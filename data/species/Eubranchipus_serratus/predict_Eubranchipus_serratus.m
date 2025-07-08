function [prdData, info] = predict_Eubranchipus_serratus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  %if f_20 > 1.3; prdData = []; info = 0; return; end
      
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  tTC = temp.tL; tTC(:,2)= tempcorr(C2K(tTC(:,2)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_i, rho_rB, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  aT_b = t_0 + tau_b/ kT_M;         % d, age at birth at f and T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty
  
  % ultimate
  L_i = L_m * l_i;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * ome); % g, ultimate dry weight
 
  % reprod
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);   % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                  % d, mean life span at T

%   % males
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, max struct length
%   pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
%   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f);
%   aT_jm = t_j/ kT_M;                   % d, age at birth 
%   aT_pm = t_p/ kT_M;                   % d, age at puberty
%   L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M; % cm, total length at puberty
%   Ww_pm = L_pm.^3 * (1 + f * w_m);     % g, wet weight at puberty
%   L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
%   Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  tf = [10 f_10; 20 f_20; 40 f_40; 60 f_60];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_40);
  [t, HeL] = ode45(@get_HeL, [0;tL(:,1)], [E_Hb 1 L_m*l_b], [], tf, tTC, v, g, E_m, L_b, L_m, kap, k_J, E_Hj); 
  HeL(1,:)=[]; ELw = HeL(:,3)/del_M;

  % pack to output
  prdData.tL = ELw;
end


function dHeL = get_HeL(t, HeL, tf, tTC, v, g, E_m, L_b, L_m, kap, k_J, E_Hj)
  persistent s_M
  
  E_H = HeL(1); % J, maturity
  e = HeL(2); % -, scaled reserve density 
  L = HeL(3); % cm, structural length
  f = spline1(t, tf); % -, scaled functional response at t
  TC = spline1(t, tTC); % -, temp corr factor
  
  if E_H < E_Hj; s_M = L/ L_b; end % set acceleration factor
  v = TC * v * s_M;              % cm/d, acceleration correction
  L_m = L_m * s_M;          % cm, acceleration correction
  
  de = (f - e) * v/ L;      % 1/d, change in scaled reserve density
  r = v * (e/ L - 1/ L_m)/ (e + g); % 1/d, specific growth rate
  dL = L * r/ 3;                    % cm/d, change in structural length d/dt L
  dE_H = (1 - kap) * e * E_m * L^3 * (v/ L - r) - TC * k_J * E_H; % J/d, change in E_H
  
  dHeL = [dE_H; de; dL];    % catenate for output
end  
  
function [prdData, info] = predict_Latris_lineata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];   % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

%   % males
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, max struc length
%   pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
%   [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
%   L_bm = L_mm * l_bm; L_im = l_im * L_mm; % cm, structural lengths
%   Lw_im = L_im/del_M;                  % cm, total length
%   tT_pm = (t_pm - t_bm)/ kT_M;         % d, time since birth at puberty
%   L_pm = l_pm * L_mm; Lw_pm = L_pm/ del_M; % length at puberty
% 
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % univariate data

  % time-length
  options = odeset('Events',@event_j, 'AbsTol',1e-9, 'RelTol',1e-9); 
  tT = temp.tL; tT(:,1) = (tT(:,1) + t_0) * k_M;
  [tau, vel] = ode45(@dget_lj, [0;(tL(:,1)+t_0)*k_M], [0, 1, l_b], options, f_tL, T_ref, T_A, tT, k_M, l_b, g, k, v_Hj);
  vel(1,:)=[]; ELw = L_m * vel(:,3)/ del_M;   % cm, total length

  % pack to output  
  prdData.tL = ELw; 
    
end

function [value,isterminal,direction] = event_j(tau, vel, f, T_ref, T_A, tT, k_M, l_b, g, k, v_Hj)
  % vel: 3-vector with [v_H; e; l]
  value = v_Hj - vel(1);
  isterminal = 0;
  direction  = 0; 
end

function dvel = dget_lj (tau, vel, f, T_ref, T_A, tT, k_M, l_b, g, k, v_Hj)
  % tau: scaled time since birth 
  % v_H continues changing after v_Hp for simplicity's sake, but is not used
  persistent s_M % set while v_H<v_Hj, used after v_H>v_Hj
  
  v_H = vel(1); e = vel(2); l = vel(3);
   
  TC = tempcorr(C2K(spline1(tau,tT)), T_ref, T_A); 
  if v_H < v_Hj; s_M = l/ l_b; end  % s_M = acceleration factor, requires v_H(0) < v_Hj
  de = (f - e) * g/ l; % d/d tau e
  rho = g * (e * s_M/ l - 1)/ (e + g); % -, spec growth rate
  dl = l * rho/ 3; % -, d/d tau l  
  dv_H = e * l^3 * (s_M/ l - rho/ g) - k * v_H; % -, d/d tau v_H
  dvel = TC * [dv_H; de; dl]; % pack to output 
end

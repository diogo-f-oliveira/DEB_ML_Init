function [prdData, info] = predict_Melanotaenia_fluviatilis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tLW, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp]; % compose parameter vector
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); 
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC;              % d, age at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(4*del_M, f, pars_R); % #/d, reproduction rate at 4 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f);
  tT_pm = (t_p- t_b)/ k_M/ TC;         % d, time since birth at puberty
  L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M; % cm, std length at puberty
  L_im = L_mm * l_i; Lw_im = L_im/ del_M; % cm, ultimate lengths

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  % uni-variate data

  % time-weight: varying food
  tf = [10 f_10; 20 f_20; 30 f_30];
  [t, EL] = ode45(@get_EL, tLW(:,1), [E_m, L_b], [], tf, L_b, L_j, v * TC_tL, g, E_m, L_m, p_Am * TC_tL); % EL: {J/cm^3, cm}, with {[E], L}
  ELw = EL(:,2)/ del_M; % cm, std length
  EWw = EL(:,2).^3 .* (1 + ome * EL(:,1)/ E_m); % g, weight


%   % time-length 
%   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
%   rT_B = TC_tL * rho_B * k_M; rT_j = TC_tL * rho_j * k_M; tT_j = (t_j - t_b)/ k_M/ TC_tL;
%   L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
%   L = L_b * exp(tLW(:,1) * rT_j/ 3) .* (tLW(:,1) < tT_j);
%   L = L + (tLW(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tLW(:,1) - tT_j))); % cm, expected length at time
%   ELw = L/ del_M;
%   % time-weight
%   EWw = L.^3 * (1 + f_tL * ome); % g, wet weight
  
  
  % length-weight
  EWw_f = (LW_f(:,1) * del_M) .^ 3 * (1 + f * w); % g, wet weight 
  EWw_m = (LW_m(:,1) * del_M) .^ 3 * (1 + f * w_m); % g, wet weight 
  
  %% pack to output
  prdData.tLW = [ELw EWw];
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  end
 
function dEL = get_EL(t, EL, tf, L_b, L_j, v, g, E_m, L_m, p_Am)
  E = EL(1); % J/cm^3, reserve density [E}
  L = EL(2); % cm, structural length
  
  p_Am = p_Am * min(L, L_j)/ L_b;        % J/d.cm^2, acceleration correction
  v = v * min(L, L_j)/ L_b;              % cm/d, acceleration correction
  
  f = (t>10) *spline1(t, tf);            % -, scaled functional response at t; 0 if t<10 d
  dE = (f * p_Am - E * v)/ L;            % J/d.cm^3, change in reserve density d/dt [E]
  e = E/ E_m;                            % -, scaled reserve density
  r = v * (e/ L - 1/ L_m)/ (e + g);      % 1/d, specific growth rate
  dL = L * r/ 3;                         % cm/d, change in structural length d/dt L
  
  dEL = [dE; dL];                        % catenate for output
end

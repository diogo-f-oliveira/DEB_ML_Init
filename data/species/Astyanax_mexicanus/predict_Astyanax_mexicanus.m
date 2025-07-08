function [prdData, info] = predict_Astyanax_mexicanus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); % all rates/times at same temp
  kT_M = k_M * TC; % 1/d, maintenance rate coefficient

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth 
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, total length at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);  % 1/d, max reproduction rate 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % cave morph
  p_Am_c = z_c * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_c = p_Am_c/ v;                   % J/cm^3, reserve capacity [E_m]
  g_c = E_G/ (kap* E_m_c);             % -, energy investment ratio
  L_mc = v/ k_M/ g_c;                  % cm, max struct length
  pars_tjc = [g_c k l_T v_Hb v_Hj v_Hp];
  [tau_jc, tau_pc, tau_bc, l_jc, l_pc, l_bc, l_ic, rho_jc, rho_Bc] = get_tj(pars_tjc, f);
  tT_pc = (tau_pc - tau_bc)/ kT_M;         % d, time since birth at puberty
  L_pc = L_mc * l_p; Lw_pc = L_pc/ del_M; % cm, total length at puberty


  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % time-length 
  % surface form
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL_s(:,1) * rT_j/ 3) .* (tL_s(:,1) < tT_j);
  L = L + (tL_s(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_s(:,1) - tT_j))); % cm, expected length at time
  tLw_s = L/ del_M;
  % cave form
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjc, f);
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_mc * l_b;  L_j = L_mc * l_j; L_i = L_mc * l_i;
  L = L_b * exp(tL_c(:,1) * rT_j/ 3) .* (tL_c(:,1) < tT_j);
  L = L + (tL_c(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_c(:,1) - tT_j))); % cm, expected length at time
  tLw_c = L/ del_M;
  
  
%% pack to output
  prdData.tL_s = tLw_s;
  prdData.tL_c = tLw_c;

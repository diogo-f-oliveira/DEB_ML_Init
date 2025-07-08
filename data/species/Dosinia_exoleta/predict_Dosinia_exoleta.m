function [prdData, info] = predict_Dosinia_exoleta(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  TC_Ave = tempcorr(temp.tL_Ave, T_ref, T_A);
  TC_Set = tempcorr(temp.tL_Set, T_ref, T_A);
  TC_Far = tempcorr(temp.tL_Far, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  %
  kT_M = k_M * TC_Ave; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  ELw_Ave  = (L_i - (L_i - L_j) * exp( - rT_B * tL_Ave(:,1)))/ del_M; % cm, shell length 
  %
  kT_M = k_M * TC_Set; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  ELw_Set  = (L_i - (L_i - L_j) * exp( - rT_B * tL_Set(:,1)))/ del_M; % cm, shell length 
  %
  kT_M = k_M * TC_Far; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  ELw_Far  = (L_i - (L_i - L_j) * exp( - rT_B * tL_Far(:,1)))/ del_M; % cm, shell length 
  
  
  % pack to output
  prdData.tL_Ave = ELw_Ave;
  prdData.tL_Set = ELw_Set;
  prdData.tL_Far = ELw_Far;
  
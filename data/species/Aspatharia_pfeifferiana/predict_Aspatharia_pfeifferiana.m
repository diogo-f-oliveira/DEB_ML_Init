function [prdData, info] = predict_Aspatharia_pfeifferiana(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_OL = tempcorr(temp.tL_OL, T_ref, T_A); kT_M = k_M * TC;
  TC_AR = tempcorr(temp.tL_AR, T_ref, T_A); kT_M = k_M * TC;
  TC_OO = tempcorr(temp.tL_OO, T_ref, T_A); kT_M = k_M * TC;
  TC_OR = tempcorr(temp.tL_OR, T_ref, T_A); kT_M = k_M * TC;
  TC_AL = tempcorr(temp.tL_AL, T_ref, T_A); kT_M = k_M * TC;
    
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since borth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, flesh wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
    
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % uni-variate data
  
  % time-length post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_OL);
  kT_M = k_M * TC_OL; rT_B = rho_B * kT_M; L_j = l_j * L_m; L_i = l_i * L_m; 
  ELw_OL = (L_i - (L_i - L_j) * exp( - rT_B * tL_OL(:,1)))/ del_M; % cm, shell length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_AR);
  kT_M = k_M * TC_AR; rT_B = rho_B * kT_M; L_j = l_j * L_m; L_i = l_i * L_m; 
  ELw_AR = (L_i - (L_i - L_j) * exp( - rT_B * tL_AR(:,1)))/ del_M; % cm, shell length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_OO);
  kT_M = k_M * TC_OO; rT_B = rho_B * kT_M; L_j = l_j * L_m; L_i = l_i * L_m; 
  ELw_OO = (L_i - (L_i - L_j) * exp( - rT_B * tL_OO(:,1)))/ del_M; % cm, shell length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_OR);
  kT_M = k_M * TC_OR; rT_B = rho_B * kT_M; L_j = l_j * L_m; L_i = l_i * L_m; 
  ELw_OR = (L_i - (L_i - L_j) * exp( - rT_B * tL_OR(:,1)))/ del_M; % cm, shell length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_AL);
  kT_M = k_M * TC_AL; rT_B = rho_B * kT_M; L_j = l_j * L_m; L_i = l_i * L_m; 
  ELw_AL = (L_i - (L_i - L_j) * exp( - rT_B * tL_AL(:,1)))/ del_M; % cm, shell length
  
  % pack to output
  prdData.tL_OL = ELw_OL;
  prdData.tL_AR = ELw_AR;
  prdData.tL_OO = ELw_OO;
  prdData.tL_OR = ELw_OR;
  prdData.tL_AL = ELw_AL;

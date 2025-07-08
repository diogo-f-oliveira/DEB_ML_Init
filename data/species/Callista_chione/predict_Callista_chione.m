function [prdData, info] = predict_Callista_chione(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

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
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_R);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  ELw_R  = (L_i - (L_i - L_j) * exp( - rT_B * tL_R(:,1)))/ del_M; % cm, shell length 
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_P);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  ELw_P  = (L_i - (L_i - L_j) * exp( - rT_B * tL_P(:,1)))/ del_M; % cm, shell length 
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_K);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  ELw_K  = (L_i - (L_i - L_j) * exp( - rT_B * tL_K(:,1)))/ del_M; % cm, shell length 
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_C);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  ELw_C  = (L_i - (L_i - L_j) * exp( - rT_B * tL_C(:,1)))/ del_M; % cm, shell length 
 
  
  % pack to output
  prdData.tL_R = ELw_R;
  prdData.tL_P = ELw_P;
  prdData.tL_K = ELw_K;
  prdData.tL_C = ELw_C;

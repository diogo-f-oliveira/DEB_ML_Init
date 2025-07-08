function [prdData, info] = predict_Dosinia_japonica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_I = tempcorr(temp.tL_I, T_ref, T_A);
  TC_H = tempcorr(temp.tL_H, T_ref, T_A);
  TC_T = tempcorr(temp.tL_T, T_ref, T_A);
  TC_S = tempcorr(temp.tL_S, T_ref, T_A);
  TC_A = tempcorr(temp.tL_A, T_ref, T_A);
  TC_K = tempcorr(temp.tL_K, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  % max gonado-somatic index of fully grown individual 
  %   that spawns once per year see (4.89) of DEB3
  GSI = 365 * TC * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^2); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length/weight 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLI);
  kT_M = k_M * TC_I; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  L  = L_i - (L_i - L_j) * exp( - rT_B * tL_I(:,1)); % cm, shell length 
  ELw_I = L/del_M; EWw_I = L.^3 * (1 + f_tLI * ome);
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLH);
  kT_M = k_M * TC_H; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  L  = L_i - (L_i - L_j) * exp( - rT_B * tL_H(:,1)); % cm, shell length 
  ELw_H = L/del_M; EWw_H = L.^3 * (1 + f_tLH * ome);
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLT);
  kT_M = k_M * TC_T; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  L  = L_i - (L_i - L_j) * exp( - rT_B * tL_T(:,1)); % cm, shell length 
  ELw_T = L/del_M; EWw_T = L.^3 * (1 + f_tLT * ome);
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLS);
  kT_M = k_M * TC_S; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  L  = L_i - (L_i - L_j) * exp( - rT_B * tL_S(:,1)); % cm, shell length 
  ELw_S = L/del_M; EWw_S = L.^3 * (1 + f_tLS * ome);
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLA);
  kT_M = k_M * TC_A; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  L  = L_i - (L_i - L_j) * exp( - rT_B * tL_A(:,1)); % cm, shell length 
  ELw_A = L/del_M; EWw_A = L.^3 * (1 + f_tLA * ome);
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLK);
  kT_M = k_M * TC_K; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  L  = L_i - (L_i - L_j) * exp( - rT_B * tL_K(:,1)); % cm, shell length 
  ELw_K = L/del_M; EWw_K = L.^3 * (1 + f_tLK * ome);
  
  % pack to output
  prdData.tL_I = ELw_I;
  prdData.tL_H = ELw_H;
  prdData.tL_T = ELw_T;
  prdData.tL_S = ELw_S;
  prdData.tL_A = ELw_A;
  prdData.tL_K = ELw_K;
  prdData.tWw_I = EWw_I;
  prdData.tWw_H = EWw_H;
  prdData.tWw_T = EWw_T;
  prdData.tWw_S = EWw_S;
  prdData.tWw_A = EWw_A;
  prdData.tWw_K = EWw_K;
  
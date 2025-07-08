function [prdData, info] = predict_Ammodytes_marinus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_11 = tempcorr(temp.ab11, T_ref, T_A);
  TC_06 = tempcorr(temp.ab06, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  a06_b = t_b/ k_M/ TC_06;          % d, age at birth at 6 C
  a11_b = t_b/ k_M/ TC_11;          % d, age at birth at 11 C
  
  % metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  L_j = l_j * L_m;                  % cm, structural length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max reproduction rate
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab06 = a06_b;
  prdData.ab11 = a11_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
   
  % time-length, weight at f 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  L_b = L_m * l_b; L_i = L_m * l_i; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; 
  L_bj = L_b * exp(tL(tL(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(tL(:,1) >= tT_j,1) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_ji]/ del_M; % cm, total length
  %
  L_bj = L_b * exp(tW(tW(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tW(tW(:,1) >= tT_j,1) - tT_j)); % cm, expected length at time
  EWw = [L_bj; L_ji].^3 * (1 + f * w); % g, wet weight
  
  % time-length, weight at f_tL
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);
  L_b = L_m * l_b; L_i = L_m * l_i; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; 
  L_bj = L_b * exp(tL1(tL1(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL1(tL1(:,1) >= tT_j,1) - tT_j)); % cm, expected length at time
  ELw_1 = [L_bj; L_ji]/ del_M; % cm, total length
  %
  L_bj = L_b * exp(tW1(tW1(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tW1(tW1(:,1) >= tT_j,1) - tT_j)); % cm, expected length at time
  EWw_1 = [L_bj; L_ji].^3 * (1 + f_tL * w); % g, wet weight
  
  %% pack to output
  prdData.tL = ELw;
  prdData.tL1 = ELw_1;
  prdData.tW = EWw;
  prdData.tW1 = EWw_1;


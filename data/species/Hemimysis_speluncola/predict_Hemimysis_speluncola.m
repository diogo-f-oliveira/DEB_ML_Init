function [prdData, info] = predict_Hemimysis_speluncola(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_10 = tempcorr(temp.tL_10, T_ref, T_A);
  TC_14 = tempcorr(temp.tL_14, T_ref, T_A);
  TC_18 = tempcorr(temp.tL_18, T_ref, T_A);
  TC_22 = tempcorr(temp.tL_22, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth at f 
  a_b = t_b/ k_M; a14_b = a_b/ TC_14; a18_b = a_b/ TC_18; a22_b = a_b/ TC_22; % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  t10_j = (t_j - t_b)/ k_M/ TC_10;  % d, time since birth at metam at 10 C
  t14_j = (t_j - t_b)/ k_M/ TC_14;  % d, time since birth at metam at 14 C
  t18_j = (t_j - t_b)/ k_M/ TC_18;  % d, time since birth at metam at 18 C
  t22_j = (t_j - t_b)/ k_M/ TC_22;  % d, time since birth at metam at 22 C

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_18;   % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_18 * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_18;               % d, mean life span at T
  
  % pack to output
  prdData.ab_14 = a14_b;
  prdData.ab_18 = a18_b;
  prdData.ab_22 = a22_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  kT_M = k_M * TC_10; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; % d, 1/von Bert growth rate
  L_bj = L_b * exp(rT_j * tL_10(tL_10(:,1) < t10_j,1)/ 3); 
  L_ji = L_i - (L_i - L_j) * exp (- rT_B * (tL_10(tL_10(:,1) >= t10_j,1) - t10_j));
  ELw_10 = [L_bj; L_ji]/ del_M; % cm, total length
  %
  kT_M = k_M * TC_14; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; % d, 1/von Bert growth rate
  L_bj = L_b * exp(rT_j * tL_14(tL_14(:,1) < t14_j,1)/ 3); 
  L_ji = L_i - (L_i - L_j) * exp (- rT_B * (tL_14(tL_14(:,1) >= t14_j,1) - t14_j));
  ELw_14 = [L_bj; L_ji]/ del_M; % cm, total length
  %
  kT_M = k_M * TC_18; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; % d, 1/von Bert growth rate
  L_bj = L_b * exp(rT_j * tL_18(tL_18(:,1) < t18_j,1)/ 3); 
  L_ji = L_i - (L_i - L_j) * exp (- rT_B * (tL_18(tL_18(:,1) >= t18_j,1) - t18_j));
  ELw_18 = [L_bj; L_ji]/ del_M; % cm, total length
  %
  kT_M = k_M * TC_22; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; % d, 1/von Bert growth rate
  L_bj = L_b * exp(rT_j * tL_22(tL_22(:,1) < t22_j,1)/ 3); 
  L_ji = L_i - (L_i - L_j) * exp (- rT_B * (tL_22(tL_22(:,1) >= t22_j,1) - t22_j));
  ELw_22 = [L_bj; L_ji]/ del_M; % cm, total length
  
  % pack to output
  prdData.tL_10 = ELw_10;
  prdData.tL_14 = ELw_14;
  prdData.tL_18 = ELw_18;
  prdData.tL_22 = ELw_22;


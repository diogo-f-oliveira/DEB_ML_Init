function [prdData, info] = predict_Neomysis_integer(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_10 = tempcorr(temp.ab_10, T_ref, T_A);
  TC_15 = tempcorr(temp.ab_15, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth at f 
  a_b = t_b/ k_M; a15_b = a_b/ TC_15; a10_b = a_b/ TC_10;  % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  t10_j = (t_j - t_b)/ k_M/ TC_10;  % d, time since birth at metam at 10 C
  t15_j = (t_j - t_b)/ k_M/ TC_15;  % d, time since birth at metam at 15 C

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty 
  t15_p = (t_p - t_b)/ k_M/ TC_15;  % d, age at puberty at f and T
  t10_p = (t_p - t_b)/ k_M/ TC_10;  % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_15;               % d, mean life span at T
  
  % pack to output
  prdData.ab_10 = a10_b;
  prdData.ab_15 = a15_b;
  prdData.tp_10 = t10_p;
  prdData.tp_15 = t15_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  
  % uni-variate data
  
  % time-length 
  kT_M = k_M * TC_10; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; % d, 1/von Bert growth rate
  L_bj = L_b * exp(rT_j * tL_10(tL_10(:,1) < t10_j,1)/ 3); 
  L_ji = L_i - (L_i - L_j) * exp (- rT_B * (tL_10(tL_10(:,1) >= t10_j,1) - t10_j));
  ELw_10 = [L_bj; L_ji]/ del_M; % cm, total length
  %
  kT_M = k_M * TC_15; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; % d, 1/von Bert growth rate
  L_bj = L_b * exp(rT_j * tL_15(tL_15(:,1) < t15_j,1)/ 3); 
  L_ji = L_i - (L_i - L_j) * exp (- rT_B * (tL_15(tL_15(:,1) >= t15_j,1) - t15_j));
  ELw_15 = [L_bj; L_ji]/ del_M; % cm, total length
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN_10 = TC_10 * 365 * reprod_rate_j(LN_10(:,1) * del_M, f, pars_R); % #, fecundity
  EN_15 = TC_15 * 365 * reprod_rate_j(LN_15(:,1) * del_M, f, pars_R); % #, fecundity

  % pack to output
  prdData.tL_10 = ELw_10;
  prdData.tL_15 = ELw_15;
  prdData.LN_10 = EN_10;
  prdData.LN_15 = EN_15;

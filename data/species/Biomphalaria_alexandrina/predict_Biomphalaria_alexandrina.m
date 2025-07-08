function [prdData, info] = predict_Biomphalaria_alexandrina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_26 = tempcorr(temp.tL26, T_ref, T_A); 
  TC_18 = tempcorr(temp.tL18, T_ref, T_A); 
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f

  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; TC_26 * k_J; TC_26 * k_M; L_T; TC_26 * v; U_Hb/ TC_26; U_Hj/ TC_26; U_Hp/ TC_26]; % compose parameter vector at T
  N26_121 = cum_reprod_j(121, f, pars_R);                    % #, number of egg at 121 d
  %
  pars_R = [kap; kap_R; g; TC_18 * k_J; TC_18 * k_M; L_T; TC_18 * v; U_Hb/ TC_18; U_Hj/ TC_18; U_Hp/ TC_18]; % compose parameter vector at T
  N18_121 = cum_reprod_j(121, f, pars_R);                    % #, number of egg at 121 d

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_26;                  % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.N26 = N26_121;
  prdData.N18 = N18_121;
  
  % uni-variate data
  
  % time-length 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_26; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL26((tL26(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL26((tL26(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_26 = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  %
  kT_M = k_M * TC_18; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL18((tL18(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL18((tL18(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_18 = [L_bj; L_jm]/ del_M;                               % cm, shell diam

  
  % pack to output
  prdData.tL26 = ELw_26;
  prdData.tL18 = ELw_18;


function [prdData, info] = predict_Bulinus_globosus(par, data, auxData)
    
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if T_L > T_ref || T_H < T_ref
    info = 0; prdData = []; return  
  end
  
  % compute temperature correction factors
  pars_T = [T_A; T_L; T_H; T_AL; T_AH];
  TC_27 = tempcorr(temp.N27, T_ref, pars_T); 
  TC_25 = tempcorr(temp.N25, T_ref, pars_T); 
  TC_22 = tempcorr(temp.N22, T_ref, pars_T);
  TC_18 = tempcorr(temp.N18, T_ref, pars_T);
  
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
  pars_R = [kap; kap_R; g; TC_27 * k_J; TC_27 * k_M; L_T; TC_27 * v; U_Hb/ TC_27; U_Hj/ TC_27; U_Hp/ TC_27]; % compose parameter vector at T
  N27 = cum_reprod_j(434 , f_tL, pars_R);                   % #, number of egg at 434 d
  %
  pars_R = [kap; kap_R; g; TC_25 * k_J; TC_25 * k_M; L_T; TC_25 * v; U_Hb/ TC_25; U_Hj/ TC_25; U_Hp/ TC_25]; % compose parameter vector at T
  N25 = cum_reprod_j(434 , f_tL, pars_R);                   % #, number of egg at 434 d
  %
  pars_R = [kap; kap_R; g; TC_22 * k_J; TC_22 * k_M; L_T; TC_22 * v; U_Hb/ TC_22; U_Hj/ TC_22; U_Hp/ TC_22]; % compose parameter vector at T
  N22 = cum_reprod_j(434 , f_tL, pars_R);                   % #, number of egg at 434 d
  %
  pars_R = [kap; kap_R; g; TC_18 * k_J; TC_18 * k_M; L_T; TC_18 * v; U_Hb/ TC_18; U_Hj/ TC_18; U_Hp/ TC_18]; % compose parameter vector at T
  N18 = cum_reprod_j(364 , f_tL, pars_R);                   % #, number of egg at 364 d

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_25;                  % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.N27 = N27;
  prdData.N25 = N25;
  prdData.N22 = N22;
  prdData.N18 = N18;
  
  % uni-variate data
  
  % time-length 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_27; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL27((tL27(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL27((tL27(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_27 = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  %
  kT_M = k_M * TC_25; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL25((tL25(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL25((tL25(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_25 = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  %
  kT_M = k_M * TC_22; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL22((tL22(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL22((tL22(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_22 = [L_bj; L_jm]/ del_M;                               % cm, shell diam

  
  % pack to output
  prdData.tL27 = ELw_27;
  prdData.tL25 = ELw_25;
  prdData.tL22 = ELw_22;

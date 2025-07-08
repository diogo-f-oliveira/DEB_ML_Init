function [prdData, info] = predict_Indoplanorbis_exustus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_35 = tempcorr(temp.tL35, T_ref, T_A); 
  TC_30 = tempcorr(temp.tL30, T_ref, T_A); 
  TC_25 = tempcorr(temp.tL25, T_ref, T_A);
  TC_20 = tempcorr(temp.tL20, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  
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
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  R35 = TC_35 * reprod_rate_j(L_i, f_tL35, pars_R);                    % #/d, reprod rate
  R30 = TC_30 * reprod_rate_j(L_i, f_tL30, pars_R);                    % #/d, reprod rate
  R25 = TC_25 * reprod_rate_j(L_i, f_tL25, pars_R);                    % #/d, reprod rate
  R20 = TC_20 * reprod_rate_j(L_i, f_tL20, pars_R);                    % #/d, reprod rate
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_25;                  % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.R35 = R35;
  prdData.R30 = R30;
  prdData.R25 = R25;
  prdData.R20 = R20;
  
  % uni-variate data
  
  % time-length 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL35);
  kT_M = k_M * TC_35; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL35((tL35(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL35((tL35(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_35 = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  EWw_35 = [L_bj; L_jm].^3 * (1 + f_tL35 * ome);                % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL30);
  kT_M = k_M * TC_30; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL30((tL30(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL30((tL30(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_30 = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  EWw_30 = [L_bj; L_jm].^3 * (1 + f_tL30 * ome);                % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL25);
  kT_M = k_M * TC_25; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL25((tL25(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL25((tL25(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_25 = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  EWw_25 = [L_bj; L_jm].^3 * (1 + f_tL25 * ome);                % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL20);
  kT_M = k_M * TC_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL20((tL20(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL20((tL20(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_20 = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  EWw_20 = [L_bj; L_jm].^3 * (1 + f_tL20 * ome);                % g, wet weight

  
  % pack to output
  prdData.tL35 = ELw_35;
  prdData.tL30 = ELw_30;
  prdData.tL25 = ELw_25;
  prdData.tL20 = ELw_20;
  prdData.tWw35 = EWw_35;
  prdData.tWw30 = EWw_30;
  prdData.tWw25 = EWw_25;
  prdData.tWw20 = EWw_20;
  
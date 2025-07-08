function [prdData, info] = predict_Cyprinodon_nevadensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
    
  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 
  TC_tL = tempcorr(temp.tL_f1, T_ref, T_A); 
    
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth
    
  % puberty 
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate std length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);  % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univatiate data
  % time-length
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL1);
  kT_M = TC_tL * k_M; rT_j = TC_tL * k_M * rho_j; rT_B = kT_M * rho_B; % 1/d, von Bertalanffy growth rate
  L_i = L_m * l_i; L_j = L_m * l_j; L_b = L_m * l_b; tT_j = (tau_j - tau_b)/ kT_M;
  L_bj = L_b * exp(rT_j * tL_f1(tL_f1(:,1)< tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(- rT_B * (tL_f1(tL_f1(:,1)>=tT_j,1) - tT_j)); 
  ELw_1 = [L_bj; L_ji]/ del_M; % cm, total length
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL2);
  kT_M = TC_tL * k_M; rT_j = TC_tL * k_M * rho_j; rT_B = kT_M * rho_B; % 1/d, von Bertalanffy growth rate
  L_i = L_m * l_i; L_j = L_m * l_j; L_b = L_m * l_b; tT_j = (tau_j - tau_b)/ kT_M;
  L_bj = L_b * exp(rT_j * tL_f2(tL_f2(:,1)< tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(- rT_B * (tL_f2(tL_f2(:,1)>=tT_j,1) - tT_j)); 
  ELw_2 = [L_bj; L_ji]/ del_M; % cm, total length
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL3);
  kT_M = TC_tL * k_M; rT_j = TC_tL * k_M * rho_j; rT_B = kT_M * rho_B; % 1/d, von Bertalanffy growth rate
  L_i = L_m * l_i; L_j = L_m * l_j; L_b = L_m * l_b; tT_j = (tau_j - tau_b)/ kT_M;
  L_bj = L_b * exp(rT_j * tL_f3(tL_f3(:,1)< tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(- rT_B * (tL_f3(tL_f3(:,1)>=tT_j,1) - tT_j)); 
  ELw_3 = [L_bj; L_ji]/ del_M; % cm, total length

  % pack to output
   prdData.tL_f1 = ELw_1;
   prdData.tL_f2 = ELw_2;   
   prdData.tL_f3 = ELw_3;
   
function [prdData, info] = predict_Folsomia_candida(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_15 = tempcorr(temp.tL_T1, T_ref, T_A);
  TC_20 = tempcorr(temp.tL_T2, T_ref, T_A);
  TC_25 = tempcorr(temp.tL_T3, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = 1e6 * L_b^3 *(1 + f * w);  % mug, wet weight at birth
  a_b = t_0 + t_b/ k_M;             % d, age at birth at f and T_ref

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = 1e6 * L_p^3 *(1 + f * w);  % mug, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = 1e6 * L_i^3 * d_V * (1 + f * w); % mug, ultimate dry weight 
 
  % weights-at-length
  Ww_f1 = 1e6 * (0.238 * del_M)^3 * (1 + f1 * w); Wd_f1 = d_V * Ww_f1; % mug, wet and dry  weight at f1
  Ww_f2 = 1e6 * (0.208 * del_M)^3 * (1 + f2 * w); Wd_f2 = d_V * Ww_f2; % mug, wet and dry  weight at f2
  Ww_f3 = 1e6 * (0.178 * del_M)^3 * (1 + f3 * w); Wd_f3 = d_V * Ww_f3; % mug, wet and dry  weight at f3
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wdi = Wd_i;
  prdData.Wwf1 = Ww_f1;
  prdData.Wdf1 = Wd_f1;
  prdData.Wwf2 = Ww_f2;
  prdData.Wdf2 = Wd_f2;
  prdData.Wwf3 = Ww_f3;
  prdData.Wdf3 = Wd_f3;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length, reprod at f1, f2, f3 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f1);
  kT_M = k_M * TC_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_f1((tL_f1(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_f1((tL_f1(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_f1 = [L_bj; L_jm]/ del_M; % cm, length
  EN_f1 = cum_reprod_j(tN_f1(:,1), f1, pars_R);
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f2);
  kT_M = k_M * TC_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_f2((tL_f2(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_f2((tL_f2(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_f2 = [L_bj; L_jm]/ del_M; % cm, length
  EN_f2 = cum_reprod_j(tN_f2(:,1), f2, pars_R);
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f3);
  kT_M = k_M * TC_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_f3((tL_f3(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_f3((tL_f3(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_f3 = [L_bj; L_jm]/ del_M; % cm, length
  EN_f3 = cum_reprod_j(tN_f3(:,1), f3, pars_R);

  % time-length, reprod at T1, T2, T3 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, fT);
  kT_M = k_M * TC_15; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; 
  L_bj = L_b * exp(tL_T1((tL_T1(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_T1((tL_T1(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_T1 = [L_bj; L_jm]/ del_M; % cm, length
  pars_R = [kap; kap_R; g; TC_15 * k_J; TC_15 * k_M; L_T; TC_15 * v; U_Hb/ TC_15; U_Hj/ TC_15; U_Hp/ TC_15]; % compose parameter vector at T
  EN_T1 = cum_reprod_j(tN_T1(:,1), f1, pars_R);
  %
  kT_M = k_M * TC_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;       
  L_bj = L_b * exp(tL_T2((tL_T2(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_T2((tL_T2(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_T2 = [L_bj; L_jm]/ del_M; % cm, length
  pars_R = [kap; kap_R; g; TC_20 * k_J; TC_20 * k_M; L_T; TC_20 * v; U_Hb/ TC_20; U_Hj/ TC_20; U_Hp/ TC_20]; % compose parameter vector at T
  EN_T2 = cum_reprod_j(tN_T2(:,1), f1, pars_R);
  %
  kT_M = k_M * TC_25; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;       
  L_bj = L_b * exp(tL_T3((tL_T3(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_T3((tL_T3(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_T3 = [L_bj; L_jm]/ del_M; % cm, length
  pars_R = [kap; kap_R; g; TC_25 * k_J; TC_25 * k_M; L_T; TC_25 * v; U_Hb/ TC_25; U_Hj/ TC_25; U_Hp/ TC_25]; % compose parameter vector at T
  EN_T3 = cum_reprod_j(tN_T3(:,1), f1, pars_R);
  
  % T-ab data
  Eab = a_b ./ TC_Tab;
  
  % time-weight, reprod  
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, fC);
  kT_M = k_M * TC_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;       
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; 
  L_bj = L_b * exp(tW((tW(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tW((tW(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  EWw = [L_bj; L_jm].^3 * (1 + fC * w); % g, wet weight
  pars_R = [kap; kap_R; g; TC_20 * k_J; TC_20 * k_M; L_T; TC_20 * v; U_Hb/ TC_20; U_Hj/ TC_20; U_Hp/ TC_20]; % compose parameter vector at T
  EN = cum_reprod_j(tN(:,1), fC, pars_R);

  % weight - respiration
  pACSJGRD = L_m^2 * p_Am * scaled_power_j((1e-6 * WJO(:,1)/ (1 + 1 * w)).^(1/3), 1, pars_R, l_b, l_j, l_p); % J/d powers
  pADG = pACSJGRD(:,[1 7 5])'; pADG(1,:) = 0; % exclude contribution from assimilation
  J_M = (- n_M\n_O * eta_O * pADG)'; % mol/d, mineral fluxes
  EJT_O = - TC_20 * J_M(:,3) * 24.4e6/ 24; % mul/h, O2 flux

  % pack to output
  prdData.tL_f1 = ELw_f1;
  prdData.tL_f2 = ELw_f2;
  prdData.tL_f3 = ELw_f3;
  prdData.tN_f1 = EN_f1;
  prdData.tN_f2 = EN_f2;
  prdData.tN_f3 = EN_f3;
  prdData.tL_T1 = ELw_T1;
  prdData.tL_T2 = ELw_T2;
  prdData.tL_T3 = ELw_T3;
  prdData.tN_T1 = EN_T1;
  prdData.tN_T2 = EN_T2;
  prdData.tN_T3 = EN_T3;
  prdData.Tab = Eab;
  prdData.tW = EWw;
  prdData.tN = EN;
  prdData.WJO = EJT_O;
  
  
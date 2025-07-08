function [prdData, info] = predict_Caenorhabditis_elegans(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_16 = tempcorr(temp.tR_16, T_ref, T_A);
  TC_20 = tempcorr(temp.tR_20, T_ref, T_A);
  TC_25 = tempcorr(temp.tR_25, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w) * 1e6; % mug, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w) * 1e6; % mug, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w) * 1e6; % mug, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length/reprod 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_tL; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_jm]/ del_M; % cm, length
  % 16 C
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_16);
  kT_M = k_M * TC_16; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_16((tL_16(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_16((tL_16(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_16 = [L_bj; L_jm]/ del_M; % cm, length
  %
  L_bj = L_b * exp(tR_16((tR_16(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tR_16((tR_16(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ER_16 = TC_16 * reprod_rate_j([L_bj; L_jm], f_16, pars_R); % #/d, ultimate reproduction rate at T
  % 20 C
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_20);
  kT_M = k_M * TC_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_20((tL_20(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_20((tL_20(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_20 = [L_bj; L_jm]/ del_M; % cm, length
  %
  L_bj = L_b * exp(tR_20((tR_20(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tR_20((tR_20(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ER_20 = TC_20 * reprod_rate_j([L_bj; L_jm], f_20, pars_R); % #/d, ultimate reproduction rate at T
  % 25 C
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_25);
  kT_M = k_M * TC_25; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_25((tL_25(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_25((tL_25(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_25 = [L_bj; L_jm]/ del_M; % cm, length
  %
  L_bj = L_b * exp(tR_25((tR_25(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tR_25((tR_25(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ER_25 = TC_25 * reprod_rate_j([L_bj; L_jm], f_25, pars_R); % #/d, ultimate reproduction rate at T
  
  % time - survival: Eq (6.5) of Kooy2010 for short growth periods, e = 1, L = L_i, 20C
  h3_W = h_a * v/ 6/ L_i; h_G = s_G * v/ L_i; h3_G = h_G^3; th_G = h_G * tS(:,1);
  ES = exp(6 * h3_W/ h3_G * (1 - exp(th_G) + th_G + th_G.^2/ 2));

  % pack to output
  prdData.tL = ELw;
  prdData.tL_16 = ELw_16;
  prdData.tL_20 = ELw_20;
  prdData.tL_25 = ELw_25;
  prdData.tR_16 = ER_16;
  prdData.tR_20 = ER_20;
  prdData.tR_25 = ER_25;
  prdData.tS = ES;
  
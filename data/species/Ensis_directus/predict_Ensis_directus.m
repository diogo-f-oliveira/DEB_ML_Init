function [prdData, info] = predict_Ensis_directus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_Fm = tempcorr(temp.Fm, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_LCR = tempcorr(temp.LCR, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC_tL;   % d, time since birth at metam
  s_M = L_j/ L_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight 
 
  % lengths
  rT_B = rho_B * k_M * TC_tL;
  Lw_730 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * 730); % cm, expected length at time
  Lw_1825 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * 1825); % cm, expected length at time

  % reproduction
  % max gonado-somatic index of fully grown individual 
  %   that spawns once per year see (4.89) of DEB3
  GI = 365 * TC_GSI * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GI = GI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^2); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % filtering
  FT_m = TC_Fm * F_m * L_i^2/ 24;       % L/h, maximum filtering rate

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.L730 = Lw_730;
  prdData.L1825 = Lw_1825;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  prdData.GSI = GI;
  prdData.Fm = FT_m;
  
  % uni-variate data
  
  % time-weight 
  kT_M = k_M * TC_tL; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_jm]/ del_M;                               % g, wet weight
  
  % dioxygen consumption as a function of shell length, T=18.5 deg C
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  pT_ref = TC_LCR * p_Am * L_m^2; % J/d, max assimilation power at max size
  pACSJGRD = pT_ref * scaled_power_j(LJO(:,1) * del_M, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O = - J_M(3,:)'; % mol/d, J_O

  % Clearance rate (l/h) as a function of shell length
  ECR = TC_LCR * F_m * (LCR(:,1) * del_M).^2/ 24;      % L/h, Clearance rate

  % Length versus weight
  EWw = (LW (:,1) * del_M).^3 .* (1 + f * w); % wet weigth in g assuming density of 1 g cm^3

  % pack to output
  prdData.tL = ELw;
  prdData.LJO = EJT_O;
  prdData.LW = EWw;
  prdData.LCR = ECR;
  
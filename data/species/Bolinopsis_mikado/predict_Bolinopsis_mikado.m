function [prdData, info] = predict_Bolinopsis_mikado(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_R65 = tempcorr(temp.R65, T_ref, T_A);
  TC_TR = tempcorr(C2K(TR(:,1)), T_ref, T_A);
  TC_WdJO = tempcorr(temp.WdJO, T_ref, T_A);
  TC_WdJN = tempcorr(temp.WdJN, T_ref, T_A);
  TC_17 = tempcorr(temp.tL17, T_ref, T_A);
  TC_24 = tempcorr(temp.tL24, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0);  % d.cm^2, initial scaled reserve
  WC_0 = U_E0 * p_Am * 12e6/ mu_E;             % mug C in egg       
  WN_0 = U_E0 * p_Am * 14e6 * n_NE/ mu_E;      % mug N in egg   
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = del_W * L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_65 = TC_R65 * reprod_rate_j(6.5 * del_M, f, pars_R);        % #/d, reproduction rate at 65 mm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.WC0 = WC_0;
  prdData.WN0 = WN_0;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wdi = Wd_i;
  prdData.R65 = RT_65;
  
  % uni-variate data
  
  EWd = (LWd(:,1) * del_M).^3 * (1 + f * w) * d_V * del_W; % mg, dry weight
  EWw = (LWw(:,1) * del_Mj).^3 * (1 + f * w);              % g, wet weight
  ER = TC_TR .* reprod_rate_j((weight.TR/ (1 + f * w)).^(1/3), f, pars_R) ./ weight.TR;  % #/d.g, reproduction rate;
  
  % flux data 
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  % respiration 
  L = (WdJO(:,1)/del_W/ d_V/ (1 + f * w)) .^ (1/3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pACSJGRD(:,1) = 0 * pACSJGRD(:,1);                % exclude contribution from assimilation
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows
  EJO = - J_M(3,:)' * TC_WdJO * 24.4e3/ 24;         % mul O2/h, O2 consumption 
  % excretion
  L = (WdJN(:,1)/del_W/ d_V/ (1 + f * w)) .^ (1/3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pACSJGRD(:,1) = 0 * pACSJGRD(:,1); % exclude contribution from assimilation
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows
  EJN = J_M(4,:)' * TC_WdJN * 14e3/ 24;             % mug-at NH3/h 
  
  % time-length
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL24);
  kT_M = k_M * TC_24; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL24(tL24(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL24(tL24(:,1) >= tT_j,1) - tT_j)); 
  L = [L_bj; L_ji]; w = min(1,(L - L_b)/ (L_j - L_b)); del = w * del_M + (1 - w) * del_Mj;
  ELw_24 = L ./ del; % cm, standard length
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL17);
  kT_M = k_M * TC_17; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL17(tL17(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL17(tL17(:,1) >= tT_j,1) - tT_j)); 
  L = [L_bj; L_ji]; w = min(1,(L - L_b)/ (L_j - L_b)); del = w * del_M + (1 - w) * del_Mj;
  ELw_17 = L ./ del; % cm, standard length

  % pack to output
  prdData.LWd = EWd;
  prdData.LWw = EWw;
  prdData.WdJO = EJO;
  prdData.WdJN = EJN;
  prdData.TR = ER;
  prdData.tL24 = ELw_24;
  prdData.tL17 = ELw_17;
  
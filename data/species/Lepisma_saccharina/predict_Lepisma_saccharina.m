function [prdData, info] = predict_Lepisma_saccharina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ni = tempcorr(temp.Ni, T_ref, T_A);
  TC_25 = tempcorr(temp.WJO_ad, T_ref, T_A);
  TC_TJO = tempcorr(C2K(TjO_ad(:,1)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = 1e3 * L_b^3 *(1 + f * w);  % mg, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = 1e3 * L_p^3 *(1 + f * w);  % mg, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = 1e3 * L_i^3 * (1 + f * w); % mg, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  NT_i = TC_Ni * cum_reprod_j(1000, f, pars_R);                 % #, cumulative # 0f eggs

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
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % weight - respiration
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  L = (WJO_ad(:,1)/ (1 + f * w)) .^ (1/3); % cm, structural length
  [spACSJGRD, info] = scaled_power_j(L, f, pars_R, l_b, l_j, l_p);
  if ~info; prdData = []; return;  end
  pACSJGRD = p_ref * spACSJGRD; % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';       % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_Oad = - J_M(3,:)' * TC_25 * 24.4e3/ 24;              % ml O2/h, O2 consumption
  %
  L = (WJO_juv(:,1)/ (1 + f * w)) .^ (1/3); % cm, structural length
  [spACSJGRD, info] = scaled_power_j(L, f, pars_R, l_b, l_j, l_p);
  if ~info; prdData = []; return;  end
  pACSJGRD = p_ref * spACSJGRD; % J/d, powers  
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';       % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_Ojuv = - J_M(3,:)' * TC_25 * 24.4e3/ 24;             % ml O2/h, O2 consumption 

  % temperature - specific respiration
  W = 0.048; L = (W/ (1 + f * w)).^ (1/3); % g, cm, wet weight, structural length
  [spACSJGRD, info] = scaled_power_j(L, f, pars_R, l_b, l_j, l_p);
  if ~info; prdData = []; return;  end
  pACSJGRD = p_ref * spACSJGRD; % J/d, powers  
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';       % mol/d: J_C, J_H, J_O, J_N in rows
  EjT_Oad = - J_M(3,:)' * TC_TJO * 24.4e3/ 24/ W;          % ml O2/h.g, O2 consumption 
  %
  W = 0.004; L = (W/ (1 + f * w)).^ (1/3); % g, cm, wet weight, structural length
  [spACSJGRD, info] = scaled_power_j(L, f, pars_R, l_b, l_j, l_p);
  if ~info; prdData = []; return;  end
  pACSJGRD = p_ref * spACSJGRD; % J/d, powers  
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';       % mol/d: J_C, J_H, J_O, J_N in rows
  EjT_Ojuv = - J_M(3,:)' * TC_TJO * 24.4e3/ 24/ W;         % ml O2/h.g, O2 consumption 

  % pack to output
  prdData.WJO_ad = EJT_Oad;
  prdData.WJO_juv = EJT_Ojuv;
  prdData.TjO_ad = EjT_Oad;
  prdData.TjO_juv = EjT_Ojuv;
  
function [prdData, info] = predict_Plectus_palustris(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC    = tempcorr(temp.am_0, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j1, tau_p1, tau_b1, l_j1, l_p1, l_b1, l_i1, rho_j1, rho_B1, info] = get_tj(pars_tj, f_tW1);
  [tau_j0, tau_p0, tau_b0, l_j0, l_p0, l_b0, l_i0, rho_j0, rho_B0, info] = get_tj(pars_tj, f_tW0);
    
  % birth
  L_b1 = L_m * l_b1;                  % cm, structural length at birth
  L_b0 = L_m * l_b0;                  % cm, structural length at birth
  Ww_b1 = L_b1^3 * (1 + f_tW1 * w) * 1e6; % mug, wet weight at birth
  Ww_b0 = L_b0^3 * (1 + f_tW0 * w) * 1e6; % mug, wet weight at birth
  a_b = tau_b1/ k_M;           % d, age at birth
  
  % puberty 
  L_p1 = L_m * l_p1;                  % cm, structural length at puberty
  L_p0 = L_m * l_p0;                  % cm, structural length at puberty
  Ww_p1 = L_p1^3 * (1 + f_tW1 * w) * 1e6; % mug, wet weight at puberty 
  Ww_p0 = L_p0^3 * (1 + f_tW0 * w) * 1e6; % mug, wet weight at puberty 
  tT_p1 = (tau_p1 - tau_b1)/ kT_M;   % d, time since birth at puberty 
  tT_p0 = (tau_p0 - tau_b0)/ kT_M;   % d, time since birth at puberty 

  % ultimate
  L_i1 = L_m * l_i1;                  % cm, ultimate structural length
  Ww_i1 = L_i1^3 * (1 + f_tW1 * w) * 1e6; % mug, ultimate wet weight 
  L_i0 = L_m * l_i0;                  % cm, ultimate structural length
  Ww_i0 = L_i0^3 * (1 + f_tW0 * w) * 1e6; % mug, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i1 = TC * reprod_rate_j(L_i1, f_tW1, pars_R);               % #/d, ultimate reproduction rate
  RT_i0 = TC * reprod_rate_j(L_i0, f_tW0, pars_R);               % #/d, ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f_tW1, l_b1);      % -, scaled mean life span at T_ref
  aT_m1 = tau_m/ kT_M;               % d, mean life span at T
  %
  tau_m = get_tm_s(pars_tm, f_tW0, l_b0); % -, scaled mean life span at T_ref
  aT_m0 = tau_m/ kT_M;               % d, mean life span at T
 
  % pack to output
  prdData.tp_1 = tT_p1;
  prdData.tp_0 = tT_p0;
  prdData.am_1 = aT_m1;
  prdData.am_0 = aT_m0;
  prdData.Wwb_1 = Ww_b1;
  prdData.Wwb_0 = Ww_b0;
  prdData.Wwp_1 = Ww_p1;
  prdData.Wwp_0 = Ww_p0;
  prdData.Wwi_1 = Ww_i1;
  prdData.Wwi_0 = Ww_i0;
  prdData.Ri_1 = RT_i1;
  prdData.Ri_0 = RT_i0;
  
  % uni-variate data
  

  % time-weight-respiration 
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars for scaled_power_j
  %
  tvel = get_tj(pars_tj, f_tW1, [], tWJO_1(:,1)*kT_M);
  L = L_m * tvel(:,4); EWw_1 = 1e6 * L.^3 .* (1 + ome * tvel(:,3)); % mug, weight
  pACSJGRD = p_Am * L_m^2 * scaled_power_j(L, f_tW1, pars_p, l_b1, l_j1, l_p1); % J/d, powers
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJ_O1 = - J_M(3, :)' * 24.4e9/ 24; % nL O2/h, O2 consumption 
  %
  tvel = get_tj(pars_tj, f_tW0, [], tWJO_0(:,1)*kT_M);
  L = L_m * tvel(:,4); EWw_0 = 1e6 * L.^3 .* (1 + ome * tvel(:,3)); % mug, weight
  pACSJGRD = p_Am * L_m^2 * scaled_power_j(L, f_tW0, pars_p, l_b0, l_j0, l_p0); % J/d, powers
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJ_O0 = - J_M(3, :)' * 24.4e9/ 24; % nL O2/h, O2 consumption
  % temperature-age at birth
  EaT_b = a_b ./ TC_ab;
  
  % pack to output
  prdData.tWJO_1 = [EWw_1 EJ_O1];
  prdData.tWJO_0 = [EWw_0 EJ_O0];
  prdData.Tab = EaT_b;
  
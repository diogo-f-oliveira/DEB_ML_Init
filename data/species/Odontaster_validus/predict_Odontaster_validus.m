function [prdData, info] = predict_Odontaster_validus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  pars_T = T_A; %[T_A; T_L; T_H; T_AL; T_AH];
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_tj = tempcorr(temp.tj, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_GSI = tempcorr(temp.GSI, T_ref, pars_T);
  TC_LW = tempcorr(temp.LW, T_ref, pars_T);
  TC_WwdWw = tempcorr(temp.WwdWw, T_ref, pars_T);
  TC_TJO = tempcorr(TJO(:,1), T_ref, pars_T);
  TC_tLj = tempcorr(temp.tLj, T_ref, pars_T);
  TC_tWde = tempcorr(temp.tWde, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Wd_0 = 1e6 * U_E0 * p_Am * w_E/ mu_E; % mug, initial dry weight
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mj;                % cm, total length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, radius length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 

  % GSI
  t1 = 1.2 * 365; % d, period of accumulaton of reprod buffer
  GSI = TC_GSI * t1 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ s_M^2/ L_m^2);

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w) * (1 + GSI/2); % g, ultimate wet weight including reprod buffer
 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wd0 = Wd_0;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % L-W data
  L = LW(:,1) * del_M; EWw_L = L.^3 * (1 + f * w); % g, wet weight
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  EWw_L = EWw_L + 0.6 * 365 * TC_LW * reprod_rate_j(L, f, pars_R) * 1e-6 * Wd_0/ d_E;
  %
  U_E0 = initial_scaled_reserve(f_LWf, pars_UE0); % d.cm^2, initial scaled reserve
  Ww_0 = U_E0 * p_Am * w_E/ mu_E/ d_E; % g, initial wet weight
  L = LW_f(:,1) * del_M; EWw_Lf = L.^3 * (1 + f_LWf * w); % g, wet weight
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  EWw_Lf = EWw_Lf + 0.5 * 365 * TC_LW * reprod_rate_j(L, f_LWf, pars_R) *  Ww_0;
  
  % W-dW data
  L = (WwdWw(:,1)/ (1 + f * w)).^(1/3); rT_B = TC_WwdWw * rho_B * k_M;
  dWw = (1 + f * w) * 3 * L.^2 * rT_B .* (L_i - L); % g/d, change in wet weight
  EdWw = 100 * dWw ./ WwdWw(:,1); % %/d, % change in wet weight
  
  % respiration data
  L = (1.21/ d_V/ (1 + f * w))^(1/3); % cm, structural length
  p_ref = p_Am * L_m^2; % max assimilation power at max size
  O2M = (- n_M\n_O)';   % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]); pADG(:,1) = 0; % exclude contribution from assim
    JO = pADG * eta_O';        % organic fluxes
    JM = JO * O2M;             % mineral fluxes
  EJO = - 32e6 * JM(:,3) .* TC_TJO/ 24/ 1.21;  % mug/h.g, specific dioxygen consumption rate at temp T

  % max gonad weight
  L = LWR(:,1) * del_M; % cm, structural length
  EWR = 1.2 * 365 * TC_LW * reprod_rate_j(L, f, pars_R) * 1e-6 * Wd_0/ d_E;
 
  % time-length data for larva
  rT_j = TC_tLj * rho_j * k_M;
  ELw_e = 10 * Lw_b * exp((tLj(:,1) - aT_b) * rT_j/ 3);  % mm, length of larva
  
  % time-weight pre-metam
  LUH_0 = [1e-3; U_E0/ TC_tWde; 0];                        % initial state vector
  vT= v * TC_tWde; kT_J = k_J * TC_tWde; pT_Am = p_Am * TC_tWde;
  [a LUH] = ode45(@dget_LUH, tWde(:,1), LUH_0, [], kap, vT, kT_J, g, L_m);
  EWde = 1e6 * (w_V * M_V .* LUH(:,1).^3 + w_E * pT_Am/ mu_E .* LUH(:,2)); % ug, dry weight
 
  % pack to output
  prdData.LW = EWw_L;
  prdData.LW_f = EWw_Lf;
  prdData.WwdWw = EdWw;
  prdData.TJO = EJO;
  prdData.LWR = EWR;
  prdData.tLj = ELw_e;
  prdData.tWde = EWde;
  
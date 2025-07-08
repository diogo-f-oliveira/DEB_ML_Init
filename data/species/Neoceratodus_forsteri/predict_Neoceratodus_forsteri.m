function [prdData, info] = predict_Neoceratodus_forsteri(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_15 = tempcorr(temp.ab_15, T_ref, T_A);
  TC_20 = 1;
  TC_25 = tempcorr(temp.ab_25, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled length at birth at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth at f 
  a_b = t_b/ k_M;                   % d, age at birth at f and T_ref
  a25_b = a_b/ TC_25; a20_b = a_b/ TC_20; a15_b = a_b/ TC_15;

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  aT_p = t_p/ k_M/ TC_20;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % length at age at 20 C
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - r_B * [110 240]); % cm, expected length at 100, 240 d
  Lw_110 = L(1)/ del_M; Lw_240 = L(2)/ del_M;

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_20 * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_20;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tp = [g_m; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tp, f); % -, scaled length at birth at f
  aT_pm = t_pm/ k_M/ TC_20;            % d, age at puberty
  Lw_pm = L_mm * l_pm/ del_M;          % cm, total length at puberty

  % pack to output
  prdData.ab_15 = a15_b;
  prdData.ab_20 = a20_b;
  prdData.ab_25 = a25_b;
  prdData.ap = aT_p;
  prdData.apm = aT_pm;
  prdData.am = aT_m;
  prdData.L110 = Lw_110;
  prdData.L240 = Lw_240;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % O2-consumption
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  %
  vT = v * TC_15; kT_J = TC_15 * k_J; pT_M = p_M * TC_15;
  a = [-1e-10; aJO_15(:,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = [];
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * J_E_Am; ee = mu_E * M_E ./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* M_E * mu_E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJO_15 = - J_M(:,3) * 1e9/ 24; % O2 flux in nmol/h
  %
  vT = v * TC_20; kT_J = TC_20 * k_J; pT_M = p_M * TC_20;
  a = [-1e-10; aJO_20(:,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = [];
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * J_E_Am; ee = mu_E * M_E ./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* M_E * mu_E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJO_20 = - J_M(:,3) * 1e9/ 24; % O2 flux in nmol/h
  %
  vT = v * TC_25; kT_J = TC_25 * k_J; pT_M = p_M * TC_25;
  a = [-1e-10; aJO_25(:,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = [];
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * J_E_Am; ee = mu_E * M_E ./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* M_E * mu_E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJO_25 = - J_M(:,3) * 1e9/ 24; % O2 flux in nmol/h

  % pack to output
  prdData.aJO_25 = EJO_25;
  prdData.aJO_20 = EJO_20;
  prdData.aJO_15 = EJO_15;

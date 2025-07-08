function [prdData, info] = predict_Chiloscyllium_plagiosum(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.ah, T_ref, T_A);
  vT = v * TC; kT_J = TC * k_J; kT_M = TC * k_M; pT_M = p_M * TC;
  JT_E_Am = TC * J_E_Am;

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % start
  pars_UE0 = [V_Hb/ TC; g; kT_J; kT_M; vT];
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  Ww_0 = U_E0 * J_E_Am * TC * w_E/ d_E; % g, wet yolk tolk at start

  % birth
  L_b = L_m * l_b;     % cm, structural length at birth at f
  Lw_b = L_b/ del_M;   % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w); % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC; % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, fork length at puberty at f
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate fork length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_L = TC * reprod_rate(83.4 * del_M, f, pars_R); % ultimate reproduction rate at T
  GSI = RT_L * 120 * Ww_b/ Ww_i;    % -, gonado somatic index, accumulation in 3 month

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
    
  %% pack to output
  prdData.ah = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwh = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.RL = RT_L;
  prdData.GSI = GSI;
  
  %% uni-variate data

  % tL-data
  f = f_Tung;
  l_i = f - l_T;                % -, scaled ultimate length at f
  L_i = L_m * l_i;              % cm, ultimate structural length at f
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - TC * r_B * tL(:,1)); % cm, expected length
  ELw = L/ del_M;               % cm, total length -at-time since birth
  
  % LW-data
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight -at- length

  % embryo-data
  f = f_Tull;
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  % aW-data
  a = [0; aW(:,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); % cm, structural length
  EWw_e = L .^ 3 * (1 + f * w); % g, wet weight embryo minus yolk
  % aY-data
  a = [0; aY(:,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0/TC 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; 
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * JT_E_Am;
  EY_e = max(0, M_E * w_E/ d_E - L3 * f * w); % g, wet weight yolk
  % aJO-data
  a = [0; aJO(:,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = [];
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * JT_E_Am; ee = mu_E * M_E ./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* M_E * mu_E; 
  pM = TC * p_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  X_gas = 1/ 24.4; % M, mol of gas per litre at T and 1 bar 
  EJO_e = - J_M(:,3) * 1e3/ X_gas; % ml/d, O2 flux

  %% pack to output
  prdData.tL = ELw;
  prdData.aW = EWw_e;
  prdData.aY = EY_e;
  prdData.aJO = EJO_e;
  prdData.LW = EWw;
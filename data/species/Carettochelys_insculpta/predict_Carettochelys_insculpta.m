function [prdData, info] = predict_Carettochelys_insculpta(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, carapace length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Ww_i = L_i^3 * (1 + f * w);       % g,  ultimate wet weight
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
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
  
  U_E0 = E_0/ p_Am;
  %pars_UE0 = [V_Hb; g; k_J; k_M; v]; U_E0 = initial_scaled_reserve(f, pars_UE0);
  UT_E0 = U_E0/ TC; LUH_0 = [1e-10 UT_E0 0];

  vT = v * TC; kT_J = TC * k_J; pT_M = p_M * TC; 
  a = aWY(:,1) - t_0;  i_sel = (a > 0); a = [-1e-10; a(i_sel)]; % d, ages
  [a LUH] = ode45(@dget_LUH, a, LUH_0, [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; 
  EWw_Y = UT_E0 * J_E_Am * w_E/ d_E + 0 * aWY(:,1); % g, initial wet yolk
  EWw_Y(i_sel) = LUH(:,2) * J_E_Am * w_E/ d_E;      % g, wet yolk

  a = aW(:,1) - t_0;  i_sel = (a > 0); a = [-1e-10; a(i_sel)]; % d, ages
  [a LUH] = ode45(@dget_LUH, a, LUH_0, [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1);
  EWw = 0 * aW(:,1); EWw(i_sel) = L.^3; % g, embryo wet weight
  
  a = aJO(:,1) - t_0;  i_sel = (a > 0); a = [-1e-10; a(i_sel)]; % d, ages
  [a LUH] = ode45(@dget_LUH, a, LUH_0, [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = [];
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * J_E_Am; ee = mu_E * M_E ./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* M_E * mu_E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJO = 0 * aJO(:,1); EJO(i_sel) = - J_M(:,3) * 24.4e3; % ml/d, O2 consumption
  
  % pack to output
  prdData.aW = EWw;
  prdData.aWY = EWw_Y;
  prdData.aJO = EJO;

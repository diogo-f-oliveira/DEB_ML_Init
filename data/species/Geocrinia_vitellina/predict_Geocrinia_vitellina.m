function [prdData, info] = predict_Geocrinia_vitellina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hh >= E_Hb
      info = 0; prdData = []; return
  end

  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_JO = tempcorr(temp.aJO, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  if 1 % if skipped, E_0 is treated as parameter
    pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
    U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
    E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap constant
  else
    U_E0 = E_0/ J_E_Am/ mu_E;   % d.cm^2, initial scaled reserve
  end

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0, U_Hh], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(end,1)/ TC_ah;          % d, age at hatch at f and T
  M_Eh = J_E_Am * aUL(end,2);        % mol, reserve at hatch at f
  L_h = aUL(end,3);                  % cm, structural length at f
  Lw_h = L_h/ del_M;                 % cm, S-V length at hatch at f
  Ww_h = L_h^3 + M_Eh * w_E/ d_E;    % g, wet weight at hatch at f
  Wd_h = L_h^3 * d_V  + M_Eh * w_E;  % g, dry weight at hatch at f
  E_h = M_V * L_h^3 * mu_V + M_Eh * mu_E; % J, energy at hatch at f
  
  % birth
  [U_H aUL] = ode45(@dget_aul, [0, U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_b = aUL(end,1)/ TC_ab;          % d, age at birth at f and T
  M_Eb = J_E_Am * aUL(end,2); % mol, reserve at hatch at f
  L_b = aUL(end,3); l_b = L_b/ L_m;  % cm, structural length at f
  Lw_b = L_b/ del_M;                 % cm, S-V length at birth at f
  Ww_b = L_b^3 + M_Eb * w_E/ d_E;    % g, wet weight at birth at f
  Wd_b = L_b^3 * d_V  + M_Eb * w_E;  % g, dry weight at birth at f
  E_b = aUL(end,2) * p_Am + mu_V * M_V * L_b^3; % J, energy at birth at f
  e_b = M_Eb/ M_V/ L_b^3/ m_Em;      % -, scaled reserve density at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wdh = Wd_h;
  prdData.Wwh = Ww_h;
  prdData.Wdb = Wd_b;
  prdData.Wwb = Ww_b;
  prdData.E0 = E_0;
  prdData.Eh = E_h;
  prdData.Eb = E_b;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % yolk
  vT = v * TC_JO; kT_J = TC_JO * k_J; pT_M = p_M * TC_JO; UT_E0 = U_E0/ TC_JO;  
  [a LUH] = ode45(@dget_LUH, aWY(:,1), [1e-10 UT_E0 0], [], kap, vT, kT_J, g, L_m);
  EWd_Y = max(0, LUH(:,2) * J_E_Am * TC_JO  - e_b * m_Em * LUH(:,1) .^ 3 * M_V) * w_E * 1e3; % predicted yolk in mg

  % body mass
  [a LUH] = ode45(@dget_LUH, aWV(:,1), [1e-10 UT_E0 0], [], kap, vT, kT_J, g, L_m);
  EWd_V = LUH(:,1).^3 * d_V * 1e3 * (1 + e_b * w); % predicted dry structure in mg

  % respiration
  %  1 mol oxygen = 22.4 L
  %  1 umol = 22.4 uL (u = micro) or 0.044643 umol = 1 uL
  a = [-1e-10; aJO(:,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 UT_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = [];
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * J_E_Am; ee = mu_E * M_E ./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* M_E * mu_E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJ_O = - J_M(:,3) * 1e6 * 22.4/ 24; % O2 flux in µml/h

  % pack to output
  prdData.aWY = EWd_Y;
  prdData.aWV = EWd_V;
  prdData.aJO = EJ_O;
  
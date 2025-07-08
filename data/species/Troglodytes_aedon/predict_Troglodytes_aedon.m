function [prdData, info] = predict_Troglodytes_aedon(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % zero-variate data

  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
  tau_x = get_tp(pars_tx, f); 
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);  % -, scaled times & lengths
  if ~info; prdData = []; return; end

  
  % birth
  tT_b = tau_b/ k_M/ TC_ab;           % d, age at birth at f and T
  aT_b = tT_b;                % d, time at birth at f and T
  L_b = L_m * l_b;                  % cm, struc length at birth
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth
  
  % fledging
  tT_x = (tau_x - tau_b)/ kT_M;         % d, time since birth at fledging

  % puberty
  tT_p = (tau_p - tau_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  [R_i, U_E0] = reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T
  RT_i = R_i * TC; U_E0 = U_E0/ TC_ab;

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tR = t_R;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight 
  tf = [0 04 08 12 16; f_00 f_04 f_08 f_12 f_16]'; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tW(:,1)*kT_M);
  EWw = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
  %
  tf = [0 04 08; f_p00 f_p04 f_p08]'; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tWp(:,1)*kT_M);
  EWw_p = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight

  % a-Ww and a-JC data for embryo with different v
  kT_J = k_J * TC_ab; kT_M = k_M * TC_ab; vT = v * TC_ab; JT_E_Am = J_E_Am * TC_ab; pT_M = p_M * TC_ab;
  a = [0; max(1e-3, aJCe(:,1))]; 
  [a LUH] = ode23(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = [];
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * JT_E_Am; ee = mu_E * M_E ./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* M_E * mu_E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  X_gas = 1/ 24.4;                     % M, mol of gas per litre at T and 1 bar 
  EJC_e = J_M(:,1) * 1e3/ X_gas;       % ml/d, CO2 flux
  EWw_e = L3 * (1 + f * ome);            % g, wet weight

  % pack to output
  prdData.tW = EWw;
  prdData.tWp = EWw_p;
  prdData.aWe = EWw_e;
  prdData.aJCe = EJC_e;

end


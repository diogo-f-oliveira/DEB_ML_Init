function [prdData, info] = predict_Taeniopygia_guttata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_JO = tempcorr(temp.tJOe, T_ref, T_A); 

  % zero-variate data

  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
  tau_x = get_tp(pars_tx, f); 
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);  % -, scaled times & lengths
  if ~info; prdData = []; return; end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  E_0 = p_Am * U_E0;            % J, initial energy content
  Ww_0 = w_E * E_0/ mu_E/ d_E;  % g, initial wet weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth at f 
  aT_b = t_0 + tau_b/ k_M/ TC_ab;   % d, age at birth at f and T

  % fledging
  tT_x = (tau_x - tau_b)/ kT_M;         % d, time since birth at fledging at f and T
  
  % puberty 
  tT_p = (tau_p - tau_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

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
  tf = [3 6 8 10 12; f_03 f_06 f_08 f_10 f_12]'; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tW(:,1)*kT_M);
  EWw = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
  
  % embryo data 
  % time-respiration
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  UT_E0 = initial_scaled_reserve(f_JO, pars_UE0)/ TC_JO; 
  vT = v * TC_JO; kT_J = k_J * TC_JO; pT_M = p_M * TC_JO; pT_Am = p_Am * TC_JO; 
  a = [0;tJOe(:,1) - t_0]; for i=2:length(a); if a(i)<=a(i-1); a(i)=a(i-1)+1e-8; end;end % d, ages 
  [a, LUH] = ode45(@dget_LUH,  a, [1e-10 UT_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); L3 = L .^3; 
  E = LUH(:,2) * pT_Am; ee = E./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJO_e = - J_M(:,3) * 24.4e3; % ml/d, O2 consumption
  % time-weight
  a = [0;tWe(:,1) - t_0]; for i=2:length(a); if a(i)<=a(i-1); a(i)=a(i-1)+1e-8; end;end % d, ages 
  [a, LUH] = ode45(@dget_LUH,  a, [1e-10 UT_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); L3 = L .^3; 
  EWw_e = L3 * (1+f_JO*ome); % g, wet weight embryo

  % pack to output
  prdData.tW = EWw;
  prdData.tWe = EWw_e;
  prdData.tJOe = EJO_e;

end

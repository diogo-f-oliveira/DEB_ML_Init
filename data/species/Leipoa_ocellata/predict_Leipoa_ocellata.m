function [prdData, info] = predict_Leipoa_ocellata(par, data, auxData)
  
  par.E_Hx = par.E_Hb + 1e-3; % fledge at hatch
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_tJO = TC_ab;

  if t_0 < 0 || z_m < 0 || f_dW < 0.4 || f_dW > 1 || f_050 < 0.4 || f_050 > 1  || f_100 < 0.4 || f_100 > 1 || f_200 < 0.4 || f_200 > 1 || f_300 < 0.4 || f_300 > 1 
    prdData = []; info = 0; return
  end

  % zero-variate data

  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
  [tau_x, ~,~,~,info] = get_tp(pars_tx, f); if info == 0; prdData = []; return; end
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); if info == 0; prdData = []; return; end % -, scaled times & lengths at f

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  E_0 = p_Am * U_E0;            % J, initial energy content
  Ww_0 = w_E * E_0/ mu_E/ d_E;  % g, initial wet weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f 
  aT_b = tau_b/ k_M/ TC_ab;      % d, age at birth at f and T
  
  % puberty
  tT_p = (tau_p - tau_b)/ kT_M;         % d, time since birth at pubert
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = (f - l_T) * L_mm;             % cm, ultimate structural length
  Ww_im = L_im^3 * (1 + f * ome_m);      % g, ultimate wet weight

  % growth at birth
  rT_B = kT_M/ 3/ (1 + f_dW/ g);
  dWw_b = (1 + f_dW * ome) * 3 * L_b^2 * rT_B * (f_dW * L_m - L_b);
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tR = t_R;
  prdData.am = aT_m;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.dWwb = dWw_b;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % embryo data
  % time-respiration
  U_E0 = initial_scaled_reserve(f, pars_UE0)/ TC_tJO;
  vT = v * TC_tJO; kT_J = k_J * TC_tJO; pT_M = p_M * TC_tJO;
  a = [0; tJOe(:,1) - t_0]; n_a = length(a); % d, ages
  for i=2:n_a; if a(i)<=a(i-1); a(i)=a(i-1)+1e-3; end; end
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = [];
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * J_E_Am; ee = mu_E * M_E ./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* M_E * mu_E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJO = - J_M(:,3) * 24.4e3/ 24; % ml/h, O2 consumption
  
  % time-yolk energy: yolk = E - f*E_m*L^3
  a = [0; tEY(:,1) - t_0]; n_a = length(a); % d, ages
  for i=2:n_a; if a(i)<=a(i-1); a(i)=a(i-1)+1e-3; end; end
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = [];
  %L = LUH(:,1); E = LUH(:,2) * p_Am; EE_Y = del_Y * (E - L.^3 * E_m)/1e3; % kJ
  L = LUH(:,1); E = LUH(:,2) * p_Am; EE_Y = del_Y * E/1e3; % kJ
  
  % time-embryo mass energy: 
  a = [0; tEV(:,1) - t_0]; n_a = length(a); % d, ages
  for i=2:n_a; if a(i)<=a(i-1); a(i)=a(i-1)+1e-3; end; end
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = [];
  %L = LUH(:,1); EE_V = L .^3 * (d_V * mu_V + E_m)/ 1e3; % kJ 
  L = LUH(:,1); EE_V = L .^3 * d_V * mu_V/ 1e3; % kJ 
  
  % time-weight
  tf = [50 100 200 300; f_050 f_100 f_200 f_300]'; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tW(:,1)*kT_M);
  EWw = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight

  % pack to output
  prdData.tJOe = EJO;
  prdData.tEY = EE_Y; 
  prdData.tEV = EE_V;  
  prdData.tW = EWw;

end

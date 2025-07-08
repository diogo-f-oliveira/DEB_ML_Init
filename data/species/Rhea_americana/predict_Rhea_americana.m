function [prdData, info] = predict_Rhea_americana(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if f_e > 1.8 || f_e < 0.5 || t_0 < 0; info = 0; prdData = []; return; end
  
  [l_b, info] = get_lb([g; k; v_Hb], f_e);
  if ~info
    prdData = []; info = 0; return
  end

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_JO = tempcorr(temp.tJO, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
  [tau_x, ~,~,~,info] = get_tp(pars_tx, f); if info == 0; prdData = []; return; end
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  if ~info; prdData = []; return; end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  E_0 = p_Am * U_E0;            % J, initial energy content
  Ww_0 = w_E * E_0/ mu_E/ d_E;  % g, initial wet weight

  % birth
  aT_b = t_0 + tau_b/ k_M/ TC_ab;   % d, age at birth at f and T
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth

  % fledging
  tT_x = (tau_x - tau_b)/ kT_M;         % d, time since birth at fledging

  % puberty
  tT_p = (tau_p - tau_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

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
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp]; % compose parameter vector

  % pack to output
  prdData.ab = aT_b;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tR = t_R;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.E0 = E_0;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight
  % female
  tf = [40 75; f_40 f_75]'; tf(:,1) = tf(:,1) * kT_M;
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, tf, [], tW_f(:,1)*kT_M);
  EWw_f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
  % male
  tvel = get_tp(pars_tpm, tf, [t_b, tf(end,2)*z/z_m, l_b*z/z_m], tW_m(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome_m); % g, weight

  % embryo data 
  U_E0 = initial_scaled_reserve(f_e, pars_UE0);
  vT = v * TC_JO; kT_J = k_J * TC_JO; pT_M = p_M * TC_JO; UT_E0 = U_E0/ TC_JO; pT_Am = p_Am * TC_JO; 
  a = [0;tJO(:,1) - t_0]; n=length(a); for i=2:n; if a(i)<=a(i-1); a(i)=a(i-1)+1e-8; end;end % d, ages 
  [a, LUH] = ode45(@dget_LUH,  a, [1e-10 UT_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; 
  %   L = LUH(1); % cm, structural length
  %   U = LUH(2); % d.cm^2, scaled reserve M_E/{J_EAm} = E/ {p_{Am}
  L = LUH(:,1); L3 = L .^3; 
  E = LUH(:,2) * pT_Am; ee = E./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJO = - J_M(:,3) * 24.4e3/ 24; % ml/h, O2 consumption

  % pack to output
  prdData.tJO = EJO;
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;

end

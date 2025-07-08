function [prdData, info] = predict_Aythya_americana(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % zero-variate data

  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
  tau_x = get_tp(pars_tx, f); % -, scaled time
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [tau_p, tau_b, ~, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; 
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b =  tau_b/ k_M/ TC_ab;      % d, age at birth at f and T

  %% fledging
  tT_x = (tau_x - tau_b)/ kT_M;         % d, time since birth at fledging

  % puberty
  tT_p = (tau_p - tau_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
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
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];% compose parameter vector
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tR = t_R;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwi_m = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight
  % embryos
  LUH_0 = [1e-10 U_E0/ TC_ab 0];
  t = max(0,[0;tW_e(:,1)]); n = length(t); for i=2:n; if t(i)<=t(i-1); t(i)=t(i-1)+1e-3; end; end
  [~, LUH] = ode45(@dget_LUH, t, LUH_0, [], kap, v * TC_ab, TC_ab * k_J, g, L_m); 
  LUH(1,:) = []; 
  EWw_e = LUH(:,1).^3 * (1 + f * w); % g, embryo wet weight
  
  % time-weight
  tf = [05 10 30 50 70; f_05 f_10 f_30 f_50 f_70]'; tf(:,1) = tf(:,1) * kT_M;
  % female
  [tvel, ~, tau_b, ~, l_b] = get_tp(pars_tp, tf, [], tW_f(:,1)*kT_M);
  EWw_f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male
  tvel = get_tp(pars_tpm, tf, [tau_b, z/z_m, l_b*z/z_m], tW_m(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome_m); % g, weight

  % pack to output
  prdData.tW_e = EWw_e;
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;


  
end

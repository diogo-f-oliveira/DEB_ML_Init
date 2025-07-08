function [prdData, info] = predict_Pelecanus_onocrotalus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if f_00 < 0; info = 0; prdData = []; return; end
      
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
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f 
  aT_b = tau_b/ k_M/ TC_ab;     % d, age at birth at f and T

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
  L_im = f * L_mm;                     % cm, struct length
  Ww_im = L_im^3 * (1 + f * ome_m);      % g, ultimate wet weight
  L_bm = L_mm * get_lb([g_m; k; v_Hb;], f);  % cm, struc length at birth      

  % pack to output
  prdData.ab = aT_b;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tR = t_R;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight: varying food
  tf = [0 10 20 30 40 50 60 70; f_00 f_10 f_20 f_30 f_40 f_50 f_60 f_70]'; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tW(:,1)*kT_M);
  EWw = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
  
  % hand-reared
  tf = [4 9; f_4 f_9]'; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tW1(:,1)*kT_M);
  EWw_1 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
  %
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tW2(:,1)*kT_M);
  EWw_2 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
  %
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tW3(:,1)*kT_M);
  EWw_3 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight

  % pack to output
  prdData.tW = EWw;
  prdData.tW1 = EWw_1;
  prdData.tW2 = EWw_2;
  prdData.tW3 = EWw_3;

end

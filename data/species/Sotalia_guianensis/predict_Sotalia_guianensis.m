function [prdData, info] = predict_Sotalia_guianensis(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = TC * k_M;

  % foetal development
  pars_tx = [g; k; l_T; v_Hb; v_Hx; v_Hp];        % compose pars for get_tx
  [tau_p, tau_x, tau_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f); % -, scaled age at puberty

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  tT_g = t_0 + tau_b/ kT_M;         % d, gestation time at f and T

  % weaning
  tT_x = (tau_x - tau_b)/ k_M/ TC;  % d, time since birth at weaning at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Ww_im = L_im^3 * (1 + f * ome_m);      % g, ultimate wet weight
  pars_txm = [g_m; k; l_T; v_Hb; v_Hx; v_Hp];% compose parameter vector

  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % time-length
  tf = [240 f_240; f_280 f_280]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tx(pars_tx, tf, [], tL_f(:,1)*kT_M); 
  ELw_f = L_m * tvel(:,4)/ del_M; % total length
  %
  tvel = get_tx(pars_txm, tf, [0 z/z_m l_b * z/z_m], tL_m(:,1)*kT_M); 
  ELw_m = L_mm * tvel(:,4)/ del_M; % total length

  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  
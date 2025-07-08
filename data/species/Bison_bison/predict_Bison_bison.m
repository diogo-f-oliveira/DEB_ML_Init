function [prdData, info] = predict_Bison_bison(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp]; % slow developmen
  pars_tx = [g k l_T v_Hb v_Hx v_Hp 1]; % slow development
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ kT_M;           % d, gestation time at f and T

  % weaning
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at fledging at f and T
  
  % puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
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
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp]; 
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f, [t_b f*z/z_m l_b*z/z_m]);
  L_bm = L_mm * l_bm; Ww_bm = L_bm^3 * (1 + f * w_m); % g, weight at birth
  L_im = L_mm * f; Ww_im = L_im^3 * (1 + f * w_m); % g, weight at ultimate
  tT_gm = t_0 + t_b/ kT_M;     % d, gestation time for male calves
  tT_pm = (t_pm - t_b)/ kT_M; % d, age at puberty for males

  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwbm = Ww_bm;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  % time-weight
  % female O
  l_0f = (Ww_0fO * 1e3/ (1 + f_O * w))^(1/3)/ L_m;
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_O, [t_b f_O l_0f], tW_fO(:,1)*kT_M);
  EWw_fO = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male O
  l_0m = (Ww_0mO * 1e3/ (1 + f_O * w_m))^(1/3)/ L_mm;
  tvel = get_tp(pars_tpm, f_O, [t_b, f_O*z/z_m, l_0m], tW_mO(:,1)*kT_M);
  EWw_mO = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  % female K
  l_0f = (Ww_0fK * 1e3/ (1 + f_K* w))^(1/3)/ L_m;
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_K, [t_b f_K l_0f], tW_fK(:,1)*kT_M);
  EWw_fK = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male K
  l_0m = (Ww_0mK * 1e3/ (1 + f_K * w_m))^(1/3)/ L_mm;
  tvel = get_tp(pars_tpm, f_K, [t_b, f_K*z/z_m, l_0m], tW_mK(:,1)*kT_M);
  EWw_mK = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  % pack to output
  prdData.tW_fO = EWw_fO;
  prdData.tW_fK = EWw_fK;
  prdData.tW_mO = EWw_mO;
  prdData.tW_mK = EWw_mK;

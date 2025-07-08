function [prdData, info] = predict_Ursus_thibetanus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ k_M/ TC;        % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ k_M/ TC;      % d, time since birth at fledging at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

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
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_txm = [g_m k l_T v_Hb v_Hx v_Hp]; 
  [t_pm, t_xm, t_bm, l_pm, l_xm, l_bm] = get_tx(pars_txm, f);
  L_bm = L_mm * l_bm; L_im = (f - l_T) * L_mm; 
  Ww_im = L_im^3 * (1 + f * w_m);

  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;  
  prdData.Wwim = Ww_im;  
  prdData.Ri = RT_i;  
  
  % uni-variate data
  
  % time-weight 
  rT_B = TC * k_M/ 3/ (1 + f_tW1/ g) ;                     % 1/d, von Bert growth rate
  L_i = f_tW1 * L_m; L_b = get_lb([g; k; v_Hb], f_tW1) * L_m; % cm, length at birth, ultimate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW_1(:,1));       % cm, structural length at time
  EWw_1 = L.^3 * (1 + f_tW1 * w);                          % g, wet weight
  %
  rT_B = TC * k_M/ 3/ (1 + f_tW2/ g) ;                    % 1/d, von Bert growth rate
  L_i = f_tW2 * L_m; L_b = get_lb([g; k; v_Hb], f_tW2) * L_m; % cm, length at birth, ultimate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW_2(:,1));      % cm, structural length at time
  EWw_2 = L.^3 * (1 + f_tW2 * w);                         % g, wet weight
  
  % pack to output
  prdData.tW_1 = EWw_1;
  prdData.tW_2 = EWw_2;
  
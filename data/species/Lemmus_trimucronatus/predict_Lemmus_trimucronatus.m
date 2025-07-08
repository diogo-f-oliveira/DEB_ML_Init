function [prdData, info] = predict_Lemmus_trimucronatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
 
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; info = 1;
  [t_p, t_x, t_b, l_p, l_x, l_b] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + t_b/ k_M/ TC;        % d, gestation time at f and T

  % weaning
  tT_x = (t_x - t_b)/ k_M/ TC;      % d, time since birth at weaning at f and T
  
  % puberty 
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
  [t_pm, t_bm, l_pm, l_bm] = get_tp([g_m k l_T v_Hb v_Hp], f);
  L_im = f * L_mm; L_bm = l_bm * L_mm;                  % cm, ultimate structural length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.tg = aT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight 
  pars_lb = [g; k; v_Hb];
  % tW6
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;     % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW6(:,1));     % cm, structural length at time
  EWw_6 = L.^3 * (1 + f * w);                          % g, wet weight
  % tW1
  f = f_tWi;                                           % func response
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;     % d, 1/von Bert growth rate
  L_i = f * L_m - L_T; L_b = get_lb(pars_lb, f) * L_m; % cm, length at birth, ultimate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW1(:,1));     % cm, structural length at time
  EWw_1 = L.^3 * (1 + f * w);                          % g, wet weight
  % tW2
  L = L_i - (L_i - L_b) * exp( - rT_B * tW2(:,1));     % cm, structural length at time
  EWw_2 = L.^3 * (1 + f * w);                          % g, wet weight
  % tW4
  L = L_i - (L_i - L_b) * exp( - rT_B * tW4(:,1));     % cm, structural length at time
  EWw_4 = L.^3 * (1 + f * w);                          % g, wet weight
  % tW5
  L = L_i - (L_i - L_b) * exp( - rT_B * tW5(:,1));     % cm, structural length at time
  EWw_5 = L.^3 * (1 + f * w);                          % g, wet weight
  % tW7
  L = L_i - (L_i - L_b) * exp( - rT_B * tW7(:,1));     % cm, structural length at time
  EWw_7 = L.^3 * (1 + f * w);                          % g, wet weight
  % tW8
  L = L_i - (L_i - L_b) * exp( - rT_B * tW8(:,1));     % cm, structural length at time
  EWw_8 = L.^3 * (1 + f * w);                          % g, wet weight
  % tW9
  f = f_tW9;                                           % func response
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;     % d, 1/von Bert growth rate
  L_i = f * L_m - L_T; L_b = get_lb(pars_lb, f) * L_m; % cm, length at birth, ultimate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW9(:,1));     % cm, structural length at time
  EWw_9 = L.^3 * (1 + f * w);                          % g, wet weight

  % pack to output
  prdData.tW1 = EWw_1;
  prdData.tW2 = EWw_2;
  prdData.tW4 = EWw_4;
  prdData.tW5 = EWw_5;
  prdData.tW6 = EWw_6;
  prdData.tW7 = EWw_7;
  prdData.tW8 = EWw_8;
  prdData.tW9 = EWw_9;
  
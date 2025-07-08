function [prdData, info] = predict_Hoplobatrachus_tigerinus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  
  % zero-variate data

  % tadpole
  p_Am_b = z_b * p_M/ kap;         % J/d.cm^2, {p_Am} max spec assimilation flux for tadpole
  J_E_Am_b = p_Am_b/ mu_E;         % mol/d.cm^2, {J_EAm}, max surface-spec assimilation  for tadpole
  E_m_b = p_Am_b/ v;               % J/cm^3, [E_m] reserve capacity for tadpole
  m_Em_b = y_E_V * E_m_b/ E_G;     % mol/mol, reserve capacity for tadpole
  g_b = E_G/ kap/ E_m_b;           % -, energy investment ratio for tadpole
  w_b = m_Em_b * w_E/ w_V;         % -, contribution of reserve to weight for tadpole
  L_m_b = v/ k_M/ g_b;             % cm, maximum structural length for tadpole
  % maturity at birth
  U_Hb_b = M_Hb/ J_E_Am_b;             % cm^2 d, scaled maturity at birth
  V_Hb_b = U_Hb_b/ (1 - kap);          % cm^2 d, scaled maturity at birth
  v_Hb_b = V_Hb_b * g_b^2 * k_M^3/ v^2;  % -, scaled maturity at birth
  % maturity at metamorphosis
  U_Hj_b = M_Hj/ J_E_Am_b;             % cm^2 d, scaled maturity at metamorphosis
  V_Hj_b = U_Hj_b/ (1 - kap);          % cm^2 d, scaled maturity at metamorphosis
  v_Hj_b = V_Hj_b * g_b^2 * k_M^3/ v^2;  % -, scaled maturity at metamorphosis
  
  % life cycle for tadpole
  pars_tp = [g_b k l_T v_Hb_b v_Hj_b]; % for tadpole
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m_b * l_b;               % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w_b);    % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC;             % d, age at birth at f and T

  % metam
  L_j = L_m_b * l_j;               % cm, structural length at puberty at f
  Lw_j = L_j/ del_M;               % cm, physical length at puberty at f
  Ww_j = L_j^3 * (1 + f * w_b);    % g, wet weight at puberty 
  tT_j = (t_j - t_b)/ k_M/ TC;     % d, time since birth at puberty at f and T
  
  % ultimate for tadpole (for tL-data)
  Lw_bi = f * L_m_b/ del_M;

  % puberty for toad
  pars_tp = [g; k; l_T; v_Hj; v_Hp]; % compose parameter vector
  [t_p, t_jb, l_p, l_jb] = get_tp(pars_tp, f, L_j/ L_m); % -, scaled length at birth at f
  tT_p = (t_p - t_j)/ k_M/ TC;   % d, time since metam at puberty at f and T
  
  % ultimate for toad
  l_i = f - l_T;                  % -, scaled ultimate length at f
  L_i = L_m * l_i;                % cm, ultimate structural length at f
  Lw_i = L_i/ del_Mj;             % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);     % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                  % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                 % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j; % of tadpole
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j; % of tadpole
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % t-L data for larva
  f = f_1; L_b = L_m_b * get_lb([g_b k v_Hb_b], f); L_bi = f * L_m_b;
  rT_B = TC * k_M/ 3/ (1 + f/ g); % d 1/von Bert growth rate
  EWw_1 = (L_bi - (L_bi - L_b) * exp( - rT_B * tW1(:,1))).^3 * (1 + f * w); % g, wet weight
  %
  f = f_5; L_b = L_m_b * get_lb([g_b k v_Hb_b], f); L_bi = f * L_m_b;
  rT_B = TC * k_M/ 3/ (1 + f/ g); % d 1/von Bert growth rate
  EWw_5 = (L_bi - (L_bi - L_b) * exp( - rT_B * tW5(:,1))).^3 * (1 + f * w); % g, wet weight
  %
  f = f_10; L_b = L_m_b * get_lb([g_b k v_Hb_b], f); L_bi = f * L_m_b;
  rT_B = TC * k_M/ 3/ (1 + f/ g); % d 1/von Bert growth rate
  EWw_10 = (L_bi - (L_bi - L_b) * exp( - rT_B * tW10(:,1))).^3 * (1 + f * w); % g, wet weight
  %
  f = f_20; L_b = L_m_b * get_lb([g_b k v_Hb_b], f); L_bi = f * L_m_b;
  rT_B = TC * k_M/ 3/ (1 + f/ g); % d 1/von Bert growth rate
  EWw_20 = (L_bi - (L_bi - L_b) * exp( - rT_B * tW20(:,1))).^3 * (1 + f * w); % g, wet weight
  %
  f = f_40; L_b = L_m_b * get_lb([g_b k v_Hb_b], f); L_bi = f * L_m_b;
  rT_B = TC * k_M/ 3/ (1 + f/ g); % d 1/von Bert growth rate
  EWw_40 = (L_bi - (L_bi - L_b) * exp( - rT_B * tW40(:,1))).^3 * (1 + f * w); % g, wet weight
  %
  f = f_80; L_b = L_m_b * get_lb([g_b k v_Hb_b], f); L_bi = f * L_m_b;
  rT_B = TC * k_M/ 3/ (1 + f/ g); % d 1/von Bert growth rate
  EWw_80 = (L_bi - (L_bi - L_b) * exp( - rT_B * tW80(:,1))).^3 * (1 + f * w); % g, wet weight
  %
  f = f_120; L_b = L_m_b * get_lb([g_b k v_Hb_b], f); L_bi = f * L_m_b;
  rT_B = TC * k_M/ 3/ (1 + f_120/ g); % d 1/von Bert growth rate
  EWw_120 = (L_bi - (L_bi - L_b) * exp( - rT_B * tW120(:,1))).^3 * (1 + f * w); % g, wet weight

  % pack to output
  prdData.tW1 = EWw_1;
  prdData.tW5 = EWw_5;
  prdData.tW10 = EWw_10;
  prdData.tW20 = EWw_20;
  prdData.tW40 = EWw_40;
  prdData.tW80 = EWw_80;
  prdData.tW120 = EWw_120;

function [prdData, info] = predict_Kurixalus_idiootocus(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tW = tempcorr(temp.tW1, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b] = get_tp(pars_tj, f);       % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
  tT_j = (t_j - t_b)/ k_M;           % d, time since birth at metam at T_ref
  
  % puberty 
  tT_p = (t_p - t_j)/ k_M/ TC;      % d, time since metam at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_tW;               % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm;                     % cm, ultimate struct length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  Lw_im = L_im/ del_M;                 % cm, SVL

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
   % univariate data
  % time-weight
  f = f_1; L_i = L_m * f; L_b = L_m * get_lb([g; k; v_Hb;], f);
  rT_B = TC_tW * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(- rT_B * tW1(:,1)); % cm, struc length
  EWw_1 = L.^3 * (1 + f * w); % g, wet weight
  %
  f = f_2; L_i = L_m * f; L_b = L_m * get_lb([g; k; v_Hb;], f);
  rT_B = TC_tW * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(- rT_B * tW2(:,1)); % cm, struc length
  EWw_2 = L.^3 * (1 + f * w); % g, wet weight
  %
  f = f_4; L_i = L_m * f; L_b = L_m * get_lb([g; k; v_Hb;], f);
  rT_B = TC_tW * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(- rT_B * tW4(:,1)); % cm, struc length
  EWw_4 = L.^3 * (1 + f * w); % g, wet weight
  %
  f = f_8; L_i = L_m * f; L_b = L_m * get_lb([g; k; v_Hb;], f);
  rT_B = TC_tW * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(- rT_B * tW8(:,1)); % cm, struc length
  EWw_8 = L.^3 * (1 + f * w); % g, wet weight

  % pack to output
  prdData.tW1 = EWw_1;
  prdData.tW2 = EWw_2;
  prdData.tW4 = EWw_4;
  prdData.tW8 = EWw_8;


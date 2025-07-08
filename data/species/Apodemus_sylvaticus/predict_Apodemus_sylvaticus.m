function [prdData, info] = predict_Apodemus_sylvaticus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = TC * k_M;

  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [tau_p, tau_x, tau_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + tau_b/ kT_M;         % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Lw_x = L_x/ del_M;                % cm, total length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (tau_x - tau_b)/ kT_M;     % d, time since birth at fledging at f and T
  
  % puberty
  
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty at f
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty at f and T


  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);      % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);   % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                  % d, mean life span at T
 
  % delete the section for males if no sexual dimorphism
  % males differ from females by {p_Am}:
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length  
  U_Hpm = E_Hpm / p_Am_m; 
  v_Hpm = (U_Hpm * g^2 * k_M ^ 3) / ((1 - kap) * v^2);
  pars_txm = [g_m k l_T v_Hb v_Hx v_Hpm]; 
  [tau_pm, tau_xm, tau_bm, l_pm, l_xm, l_bm, info] = get_tx(pars_txm, f);
  tT_pm = (tau_pm - tau_bm)/ k_M/ TC;  % d, time since birth at puberty at f and T
  L_pm = L_mm * l_pm;                  % cm, structural length at puberty at f
  Ww_pm = L_pm^3 * (1 + f * w_m);      % g, wet weight at puberty at f

  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.Wwi = Ww_i;
  prdData.Ri  = RT_i;
  
  % uni-variate data
  
  % time-weight 1 LAB
  L_init = ((W0.tW1 / (1 + f * w)))^(1/3); % initial structural lenght, cm
  L_i = L_m * (f - l_T);
  rT_B = TC * k_M/ 3/ (1 + f/ g);  % d, 1/von Bert growth rate
  L = L_i - (L_i - L_init) * exp( - rT_B * tW1(:,1)); % cm, total length
  EWw1 = L.^3 * (1 + f * w);                          % g, wet weight

  % time-weight 2 FIELD
  L_init = ((W0.tW2 / (1 + f_f * w)))^(1/3); % initial structural lenght, cm
  L_i = L_m * (f_f - l_T);
  rT_B = TC * k_M/ 3/ (1 + f_f/ g);  % d, 1/von Bert growth rate
  L = L_i - (L_i - L_init) * exp( - rT_B * tW2(:,1)); % cm, total length
  EWw2 = L.^3 * (1 + f_f * w);                        % g, wet weight  
  
  % pack to output
  prdData.tW1 = EWw1;
  prdData.tW2 = EWw2;

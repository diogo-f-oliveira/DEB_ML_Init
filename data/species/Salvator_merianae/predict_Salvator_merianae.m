function [prdData, info] = predict_Salvator_merianae(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_LL = tempcorr(temp.LL, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, ultimate structural length at f
  Ww_p = L_p^3 * (1 + f * w);       % g,  wet weight at puberty
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, age at puberty at f and T

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;               % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;          % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);          % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;      % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;          % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;               % cm, max struct length
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * w_m);   % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % length-length/weight
  L0 = init.LL; W0 = init.WW;
  L_i = f_1 * L_m; Lw_i = L_i/ del_M; rT_B = TC_LL * k_M/ 3/ (1 + f_1/ g); % 1/d, von Bert growth rate
  ELw_1 = Lw_i - (Lw_i - L0(1)) * exp( - rT_B * 42); % cm, TL 
  EWw_1 = (L_i - (L_i - (W0(1)/(1 + f_1*w))^(1/3)) * exp( - rT_B * 42))^3 * (1 + f_1 * w); % g, weight 
  %
  L_i = f_2 * L_m; Lw_i = L_i/ del_M; rT_B = TC_LL * k_M/ 3/ (1 + f_2/ g); % 1/d, von Bert growth rate
  ELw_2 = Lw_i - (Lw_i - L0(2)) * exp( - rT_B * 42); % cm, TL 
  EWw_2 = (L_i - (L_i - (W0(2)/(1 + f_2*w))^(1/3)) * exp( - rT_B * 42))^3 * (1 + f_2 * w); % g, weight 
  %
  L_i = f_3 * L_m; Lw_i = L_i/ del_M; rT_B = TC_LL * k_M/ 3/ (1 + f_3/ g); % 1/d, von Bert growth rate
  ELw_3 = Lw_i - (Lw_i - L0(3)) * exp( - rT_B * 42); % cm, TL 
  EWw_3 = (L_i - (L_i - (W0(3)/(1 + f_3*w))^(1/3)) * exp( - rT_B * 42))^3 * (1 + f_3 * w); % g, weight 
  %
  L_i = f_4 * L_m; Lw_i = L_i/ del_M; rT_B = TC_LL * k_M/ 3/ (1 + f_4/ g); % 1/d, von Bert growth rate
  ELw_4 = Lw_i - (Lw_i - L0(4)) * exp( - rT_B * 42); % cm, TL 
  EWw_4 = (L_i - (L_i - (W0(4)/(1 + f_4*w))^(1/3)) * exp( - rT_B * 42))^3 * (1 + f_4 * w); % g, weight 

  
  % pack to output
  prdData.LL = [ELw_1; ELw_2; ELw_3; ELw_4];
  prdData.WW = [EWw_1; EWw_2; EWw_3; EWw_4];
  
function [prdData, info] = predict_Rhaebo_blombergi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b] = get_tp(pars_tj, f);       % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;              % cm, structural length at puberty at f
  Ww_j = L_j^3 * (1 + f * ome); % g, wet weight at puberty 
  tT_j = (t_j - t_b)/ k_M/ TC;  % d, time since birth at puberty at f and T

  % puberty for toad
  pars_tp = [g; k; l_T; v_Hj; v_Hp]; % compose parameter vector
  [t_p, t_jb, l_p, l_jb] = get_tp(pars_tp, f, L_j/ L_m); % -, scaled length at birth at f
  L_p = L_m * l_p;               % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * ome);  % g, wet weight at puberty 
  tT_p = (t_p - t_jb)/ k_M/ TC;  % d, time time metam at puberty at f and T
  
  % ultimate for toad
  l_i = f - l_T;                  % -, scaled ultimate length at f
  L_i = L_m * l_i;                % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;              % cm, ultimate body length at f
  Ww_i = L_i^3 * (1 + f * ome);   % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                 % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm;                     % cm, ultimate struct length
  Lw_im = L_im/del_M;                  % cm, ultimate body length

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % t-L data for larva
  rT_B = TC * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  ELw = (L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)))/ del_M; % cm, body length
  

  % pack to output
  prdData.tL = ELw;

function [prdData, info] = predict_Pyxicephalus_adspersus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
  
  % zero-variate data
  
  % life cycle for tadpole
  pars_tpj = [g k l_T v_Hb v_Hj]; % for tadpole
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tpj, f);
  pars_tp = [g k l_T v_Hb v_Hp]; % for frog
  [t_p, t_b, l_p, l_b] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mb;               % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;              % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;              % cm, structural length at puberty at f
  Lw_j = L_j/ del_M;            % cm, physical length at puberty at f
  Ww_j = L_j^3 * (1 + f * w);   % g, wet weight at puberty 
  tT_j = (t_j - t_b)/ k_M/ TC_ab;  % d, time since birth at puberty at f and T
  
  % puberty for frog
  L_p = L_m * l_p;               % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;             % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);    % g, wet weight at puberty 
  tT_p = (t_p - t_j)/ k_M/ TC;   % d, time time metam at puberty at f and T
  
  % ultimate for toad
  l_i = f - l_T;                  % -, scaled ultimate length at f
  L_i = L_m * l_i;                % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;              % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);     % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);               % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;              % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate structural, body length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % t-L data for larva
  rT_B = TC_tL * k_M/ 3/ (1 + f_tL/ g); rT_Bm = TC_tL * k_M/ 3/ (1 + f_tL/ g_m); % d 1/von Bert growth rate
  L_i = f_tL * L_m; L_im = f_tL * L_mm; 
  ELw_f = (L_i - (L_i - L_j) * exp( - rT_B * tL_f(:,1)))/ del_M; % cm, body length at time
  EWw_f = (L_i - (L_i - L_j) * exp( - rT_B * tW_f(:,1))).^3 * (1 + f_tL * w); % g, wet weight
  ELw_m = (L_im - (L_im - L_j) * exp( - rT_Bm * tL_m(:,1)))/ del_M; % cm, body length at time
  EWw_m = (L_im - (L_im - L_j) * exp( - rT_Bm * tW_m(:,1))).^3 * (1 + f_tL * w_m); % g, wet weight
  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
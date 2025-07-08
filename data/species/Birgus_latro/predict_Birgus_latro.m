function [prdData, info] = predict_Birgus_latro(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_L2 = tempcorr(temp.L2, T_ref, T_A);
  TC = tempcorr(temp.tp, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth

  % metam
  L_j = l_j * L_m;                  % cm, struct length at puberty
  Lw_j = L_j/ del_M;                % cm, thoracic length at puberty
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % growth
  rT_B = rho_B * k_M * TC_L2;       % 1/d, von Bert growth rate
  Lw_2 = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (365 * 2.5 - tT_j)); % cm, thoracic length at 2.5 yr 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  %pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  %t_m = get_tm_s(pars_tm, f);  % -, scaled mean life span at T_ref
  pars_tm = [g; k; v_Hb; v_Hj; v_Hp; h_a/k_M^2; s_G]; 
  t_m = get_tm_mod('abj', pars_tm, f);  % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = l_i * L_mm; Lw_im = L_im/ del_M; % cm, ultimate total length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimagte wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.L2 = Lw_2;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univariate data
  
  % length-change in length
  % females
  kT_M = k_M * TC; rT_B = rho_B * kT_M; 
  EdLw_f = rT_B * (Lw_i - LdL_f(:,1)); % cm, thoracic length females
  % males
  kT_M = k_M * TC; rT_Bm = rho_Bm * kT_M; 
  EdLw_m = rT_Bm * (Lw_im - LdL_m(:,1)); % cm, thoracic length males

  prdData.LdL_f = EdLw_f;
  prdData.LdL_m = EdLw_m;

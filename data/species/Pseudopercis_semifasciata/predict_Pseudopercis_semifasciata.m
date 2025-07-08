function [prdData, info] = predict_Pseudopercis_semifasciata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  
  % metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  L_j = l_j * L_m;                  % cm, structural length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max reproduction rate
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % yellow males
  p_Am_my = z_my * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_my = p_Am_my/ v;                   % J/cm^3, reserve capacity [E_m]
  g_my = E_G/ (kap* E_m_my);             % -, energy investment ratio
  m_Em_my = y_E_V * E_m_my/ E_G;         % mol/mol, reserve capacity 
  w_my = m_Em_my * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmy = v/ k_M/ g_my;                  % cm, max struct length
  pars_tjmy = [g_my k l_T v_Hb v_Hj v_Hp];
  [t_jmy, t_pmy, t_bmy, l_jmy, l_pmy, l_bmy, l_imy, rho_jmy, rho_Bmy] = get_tj(pars_tjmy, f);
  L_imy = L_mmy * l_imy; Ww_imy = L_imy^3 * (1 + f * w_my); Lw_imy = L_imy/ del_M;
  % gray males
  p_Am_mg = z_mg * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mg = p_Am_mg/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mg = E_G/ (kap* E_m_mg);             % -, energy investment ratio
  m_Em_mg = y_E_V * E_m_mg/ E_G;         % mol/mol, reserve capacity 
  w_mg = m_Em_mg * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmg = v/ k_M/ g_mg;                  % cm, max struct length
  pars_tjmg = [g_mg k l_T v_Hb v_Hj v_Hp];
  [t_jmg, t_pmg, t_bmg, l_jmg, l_pmg, l_bmg, l_img, rho_jmg, rho_Bmg] = get_tj(pars_tjmg, f);
  L_img = L_mmg * l_img; Ww_img = L_img^3 * (1 + f * w_mg); Lw_img = L_img/ del_M;

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Limy = Lw_imy;
  prdData.Limg = Lw_img;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwimy = Ww_imy;
  prdData.Wwimg = Ww_img;
  prdData.Ri = RT_i;
   
  % time-length
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;      % cm, length
  % yellow male
  tvel = get_tj(pars_tjmy, f_tL, [t_b, f_tL*z/z_my, l_b*z/z_my], tL_my(:,1)*kT_M);
  ELw_my = L_mmy * tvel(:,4)/ del_M;   % cm, length
  % gray male
  tvel = get_tj(pars_tjmg, f_tL, [t_b, f_tL*z/z_mg, l_b*z/z_mg], tL_mg(:,1)*kT_M);
  ELw_mg = L_mmg * tvel(:,4)/ del_M;   % cm, length
  
  %% pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_my = ELw_my;
  prdData.tL_mg = ELw_mg;


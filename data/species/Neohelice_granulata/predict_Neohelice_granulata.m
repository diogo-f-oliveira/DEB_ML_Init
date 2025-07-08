function [prdData, info] = predict_Neohelice_granulata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tW = tempcorr(temp.tWZI, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
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
  L_im = l_i * L_mm; Lw_im = L_im/ del_M; % cm, ultimate total length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_pm = l_pm * L_mm; Lw_pm = L_pm/ del_M; % cm, struc length, carapace width
  Ww_pm = L_pm^3 * (1 + f * w_m);      % g, wet weight at puberty
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimagte wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  
  % uni-variate data
  
  % time-length post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC;  rT_B = rho_B * kT_M; L_0 = Lw_0 * del_M; L_i = L_m * l_i;
  L = L_i - (L_i - L_0) * exp( - rT_B * tL_f(:,1)); % cm, struc length females
  ELw_f = L / del_M; % cm, carapace width
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tL);
  kT_M = k_M * TC;  rT_Bm = rho_Bm * kT_M; L_im = L_mm * l_im; 
  L = L_im - (L_im - L_0) * exp( - rT_Bm * tL_m(:,1)); % cm, struc length females
  ELw_m = L / del_M; % cm, carapace width

  % time-weight pre-metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tW);
  kT_M = k_M * TC_tW;  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_b = L_m * l_b; 
  L = L_b * exp(rT_j * tWZI(:,1)/ 3); % cm, struc length
  EWd_ZI = L.^3 * d_V * (1 + f_tW * w) * 1e6;  % mug, dry weight
  %
  L = L_b * exp(rT_j * tWZII(:,1)/ 3); % cm, struc length
  EWd_ZII = L.^3 * d_V * (1 + f_tW * w) * 1e6;  % mug, dry weight
  %
  L = L_b * exp(rT_j * tWZIII(:,1)/ 3); % cm, struc length
  EWd_ZIII = L.^3 * d_V * (1 + f_tW * w) * 1e6;  % mug, dry weight
  %
  L = L_b * exp(rT_j * tWZIV(:,1)/ 3); % cm, struc length
  EWd_ZIV = L.^3 * d_V * (1 + f_tW * w) * 1e6;  % mug, dry weight
  %
  L = L_b * exp(rT_j * tWM(:,1)/ 3); % cm, struc length
  EWd_M = L.^3 * d_V * (1 + f_tW * w) * 1e6;  % mug, dry weight
  %
  L = L_b * exp(rT_j * tWCI(:,1)/ 3); % cm, struc length
  EWd_CI = L.^3 * d_V * (1 + f_tW * w) * 1e6;  % mug, dry weight

  % length-weight
  EWd_f = (LW_f(:,1) * del_M).^3 * d_V * (1 + f * w);  % g, dry weight
  EWd_m = (LW_m(:,1) * del_M).^3 * d_V * (1 + f * w_m); % g, dry weight
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  EN = TC * 365 * reprod_rate_j(LN(:,1) * del_M, f, pars_R);     % #/d, ultimate reproduction rate at T
 
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tWZI = EWd_ZI;
  prdData.tWZII = EWd_ZII;
  prdData.tWZIII = EWd_ZIII;
  prdData.tWZIV = EWd_ZIV;
  prdData.tWM = EWd_M;
  prdData.tWCI = EWd_CI;
  prdData.LN = EN;
  prdData.LW_f = EWd_f;
  prdData.LW_m = EWd_m;
 
  
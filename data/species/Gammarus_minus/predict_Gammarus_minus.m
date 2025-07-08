function [prdData, info] = predict_Gammarus_minus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = (t_0 + t_b/ kT_M);         % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m]);
  L_bm = L_mm * l_bm; L_im = l_i * L_mm;% cm, structural lengths
  Ww_im = L_im^3 * (1 + f * ome_m); % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  % weight at t-weight at t+21 d; assume post metam males
  L = (WW(:,1)/(1+f_tW*ome_m)).^(1/3);
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tW);
  L_im = L_mm * l_im; rT_Bm = rho_Bm * kT_M; 
  L = L_im - (L_im - L) .* exp(-rT_Bm * 21); 
  EWw = L.^3 * (1 + f_tW * ome_m); % g, weight
  
  % dry weight-metabolic rate
  pars_pm = [kap; kap_R; g_m; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars for scaled_power_j
  L = (WpD(:,1)/(1+f_tW*ome_m)/d_V).^(1/3); % cm, struc length
  pACSJGRD = TC * p_Am_m * L_mm^2 * scaled_power_j(L, f_tW, pars_pm, l_bm, l_jm, l_pm); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  EpT_D = pACSJGRD(:,7);
 
  % pack to output
  prdData.WW = EWw;
  prdData.WpD = EpT_D;

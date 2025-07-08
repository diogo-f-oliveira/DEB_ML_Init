function [prdData, info] = predict_Lepeophtheirus_salmonis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


  % compute temperature correction factors
  TC_5 = tempcorr(temp.ab_5, T_ref, T_A);
  TC_15 = tempcorr(temp.ab_15, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_tpm = tempcorr(temp.tp_m, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % zero-variate data

  % initial
  E_0 = p_Am * initial_scaled_reserve(f, [V_Hb, g, k_J, k_M, v]);
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hp v_Hp+1e-4];
  [t_j, t_p, t_b, l_j, l_p, l_b, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Me;               % cm, total length at birth at f
  a_b = t_b/ k_M; aT_b5 = a_b/ TC_5; aT_b15 = a_b/ TC_15; % d, age at birth at f and T

  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, age at puberty at f and T

  % ultimate
  L_i  = L_p;                       % cm, ultimate structural length at f
  Lw_i = L_p/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction (no kappa-rule)
  RT_i = TC_Ri * kap_R * ((1 - kap) * s_M * p_Am * L_p^2  - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hpm v_Hpm+1e-4];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  tT_pm = (t_pm - t_bm)/ k_M/ TC_tpm;  % d, time since birth at puberty
  L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M; % cm, total length at puberty
  Lw_im = Lw_pm;                       % cm, ultimate total length

  
  % pack to output
  prdData.ab_5 = aT_b5;
  prdData.ab_15 = aT_b15;
  prdData.tp = tT_p;
  prdData.tp_m = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lp_m = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Li_m = Lw_im;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length during acceleration
  rT_j = rho_j * k_M * TC_tL;
  L = L_b * exp( rT_j * (t_0+tL(:,1))/ 3); % cm, total length
  w_del = min(1,max(0,(L - L_b)/ (L_p - L_b)));
  del = (1 - w_del) * del_Me + w * del_M; ELw = L ./ del; 
  
  % pack to output
  prdData.tL = ELw;


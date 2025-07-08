function [prdData, info] = predict_Gambusia_affinis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if T_L >= T_ref
    info = 0; prdData = []; return
  end
        
  % compute temperature correction factors
  pars_T = [T_A, T_L, T_AL];
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_30 = tempcorr(temp.tWw_30h, T_ref, pars_T);
  TC_25 = tempcorr(temp.tWw_25h, T_ref, pars_T);
  TC_20 = tempcorr(temp.tWw_20h, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  pars_tRj = [g, k, v_Hb, v_Hj, v_Hp, t_N/ TC *k_M]; 
  [tau_R, tau_p, tau_j, tau_b, l_R, l_p, l_j, l_b, info] = get_tRj(pars_tRj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_0 + tau_b/ k_M/ TC;      % d, age at birth at f and T

  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  l_i = s_M * f;                    % -, ultimate scaled length

  % puberty / first reprod
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  %
  pars_tRj20 = [g, k, v_Hb, v_Hj, v_Hp, t_N * TC_20 *k_M]; 
  [tau_R20, ~, ~, ~, l_R20] = get_tRj(pars_tRj20, f);
  t20_R = (tau_R20 - tau_b)/ k_M/ TC_20; % d, time since birth at first reprod at 20 C
  Ww_R20 = (L_m * l_R20).^3 * (1 + f * ome); % g, wet weight at first reprod at 20 C
  %
  pars_tRj25 = [g, k, v_Hb, v_Hj, v_Hp, t_N * TC_25 *k_M]; 
  [tau_R25, ~, ~, ~, l_R25] = get_tRj(pars_tRj25, f);
  t25_R = (tau_R25 - tau_b)/ k_M/ TC_25; % d, time since birth at first reprod at 25 C
  Ww_R25 = (L_m * l_R25).^3 * (1 + f * ome); % g, wet weight at first reprod at 25 C
  %
  pars_tRj30 = [g, k, v_Hb, v_Hj, v_Hp, t_N * TC_30 *k_M]; 
  [tau_R30, ~, ~, ~, l_R30] = get_tRj(pars_tRj30, f);
  t30_R = (tau_R30 - tau_b)/ k_M/ TC_30; % d, time since birth at first reprod at 30 C
  Ww_R30 = (L_m * l_R30).^3 * (1 + f * ome); % g, wet weight at first reprod at 30 C

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i20 = TC_20 * reprod_rate_j(L_i, f, pars_R);               % #/d, ultimate reproduction rate at 20 C
  RT_i25 = TC_25 * reprod_rate_j(L_i, f, pars_R);               % #/d, ultimate reproduction rate at 25 C
  RT_i30 = TC_30 * reprod_rate_j(L_i, f, pars_R);               % #/d, ultimate reproduction rate at 30 C

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
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_im = l_im * L_mm; Lw_im = L_im/ del_M; % cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * w_m); % g, ultimate weight
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, length at puberty
  tT_pm = (tau_pm - tau_bm)/ k_M/ TC;  % d, time since birt at metam
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tR20 = t20_R;
  prdData.tR25 = t25_R;
  prdData.tR30 = t30_R;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.WwR20 = Ww_R20;
  prdData.WwR25 = Ww_R25;
  prdData.WwR30 = Ww_R30;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri20 = RT_i20;
  prdData.Ri25 = RT_i25;
  prdData.Ri30 = RT_i30;
  
  % uni-variate data
  
  % time-weight
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_h);
  kT_M = k_M * TC_30; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_30h(tWw_30h(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_30h(tWw_30h(:,1) >= tT_j) - tT_j));
  EWw_30h = [L_bj; L_ji].^3 * (1 + f_h * ome); % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_m);
  kT_M = k_M * TC_30; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_30m(tWw_30m(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_30m(tWw_30m(:,1) >= tT_j) - tT_j));
  EWw_30m = [L_bj; L_ji].^3 * (1 + f_h * ome); % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_l);
  kT_M = k_M * TC_30; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_30l(tWw_30l(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_30l(tWw_30l(:,1) >= tT_j) - tT_j));
  EWw_30l = [L_bj; L_ji].^3 * (1 + f_h * ome); % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_h);
  kT_M = k_M * TC_25; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_25h(tWw_25h(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_25h(tWw_25h(:,1) >= tT_j) - tT_j));
  EWw_25h = [L_bj; L_ji].^3 * (1 + f_h * ome); % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_m);
  kT_M = k_M * TC_25; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_25m(tWw_25m(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_25m(tWw_25m(:,1) >= tT_j) - tT_j));
  EWw_25m = [L_bj; L_ji].^3 * (1 + f_h * ome); % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_l);
  kT_M = k_M * TC_25; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_25l(tWw_25l(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_25l(tWw_25l(:,1) >= tT_j) - tT_j));
  EWw_25l = [L_bj; L_ji].^3 * (1 + f_h * ome); % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_h);
  kT_M = k_M * TC_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_20h(tWw_20h(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_20h(tWw_20h(:,1) >= tT_j) - tT_j));
  EWw_20h = [L_bj; L_ji].^3 * (1 + f_h * ome); % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_m);
  kT_M = k_M * TC_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_20m(tWw_20m(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_20m(tWw_20m(:,1) >= tT_j) - tT_j));
  EWw_20m = [L_bj; L_ji].^3 * (1 + f_h * ome); % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_l);
  kT_M = k_M * TC_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_20l(tWw_20l(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_20l(tWw_20l(:,1) >= tT_j) - tT_j));
  EWw_20l = [L_bj; L_ji].^3 * (1 + f_h * ome); % g, wet weight
  
  % f_Ww, 30,25,20
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tWw);
  kT_M = k_M * TC_30; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_30(tWw_30(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_30(tWw_30(:,1) >= tT_j) - tT_j));
  EWw_30 = [L_bj; L_ji].^3 * (1 + f_tWw * ome); % g, wet weight
  %
  kT_M = k_M * TC_25; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_25(tWw_25(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_25(tWw_25(:,1) >= tT_j) - tT_j));
  EWw_25 = [L_bj; L_ji].^3 * (1 + f_tWw * ome); % g, wet weight
  %
  kT_M = k_M * TC_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tWw_20(tWw_20(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tWw_20(tWw_20(:,1) >= tT_j) - tT_j));
  EWw_20 = [L_bj; L_ji].^3 * (1 + f_tWw * ome); % g, wet weight
  
  % pack to output
  prdData.tWw_30h = EWw_30h;
  prdData.tWw_30m = EWw_30m;
  prdData.tWw_30l = EWw_30l;
  prdData.tWw_25h = EWw_25h;
  prdData.tWw_25m = EWw_25m;
  prdData.tWw_25l = EWw_25l;
  prdData.tWw_20h = EWw_20h;
  prdData.tWw_20m = EWw_20m;
  prdData.tWw_20l = EWw_20l;
  prdData.tWw_30 = EWw_30;
  prdData.tWw_25 = EWw_25;
  prdData.tWw_20 = EWw_20;
 
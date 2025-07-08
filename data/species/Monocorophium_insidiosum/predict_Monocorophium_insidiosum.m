function [prdData, info] = predict_Monocorophium_insidiosum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_10 = tempcorr(temp.ab10, T_ref, T_A);
  TC_15 = tempcorr(temp.ab15, T_ref, T_A);
  TC_20 = tempcorr(temp.ab20, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  a_b = (t_0 + t_b/ k_M);           % d, age at birth ar T_ref
  aT_b10 = a_b/ TC_10;              % d, age at birth
  aT_b15 = a_b/ TC_15;              % d, age at birth
  aT_b20 = a_b/ TC_20;              % d, age at birth

  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p10 = (t_p - t_b)/ k_M/ TC_10; % d, time since birth at puberty at 10 C
  tT_p15 = (t_p - t_b)/ k_M/ TC_15; % d, time since birth at puberty at 15 C
  tT_p20 = (t_p - t_b)/ k_M/ TC_20; % d, time since birth at puberty at 20 C

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  NT_i10 = TC_10 * cum_reprod_j(220, f, pars_R);             % #, cum reproduction rate at 10 C
  NT_i15 = TC_15 * cum_reprod_j(167, f, pars_R);             % #, cum reproduction rate at 15 C
  NT_i20 = TC_20 * cum_reprod_j(140, f, pars_R);             % #, cum reproduction rate at 20 C

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  a_m = t_m/ k_M;                       % d, mean life span at T_ref
  aT_m10 = a_m/ TC_10; aT_m15 = a_m/ TC_15; aT_m20 = a_m/ TC_20; % d, mean life span at 10, 15, 20 C
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_im = l_i * L_mm; Lw_im = L_im/ del_M; % max body length

  % pack to output
  prdData.ab10 = aT_b10;
  prdData.ab15 = aT_b15;
  prdData.ab20 = aT_b20;
  prdData.tp10 = tT_p10;
  prdData.tp15 = tT_p15;
  prdData.tp20 = tT_p20;
  prdData.am10 = aT_m10;
  prdData.am15 = aT_m15;
  prdData.am20 = aT_m20;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wdi = Wd_i;
  prdData.Ni10 = NT_i10;
  prdData.Ni15 = NT_i15;
  prdData.Ni20 = NT_i20;
  
  % uni-variate data
  % time-length 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_10;  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i; 
  L_bj = L_b * exp(rT_j * tL_f10(tL_f10(:,1) < tT_j,1)/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_f10(tL_f10(:,1) >= tT_j,1)- tT_j)); % cm, struc length
  ELw_f10 = [L_bj; L_ji]/ del_M;  % cm, body length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_15;  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i; 
  L_bj = L_b * exp(rT_j * tL_f15(tL_f15(:,1) < tT_j,1)/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_f15(tL_f15(:,1) >= tT_j,1)- tT_j)); % cm, struc length
  ELw_f15 = [L_bj; L_ji]/ del_M;  % cm, body length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_20;  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i; 
  L_bj = L_b * exp(rT_j * tL_f20(tL_f20(:,1) < tT_j,1)/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_f20(tL_f20(:,1) >= tT_j,1)- tT_j)); % cm, struc length
  ELw_f20 = [L_bj; L_ji]/ del_M;  % cm, body length
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tL);
  kT_M = k_M * TC_10;  rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm)/ kT_M; 
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im; 
  L_bj = L_bm * exp(rT_jm * tL_m10(tL_m10(:,1) < tT_jm,1)/ 3); % cm, struc length
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_m10(tL_m10(:,1) >= tT_jm,1)- tT_jm)); % cm, struc length
  ELw_m10 = [L_bj; L_ji]/ del_M;  % cm, body length
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tL);
  kT_M = k_M * TC_15;  rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm)/ kT_M; 
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im; 
  L_bj = L_bm * exp(rT_jm * tL_m15(tL_m15(:,1) < tT_jm,1)/ 3); % cm, struc length
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_m15(tL_m15(:,1) >= tT_jm,1)- tT_jm)); % cm, struc length
  ELw_m15 = [L_bj; L_ji]/ del_M;  % cm, body length
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tL);
  kT_M = k_M * TC_20;  rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm)/ kT_M; 
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im; 
  L_bj = L_bm * exp(rT_jm * tL_m20(tL_m20(:,1) < tT_jm,1)/ 3); % cm, struc length
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_m20(tL_m20(:,1) >= tT_jm,1)- tT_jm)); % cm, struc length
  ELw_m20 = [L_bj; L_ji]/ del_M;  % cm, body length

  % pack to output
  prdData.tL_f10 = ELw_f10;
  prdData.tL_f15 = ELw_f15;
  prdData.tL_f20 = ELw_f20;
  prdData.tL_m10 = ELw_m10;
  prdData.tL_m15 = ELw_m15;
  prdData.tL_m20 = ELw_m20;
end

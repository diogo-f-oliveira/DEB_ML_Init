function [prdData, info] = predict_Austrolebias_wolterstorffi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
    
  % compute temperature correction factors
  pars_T = [T_A, T_H, T_AH];
  TC_28 = tempcorr(temp.tL_28f, T_ref, pars_T); 
  TC_24 = tempcorr(temp.tL_24f, T_ref, pars_T); kT_M = TC_24 * k_M; 
  TC_20 = tempcorr(temp.tL_20f, T_ref, pars_T); 
  TC_16 = tempcorr(temp.tL_16f, T_ref, pars_T); 
    
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth
    
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  NT_i = TC_24 * cum_reprod_j(200, f, pars_R);  % #, total # of eggs

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_24;               % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  
  % univariate data

  % time-length/weight 
  % females
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_16);
  kT_M = TC_16 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp (rT_j * tL_16f(tL_16f(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_16f(tL_16f(:,1)>=tT_j,1) - tT_j)); 
  ELw_16f = [L_bj; L_ji]/ del_M;
  %
  L_bj = L_b * exp (rT_j * tWw_16f(tWw_16f(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tWw_16f(tWw_16f(:,1)>=tT_j,1) - tT_j)); 
  EWw_16f = [L_bj; L_ji].^3 * (1 + f_16 * ome);
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_20);
  kT_M = TC_20 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp (rT_j * tL_20f(tL_20f(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_20f(tL_20f(:,1)>=tT_j,1) - tT_j)); 
  ELw_20f = [L_bj; L_ji]/ del_M;
  %
  L_bj = L_b * exp (rT_j * tWw_20f(tWw_20f(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tWw_20f(tWw_20f(:,1)>=tT_j,1) - tT_j)); 
  EWw_20f = [L_bj; L_ji].^3 * (1 + f_20 * ome);
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_24);
  kT_M = TC_24 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp (rT_j * tL_24f(tL_24f(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_24f(tL_24f(:,1)>=tT_j,1) - tT_j)); 
  ELw_24f = [L_bj; L_ji]/ del_M;
  %
  L_bj = L_b * exp (rT_j * tWw_24f(tWw_24f(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tWw_24f(tWw_24f(:,1)>=tT_j,1) - tT_j)); 
  EWw_24f = [L_bj; L_ji].^3 * (1 + f_24 * ome);
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_28);
  kT_M = TC_28 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp (rT_j * tL_28f(tL_28f(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_28f(tL_28f(:,1)>=tT_j,1) - tT_j)); 
  ELw_28f = [L_bj; L_ji]/ del_M;
  %
  L_bj = L_b * exp (rT_j * tWw_28f(tWw_28f(:,1)<tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tWw_28f(tWw_28f(:,1)>=tT_j,1) - tT_j)); 
  EWw_28f = [L_bj; L_ji].^3 * (1 + f_28 * ome);
  %
  % males
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_16);
  kT_M = TC_16 * k_M; rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M; tT_jm = (tau_jm - tau_bm)/ kT_M;
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im;
  L_bj = L_bm * exp (rT_jm * tL_16m(tL_16m(:,1)<tT_jm,1)/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_16m(tL_16m(:,1)>=tT_jm,1) - tT_jm)); 
  ELw_16m = [L_bj; L_ji]/ del_M;
  %
  L_bj = L_bm * exp (rT_jm * tWw_16m(tWw_16m(:,1)<tT_jm,1)/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tWw_16m(tWw_16m(:,1)>=tT_jm,1) - tT_jm)); 
  EWw_16m = [L_bj; L_ji].^3 * (1 + f_16 * ome_m);
  %
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_20);
  kT_M = TC_20 * k_M; rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M; tT_jm = (tau_jm - tau_bm)/ kT_M;
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im;
  L_bj = L_bm * exp (rT_jm * tL_20m(tL_20m(:,1)<tT_jm,1)/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_20m(tL_20m(:,1)>=tT_jm,1) - tT_jm)); 
  ELw_20m = [L_bj; L_ji]/ del_M;
  %
  L_bj = L_bm * exp (rT_jm * tWw_20m(tWw_20m(:,1)<tT_jm,1)/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tWw_20m(tWw_20m(:,1)>=tT_jm,1) - tT_jm)); 
  EWw_20m = [L_bj; L_ji].^3 * (1 + f_20 * ome_m);
  %
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_24);
  kT_M = TC_24 * k_M; rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M; tT_jm = (tau_jm - tau_bm)/ kT_M;
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im;
  L_bj = L_bm * exp (rT_jm * tL_24m(tL_24m(:,1)<tT_jm,1)/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_24m(tL_24m(:,1)>=tT_jm,1) - tT_jm)); 
  ELw_24m = [L_bj; L_ji]/ del_M;
  %
  L_bj = L_bm * exp (rT_jm * tWw_24m(tWw_24m(:,1)<tT_jm,1)/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tWw_24m(tWw_24m(:,1)>=tT_jm,1) - tT_jm)); 
  EWw_24m = [L_bj; L_ji].^3 * (1 + f_24 * ome_m);
  %
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, ~, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_28);
  kT_M = TC_28 * k_M; rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M; tT_jm = (tau_jm - tau_bm)/ kT_M;
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im;
  L_bj = L_bm * exp (rT_jm * tL_28m(tL_28m(:,1)<tT_jm,1)/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_28m(tL_28m(:,1)>=tT_jm,1) - tT_jm)); 
  ELw_28m = [L_bj; L_ji]/ del_M;
  %
  L_bj = L_bm * exp (rT_jm * tWw_28m(tWw_28m(:,1)<tT_jm,1)/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tWw_28m(tWw_28m(:,1)>=tT_jm,1) - tT_jm)); 
  EWw_28m = [L_bj; L_ji].^3 * (1 + f_28 * ome_m);

  % pack to output
  prdData.tL_16f = ELw_16f;
  prdData.tL_20f = ELw_20f;
  prdData.tL_24f = ELw_24f;
  prdData.tL_28f = ELw_28f;
  prdData.tL_16m = ELw_16m;
  prdData.tL_20m = ELw_20m;
  prdData.tL_24m = ELw_24m;
  prdData.tL_28m = ELw_28m;
  prdData.tWw_16f = EWw_16f;
  prdData.tWw_20f = EWw_20f;
  prdData.tWw_24f = EWw_24f;
  prdData.tWw_28f = EWw_28f;
  prdData.tWw_16m = EWw_16m;
  prdData.tWw_20m = EWw_20m;
  prdData.tWw_24m = EWw_24m;
  prdData.tWw_28m = EWw_28m;
end

  
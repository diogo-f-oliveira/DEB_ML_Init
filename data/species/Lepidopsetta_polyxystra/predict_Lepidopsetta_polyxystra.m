function [prdData, info] = predict_Lepidopsetta_polyxystra(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
            
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  kT_M = k_M * TC; 
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - ...
     k_M^2 * g^2 * k_J * U_Hp/ (v^2 * s_M^3));% mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_mm = p_Am_m/ v;                    % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_mm);              % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  m_Em_m = y_E_V * E_mm/ E_G;          % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im] = get_tj(pars_tjm, f);
  tT_pm = (t_pm - t_bm)/ k_M/ TC;      % d, time since birth at puberty
  Lw_im = l_im * L_mm/ del_M;          % cm, ultimate total length
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length 
  % tL for late juveniles and adults
  f = f_tL; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_j = l_j * L_m; L_i = l_i * L_m; tT_j = (t_j - t_b)/ kT_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;
  L_bj = L_b * exp(tL_f(tL_f(:,1) < tT_j, 1) * rT_j/3); 
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_f(tL_f(:,1) >= tT_j, 1) - tT_j)); % cm, total length at time
  ELw_f = [L_bj; L_ji]/ del_M;
  % males
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_bm = l_bm * L_mm; L_jm = l_jm * L_mm; L_im = l_im * L_mm;  tT_jm = (t_jm - t_bm)/ kT_M; rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M;  
  L_bj = L_bm * exp(tL_m(tL_m(:,1) < tT_jm, 1) * rT_jm/3); % exponential growth as V1-morph
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_m(tL_m(:,1) >= tT_jm, 1) - tT_jm)); % cm, total length at time
  ELw_m = [L_bj; L_ji]/ del_M;
  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  
end

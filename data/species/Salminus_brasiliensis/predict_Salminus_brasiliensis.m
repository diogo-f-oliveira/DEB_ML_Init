function [prdData, info] = predict_Salminus_brasiliensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC; % 1/d, maintenance rate coefficient
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A); 
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
    
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, total length at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);  % 1/d, max reproduction rate 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_im = L_mm * l_im; Ww_im = L_im^3 * (1 + f * ome); % g, ultimate wet weight

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data

  % time-length
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i; 
  kT_M = TC_tL * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp (rT_j * tL_f(tL_f(:,1) < tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp (- rT_B * (tL_f(tL_f(:,1) >= tT_j,1) - tT_j));
  ELw_f = [L_bj; L_ji]/ del_M; % cm, standard length
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tL);
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im; 
  kT_M = TC_tL * k_M; rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm)/ kT_M;
  L_bj = L_bm * exp (rT_jm * tL_m(tL_m(:,1) < tT_jm,1)/ 3);
  L_ji = L_im - (L_im - L_jm) * exp (- rT_Bm * (tL_m(tL_m(:,1) >= tT_jm,1) - tT_jm));
  ELw_m = [L_bj; L_ji]/ del_M; % cm, standard length


  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;

end

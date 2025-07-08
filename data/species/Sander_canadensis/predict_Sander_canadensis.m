function [prdData, info] = predict_Sander_canadensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);


  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M;                  % d, age at birth at T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
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

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;

  % univariate data

  % time-length post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLG);
  rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_j = L_m * l_j; L_i = L_m * l_i;
  ELw_Gf = (L_i - (L_i - L_j) * exp( - rT_B * (tL_Gf(:,1) - tT_j)))/ del_M; % cm, total length
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tLG);
  rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm)/ kT_M; L_jm = L_mm * l_jm; L_im = L_mm * l_im;
  ELw_Gm = (L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_Gm(:,1) - tT_jm)))/ del_M; % cm, total length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLt);
  rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_j = L_m * l_j; L_i = L_m * l_i;
  ELw_tf = (L_i - (L_i - L_j) * exp( - rT_B * (tL_tf(:,1) - tT_j)))/ del_M; % cm, total length
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tLt);
  rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm)/ kT_M; L_jm = L_mm * l_jm; L_im = L_mm * l_im;
  ELw_tm = (L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_tm(:,1) - tT_jm)))/ del_M; % cm, total length

  % length - fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];   % compose parameter vector
  EN = TC * 365 * reprod_rate_j(LN(:,1)*del_M, f, pars_R);        % #, fecundity
  
  % legnth - weight
  EWw = (LWw(:,1)*del_M).^3 * (1 + f_tLG * ome); % g, wet weight

  
  prdData.tL_Gf = ELw_Gf;
  prdData.tL_Gm = ELw_Gm;
  prdData.tL_tf = ELw_tf;
  prdData.tL_tm = ELw_tm;
  prdData.LN = EN;
  prdData.LWw = EWw;
end
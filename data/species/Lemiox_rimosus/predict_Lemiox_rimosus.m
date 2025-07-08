function [prdData, info] = predict_Lemiox_rimosus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  % zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 *  (1 + f * ome);    % g, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                    % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-length/weight post metam
  % females
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_D);
  rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_i - (L_i - L_j) * exp( - rT_B * (tL_Df(:,1) - tT_j)); ELw_Df = L/ del_M; 
  % males
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_D);
  rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm)/ kT_M; L_jm = L_mm * l_jm; L_im = L_mm * l_im;
  L = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_Dm(:,1) - tT_j)); ELw_Dm = L/ del_M; 
  %
  % females
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_C);
  rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_i - (L_i - L_j) * exp( - rT_B * (tL_Cf(:,1) - tT_j)); ELw_Cf = L/ del_M; 
  % males
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_C);
  rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm)/ kT_M; L_jm = L_mm * l_jm; L_im = L_mm * l_im;
  L = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_Cm(:,1) - tT_j)); ELw_Cm = L/ del_M; 
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  EN_D = 365 * TC * reprod_rate_j(LN_D(:,1) * del_M, f_D, pars_R);  % #, fecundity
  EN_C = 365 * TC * reprod_rate_j(LN_C(:,1) * del_M, f_C, pars_R);  % #, fecundity
 
  % pack to output
  prdData.tL_Df = ELw_Df;
  prdData.tL_Dm = ELw_Dm;
  prdData.tL_Cf = ELw_Cf;
  prdData.tL_Cm = ELw_Cm;
  prdData.LN_D = EN_D;
  prdData.LN_C = EN_C;
  
  
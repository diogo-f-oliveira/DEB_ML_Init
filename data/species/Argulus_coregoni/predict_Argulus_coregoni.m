function [prdData, info] = predict_Argulus_coregoni(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, body length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, body length at metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty 
  Lw_p = L_p/ del_M;                % cm, body length at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty

  % ultimate
  L_i = l_i * L_m;                  % cm, ultimate structural length
  Lw_i = L_i/ del_M;                % cm, ulitmate body length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  NT_i = TC * cum_reprod_j(60, f, pars_R);                      % #, cum number of eggs

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im; % cm, structural lengths
  tT_jm = (t_jm - t_bm)/ k_M/ TC;      % d, time since birth at metam
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % time-length 
  % female on Oncorhynchus f=1
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;      
  L_bj = L_b * exp(tL_f((tL_f(:,1) <= tT_j),1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_f((tL_f(:,1) > tT_j),1) - tT_j));  % cm, structural length
  ELw_f = [L_bj; L_ji]/ del_M; % cm, body length
  % male on Oncorhynchus f=1
  rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M;        
  L_bj = L_bm * exp(tL_m((tL_m(:,1) <= tT_jm),1) * rT_jm/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_B * (tL_m((tL_m(:,1) > tT_jm),1) - tT_j));  % cm, structural length
  ELw_m = [L_bj; L_ji]/ del_M; % cm, body length
  % female on Rutilus f=f_R
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_R);
  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;        
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;                              % cm, structural length
  L_bj = L_b * exp(tL_fR((tL_fR(:,1) <= tT_j),1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_fR((tL_fR(:,1) > tT_j),1) - tT_j));  % cm, structural length
  ELw_fR = [L_bj; L_ji]/ del_M; % cm, body length
  % male on Rutilus f=f_R
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_R);
  rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm)/ kT_M;        
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im;                     % cm, structural length
  L_bj = L_bm * exp(tL_mR((tL_mR(:,1) <= tT_jm),1) * rT_jm/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_mR((tL_mR(:,1) > tT_jm),1) - tT_jm));  % cm, structural length
  ELw_mR = [L_bj; L_ji]/ del_M; % cm, body length

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tL_fR = ELw_fR;
  prdData.tL_mR = ELw_mR;
  
function [prdData, info] = predict_Rhizoglyphus_robini(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab_fp, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp]; f_y = f;
  [t_jp, t_pp, t_bp, l_jp, l_pp, l_bp, l_ip, rho_jp, rho_Bp, info] = get_tj(pars_tj, f_p);
  [t_jy, t_py, t_by, l_jy, l_py, l_by, l_iy]                       = get_tj(pars_tj, f_y);
  
  
  % birth
  L_bp = L_m * l_bp;                  % cm, structural length at birth at f_p
  Lw_bp = L_bp/ del_M;                % cm, total length at birth at f_p
  Ww_bp = L_bp^3 * (1 + f_p * w);     % g, wet weight at birth at f_p
  aT_bp = t_bp/ k_M/ TC;              % d, age at birth at f_p and T
  L_by = L_m * l_by;                  % cm, structural length at birth at f_y
  Lw_by = L_by/ del_M;                % cm, total length at birth at f_y
  Ww_by = L_by^3 * (1 + f_y * w);     % g, wet weight at birth at f_y
  aT_by = t_by/ k_M/ TC;              % d, age at birth at f_y and T
  
  % puberty 
  L_pp = L_m * l_pp;                  % cm, structural length at puberty at f_p
  Lw_pp = L_pp/ del_M;                % cm, total length at puberty at f_p
  Ww_pp = L_pp^3 *(1 + f_p * w);      % g, wet weight at puberty at f_p
  tT_pp = (t_pp - t_bp)/ k_M/ TC;     % d, time since birth at puberty at f_p and T
  L_py = L_m * l_py;                  % cm, structural length at puberty at f_y
  Lw_py = L_py/ del_M;                % cm, total length at puberty at f_y
  Ww_py = L_py^3 *(1 + f_y * w);      % g, wet weight at puberty at f_y
  tT_py = (t_py - t_by)/ k_M/ TC;     % d, time since birth at puberty at f_y and T

  % ultimate
  L_ip = L_m * l_ip;                  % cm, ultimate structural length at f_y
  Lw_ip = L_ip/ del_M;                % cm, ultimate total length at f_y
  Ww_ip = L_ip^3 * (1 + f_p * w);     % g, ultimate wet weight f_y
  L_iy = L_m * l_iy;                  % cm, ultimate structural length at f_y
  Lw_iy = L_iy/ del_M;                % cm, ultimate total length at f_y
  Ww_iy = L_iy^3 * (1 + f_y * w);     % g, ultimate wet weight f_y
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector 
  RT_ip = TC * reprod_rate_j(L_ip, f_p, pars_R);                % #/d, ultimate reproduction rate at f_p
  RT_iy = TC * reprod_rate_j(L_iy, f_y, pars_R);                % #/d, ultimate reproduction rate at f_y

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f_p, l_bp);   % -, scaled mean life span at T_ref
  aT_mp = t_m/ k_M/ TC;                 % d, mean life span at T
  t_m = get_tm_s(pars_tm, f_y, l_by);   % -, scaled mean life span at T_ref
  aT_my = t_m/ k_M/ TC;                 % d, mean life span at T
  
  % pack to output
  prdData.ab_fp = aT_bp;
  prdData.ab_fy = aT_by;
  prdData.tp_fp = tT_pp;
  prdData.tp_fy = tT_py;
  prdData.am_fp = aT_mp;
  prdData.am_fy = aT_my;
  prdData.Lb_fp = Lw_bp;
  prdData.Lb_fy = Lw_by;
  prdData.Lp_fp = Lw_pp;
  prdData.Lp_fy = Lw_py;
  prdData.Li_fp = Lw_ip;
  prdData.Li_fy = Lw_iy;
  prdData.Vb_fp = Ww_bp;
  prdData.Vb_fy = Ww_by;
  prdData.Vp_fp = Ww_pp;
  prdData.Vp_fy = Ww_py;
  prdData.Vi_fp = Ww_ip;
  prdData.Vi_fy = Ww_iy;
  prdData.Ri_fp = RT_ip;
  prdData.Ri_fy = RT_iy;
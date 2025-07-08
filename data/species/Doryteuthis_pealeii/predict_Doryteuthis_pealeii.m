function [prdData, info] = predict_Doryteuthis_pealeii(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_22 = tempcorr(temp.ab_22, T_ref, T_A);
  TC_18 = tempcorr(temp.ab_18, T_ref, T_A);
  TC_15 = tempcorr(temp.ab_15, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  r_B = rho_B * k_M; % 1/d, von Bert growth rate
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  a_b = t_b/ k_M;                   % d, age at birth at f and T_ref
  a22_b = a_b/ TC_22; a18_b = a_b/ TC_18; a15_b = a_b/ TC_15;

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  kT_M = k_M * TC_tL; tj = (t_j - t_b)/ kT_M; % d, time since birth at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- TC_am * r_B * (aT_m - t_j/k_M/ TC_am));  
  Lw_i = L_am/ del_M;               % cm, mantle length at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC_15*k_J; TC_15*k_M; L_T; TC_15*v; U_Hb/TC_15; U_Hj/TC_15; U_Hp/TC_15]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, cum no of eggs at i yr

  % male
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m]);
  tjm = (t_jm - t_bm)/ kT_M;           % d, time since birth at metam
  L_bm= L_mm * l_bm; L_j_m= L_mm * l_jm;  L_im = L_mm * l_im; % cm, structural lengths at f
  pars_tmm = [pars_tjm; h_am/ k_M^2; s_G]; % compose parameter vector at T_ref
  aT_mm = get_tm_j(pars_tmm, f)/ k_M/ TC_am; % d, mean life span at T
  L_amm = L_im - (L_im - L_j_m) * exp(- TC_am * r_B * (aT_mm - t_jm/ k_M/ TC_am));  
  Lw_im = L_amm/ del_M;               % cm, mantle length at death
  
  % pack to output
  prdData.ab_22 = a22_b;
  prdData.ab_18 = a18_b;
  prdData.ab_15 = a15_b;
  prdData.am = aT_m;
  prdData.am_m = aT_mm;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Li_m = Lw_im;
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % time-length
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, dorsal mantle length at time
  % male
  tvel = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m], tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, dorsal mantle length at time

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w);   % g, wet weight      
    
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LW = EWw;
  
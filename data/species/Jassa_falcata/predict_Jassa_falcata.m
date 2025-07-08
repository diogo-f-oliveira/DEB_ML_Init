function [prdData, info] = predict_Jassa_falcata(par, data, auxData)
  
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
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
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
  NT_i10 = TC_10 * cum_reprod_j(252, f, pars_R);             % #, cum reproduction rate at 10 C
  NT_i15 = TC_15 * cum_reprod_j(173, f, pars_R);             % #, cum reproduction rate at 15 C
  NT_i20 = TC_20 * cum_reprod_j(153, f, pars_R);             % #, cum reproduction rate at 20 C

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
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m]);
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
  prdData.Wwb = Ww_b;
  prdData.Wdi = Wd_i;
  prdData.Ni10 = NT_i10;
  prdData.Ni15 = NT_i15;
  prdData.Ni20 = NT_i20;
  
  % uni-variate data
  % time-length
  % female at 10 C
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f10(:,1)*k_M*TC_10);
  ELw_f10 = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male at 10 C
  tvel = get_tj(pars_tjm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m10(:,1)*k_M*TC_10);
  ELw_m10 = L_mm * tvel(:,4)/ del_M;   % cm, length
  % female at 15 C
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f15(:,1)*k_M*TC_15);
  ELw_f15 = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male at 15 C
  tvel = get_tj(pars_tjm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m15(:,1)*k_M*TC_15);
  ELw_m15 = L_mm * tvel(:,4)/ del_M;   % cm, length
  % female at 20 C
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f20(:,1)*k_M*TC_20);
  ELw_f20 = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male at 20 C
  tvel = get_tj(pars_tjm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m20(:,1)*k_M*TC_20);
  ELw_m20 = L_mm * tvel(:,4)/ del_M;   % cm, length


  % pack to output
  prdData.tL_f10 = ELw_f10;
  prdData.tL_f15 = ELw_f15;
  prdData.tL_f20 = ELw_f20;
  prdData.tL_m10 = ELw_m10;
  prdData.tL_m15 = ELw_m15;
  prdData.tL_m20 = ELw_m20;
end

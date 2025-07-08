function [prdData, info] = predict_Gammarus_pulex(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tW = tempcorr(temp.tW_f, T_ref, T_A);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_7 = tempcorr(temp.tL2, T_ref, T_A);
  TC_11 = tempcorr(temp.tL3, T_ref, T_A);
  TC_15 = tempcorr(temp.tL4, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = 1e3 * L_b^3 * (1 + f * w); % mg, wet weight at birth
  a_b = (t_0 + t_b/ k_M); aT_b = a_b/ TC_ab;% d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = 1e3 * L_p^3 * (1 + f * w); % mg, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = 1e3 * L_i^3 * (1 + f * w); % mg, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_bm = L_mm * l_bm; L_j_m = L_mm * l_jm; L_im = l_i * L_mm;% cm, structural lengths

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  tvel = get_tj(pars_tj, f, [], tL(:,1) * k_M * TC_tL);
  ELw = L_m * tvel(:,4)/ del_M;                              % cm, length
  % 7 deg C 
  tvel = get_tj(pars_tj, f, del_M*Lw2_0/L_m, tL2(:,1) * k_M * TC_7);
  ELw_2 = L_m * tvel(:,4)/ del_M;                              % cm, polar length
  tvel = get_tj(pars_tj, f, del_M*Lw5_0/L_m, tL5(:,1) * k_M * TC_7);
  ELw_5 = L_m * tvel(:,4)/ del_M;                              % cm, polar length
  % 11 deg C
  tvel = get_tj(pars_tj, f, del_M*Lw3_0/L_m, tL3(:,1) * k_M * TC_11);
  ELw_3 = L_m * tvel(:,4)/ del_M;                              % cm, polar length
  tvel = get_tj(pars_tj, f, del_M*Lw6_0/L_m, tL6(:,1) * k_M * TC_11);
  ELw_6 = L_m * tvel(:,4)/ del_M;                              % cm, polar length
  % 15 deg C
  tvel = get_tj(pars_tj, f, del_M*Lw4_0/L_m, tL4(:,1) * k_M * TC_15);
  ELw_4 = L_m * tvel(:,4)/ del_M;                              % cm, polar length
  tvel = get_tj(pars_tj, f, del_M*Lw7_0/L_m, tL7(:,1) * k_M * TC_15);
  ELw_7 = L_m * tvel(:,4)/ del_M;                              % cm, polar length

  % time-weight
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tW_f(:,1) * k_M * TC_tW);
  EWw_f = (L_m * tvel(:,4)).^3 * (1 + f * w) * 1e3;   % mg, weight
  % male
  tvel = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m], tW_m(:,1) * k_M * TC_tW);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m) * 1e3; % mg, weight
  
  % Tab data
  Ea_b = a_b ./ TC_Tab; % d, age at birth at T
  
  % pack to output
  prdData.tL = ELw;
  prdData.tL2 = ELw_2;
  prdData.tL3 = ELw_3;
  prdData.tL4 = ELw_4;
  prdData.tL5 = ELw_5;
  prdData.tL6 = ELw_6;
  prdData.tL7 = ELw_7;
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
  prdData.Tab = Ea_b;

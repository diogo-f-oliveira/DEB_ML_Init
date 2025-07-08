function [prdData, info] = predict_Gammarus_fossarum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  %TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tW = tempcorr(temp.tW_f, T_ref, T_A);
  TC_tW2 = tempcorr(temp.tW_f2, T_ref, T_A);
  TC_tW3 = tempcorr(temp.tW_f3, T_ref, T_A);
  TC_tW4 = tempcorr(temp.tW_f4, T_ref, T_A);
  TC_Tap = tempcorr(C2K(Tap(:,1)), T_ref, T_A);

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
  % time-weight
  % female at TC
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tW_f(:,1)*k_M*TC_tW);
  EWw_f = (L_m * tvel(:,4)).^3 * (1 + f * w) * 1e3;   % mg, weight
  % male at TC
  tvel = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m], tW_m(:,1)*k_M*TC_tW);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m) * 1e3; % mg, weight
  % female at TC_tW2
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tW_f2(:,1)*k_M*TC_tW2);
  EWw_f2 = (L_m * tvel(:,4)).^3 * (1 + f * w) * 1e3;   % mg, weight
  % male at TC_tW2
  tvel = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m], tW_m2(:,1)*k_M*TC_tW2);
  EWw_m2 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m) * 1e3; % mg, weight
  % female at TC_tW3
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tW_f3(:,1)*k_M*TC_tW3);
  EWw_f3 = (L_m * tvel(:,4)).^3 * (1 + f * w) * 1e3;   % mg, weight
  % male at TC_tW3
  tvel = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m], tW_m3(:,1)*k_M*TC_tW3);
  EWw_m3 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m) * 1e3; % mg, weight
  % female at TC_tW4
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tW_f4(:,1)*k_M*TC_tW4);
  EWw_f4 = (L_m * tvel(:,4)).^3 * (1 + f * w) * 1e3;   % mg, weight
  % male at TC_tW4
  tvel = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m], tW_m4(:,1)*k_M*TC_tW4);
  EWw_m4 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m) * 1e3; % mg, weight  
  
  % Tap data
  Ea_p=(t_p - t_b)/ k_M ./ TC_Tap;

  
  % pack to output
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
  prdData.tW_f2 = EWw_f2;
  prdData.tW_m2 = EWw_m2;
  prdData.tW_f3 = EWw_f3;
  prdData.tW_m3 = EWw_m3;
  prdData.tW_f4 = EWw_f4;
  prdData.tW_m4 = EWw_m4;
  prdData.Tap = Ea_p;

function [prdData, info] = predict_Merluccius_hubbsi(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_tL0 = tempcorr(temp.tL0, T_ref, T_A);
  TC_tL1 = tempcorr(temp.tL1, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                     % cm, structural, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC_ab;              % d, age at birth

  % metam
  s_M = l_j/ l_b;                      % -, acceleration factor

  % puberty and ultimate size
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;         % d, age at puberty
  Ww_p = L_p^3 * (1 + f * w);          % g, wet weight at puberty at f
  
  % ultimate size
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = 100 * GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^2); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                  % d, mean life span at T
     
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f);
  tT_pm = (t_p- t_b)/ k_M/ TC;         % d, time since birth at puberty
  L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M; % cm, total length at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI= GSI;
  
 % uni-variate data

  % time-length
  % larvae
  tvel = get_tj(pars_tj, f_tL0, [], tL0(:,1)*k_M*TC_tL0);
  ELw_0 = L_m * tvel(:,4)/ del_M;   % cm, length
  % larvae
  tvel = get_tj(pars_tj, f_tL1, [], tL1(:,1)*k_M*TC_tL1);
  ELw_1 = L_m * tvel(:,4)/ del_M;   % cm, length
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length
  
%% pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tL0 = ELw_0;
  prdData.tL1 = ELw_1;
    

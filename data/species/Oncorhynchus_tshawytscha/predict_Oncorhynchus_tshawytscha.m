function [prdData, info] = predict_Oncorhynchus_tshawytscha(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_NR = tempcorr(temp.NR, T_ref, T_A);
  TC_Hemi1982_6 = tempcorr(temp.tL_Hemi1982_6, T_ref, T_A);
  TC_Hemi1982_8 = tempcorr(temp.tL_Hemi1982_8, T_ref, T_A);
  TC_Hemi1982_10 = tempcorr(temp.tL_Hemi1982_10, T_ref, T_A);
  TC_Hemi1982_12 = tempcorr(temp.tL_Hemi1982_12, T_ref, T_A);
  TC_AlleHass1985 = tempcorr(temp.tL_AlleHass1985, T_ref, T_A);
  TC_OrsiJaen1996 = tempcorr(temp.tL_OrsiJaen1996, T_ref, T_A);
  TC_BeacMurr1993 = tempcorr(temp.LWR_BeacMurr1993, T_ref, T_A);

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M_e;              % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  a_b = t_b/ k_M; aT_b = a_b/ TC_ab;% d, age at birth of foetus at f and T

  % metamorphosis
  L_j = l_j * L_m;                  % cm, length at metamorphosis
  a_j = t_j/ k_M;                   % d, age at metam at T_ref

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  a_m = t_m/ k_M; aT_m = a_m/ TC_am;   % d, mean life span at T

  % spawning + E_0
  kT_M = k_M * TC_NR; kT_J = k_J * TC_NR; vT= v * TC_NR; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;
  UT_Hb = U_Hb/ TC_NR; UT_Hj = U_Hj/ TC_NR; UT_Hp = U_Hp/ TC_NR;
  pars_NR = [kap; kap_R; g; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hj; UT_Hp];
  [N_R UT_E0] = cum_reprod_metam(aT_m, f, pars_NR);
  % U_E^0 = E_0/ {p_Am}; e = E/ L^3/ [E_m] = v * E/ L^3/ {p_Am} = v * U_E/ L^3
  E_0 = TC_NR * J_E_Am * UT_E0 * mu_E;  % J, initial reserve 
  U_E0 = UT_E0 * TC_NR;                 % d.cm^2, U_E^0 at T_ref
  Wd_0 = w_E * E_0/ mu_E;               % g, dryweight of egg at 0
  L_am = L_i - (L_i - L_b) * exp(- a_m * rT_B); % cm, structural length at death
  Lw_am = L_am/ del_M;                  % cm, physical length at death
  eR = vT * UT_E0 * N_R/ kap_R/ L_am^3; % -, scaled cumulative reproduction buffer density
  Ww_am = L_am^3 * (1 + (f + eR) * w);  % g, wet weight at death including reprod buffer and T and f

  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lam = Lw_am;
  prdData.Li = Lw_i;
  prdData.E0 = E_0;
  prdData.Wd0 = Wd_0;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwam = Ww_am;
  prdData.Wwi = Ww_i;
  prdData.NR = N_R;

  %% uni-variate data
  
% embryo + juvenile at f = 0 at different temperatures
  % BeacMurr1993
  f = f_BeacMurr1993; pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  [H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0, U_E0, 1e-10], [], kap, v, k_J, g, L_m);
  TC = tempcorr(C2K(Tab(:,1)), T_ref, T_A); 
  Eab = aUL(3,1) ./ TC;
  TC = tempcorr(C2K(Tah(:,1)), T_ref, T_A); 
  Eah = aUL(2,1) ./ TC;
  
  % Hemi1982_6
  a = [-1e-10; tL_Hemi1982_6(:,1)] * TC_Hemi1982_6; % a, convert ages from actual T to T_ref
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, v, k_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); L3 = L.^3; U = LUH(:,2); 
  ELw_Hemi1982_6 = L/ del_M_e;
  EWy_Hemi1982_6 = J_E_Am * U * w_E;
  EWt_Hemi1982_6 = EWy_Hemi1982_6 + L3 * d_V;
  EWd_Hemi1982_6 = L3 * d_V * (1 + f * w);
  % Hemi1982_8
  a = [-1e-10;tL_Hemi1982_8(:,1)] * TC_Hemi1982_8; % d, convert ages from actual T to T_ref
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, v, k_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); L3 = L.^3; U = LUH(:,2); 
  ELw_Hemi1982_8 = L/ del_M_e;
  EWy_Hemi1982_8 = J_E_Am * U * w_E;
  EWt_Hemi1982_8 = EWy_Hemi1982_8 + L3 * d_V;
  EWd_Hemi1982_8 = L3 * d_V * (1 + f * w);
  % Hemi1982_10
  a = [-1e-10;tL_Hemi1982_10(:,1)] * TC_Hemi1982_10; % d, convert ages from actual T to T_ref
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, v, k_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); L3 = L.^3; U = LUH(:,2); 
  ELw_Hemi1982_10 = L/ del_M_e;
  EWy_Hemi1982_10 = J_E_Am * U * w_E;
  EWt_Hemi1982_10 = EWy_Hemi1982_10 + L3 * d_V;
  EWd_Hemi1982_10 = L3 * d_V * (1 + f * w);
  % Hemi1982_12
  a = [-1e-10;tL_Hemi1982_12(:,1)] * TC_Hemi1982_12; % d, convert ages from actual T to T_ref
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, v, k_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); L3 = L.^3; U = LUH(:,2); 
  ELw_Hemi1982_12 = L/ del_M_e;
  EWy_Hemi1982_12 = J_E_Am * U * w_E;
  EWt_Hemi1982_12 = EWy_Hemi1982_12 + L3 * d_V;
  EWd_Hemi1982_12 = L3 * d_V * (1 + f * w);

  % juvenile data
  
  % tL_ShelClar1995 and tW_ShelClar1995 data
  L0 = L0_ShelClar1995 * del_M; E0 = L0^3 * p_Am/ v; H0 = E_Hb;
  f1 = f_ShelClar1995; f0 = 0.6 * f_ShelClar1995; f2 = 0.8 * f_ShelClar1995;  % -, set food levels
  ELH_0 = [f0 * E0; L0; H0]; ELH_1 = [f1 * E0; L0; H0]; ELH_2 = [f2 * E0; L0; H0]; % state vector at start
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_1(:,1)], ELH_1, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f1, E_Hb, E_Hj, tT.tL_ShelClar1995_1, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_1 = L/ del_M;  EWw_ShelClar1995_1 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_2(:,1)], ELH_1, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f1, E_Hb, E_Hj, tT.tL_ShelClar1995_2, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_2 = L/ del_M;  EWw_ShelClar1995_2 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_3(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f0, E_Hb, E_Hj, tT.tL_ShelClar1995_3, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_3 = L/ del_M;  EWw_ShelClar1995_3 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_4(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f0, E_Hb, E_Hj, tT.tL_ShelClar1995_4, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_4 = L/ del_M;  EWw_ShelClar1995_4 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_7(:,1)], ELH_1, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f1, E_Hb, E_Hj, tT.tL_ShelClar1995_7, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_7 = L/ del_M;  EWw_ShelClar1995_7 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_8(:,1)], ELH_1, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f1, E_Hb, E_Hj, tT.tL_ShelClar1995_8, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_8 = L/ del_M;  EWw_ShelClar1995_8 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_9(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f0, E_Hb, E_Hj, tT.tL_ShelClar1995_9, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_9 = L/ del_M;  EWw_ShelClar1995_9 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_10(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f0, E_Hb, E_Hj, tT.tL_ShelClar1995_10, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_10 = L/ del_M;  EWw_ShelClar1995_10 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_13(:,1)], ELH_1, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f1, E_Hb, E_Hj, tT.tL_ShelClar1995_13, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_13 = L/ del_M;  EWw_ShelClar1995_13 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_14(:,1)], ELH_1, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f1, E_Hb, E_Hj, tT.tL_ShelClar1995_14, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_14 = L/ del_M;  EWw_ShelClar1995_14 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_15(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f0, E_Hb, E_Hj, tT.tL_ShelClar1995_15, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_15 = L/ del_M;  EWw_ShelClar1995_15 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_16(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f0, E_Hb, E_Hj, tT.tL_ShelClar1995_16, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_16 = L/ del_M;  EWw_ShelClar1995_16 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_19(:,1)], ELH_1, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f1, E_Hb, E_Hj, tT.tL_ShelClar1995_19, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_19 = L/ del_M;  EWw_ShelClar1995_19 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_20(:,1)], ELH_1, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f1, E_Hb, E_Hj, tT.tL_ShelClar1995_20, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_20 = L/ del_M;  EWw_ShelClar1995_20 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_21(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f0, E_Hb, E_Hj, tT.tL_ShelClar1995_21, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_21 = L/ del_M;  EWw_ShelClar1995_21 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_22(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f0, E_Hb, E_Hj, tT.tL_ShelClar1995_22, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_22 = L/ del_M;  EWw_ShelClar1995_22 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_5(:,1)], ELH_2, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f2, E_Hb, E_Hj, tT.tL_ShelClar1995_5, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_5 = L/ del_M;  EWw_ShelClar1995_5 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_6(:,1)], ELH_2, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f2, E_Hb, E_Hj, tT.tL_ShelClar1995_6, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_6 = L/ del_M;  EWw_ShelClar1995_6 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_11(:,1)], ELH_2, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f2, E_Hb, E_Hj, tT.tL_ShelClar1995_11, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_11 = L/ del_M;  EWw_ShelClar1995_11 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_12(:,1)], ELH_2, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f2, E_Hb, E_Hj, tT.tL_ShelClar1995_12, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_12 = L/ del_M;  EWw_ShelClar1995_12 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_17(:,1)], ELH_2, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f2, E_Hb, E_Hj, tT.tL_ShelClar1995_17, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_17 = L/ del_M;  EWw_ShelClar1995_17 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_18(:,1)], ELH_2, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f2, E_Hb, E_Hj, tT.tL_ShelClar1995_18, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_18 = L/ del_M;  EWw_ShelClar1995_18 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_23(:,1)], ELH_2, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f2, E_Hb, E_Hj, tT.tL_ShelClar1995_23, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_23 = L/ del_M;  EWw_ShelClar1995_23 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
  %
  [a ELH] = ode45(@dget_ELH_pj, [0; tL_ShelClar1995_24(:,1)], ELH_2, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f2, E_Hb, E_Hj, tT.tL_ShelClar1995_24, T_A, T_ref); 
  ELH(1,:) = []; E = ELH(:,1); L = ELH(:,2); ELw_ShelClar1995_24 = L/ del_M;  EWw_ShelClar1995_24 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
 
  % LW-data
  L = LW_juv(:,1);
  EWw_juv = (L * del_M).^3 * (1 + f * w); % g, wet weight
  
  % ocean tL-data:
  % AlleHass1985
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f_AlleHass1985);
  kT_M = k_M * TC_AlleHass1985; rT_B = rho_B * kT_M; Lw_i = l_i * L_m/ del_M;
  ELw_AlleHass1985 = Lw_i - (Lw_i - L0_AlleHass1985) * exp( - rT_B * tL_AlleHass1985(:,1)); % cm, expected length at time
  % OrsiJaen1996
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f_OrsiJaen1996);
  rT_B = rho_B * kT_M; Lw_i = l_i * L_m/ del_M;
  ELw_OrsiJaen1996 = Lw_i - (Lw_i - L0_AlleHass1985) * exp( - rT_B * tL_OrsiJaen1996(:,1)); % cm, expected length at time

  % spawning data on river: 
  % BeacMurr1993, EinuFlem2003, JaspEven2006
  TC = TC_BeacMurr1993;
  kT_M = k_M * TC; kT_J = k_J * TC; vT= v * TC; rT_B = rho_B * kT_M;
  UT_Hb = U_Hb/ TC; UT_Hj = U_Hj/ TC; UT_Hp = U_Hp/ TC; aT_b = a_b/ TC; aT_j = a_j/ TC;
  pars_NR = [kap; kap_R; g; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hj; UT_Hp];
  t = log((L_i - L_j)./ (L_i - LN_EinuFlem2003(:,1) * del_M_R))/ rT_B; % d, time since metamorphosis
  EN_EinuFlem2003 = cum_reprod_metam(t + aT_j - aT_b, f, pars_NR);
  %
  L = LWR_BeacMurr1993(:,1) * del_M_R;
  t = log((L_i - L_j)./ (L_i - L))/ rT_B; % d, time since metamorphosis
  [N_R UT_E0] = cum_reprod_metam(t + aT_j - aT_b, f, pars_NR);
  E_0 = TC_NR * J_E_Am * UT_E0 * mu_E;  % J, initial reserve 
  %U_E0 = UT_E0 * TC;                   % d.cm^2, U_E^0 at T_ref
  W_0 = w_E * E_0/ mu_E/ d_E;           % g, wet weight of egg at 0
  EWR_BeacMurr1993 = N_R * W_0;         % g, wet weight of spawned eggs
  % JaspEven2006
  L = LW_JaspEven2006(:,1) * del_M_R;
  t = log((L_i - L_j)./ (L_i - L))/ rT_B; % d, time since metamorphosis
  EN_JaspEven2006 = cum_reprod_metam(t + aT_j - aT_b, f, pars_NR, L_b);
  EWw_JaspEven2006 = EN_JaspEven2006 * W_0 + L.^3 * (1 + f * w); % g, wet weight of individuals before spawning
  
  % pack to output
  prdData.tL_Hemi1982_6 = ELw_Hemi1982_6;
  prdData.tW_Hemi1982_6 = EWd_Hemi1982_6;
  prdData.tWy_Hemi1982_6 = EWy_Hemi1982_6;
  prdData.tWt_Hemi1982_6 = EWt_Hemi1982_6;
  prdData.tL_Hemi1982_8 = ELw_Hemi1982_8;
  prdData.tW_Hemi1982_8 = EWd_Hemi1982_8;
  prdData.tWy_Hemi1982_8 = EWy_Hemi1982_8;
  prdData.tWt_Hemi1982_8 = EWt_Hemi1982_8;
  prdData.tL_Hemi1982_10 = ELw_Hemi1982_10;
  prdData.tW_Hemi1982_10 = EWd_Hemi1982_10;
  prdData.tWy_Hemi1982_10 = EWy_Hemi1982_10;
  prdData.tWt_Hemi1982_10 = EWt_Hemi1982_10;
  prdData.tL_Hemi1982_12 = ELw_Hemi1982_12;
  prdData.tW_Hemi1982_12 = EWd_Hemi1982_12;
  prdData.tWy_Hemi1982_12 = EWy_Hemi1982_12;
  prdData.tWt_Hemi1982_12 = EWt_Hemi1982_12;
  prdData.Tah = Eah;
  prdData.Tab = Eab;
  prdData.tL_ShelClar1995_1 = ELw_ShelClar1995_1;
  prdData.tL_ShelClar1995_2 = ELw_ShelClar1995_2;
  prdData.tL_ShelClar1995_3 = ELw_ShelClar1995_3;
  prdData.tL_ShelClar1995_4 = ELw_ShelClar1995_4;
  prdData.tL_ShelClar1995_7 = ELw_ShelClar1995_7;
  prdData.tL_ShelClar1995_8 = ELw_ShelClar1995_8;
  prdData.tL_ShelClar1995_9 = ELw_ShelClar1995_9;
  prdData.tL_ShelClar1995_10 = ELw_ShelClar1995_10;
  prdData.tL_ShelClar1995_13 = ELw_ShelClar1995_13;
  prdData.tL_ShelClar1995_14 = ELw_ShelClar1995_14;
  prdData.tL_ShelClar1995_15 = ELw_ShelClar1995_15;
  prdData.tL_ShelClar1995_16 = ELw_ShelClar1995_16;
  prdData.tL_ShelClar1995_19 = ELw_ShelClar1995_19;
  prdData.tL_ShelClar1995_20 = ELw_ShelClar1995_20;
  prdData.tL_ShelClar1995_21 = ELw_ShelClar1995_21;
  prdData.tL_ShelClar1995_22 = ELw_ShelClar1995_22;
  prdData.tL_ShelClar1995_5 = ELw_ShelClar1995_5;
  prdData.tL_ShelClar1995_6 = ELw_ShelClar1995_6;
  prdData.tL_ShelClar1995_11 = ELw_ShelClar1995_11;
  prdData.tL_ShelClar1995_12 = ELw_ShelClar1995_12;
  prdData.tL_ShelClar1995_17 = ELw_ShelClar1995_17;
  prdData.tL_ShelClar1995_18 = ELw_ShelClar1995_18;
  prdData.tL_ShelClar1995_23 = ELw_ShelClar1995_23;
  prdData.tL_ShelClar1995_24 = ELw_ShelClar1995_24;
  prdData.tW_ShelClar1995_1 = EWw_ShelClar1995_1;
  prdData.tW_ShelClar1995_2 = EWw_ShelClar1995_2;
  prdData.tW_ShelClar1995_3 = EWw_ShelClar1995_3;
  prdData.tW_ShelClar1995_4 = EWw_ShelClar1995_4;
  prdData.tW_ShelClar1995_7 = EWw_ShelClar1995_7;
  prdData.tW_ShelClar1995_8 = EWw_ShelClar1995_8;
  prdData.tW_ShelClar1995_9 = EWw_ShelClar1995_9;
  prdData.tW_ShelClar1995_10 = EWw_ShelClar1995_10;
  prdData.tW_ShelClar1995_13 = EWw_ShelClar1995_13;
  prdData.tW_ShelClar1995_14 = EWw_ShelClar1995_14;
  prdData.tW_ShelClar1995_15 = EWw_ShelClar1995_15;
  prdData.tW_ShelClar1995_16 = EWw_ShelClar1995_16;
  prdData.tW_ShelClar1995_19 = EWw_ShelClar1995_19;
  prdData.tW_ShelClar1995_20 = EWw_ShelClar1995_20;
  prdData.tW_ShelClar1995_21 = EWw_ShelClar1995_21;
  prdData.tW_ShelClar1995_22 = EWw_ShelClar1995_22;
  prdData.tW_ShelClar1995_5 = EWw_ShelClar1995_5;
  prdData.tW_ShelClar1995_6 = EWw_ShelClar1995_6;
  prdData.tW_ShelClar1995_11 = EWw_ShelClar1995_11;
  prdData.tW_ShelClar1995_12 = EWw_ShelClar1995_12;
  prdData.tW_ShelClar1995_17 = EWw_ShelClar1995_17;
  prdData.tW_ShelClar1995_18 = EWw_ShelClar1995_18;
  prdData.tW_ShelClar1995_23 = EWw_ShelClar1995_23;
  prdData.tW_ShelClar1995_24 = EWw_ShelClar1995_24;
  prdData.LW_juv = EWw_juv;
  prdData.tL_AlleHass1985 = ELw_AlleHass1985;
  prdData.tL_OrsiJaen1996 = ELw_OrsiJaen1996;
  prdData.LWR_BeacMurr1993 = EWR_BeacMurr1993;
  prdData.LN_EinuFlem2003 = EN_EinuFlem2003;
  prdData.LW_JaspEven2006 = EWw_JaspEven2006;
  prdData.LN_JaspEven2006 = EN_JaspEven2006;
  
end

%% sub subfuctions

function dELH = dget_ELH_pj(t, ELH, Lb, Lj, Lm, p_Am, v, g, kJ, kap, f, Hb, Hj, tT, T_A, T_ref)
  %  change in state variables during juvenile stage
  %  dELH = dget_ELH_p_pj(t, ELH)
  %  ELH: 3-vector
  %   E: reserve E
  %   L: structural length
  %   H: maturity E_H
  %  dELH: change in reserve, length, scaled maturity
  
 
  %  unpack variables
  E = ELH(1); L = ELH(2); H = ELH(3);
  
  TC = tempcorr(C2K(spline1(t, tT)), T_ref, T_A);
  vT = v * TC; kT_J = kJ * TC; pT_Am = p_Am * TC;
 
  if H < Hb 
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
  e = vT * E/ L^3/ pT_Am; % -, scaled reserve density; 
  rT = s * vT * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  pT_C = E * (s * vT/ L - rT); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dH = (1 - kap) * pT_C - kT_J * H;
  dE = (L > Lb) * s * pT_Am * f * L^2 - pT_C;
  dL = rT * L/3;

  % pack derivatives
  dELH = [dE; dL; dH];
end
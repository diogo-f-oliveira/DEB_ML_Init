function [prdData, info] = predict_Branchiostoma_floridae(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_aj_22 = tempcorr(temp.aj_22, T_ref, T_A);
  TC_aj_30 = tempcorr(temp.aj_30, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL_92  = tempcorr(temp.tL_92, T_ref, T_A);
  TC_tL_93  = tempcorr(temp.tL_93, T_ref, T_A);
  TC_tL_94  = tempcorr(temp.tL_94, T_ref, T_A);
  TC_tLe_30 = tempcorr(temp.tLe_30, T_ref, T_A);
  TC_tLe_22 = tempcorr(temp.tLe_22, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];                                  % compose parameter vector
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, physical length at metam at f
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
  aT_j22 = t_j/ k_M/ TC_aj_22;      % d, age at metam at f and T
  aT_j30 = t_j/ k_M/ TC_aj_30;      % d, age at metam at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.aj_22 = aT_j22;
  prdData.aj_30 = aT_j30;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % tL data
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f_tL_92);
  Lw_j = L_m * l_j/ del_M; Lw_i = L_m * l_i/ del_M;
  rT_B = rho_B * k_M * TC_tL_92; % d, von Bert growth rate
  ELw_92 = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * tL_92(:,1)); % cm, expected length at time
  
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f_tL_93);
  Lw_j = L_m * l_j/ del_M; Lw_i = L_m * l_i/ del_M;
  rT_B = rho_B * k_M * TC_tL_93; % d, von Bert growth rate
  ELw_93 = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * tL_93(:,1)); % cm, expected length at time

  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f_tL_94);
  Lw_j = L_m * l_j/ del_M; Lw_i = L_m * l_i/ del_M;
  rT_B = rho_B * k_M * TC_tL_94; % d, von Bert growth rate
  ELw_94 = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * tL_94(:,1)); % cm, expected length at time
  
  % O2 consumption rate in ml/h.g
  f = f_TO;
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  p_ref = p_Am * L_m^2;               % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];

  L = ([0.01; 0.02; 0.03; 0.04]/ d_V/ (1 + f * w)).^(1/3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_old(L, f, pars_power, l_b, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  %pADG(:,1) = 0; % exclude assim contribution
  JM = pADG * eta_O' * O2M;                     % mol/d, mineral fluxes
  EO = - 24.4e3/ 24 * JM(:,3);                  % ml/h, O_2 consumption
  EO_01 = EO(1) * tempcorr(C2K(TO_01(:,1)), T_ref, T_A)/ 0.01; % ml/h.g for 0.01 g dry
  EO_02 = EO(2) * tempcorr(C2K(TO_02(:,1)), T_ref, T_A)/ 0.02; % ml/h.g for 0.02 g dry
  EO_03 = EO(3) * tempcorr(C2K(TO_03(:,1)), T_ref, T_A)/ 0.03; % ml/h.g for 0.03 g dry
  EO_04 = EO(4) * tempcorr(C2K(TO_04(:,1)), T_ref, T_A)/ 0.04; % ml/h.g for 0.04 g dry
  
  % tLe_22
  f = f_tLe_22;
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);
  vT = v * TC_tLe_22; kT_J = TC_tLe_22 * k_J; 
  aT_b = t_b/ k_M/ TC_tLe_22; aT_j = t_j/ k_M/ TC_tLe_22;
  i_e = tLe_22(:,1) <= aT_b; i_j = (tLe_22(:,1) <= aT_j) & ~i_e; i_a = tLe_22(:,1) > aT_j;
  a = [-1e-10; tLe_22(i_e,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0/ TC_tLe_22 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; ELe = LUH(:,1)/ del_M; 
  Lw_j = L_m * l_j/ del_M; Lw_i = L_m * l_i/ del_M;
  rT_B = rho_B * k_M * TC_tLe_22; rT_j = rho_j * k_M * TC_tLe_22;  % d, von Bert, expo  growth rate
  ELj = Lw_b * exp(rT_j * (tLe_22(i_j,1) - aT_b)/3);
  ELa = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tLe_22(i_a,1) - aT_j)); % cm, expected length at time
  ELe_22 = [ELe; ELj; ELa];

  % tLe_30
  f = f_tLe_30;
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);
  vT = v * TC_tLe_30; kT_J = TC_tLe_30 * k_J; 
  aT_b = t_b/ k_M/ TC_tLe_30; aT_j = t_j/ k_M/ TC_tLe_30;
  i_e = tLe_30(:,1) <= aT_b; i_j = (tLe_30(:,1) <= aT_j) & ~i_e; i_a = tLe_30(:,1) > aT_j;
  a = [-1e-10; tLe_22(i_e,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0/TC_tLe_30 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; ELe = LUH(:,1)/ del_M; 
  Lw_j = L_m * l_j/ del_M; Lw_i = L_m * l_i/ del_M;
  rT_B = rho_B * k_M * TC_tLe_30; rT_j = rho_j * k_M * TC_tLe_30;  % d, von Bert, expo  growth rate
  ELj = Lw_b * exp(rT_j * (tLe_30(i_j,1) - aT_b)/3);
  ELa = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tLe_30(i_a,1) - aT_j)); % cm, expected length at time
  ELe_30 = [ELe; ELj; ELa];

  %% pack to output
  prdData.TO_01 = EO_01;
  prdData.TO_02 = EO_02;
  prdData.TO_03 = EO_03;
  prdData.TO_04 = EO_04;
  prdData.tLe_22 = ELe_22;
  prdData.tLe_30 = ELe_30;
  prdData.tL_92 = ELw_92;
  prdData.tL_93 = ELw_93;
  prdData.tL_94 = ELw_94;
function [prdData, info] = predict_Corydoras_aeneus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 

  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hh >= E_Hb
    info = 0; prdData = {}; return
  end

%% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); % all rates/times at same temp

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp]; % compose parameter vector
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); % -, scaled length at birth at f
  if info == 0
    prdData = []; return
  end

  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  %E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap constant

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  L_h = aUL(2,3);                   % cm, structural length at f
  Lw_h = L_h/ del_M;                % cm, total length at hatch at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Lw_b = L_b/ del_M;                % cm, standard length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC;             % d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (tau_p - tau_b)/ k_M/ TC;  % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);  % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% univ-variate data
  
  % time - length
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL); % -, scaled length at birth at f
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; % 1/d, von Bert growth rate
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (tau_j - tau_b)/ kT_M; 
  L_bj = L_b * exp(rT_j * tL(tL(:,1) < tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(- rT_B * (tL(tL(:,1) >= tT_j,1) - tT_j));
  ELw = [L_bj; L_ji]/ del_M; % cm, physical length

  % pack to output
  prdData.tL = ELw;


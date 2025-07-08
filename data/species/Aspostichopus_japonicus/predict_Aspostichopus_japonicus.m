function [prdData, info] = predict_Stichopus_japonicus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_Ri = TC_ab;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
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

  
  % uni-variate data
  
  % time-length post metam
  kT_M = k_M * TC_tL; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j)); % cm, structural length
  ELw = L/ del_M; % cm, total length
  %
  [t_j1, t_p1, t_b1, l_j1, l_p1, l_b1, l_i1, rho_j1, rho_B1] = get_tj(pars_tj, f_tL);
  rT_B1 = rho_B1 * kT_M; tT_j1 = (t_j1 - t_b1)/ kT_M; L_j1 = L_m * l_j1; L_i1 = L_m * l_i1;
  L = L_i1 - (L_i1 - L_j1) * exp( - rT_B1 * (tL1(:,1) - tT_j1)); % cm, structural length
  ELw_1 = L/ del_M; % cm, total length
  
  % time-weight post metam
  L = L_i - (L_i - L_b) * exp( - rT_B * (tW(:,1) - tT_j)); % cm, structural length
  EWw = L.^3 * (1 + f * w); % g, wet weight
  %
  L = L_i1 - (L_i1 - L_j1) * exp( - rT_B1 * (tW1(:,1) - tT_j1)); % cm, structural length
  EWw_1 = L.^3 * (1 + f * w); % g, wet weight

  % length-weight
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

  % pack to output
  prdData.tL = ELw;    % time (day) vs length (cm)
  prdData.tL1 = ELw_1; % time (day) vs length (cm)
  prdData.tW = EWw;    % time (day) vs wet weight (g)
  prdData.tW1 = EWw_1; % time (day) vs wet weight (g)
  prdData.LW = EWw_L;  % length (cm) wet weight (g)


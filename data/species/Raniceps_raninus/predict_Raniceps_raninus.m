function [prdData, info] = predict_Raniceps_raninus(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b; Lw_b = L_b/ del_M;  % cm, structural, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f

  % puberty and ultimate size
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  
  % ultimate size
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reproduction at 50 cm
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(75 * del_M, f, pars_R);             % reproduction rate for fish of 50 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
%% pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
%% uni-variate data

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + w * f);
  
  % time-length 
  f = f_tL;[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL(:,1) * rT_j/ 3) .* (tL(:,1) < tT_j);
  L = L + (tL(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j))); % cm, expected length at time
  ELw = L/ del_M;
  
%% pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
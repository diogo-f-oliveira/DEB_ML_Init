function [prdData, info] = predict_Galaxias_maculatus(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A);
  TC_Ez = tempcorr(temp.tL_Ez, T_ref, T_A);
  TC_Mo = tempcorr(temp.tL_Mo, T_ref, T_A);
  TC_ME = tempcorr(temp.tL_ME, T_ref, T_A);
  TC_MW = tempcorr(temp.tL_MW, T_ref, T_A);
  TC_Gu = tempcorr(temp.tL_Gu, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                     % cm, structural length at birth
  Lw_b = L_b/ del_M;                   % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f

  % puberty 
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  
  % ultimate
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length

  % reprod rate
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);    % #/d, reproduction rate

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
  prdData.Ri = RT_i;
  
  % LW
  EWw = (LW(:,1) * del_M) .^ 3 * (1 + f * w); % g, wet weight 
  
  % tL-data: tL_Ez
  f = f_Ez; kT_M = k_M * TC_Ez;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL_Ez(:,1) * rT_j/ 3) .* (tL_Ez(:,1) < tT_j);
  L = L + (tL_Ez(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_Ez(:,1) - tT_j))); % cm, expected length at time
  tLw_Ez = L/ del_M;
  % tL-data: tL_Mo
  f = f_Mo; kT_M = k_M * TC_Mo;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL_Mo(:,1) * rT_j/ 3) .* (tL_Mo(:,1) < tT_j);
  L = L + (tL_Mo(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_Mo(:,1) - tT_j))); % cm, expected length at time
  tLw_Mo = L/ del_M;
  % tL-data: tL_ME
  f = f_ME; kT_M = k_M * TC_ME;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL_ME(:,1) * rT_j/ 3) .* (tL_ME(:,1) < tT_j);
  L = L + (tL_ME(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_ME(:,1) - tT_j))); % cm, expected length at time
  tLw_ME = L/ del_M;
  % tL-data: tL_MW
  f = f_MW; kT_M = k_M * TC_MW;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL_MW(:,1) * rT_j/ 3) .* (tL_MW(:,1) < tT_j);
  L = L + (tL_MW(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_MW(:,1) - tT_j))); % cm, expected length at time
  tLw_MW = L/ del_M;
  % tL-data: tL_Gu
  f = f_Gu; kT_M = k_M * TC_Ez;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL_Gu(:,1) * rT_j/ 3) .* (tL_Gu(:,1) < tT_j);
  L = L + (tL_Gu(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_Gu(:,1) - tT_j))); % cm, expected length at time
  tLw_Gu = L/ del_M;
  

%% pack to output
  prdData.tL_Ez = tLw_Ez;
  prdData.tL_Mo = tLw_Mo;
  prdData.tL_ME = tLw_ME;
  prdData.tL_MW = tLw_MW;
  prdData.tL_Gu = tLw_Gu;
  prdData.LW = EWw;


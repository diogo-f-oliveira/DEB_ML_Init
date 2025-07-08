function [prdData, info] = predict_Hyphessobrycon_pulchripinnis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); % all rates/times at same temp
  kT_M = k_M * TC; % 1/d, maintenance rate coefficient

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth 
  
  % puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % weight-at-length
  Ww_L = (3.4*del_M).^3 * (1 + f * w); % g, wet weight at 3.4 cm TL

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);  % 1/d, max reproduction rate 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.WwL = Ww_L;
  prdData.Ri = RT_i;
  
  % univariate data
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i; 
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL(tL(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(tL(:,1) >= tT_j,1) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_ji]/ del_M; % cm, total length

  % pack to output
  prdData.tL = ELw;


function [prdData, info] = predict_Engraulis_japonicus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
      
%% compute temperature correction factors
  TC_29 = tempcorr(temp.ab29, T_ref, T_A);
  TC_24 = tempcorr(temp.ab24, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  a29_b = t_b/ k_M/ TC_29;          % d, age at birth of foetus at f and T
  a24_b = t_b/ k_M/ TC_24;          % d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC;              % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % pack to output
  prdData.ab24 = a24_b;
  prdData.ab29 = a29_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  % time-length
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B] = get_tj(pars_tj, f_tL);
  kT_M = TC_tL * k_M; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M;     % 1/d, von Bert, exponential growth rate
  tT_j = (t_j - t_b)/ kT_M; Lw_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL(tL(:,1) < tT_j) * rT_j/3); % exponential growth as V1-morph
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(tL(:,1) >= tT_j) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_ji]/ del_M; % % cm, standard length
  %
  L_bj = L_b * exp(tLj(tLj(:,1) < tT_j) * rT_j/3); % exponential growth as V1-morph
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tLj(tLj(:,1) >= tT_j) - tT_j)); % cm, expected length at time
  ELw_j = [L_bj; L_ji]/ del_M; % % cm, standard length

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + ome * f_tL); % g, wet weight
  
  % pack to output
  prdData.tL = ELw;
  prdData.tLj = ELw_j;
  prdData.LW = EWw;

  
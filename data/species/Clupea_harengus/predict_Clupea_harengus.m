function [prdData, info] = predict_Clupea_harengus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL_N = tempcorr(temp.tL_N, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth of foetus at f and T

  % metamorphosis
  aT_j = t_j/ k_M/ TC_aj;           % d, time since birth at puberty at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  f = f_tL;        
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);
  rT_B = TC_tL * rho_B * k_M; rT_j = TC_tL * rho_j * k_M;              % 1/d, von Bert, exponential growth rate
  aT_b = t_b/ k_M/ TC_tL; aT_j = t_j/ k_M/ TC_tL;
  t_j = aT_j - aT_b; % time since birth at metamorphosis
  t_bj = tL(tL(:,1) < t_j,1); % select times between birth & metamorphosis
  Lw_b = l_b * L_m/ del_M; Lw_j = l_j * L_m/ del_M; Lw_i = l_i * L_m/ del_M;
  EL_bj = Lw_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
  t_ji = tL(tL(:,1) >= t_j,1); % selects times after metamorphosis
  EL_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (t_ji - t_j)); % cm, expected length at time
  ELw = [EL_bj; EL_ji]; % catenate lengths
  
  f = f_tL_N;         
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);
  rT_B = TC_tL_N * rho_B * k_M; rT_j = TC_tL_N * rho_j * k_M;              % 1/d, von Bert, exponential growth rate
  aT_b = t_b/ k_M/ TC_tL_N; aT_j = t_j/ k_M/ TC_tL_N;
  t_j = aT_j - aT_b; % time since birth at metamorphosis
  t_bj = tL_N(tL_N(:,1) < t_j,1); % select times between birth & metamorphosis
  Lw_b = l_b * L_m/ del_M; Lw_j = l_j * L_m/ del_M; Lw_i = l_i * L_m/ del_M;
  EL_bj = Lw_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
  t_ji = tL_N(tL_N(:,1) >= t_j,1); % selects times after metamorphosis
  EL_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (t_ji - t_j)); % cm, expected length at time
  ELw_N = [EL_bj; EL_ji]; % catenate lengths
  
  f = f_tW;       
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);
  rT_B = TC_tW * rho_B * k_M; rT_j = TC_tW * rho_j * k_M;              % 1/d, von Bert, exponential growth rate
  aT_b = t_b/ k_M/ TC_tW; aT_j = t_j/ k_M/ TC_tW;
  t_j = aT_j - aT_b; % time since birth at metamorphosis
  t_bj = tW(tW(:,1) < t_j,1); % select times between birth & metamorphosis
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
  t_ji = tW(tW(:,1) >= t_j,1); % selects times after metamorphosis
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - t_j)); % cm, expected length at time
  L = [L_bj; L_ji]; % catenate lengths
  EWw = L.^3 * ( 1 + f * w); % g, wet weight-at-time
 
  f = f_LW; 
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  
  % pack to output
  prdData.tL = ELw;
  prdData.tL_N = ELw_N;
  prdData.tW = EWw;
  prdData.LW = EWw_L;
     
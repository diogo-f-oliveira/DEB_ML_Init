function [prdData, info] = predict_Melanogrammus_aeglefinus(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC_5= tempcorr(temp.ab, T_ref, T_A);
  TC_2 = tempcorr(temp.ab2, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                     % cm, structural at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f
  a_b = t_b/ k_M; a5_b = a_b/ TC_5; a2_b = a_b/ TC_2; % d, age at birth at f, temp corrected
  
  % weight-at-length
  Ww_40 = (40 * del_M)^3 * (1 + f * w); % g, wet weight at total length of 40 cm 
   
  % puberty and ultimate size
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);          % g, wet weight at puberty
  aT_p = t_p/ k_M/ TC;                 % d, age at puberty
  
  % ultimate size
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reproduction at 50 cm
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(40 * del_M, f, pars_R);          % reproduction rate for fish of 50 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  

%% pack to output
  prdData.ab = a5_b;
  prdData.ab2 = a2_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ww40 = Ww_40;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
%% uni-variate data

  % time-length 
  % data 1995
  f = f_tL1995;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = TC * rho_B * k_M; rT_j = TC * rho_j * k_M; tT_j = (t_j - t_b)/ k_M/ TC;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL_1995(:,1) * rT_j/ 3) .* (tL_1995(:,1) < tT_j);
  L = L + (tL_1995(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_1995(:,1) - tT_j))); % cm, expected length at time
  tLw_1995 = L/ del_M;
  % data 1425
  f = f_tL1425;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = TC * rho_B * k_M; rT_j = TC * rho_j * k_M; tT_j = (t_j - t_b)/ k_M/ TC;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL_1425(:,1) * rT_j/ 3) .* (tL_1425(:,1) < tT_j);
  L = L + (tL_1425(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_1425(:,1) - tT_j))); % cm, expected length at time
  tLw_1425 = L/ del_M;
  
  
%% pack to output
  prdData.tL_1995 = tLw_1995;
  prdData.tL_1425 = tLw_1425;

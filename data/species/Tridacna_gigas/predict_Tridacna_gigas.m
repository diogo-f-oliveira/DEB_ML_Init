function [prdData, info] = predict_Tridacna_gigas(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  

  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp]; % compose parameter vector for get_tj
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rj, rB, info] = get_tj(pars_tj, f);
              
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); % all data at same temp
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_j = l_j * L_m;                  % cm, structural length at settlement
   
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, shell height at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f #considere acceleration
  Lw_i = L_i/ del_M;                % cm, ultimate shell height at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
  Ww_115 = (115 * del_M)^3 * (1 + f * w); % g, wet weight at 115 cm
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, ultimate reprod rate
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % growth
  rT_B = TC * rho_B * k_M; % 1/d, von Bert growth rate
  dLT_j = rT_B * (L_i - L_j)/ del_M; % cm/d, growth rate at settlement
  Lw_10 = (L_i - (L_i - L_j) * exp( - rT_B * 305))/ del_M; % cm, shell length at 10 mnth
  Lw_17 = (L_i - (L_i - L_j) * exp( - rT_B * 17 * 30.5))/ del_M; % cm, shell length at 17 mnth
  Lw_9  = (L_i - (L_i - L_j) * exp( - rT_B * 9 * 365))/ del_M; % cm, shell length at 9 yr

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.L10 = Lw_10;
  prdData.L17 = Lw_17;
  prdData.L9 = Lw_9;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ww115 = Ww_115;
  prdData.Ri = RT_i;
  prdData.dLj = dLT_j;


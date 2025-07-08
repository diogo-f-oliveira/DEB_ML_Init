function [prdData, info] = predict_Spisula_subtruncata(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  

  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp]; % compose parameter vector for get_tj
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rj, rB, info] = get_tj(pars_tj, f);
              
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  Wd_b = L_b^3 * (1 + f * w) * d_V; % g, dry weight at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
   
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, shell height at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f #considere acceleration
  Lw_i = L_i/ del_M;                % cm, ultimate shell height at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  Wd_R1 = TC * 365 * Wd_b * reprod_rate_j((0.05/(1 + w * f_tL))^(1/3), f, pars_R); % g, gonadal dry weight at 0.05 g
  Wd_R2 = TC * 365 * Wd_b * reprod_rate_j((0.13/(1 + w * f_tL))^(1/3), f, pars_R); % g, gonadal dry weight at 0.13 g
  Wd_R3 = TC * 365 * Wd_b * reprod_rate_j((0.17/(1 + w * f_tL))^(1/3), f, pars_R); % g, gonadal dry weight at 0.17 g 
  
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdp = Wd_p;
  prdData.WdR1 = Wd_R1;
  prdData.WdR2 = Wd_R2;
  prdData.WdR3 = Wd_R3;
  
  % uni-variate data
  
  % time-length
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j)); % cm, structural length 
  ELw = L/ del_M;        % cm, shell length
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * (tW(:,1) - tT_j)); % cm, structural length 
  EWw = L.^3 * d_V * (1 + f_tL * w); % g, dry weight

  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;

function [prdData, info] = predict_Phorcus_lineatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if kap_X + kap_P > 1
    info = 0; prdData = []; return;
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, shell length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = (2 * del_M)^3 * (1 + f * w); % g, typical wet weight at "max size"
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(2 * del_M, f, pars_R);          % #/d, ultimate reproduction rate at T

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
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
    
  % time-length 
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_bj = L_b * exp(tL94((tL94(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL94((tL94(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  ELw_94 = [L_bj; L_ji]/ del_M;                               % cm, shell length
  % time-length 
  L_bj = L_b * exp(tL95((tL95(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL95((tL95(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  ELw_95 = [L_bj; L_ji]/ del_M;                               % cm, shell length
  % time-length 
  L_bj = L_b * exp(tL96((tL96(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL96((tL96(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  ELw_96 = [L_bj; L_ji]/ del_M;                               % cm, shell length
  % time-length 

  % pack to output
  prdData.tL94 = ELw_94;
  prdData.tL95 = ELw_95;  
  prdData.tL96 = ELw_96;  

function [prdData, info] = predict_Amphibalanus_amphitrite(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth

  % settlement
  pars_ts = [g k l_T v_Hb v_Hs v_Hs+1e-3];
  [t_s, ~, ~, l_s] = get_tj(pars_ts, f);
  L_s = l_s * L_m;                  % cm, structural length as settlement
  tT_s = (t_s - t_b)/ k_M/ TC;      % d, time since birth at settlement

  % metam: end of acceleration (well after settlement)
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, basal diameter at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, basal diameter at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate basal diameter at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(1.56*del_M, f, pars_R);              % #/d, reproduction rate at 1.56 cm basal diameter  T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ts = tT_s;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  pars_ts = [g k l_T v_Hb v_Hs v_Hs+1e-3]; pars_tj = [g k l_T v_Hb v_Hj v_Hj+1e-3];
  [t_s, t_p, t_b, l_s] = get_tj(pars_ts, f_tL1);
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL1);
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_s)/ kT_M;        
  L_s = L_m * l_s; L_j = L_m * l_j; L_i = L_m * l_i;                            % cm, structural length
  L_sj = L_s * exp(tL1((tL1(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL1((tL1(:,1) > tT_j),1) - tT_j));  % cm, structural length
  ELw_1 = [L_sj; L_jm]/ del_M; % cm, basal diameter
  %
  [t_s, t_p, t_b, l_s] = get_tj(pars_ts, f_tL2);
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL2);
  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_s)/ kT_M;
  L_s = L_m * l_s; L_j = L_m * l_j; L_i = L_m * l_i;                            % cm, structural length
  L_sj = L_s * exp(tL2((tL2(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL2((tL2(:,1) > tT_j),1) - tT_j));  % cm, structural length
  ELw_2 = [L_sj; L_jm]/ del_M; % cm, basal diameter
  %
  [t_s, t_p, t_b, l_s] = get_tj(pars_ts, f_tL3);
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL3);
  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_s)/ kT_M;
  L_s = L_m * l_s; L_j = L_m * l_j; L_i = L_m * l_i;                            % cm, structural length
  L_sj = L_s * exp(tL3((tL3(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL3((tL3(:,1) > tT_j),1) - tT_j));  % cm, structural length
  ELw_3 = [L_sj; L_jm]/ del_M; % cm, basal diameter
  %
  [t_s, t_p, t_b, l_s] = get_tj(pars_ts, f_tL4);
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL4);
  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_s)/ kT_M; 
  L_s = L_m * l_s; L_j = L_m * l_j; L_i = L_m * l_i;                            % cm, structural length
  L_sj = L_s * exp(tL4((tL4(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL4((tL4(:,1) > tT_j),1) - tT_j));  % cm, structural length
  ELw_4 = [L_sj; L_jm]/ del_M; % cm, basal diameter

  % pack to output
  prdData.tL1 = ELw_1;
  prdData.tL2 = ELw_2;
  prdData.tL3 = ELw_3;
  prdData.tL4 = ELw_4;
  
function [prdData, info] = predict_Chlamys_islandica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_R = tempcorr(temp.WdR, T_ref, T_A);
  TC_15 = tempcorr(temp.tL115, T_ref, T_A);
  TC_30 = tempcorr(temp.tL130, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  Wd_R = Ww_b * d_V * TC_R * 365 * reprod_rate_j(6.7*del_M, f, pars_R); % g, gonad dry weight at Lw 6.7 cm at spawning 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.WdR = Wd_R;

  % uni-variate data
  
  % time-length/weight post metam 
  f = f_15; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC_15; rT_B = rho_B * kT_M; Lw_i = l_i * L_m/ del_M; 
  ELw_115 = Lw_i - (Lw_i - Lw_1) * exp( - rT_B * (tL115(:,1) - tL115(1,1))); % cm, expected length at time
  EWd_115 = (ELw_115 * del_M).^3 * (1 + f * w) * d_V; % g, dry weight
  ELw_215 = Lw_i - (Lw_i - Lw_2) * exp( - rT_B * (tL215(:,1) - tL215(1,1))); % cm, expected length at time
  EWd_215 = (ELw_215 * del_M).^3 * (1 + f * w) * d_V; % g, dry weight
  %
  f = f_30; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC_30; rT_B = rho_B * kT_M; Lw_i = l_i * L_m/ del_M; 
  ELw_130 = Lw_i - (Lw_i - Lw_1) * exp( - rT_B * (tL130(:,1) - tL130(1,1))); % cm, expected length at time
  EWd_130 = (ELw_115 * del_M).^3 * (1 + f * w) * d_V; % g, dry weight
  ELw_230 = Lw_i - (Lw_i - Lw_2) * exp( - rT_B * (tL230(:,1) - tL230(1,1))); % cm, expected length at time
  EWd_230 = (ELw_230 * del_M).^3 * (1 + f * w) * d_V; % g, dry weight

  
  % pack to output
  prdData.tL115 = ELw_115;
  prdData.tL215 = ELw_215;
  prdData.tL130 = ELw_130;
  prdData.tL230 = ELw_230;
  prdData.tW115 = EWd_115;
  prdData.tW215 = EWd_215;
  prdData.tW130 = EWd_130;
  prdData.tW230 = EWd_230;

  
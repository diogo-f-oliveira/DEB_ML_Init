function [prdData, info] = predict_Pollicipes_polymerus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ts = tempcorr(temp.ts, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if ~info; pdrdData = []; return; end  
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth

  % settlement
  pars_ts = [g k l_T v_Hb v_Hs v_Hs+1e-3];
  t_s = get_tj(pars_ts, f);         % -, scaled time since birth at settlement
  tT_s = (t_s - t_b)/ k_M/ TC_ts;   % d, time since birth at settlement

  % puberty 
  [l_j1, l_p1, l_b1] = get_lj(pars_tj, f_LdL1);
  L_p1 = L_m * l_p1;                % cm, structural length at puberty at f_LdL1
  Lw_p1 = L_p1/ del_M;              % cm, basal diameter at puberty at f_LdL1
  sM_1 = l_j1/ l_b1;                % -, acceleration factor at f_LdL1
  [l_j2, l_p2, l_b2] = get_lj(pars_tj, f_LdL2);
  L_p2 = L_m * l_p2;                % cm, structural length at puberty at f_LdL2
  Lw_p2 = L_p2/ del_M;              % cm, basal diameter at puberty at f_LdL2
  sM_2 = l_j2/ l_b2;                % -, acceleration factor at f_LdL1


  % ultimate
  L_i1 = f_LdL1 * sM_1; Lw_i1 = L_i1/ del_M; % cm, ultimate basal diameter at f_LdL1
  L_i2 = f_LdL2 * sM_2; Lw_i2 = L_i2/ del_M; % cm, ultimate basal diameter at f_LdL2
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i2, f, pars_R);                     % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ts = tT_s;
  prdData.am = aT_m;
  prdData.Lp1 = Lw_p1;
  prdData.Lp2 = Lw_p2;
  prdData.Li1 = Lw_i1;
  prdData.Li2 = Lw_i2;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % length-change in length 
  pars_tj = [g k l_T v_Hb v_Hj v_Hj+1e-3];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_LdL1);
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  
  Lw_j = L_m * l_j/ del_M; Lw_i = L_m * l_i/ del_M;    % cm, structural length
  dL_sj = LdL1((LdL1(:,1) <= Lw_j),1) * rT_j/ 3;       % cm/d, change in capitulum height
  dL_jm = rT_B * (Lw_i1 - LdL1((LdL1(:,1) > Lw_j),1));  % cm/d, change in capitulum height
  EdLw_1 = [dL_sj; dL_jm];                             % cm/d, change in capitulum height
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_LdL2);
  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  
  Lw_j = L_m * l_j/ del_M; Lw_i = L_m * l_i/ del_M;    % cm, structural length
  dL_sj = LdL2((LdL2(:,1) <= Lw_j),1) * rT_j/ 3;       % cm/d, change in capitulum height
  dL_jm = rT_B * (Lw_i2 - LdL2((LdL2(:,1) > Lw_j),1));  % cm/d, change in capitulum height
  EdLw_2 = [dL_sj; dL_jm];                             % cm/d, change in capitulum height

  % length-weight
  EWd_1 = (LWd1(:,1) * del_M).^3 * d_V * (1 + f_LdL1 * w); % g, dry weight
  EWd_2 = (LWd2(:,1) * del_M).^3 * d_V * (1 + f_LdL2 * w); % g, dry weight
  
  % pack to output
  prdData.LdL1 = EdLw_1;
  prdData.LdL2 = EdLw_2;
  prdData.LWd1 = EWd_1;
  prdData.LWd2 = EWd_2;
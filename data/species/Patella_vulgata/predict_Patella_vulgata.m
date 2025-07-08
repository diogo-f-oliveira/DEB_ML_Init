function [prdData, info] = predict_Patella_vulgata(par, data, auxData)
  
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
  Wd_b = L_b^3 * (d_V + w_E * f * E_m/ mu_E); % g, dry weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, shell length at metam at f

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * (d_V + w_E * f * E_m/ mu_E); % g, ultimate dry weight
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T
  GSI = Wd_b * 365 * RT_i/ Wd_i;    % -, max somato gonadic index                       % -, gonad weight before spawning as fraction of body weight

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
    
  %E_W at L
  E_W4 = (4 * del_M)^3 * (mu_V * M_V + f * E_m)/ 1e3; % kJ, energy content at 4 cm 
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdi = Wd_i;
  prdData.GSI = GSI;
  prdData.EW4 = E_W4;
  
  % uni-variate data
    
  % time-length 
  f = f_tL; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_b = l_b * L_m; L_i = l_i * L_m; kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  ELw = [L_bj; L_ji]/ del_M;                               % cm, shell length
  % time-length 
  f = f_tL1; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_b = l_b * L_m; L_i = l_i * L_m; kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_bj = L_b * exp(tL1((tL1(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL1((tL1(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  ELw_1 = [L_bj; L_ji]/ del_M;                               % cm, shell length
  % time-length 
  f = f_tL2; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_b = l_b * L_m; L_i = l_i * L_m; kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_bj = L_b * exp(tL2((tL2(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL2((tL2(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  ELw_2 = [L_bj; L_ji]/ del_M;                               % cm, shell length
  % time-length 
  f = f_tL3; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_b = l_b * L_m; L_i = l_i * L_m; kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_bj = L_b * exp(tL3((tL3(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL3((tL3(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  ELw_3 = [L_bj; L_ji]/ del_M;                               % cm, shell length
  % time-length 
  f = f_tL4; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_b = l_b * L_m; L_i = l_i * L_m; kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_bj = L_b * exp(tL4((tL4(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL4((tL4(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  ELw_4 = [L_bj; L_ji]/ del_M;                            % cm, shell length

  % pack to output
  prdData.tL = ELw;
  prdData.tL1 = ELw_1;
  prdData.tL2 = ELw_2;  
  prdData.tL3 = ELw_3;  
  prdData.tL4 = ELw_4;
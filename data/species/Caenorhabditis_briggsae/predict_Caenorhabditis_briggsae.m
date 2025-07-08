function [prdData, info] = predict_Caenorhabditis_briggsae(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  %f_3 = M_X*1e10/(K+M_X*1e10); f_2 = M_X*1e9/(K+M_X*1e9); f_1 = M_X*5e8/(K+M_X*5e8);
  pars_tj = [g k l_T v_Hb v_Hj v_Hp]; 
  [tau_j1, tau_p1, tau_b1, l_j1, l_p1, l_b1, l_i1, rho_j1, rho_B1, info] = get_tj(pars_tj, f_1);
  if ~info; prdData = []; return; end
  [tau_j3, tau_p3, tau_b3, l_j3, l_p3, l_b3, l_i3, rho_j3, rho_B3, info] = get_tj(pars_tj, f_3);
  if ~info; prdData = []; return; end
    
  % birth
  L_b = L_m * l_b3;                   % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f_3 * w) * 1e6; % mug, wet weight at birth
  aT_b = tau_b1/ kT_M;                % d, age at birth
  
  % puberty 
  L_p1 = L_m * l_p1;                  % cm, structural length at puberty
  L_p3 = L_m * l_p3;                  % cm, structural length at puberty
  Ww_p1 = L_p1^3 * (1 + f_1 * w) * 1e6; % mug, wet weight at puberty 
  Ww_p3 = L_p3^3 * (1 + f_3 * w) * 1e6; % mug, wet weight at puberty 

  % ultimate
  L_i1 = L_m * l_i1;                  % cm, ultimate structural length
  Ww_i1 = L_i1^3 * (1 + f_1 * w) * 1e6; % mug, ultimate wet weight 
  L_i3 = L_m * l_i3;                  % cm, ultimate structural length
  Ww_i3 = L_i3^3 * (1 + f_3 * w) * 1e6; % mug, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector
  tau_m = get_tm_s(pars_tm, f_3, l_b3); % -, scaled mean life span
  aT_m = tau_m/ kT_M;                  % d, mean life span at T
 
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp_1 = Ww_p1;
  prdData.Wwp_3 = Ww_p3;
  prdData.Wwi_1 = Ww_i1;
  prdData.Wwi_3 = Ww_i3;
  
  % uni-variate data
  % time-weight
  tvel = get_tj(pars_tj, f_3, [], tW3(:,1)*kT_M);
  EWw_3 = (L_m * tvel(:,4)).^3 .* (1 + ome * tvel(:,3)) * 1e6; % mug, weight
  %
  tvel = get_tj(pars_tj, f_2, [], tW2(:,1)*kT_M);
  EWw_2 = (L_m * tvel(:,4)).^3 .* (1 + ome * tvel(:,3)) * 1e6; % mug, weight
  %
  tvel = get_tj(pars_tj, f_1, [], tW1(:,1)*kT_M);
  EWw_1 = (L_m * tvel(:,4)).^3 .* (1 + ome * tvel(:,3)) * 1e6; % mug, weight

  % weight-respiration 
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars for scaled_power_j
  %
  L = (1e-6*WJO3(:,1)/(1+f_3*ome)).^(1/3); % cm, struc length
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i] = get_tj(pars_tj, f_3);
  pACSJGRD = p_Am * L_m^2 * scaled_power_j(L, f_3, pars_p, l_b, l_j, l_p); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJ_O3 = - J_M(3, :)' * 24.4e9/ 24; % nL O2/h, O2 consumption 
  %
  L = (1e-6*WJO2(:,1)/(1+f_2*ome)).^(1/3); % cm, struc length
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i] = get_tj(pars_tj, f_3);
  pACSJGRD = p_Am * L_m^2 * scaled_power_j(L, f_2, pars_p, l_b, l_j, l_p); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJ_O2 = - J_M(3, :)' * 24.4e9/ 24; % nL O2/h, O2 consumption 
  %
  L = (1e-6*WJO1(:,1)/(1+f_1*ome)).^(1/3); % cm, struc length
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i] = get_tj(pars_tj, f_3);
  pACSJGRD = p_Am * L_m^2 * scaled_power_j(L, f_1, pars_p, l_b, l_j, l_p); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJ_O1 = - J_M(3, :)' * 24.4e9/ 24; % nL O2/h, O2 consumption 

  % food density-reproduction rate & time since birth at puberty
  %f = XR(:,1) * M_X ./ (K + XR(:,1) * M_X); % -, scaled function response
  f = [f_0; f_1; f_2; f_25; f_3; f_4];
  n = length(f); ER = zeros(n,1); Et_p = zeros(n,1);
  for i=1:n
    [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f(i));
    ER(i) = TC * reprod_rate_j(L_m*l_i, f(i), pars_R); % #/d, ultimate reproduction rate
    Et_p(i) = (tau_p - tau_b)/ kT_M;
  end
  
  % pack to output
  prdData.tW3 = EWw_3;
  prdData.tW2 = EWw_2;
  prdData.tW1 = EWw_1;
  prdData.WJO3 = EJ_O3;
  prdData.WJO2 = EJ_O2;
  prdData.WJO1 = EJ_O1;
  prdData.XR = ER;
  prdData.Xtp = Et_p;
  
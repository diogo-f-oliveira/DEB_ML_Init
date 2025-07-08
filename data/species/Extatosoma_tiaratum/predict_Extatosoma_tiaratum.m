function [prdData, info] = predict_Extatosoma_tiaratum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_25 = tempcorr(temp.WJC_25, T_ref, T_A);
  TC_35 = tempcorr(temp.WJC_35, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hp v_Hp+1e-8];
  [t_p, ~, t_b, l_p, ~, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Wd_0 = 1e3 * E_0 * w_E/ mu_E; % mg, egg dry weight
  Ww_0 = Wd_0/ d_E;             % mg, egg wet weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  s_M = l_p/ l_b;                   % -, acceleration factor 

  % reproduction (no kappa-rule)
  RT_i = TC * kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % length at instar 1, 2, 3
  L_1 = L_b * s_1^0.5; L_2 = L_1 * s_2^0.5; L_3 = L_2 * s_3^0.5;  % cm, structural length of instar 1-3
  Lw_1 = L_1/ del_M; Lw_2 = L_2/ del_M; Lw_3 = L_3/ del_M; % cm, total length

  % weight at instar 1, 2, 3
  Ww_1 = 1e3 * L_1^3 * (1 + f * w); Ww_2 = 1e3 * L_2^3 * (1 + f * w); Ww_3 = 1e3 * L_3^3 * (1 + f * w); % mg, wet weight

  % CO2 production at instar 1, 2, 3
  pars_mat = [kap kap_R g k_J k_M 0 v E_Hb E_Hp E_Hp+1e-6]; % maturity parameters
  kT_M = TC_25 * k_M; kT_J = TC_25 * k_J; pT_M = TC_25 * p_M; kT_E = TC_25 * v/ L_b; % 1/d, reserve turnover rate
  L = [L_1 L_2 L_3]'; % cm, struc length
  E_H = maturity_j(L, f, pars_mat); % J, maturity at L
  E = f * E_m * L.^3;               % J, reserve
  r = (f * kT_E - g * kT_M) ./ (f + g);  % 1/d, specific growth rate
  pC = E .* (kT_E - r); pJ = kT_J * E_H; pM = pT_M * L.^3; pR = (1 - kap) * pC - pJ;
  pA = f * p_Am/ L_b * L.^3; pD = pJ + pM + (1 - kap_R) * pR; pG = kap * pC - pM;  
  pADG = [pA, pD, pG];                   % scaled growth (page 78 DEB book)
  JM = - (n_M\n_O) * eta_O * pADG';      % mol/d, mineral fluxes
  JC_25 = JM(1,:)' * 24.4e3/ 24/ 60;     % ml/min, CO2 prod
  JC_1 = JC_25(1); JC_2 = JC_25(2); JC_3 = JC_25(3); JC_i = JC_25(3);


  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.L1 = Lw_1;
  prdData.L2 = Lw_2;
  prdData.L3 = Lw_3;
  prdData.Li = Lw_p;
  prdData.Wd0 = Wd_0;
  prdData.Ww0 = Ww_0;
  prdData.Ww1 = Ww_1;
  prdData.Ww2 = Ww_2;
  prdData.Ww3 = Ww_3;
  prdData.Ri = RT_i;
  prdData.JC1 = JC_1;
  prdData.JC2 = JC_2;
  prdData.JC3 = JC_3;
  prdData.JCi = JC_i;
  
  % uni-variate data
  
  % weight-CO2 production 
  kT_M = TC_25 * k_M; kT_J = TC_25 * k_J; pT_M = TC_25 * p_M; kT_E = TC_25 * v/ L_b; % 1/d, reserve turnover rate
  L = (1e-3 * WJC_25(:,1)/ (1 + f * w)).^(1/3); % cm, struc length
  E_H = maturity_j(L, f, pars_mat); % J, maturity at L
  E = f * E_m * L.^3;                % J, reserve
  r = (f * kT_E - g * kT_M) ./ (f + g);  % 1/d, specific growth rate
  pC = E .* (kT_E - r); pJ = kT_J * E_H; pM = pT_M * L.^3; pR = (1 - kap) * pC - pJ;
  pA = f * p_Am/ L_b * L.^3; pD = pJ + pM + (1 - kap_R) * pR; pG = kap * pC - pM;  
  pADG = [pA, pD, pG];                   % J/d, assim, dissip, growth (page 78 DEB3 book)
  JM = - (n_M\n_O) * eta_O * pADG';      % mol/d, mineral fluxes
  EJC_25 = JM(1,:)' * 24.4e3/ 24/ 60;    % ml/min, CO2 prod
  %
  kT_M = TC_35 * k_M; kT_J = TC_35 * k_J; pT_M = TC_35 * p_M; kT_E = TC_35 * v/ L_b; % 1/d, reserve turnover rate
  L = (1e-3 * WJC_35(:,1)/ (1 + f * w)).^(1/3); % cm, struc length
  E_H = maturity_j(L, f, pars_mat); % J, maturity at L
  E = f * E_m * L.^3;               % J, reserve
  r = (f * kT_E - g * kT_M) ./ (f + g);  % 1/d, specific growth rate
  pC = E .* (kT_E - r); pJ = kT_J * E_H; pM = pT_M * L.^3; pR = (1 - kap) * pC - pJ;
  pA = f * p_Am/ L_b * L.^3; pD = pJ + pM + (1 - kap_R) * pR; pG = kap * pC - pM;  
  pADG = [pA, pD, pG];                   % scaled growth (page 78 DEB book)
  JM = - (n_M\n_O) * eta_O * pADG';      % mol/d, mineral fluxes
  EJC_35 = JM(1,:)' * 24.4e3/ 24/ 60;    % ml/min, CO2 prod

  
  % pack to output
  prdData.WJC_25 = EJC_25;
  prdData.WJC_35 = EJC_35;
  
end


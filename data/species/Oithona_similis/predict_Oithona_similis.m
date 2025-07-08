function [prdData, info] = predict_Oithona_similis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hp v_Hp+1e-8];
  [t_p, ~, t_b, l_p, ~, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial reserve

  % birth (start of acceleration)
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  WC_b = Ww_b * d_V * 12e9/ w_V;    % ng, C-weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  WC_p = L_p^3 * d_V * (1 + f * w) * 12e9/ w_V; % ng, C-weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  s_M = l_p/ l_b;                   % -, acceleration factor 
  
  % ultimate
  WC_i = WC_p;

  % reproduction (no kappa-rule)
  RT_i = TC * kap_R * ((1 - kap) * p_Am * s_M * L_p^2 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T

  % life span
  h3_W = f * h_a * v/ 6/ L_b; % 1/d^3, cubed Weibull ageing rate
  a_m = gamma(4/3)/ h3_W^(1/3); % d, mean life span at T
  aT_m = a_m/ TC;
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.WCb = WC_b;
  prdData.WCp = WC_p;
  prdData.WCi = WC_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
    
  % time-weight
  rT_j = rho_j * k_M * TC;
  EWC_1 = min(WC_p, WC_b * exp(tW1(:,1) * rT_j));% ng, C-weight
  EWC_2 = min(WC_p, WC_b * exp(tW2(:,1) * rT_j));% ng, C-weight
  EWC_3 = min(WC_p, WC_b * exp(tW3(:,1) * rT_j));% ng, C-weight
  EWC_4 = min(WC_p, WC_b * exp(tW4(:,1) * rT_j));% ng, C-weight

  % pack to output
  prdData.tW1 = EWC_1;
  prdData.tW2 = EWC_2;
  prdData.tW3 = EWC_3;
  prdData.tW4 = EWC_4;
  
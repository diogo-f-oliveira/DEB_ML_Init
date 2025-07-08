function [prdData, info] = predict_Calanus_sinicus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_20 = tempcorr(temp.tW_20, T_ref, T_A);
  TC_17 = tempcorr(temp.tW_17, T_ref, T_A);
  TC_15 = tempcorr(temp.tW_15, T_ref, T_A);
  TC_13 = tempcorr(temp.tW_13, T_ref, T_A);
  TC_10 = tempcorr(temp.tW_10, T_ref, T_A);
  TC_TJX = tempcorr(C2K(TJX(:,1)), T_ref, T_A);
  TC_TJC = tempcorr(C2K(TJC(:,1)), T_ref, T_A);
  TC_TR = tempcorr(C2K(TR(:,1)), T_ref, T_A);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_Tap = tempcorr(C2K(Tap(:,1)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tjp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tjp, f); % gets scaled age at metamorph
 
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial reserve
  WC_0 = 12e6 * E_0/ mu_E;                          % mug C, initial carbon reserve

  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = 1e6 * L_b^3 * (1 + f * w); % mug, wet weight at birth
  a_b = t_b/ k_M;                   % d, age at birth at f and T
  
  % puberty (end of growth and kappa-rule)
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = 1e6 * L_p^3 * (1 + f * w); % mug, wet weight at puberty 
  a_p = t_p/ k_M;                   % d, time since birth at puberty at f and T

  % ultimate  
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Ww_i = Ww_p;                      % mug, ultimate wet weight 
 
  % reproduction (no kappa-rule)
  R_i = kap_R * (p_Am * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T_ref
  RT_i = TC * R_i; % 1/d, repord at T
  
  % life span
  h3_W = f * h_a * v/ 6/ L_p; % 1/d^3, cubed Weibull ageing rate
  aT_m = gamma(4/3)/ h3_W^(1/3)/ TC; % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.WC0 = WC_0;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight 
  r_B = k_M/ 3/ (1 + f/ g);   
  EWw_20 = min(L_p, L_i - (L_i - L_b) * exp(- r_B * TC_20 * tW_20(:,1))).^3 * (1 + f * w) ; % g, wet weight
  EWw_17 = min(L_p, L_i - (L_i - L_b) * exp(- r_B * TC_17 * tW_17(:,1))).^3 * (1 + f * w) ; % g, wet weight
  EWw_15 = min(L_p, L_i - (L_i - L_b) * exp(- r_B * TC_15 * tW_15(:,1))).^3 * (1 + f * w) ; % g, wet weight
  EWw_13 = min(L_p, L_i - (L_i - L_b) * exp(- r_B * TC_13 * tW_13(:,1))).^3 * (1 + f * w) ; % g, wet weight
  EWw_10 = min(L_p, L_i - (L_i - L_b) * exp(- r_B * TC_10 * tW_10(:,1))).^3 * (1 + f * w) ; % g, wet weight
  
  % T-JX data
  EJ_X = 1e6 * TC_TJX * p_Am * L_p^2/ kap_X/ mu_X/ Ww_i/ d_V; % g C/d.g C
  
  % T-JC data
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  pACSJGRD = L_m^2 * p_Am * scaled_power(L_p, f, pars_R, l_b, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:,[1 7 5])')'; % mol/d, mineral fluxes
  EJ_C = 1e6 * TC_TJC * J_M(:,1) * 12/ Ww_i/ d_V;         % g/d.g, CO2 flux
  
  % T-R data
  ER = R_i * TC_TR;
  
  % T-ab, ap data
  Eab = a_b ./ TC_Tab; % d, age at birth
  Eap = a_p ./ TC_Tap; % d, age at puberty
  
  % pack to output
  prdData.tW_20 = EWw_20;
  prdData.tW_17 = EWw_17;
  prdData.tW_15 = EWw_15;
  prdData.tW_13 = EWw_13;
  prdData.tW_10 = EWw_10;
  prdData.TJX = EJ_X;
  prdData.TJC = EJ_C;
  prdData.TR = ER;
  prdData.Tab = Eab;
  prdData.Tap = Eap;
  
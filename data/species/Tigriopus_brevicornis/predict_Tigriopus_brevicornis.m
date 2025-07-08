function [prdData, info] = predict_Tigriopus_brevicornis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_TRi = tempcorr(C2K(TR(:,1)), T_ref, T_A);
  TC_15 = tempcorr(temp.tJN, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tjp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tjp, f); % gets scaled age at metamorph
   
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial reserve

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = 1e6 * L_b^3 * (1 + f * w); % mug, wet weight at birth
  
  % puberty (end of growth and kappa-rule)
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = 1e6 * L_p^3 * (1 + f * w); % mug, wet weight at puberty 
  if (p_Am * L_p^2 * (1 - kap) - p_M * L_p^3 - k_J * E_Hp) < 0 % negative reprod
     info = 0; prdData = []; return
  end

  % ultimate 
  L_i = L_m * f;                    % cm, ultimate (assymptotic) struc length
  Ww_i = Ww_p;                      % mug, ultimate wet weight 
 
  % reproduction 
  R_i = kap_R * (f * p_Am * L_p^2 * (1 - kap) - p_M * L_p^3 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T_ref
  
  % life span
  h3_W = f * h_a * v/ 6/ L_p; % 1/d^3, cubed Weibull ageing rate
  aT_m = gamma(4/3)/ h3_W^(1/3)/ TC; % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-weight 
  r_B = k_M/ 3/ (1 + f/ g);   
  EV_f = min(L_p, L_i - (L_i - L_b) * exp(- r_B * TC * tV_f(:,1))).^3 * (1 + f * w) ; % cm^3, volume
  EV_m = min(L_p, L_i - (L_i - L_b) * exp(- r_B * TC * tV_m(:,1))).^3 * (1 + f * w) ; % cm^3, volume
  %
  [t_p, t_b, l_p, l_b] = get_tp(pars_tjp, f_tWN); 
  L_i = f_tWN * L_m; L_b = l_b * L_m; r_B = k_M/ 3/ (1 + f_tWN/ g); 
  EW_N = 1e6 * min(L_p, L_i - (L_i - L_b) * exp(- r_B * TC_15 * tWN(:,1))).^3 * d_V * (14/w_V + f_tWN * w * 14/w_E) ; % mug, Nitogen weight
    
  % t-N excretion using f_tWN
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  L = min(L_p, L_i - (L_i - L_b) * exp(- r_B * TC_15 * tJN(:,1))).^3; % cm, struc length
  pACSJGRD = L_m^2 * p_Am * scaled_power(L, f_tWN, pars_R, l_b, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:,[1 7 5])')'; % mol/d, mineral fluxes
  EJ_N = TC_15 * J_M(:,4) * 14e6;                    % mug/d, N flux
  
  % T-R data
  ER_i = R_i * TC_TRi;
  
  
  % pack to output
  prdData.tV_f = EV_f;
  prdData.tV_m = EV_m;
  prdData.tWN = EW_N;
  prdData.tJN = EJ_N;
  prdData.TR = ER_i;
  
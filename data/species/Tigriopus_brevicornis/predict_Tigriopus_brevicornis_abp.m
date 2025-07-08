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
  pars_tj = [g; k; l_T; v_Hb; v_Hp-1e-3; v_Hp]; 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
   
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial reserve

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = 1e6 * L_b^3 * (1 + f * w); % mug, wet weight at birth
  
  % puberty (end of growth and kappa-rule)
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = 1e6 * L_p^3 * (1 + f * w); % mug, wet weight at puberty 
  s_M = L_p/ L_b;                   % -. acceleration factor

  % ultimate     
  Ww_i = Ww_p;                      % mug, ultimate wet weight 
 
  % reproduction
  R_i = kap_R * ((1 - kap) * p_Am * s_M * L_p^2  - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T
  
  % life span
  h3_W = f * h_a * v/ 6/ L_b; % 1/d^3, cubed Weibull ageing rate
  a_m = gamma(4/3)/ h3_W^(1/3); % d, mean life span at T
  aT_m = a_m/ TC; 
  
  % pack to output
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-weight/volume
  r_j = rho_j * k_M;        
  EV_f = min(L_p, L_b * exp(tV_f(:,1)* r_j * TC/3)).^3 * (1 + f * w); % cm^3, volume
  EV_m = min(L_p, L_b * exp(tV_m(:,1)* r_j * TC/3)).^3 * (1 + f * w); % cm^3, volume
  EW_N = 1e6 * min(L_p, L_b * exp(tWN(:,1)* r_j * TC/3)).^3 * (1 + f * w) * d_V * (n_NV + f * w * n_NE) ; % mug, Nitogen weight
    
  % T-JN data
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp-1e-3;  U_Hp]; % compose parameter vector at T
  L = L_b * exp(tJN(:,1) * r_j * TC_15/3); % cm, struc length
  pACSJGRD = L_m^2 * p_Am * scaled_power_j(L, f, pars_R, l_b, l_j, l_p); % J/d powers
  pACSJGRDp = L_m^2 * p_Am * scaled_power_j(L_p, f, pars_R, l_b, l_j, l_p); % J/d powers
  pACSJGRD = min(pACSJGRD, pACSJGRDp(ones(length(L),1),:));
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
  
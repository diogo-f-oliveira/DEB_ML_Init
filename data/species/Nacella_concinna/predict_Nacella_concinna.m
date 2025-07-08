function [prdData, info] = predict_Nacella_concinna(par, data, auxData)

% unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  %TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  %TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  
  TC_LGSI_i = tempcorr(temp.LGSI_i, T_ref, T_A);
  TC_TJO_i = tempcorr(TJO_i(:,1), T_ref, T_A);
  TC_LJO_i = tempcorr(temp.LJO_i, T_ref, T_A);
  TC_LGSI_s = tempcorr(temp.LGSI_s, T_ref, T_A);
  TC_TJO_s = tempcorr(TJO_s(:,1), T_ref, T_A);
  TC_LJO_s = tempcorr(temp.LJO_s, T_ref, T_A);

  
% zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];               % compose parameter vector for get_tj later 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J ;k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm2, initial scaled reserve. Fraction des r�serves restantes at birth
  Ww_0 = U_E0 * p_Am * w_E / mu_E /d_V; % g, initial wet weight
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M_larvae;         % cm, physical length at birth at f
  %Ww_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth at f (remove d_V for wet weight)
  a_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis
  
  % puberty
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M_i;                % cm, physical length at puberty at f
  AFDW_p = L_p^3 * (1 + f * w) * d_V; % g, dry weight at puberty 
  a_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M_i;                % cm, ultimate physical length at f
  AFDW_i = L_i^3 * (1 + f * w) * d_V; % g, ultimate dry weight 
 
  % life span
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f_anvers);
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f_anvers, l_b);      % -, scaled mean life span at T_ref
  a_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.ab = a_b;
  prdData.ap = a_p;
  prdData.am = a_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  %prdData.Wwb = Ww_b;
  prdData.Wdp = AFDW_p;
  prdData.Wdi = AFDW_i;
  
  % intertital uni-variate data
  % length-GSI: max gonad weight and proportion to soma (GSI= gonad weight/ soma weight)
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj; U_Hp]; % compose parameter vector at T
  L_gsi = LGSI_i(:,1) .* del_M_i; % cm, structural length
  Ww = (L_gsi.^3) .* (1 + f * w); % g, wet weight
  GWW = 365 * TC_LGSI_i * reprod_rate_j(L_gsi, f, pars_R)* Ww_0 ;
  EGSI = GWW./ Ww;  % -, GSI
  
  % Length-AFDW rothera
  L= LWd_rothera_i(:,1) * del_M_i;  % cm, structural length
  EAFDW_rothera= L.^3 * (1+ f * w) * d_V ; % g, AFDW
  
  % Length-AFDW signy
  L= LWd_signy_i(:,1) * del_M_i;  % cm, structural length
  EAFDW_signy = L.^3 * (1 + f_signy * w) * d_V ; % g, AFDW
  
  % temperature-O2 consumption
  L = 3.25 * del_M_i; % cm, structural length, individuals respiro Peck measured 32.5mm in average
  p_ref = p_Am * L_m^2; % max assimilation power at max size 
  O2M = (- n_M\n_O)' ; % -, matrix that converts organic to mineral fluxes 02M is prepared for post multiplication eq 4.35
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]) ;
  pADG(:,1) = 0; % exclude contribution from assim % BECAUSE the animal is not feeding, if starved for a long time we have the metabolic basal rate 
  % 2 weeks maybe is not enough. 0: no assimilation (starved animal), 1
  % consider that the animal spends energy on assimilation 
  JO = pADG * eta_O';        % organic fluxes
  JM = JO * O2M   ;          % mineral fluxes
  ETJO = - 1e6 * JM(:,3) * TC_TJO_i/ 24 * 22.4;  % mul/h, dioxygen consumption rate at temp T  
 
  % length-O2 consumption
  L = LJO_i(:,1) * del_M_i; % cm, structural length
  s_M = l_j/ l_b;            % -, acceleration factor
  p_ref = p_Am * L_m^2; % max assimilation power at max size
  O2M = (- n_M\n_O)';   % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  pA = f .* s_M .* (L./L_m).^2 * p_ref;% assimilation power, reserves not in equilibrium with food yet
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);%;  pADG(:,1) = pA; % powers that contribute to Oxygen fluxes
  %pADG(:,1) = 0; % exclude contribution from assim % BECAUSE the animal is not feeding, if starved for a long time we have the metabolic basal rate 
  JO = pADG * eta_O';        % mol/d, organic fluxes
  JM = JO * O2M;             % mol/d, mineral fluxes
  ELJO = - 1e6 * JM(:,3) * TC_LJO_i/ 24;  % mumol/h, dioxygen consumption rate at temp T
  
  % pack to output intertidal data
  prdData.LGSI_i = EGSI;
  prdData.LWd_rothera_i = EAFDW_rothera;
  prdData.LWd_signy_i = EAFDW_signy;
  prdData.TJO_i = ETJO;
  prdData.LJO_i = ELJO;

  % subtital uni-variate data
  % length-GSI: max gonad weight and proportion to soma (GSI= gonad weight/ soma weight)
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj; U_Hp]; % compose parameter vector at T
  L_gsi = LGSI_s(:,1) .* del_M_s; %cm, structural length
  Ww = (L_gsi.^3) .* (1 + f * w); % g, wet weight
  GWW = 365 * TC_LGSI_s * reprod_rate_j(L_gsi, f, pars_R)* Ww_0 ;
  EGSI = GWW./ Ww;% %, estimate of the GSI
  
  % Length-AFDW rothera
  L= LWd_rothera_s(:,1) * del_M_s;  % cm, structural length
  EAFDW_rothera= L.^3 * (1+ f * w) * d_V ; % g, AFDW
  
  % Length-AFDW signy
  L= LWd_signy_s(:,1) * del_M_s;  % cm, structural length
  EAFDW_signy= L.^3 * (1 + f_signy * w) * d_V ; % g, AFDW
  
  % temperature-O2 consumption
  L = 3.25 * del_M_s; %cm, structural length, individuals respiro Peck measured 32.5mm in average
  p_ref = p_Am * L_m^2; % max assimilation power at max size 
  O2M = (- n_M\n_O)' ;% -, matrix that converts organic to mineral fluxes 02M is prepared for post multiplication eq 4.35
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]) ;
  pADG(:,1) = 0; % exclude contribution from assim % BECAUSE the animal is not feeding, if starved for a long time we have the metabolic basal rate 
  % 2 weeks maybe is not enough. 0: no assimilation (starved animal), 1
  % consider that the animal spends energy on assimilation 
  JO = pADG * eta_O';        % organic fluxes
  JM = JO * O2M   ;          % mineral fluxes
  ETJO = - 1e6 * JM(:,3) * TC_TJO_s/ 24 * 22.4;  % mul/h, dioxygen consumption rate at temp T  
 
  % length-O2 consumption
  L = LJO_s(:,1) * del_M_s; % cm, structural length
  s_M = l_j/ l_b;                       % acceleration factor
  p_ref = p_Am * L_m^2; % max assimilation power at max size
  O2M = (- n_M\n_O)';   % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  pA = f .* s_M .* (L./L_m).^2 * p_ref;% assimilation power, reserves not in equilibrium with food yet
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);%;  pADG(:,1) = pA; % powers that contribute to Oxygen fluxes
  %pADG(:,1) = 0; % exclude contribution from assim % BECAUSE the animal is not feeding, if starved for a long time we have the metabolic basal rate 
  JO = pADG * eta_O';        % organic fluxes
  JM = JO * O2M;             % mineral fluxes
  ELJO = - 1e6 * JM(:,3) * TC_LJO_s/ 24;  % mumol/h, dioxygen consumption rate at temp T
  
  % pack to output subtital data
  prdData.LGSI_s = EGSI;
  prdData.LWd_rothera_s = EAFDW_rothera;
  prdData.LWd_signy_s = EAFDW_signy;
  prdData.TJO_s = ETJO;
  prdData.LJO_s = ELJO;

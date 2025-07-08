function [prdData, info] = predict_Abatus_cordatus(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
    
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); % 5°C
  TC_LJO = tempcorr(temp.LJO, T_ref, T_A); % 9°C

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J ;k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0); %d.cm2, initial scaled reserve. Fraction des réserves restantes at birth
  Ww_0 = U_E0 * p_Am * w_E / mu_E /d_V;       % g, initial wet weight
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  
  % metamorphosis 
  L_j = L_m * l_j;                  % cm, structural length at metamorphosis 
  Lw_j = L_j / del_M ;              % cm, total length at metam at f 
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at puberty (remove d_V for wet weight)
  tT_j = (t_j - t_b)/k_M /TC ;      % d, time since birth at metam
  s_M= l_j/l_b;                     % - acceleration factor
  
  % puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w) ;      % g, wet weight at puberty (remove d_V for wet weight)
  a_p = t_p/ k_M/ TC;               % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate length
  
  % at 6 yrs
  rT_B = TC * k_M * rho_B; 
  L_6 = L_i - (L_i - L_j) * exp( - rT_B * (6*365 - tT_j)); % cm, struct length after acceleration
  Lw_6 = L_6/ del_M; Ww_6 = L_6^3 * (1 + w * f);           % cm, g, length and weight at 6 yrs
  
  % reproduction
  %pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  %RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % GSI
  %t_halage = (10/12)*365; % d, period of accumulation of reprod buffer
  t_halage= 365;
  GSI = TC * (t_halage * k_M * g/ f^3)/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^3);
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  a_m = t_m/ k_M/ TC;                   % d, mean life span at T
  
  % pack to output
  prdData.tj = tT_j;
  prdData.ap = a_p;
  prdData.am = a_m;
  %prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.L6 = Lw_6;
  prdData.Ww0 = Ww_0; 
  prdData.Wwj = Ww_j; 
  prdData.Wwp = Ww_p; 
  prdData.Ww6 = Ww_6; 
  %prdData.Ri = RT_i;
  prdData.GSI = GSI;

  % uni-variate data
  
  % time-length
  % rT_j = TC * k_M * rho_j; 
  % L_bj = L_b * exp(-tL_egg(:,1) * rT_j); % cm, struct length during acceleration
  % ELw_egg = L_bj / del_M; % cm, length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j)); % cm, struct length after acceleration
  ELw = L_ji / del_M; % cm, length
  
  
  % Length-weight
  EWw = (LW(:,1) * del_M).^3 * (1+ f * w) ; % g, wet weight
  EWw_egg = (LW_egg(:,1) * del_Me).^3; % g, wet weight egg

  %length-O2 consumption
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  pACSJGRD = L_m^2 * p_Am * scaled_power_j(del_M * LJO(:,1), f, pars_power, l_b,l_j, l_p); % J/d powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:,[1 7 5])'; % mol/d, mineral fluxes
  EJT_O = - J_M(3,:)' .* TC_LJO * 24.4e6 / 24;  % muL/h

  % pack to output
  prdData.LW = EWw;
  prdData.LW_egg = EWw_egg;
  prdData.tL = ELw;
  %prdData.tL_egg = ELw_egg;
  prdData.LJO = EJT_O;


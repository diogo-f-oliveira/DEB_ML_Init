function [prdData, info] = predict_Mesocentrotus_franciscanus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_LdL = tempcorr(temp.LdL, T_ref, T_A);
  TC_JO1 = tempcorr(temp.WwJO1, T_ref, T_A);
  TC_JO2 = tempcorr(temp.WwJO2, T_ref, T_A);
  TC_JO3 = tempcorr(temp.WwJO3, T_ref, T_A);
  TC_LR1 = tempcorr(temp.LR1, T_ref, T_A);
  TC_LR2 = tempcorr(temp.LR2, T_ref, T_A);
  TC_LR3 = tempcorr(temp.LR3, T_ref, T_A);


  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, test diameter at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at birth at f
  Lw_j = L_j/ del_M;                % cm, test diameter at birth at f
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, test diameter at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate test diameter at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % GSI
  t1 = 365; % d, period of accumulaton of reprod buffer
  GSI = TC_GSI * (t1 * k_M * g/ f^3)/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3);

  % life span
  %pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  %t_m = get_tm_s(pars_tm, f);  % -, scaled mean life span at T_ref
  pars_tm = [g; k; v_Hb; v_Hj; v_Hp; h_a/k_M^2; s_G]; 
  t_m = get_tm_mod('abj', pars_tm, f);  % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % wet weight - respiration  
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  %
  L = (WwJO1(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  %EJT_01 = - J_M(3,:)' * TC_JO1 * 24.4e6/ 24;           % µl O2/h, O2 consumption 
  EJT_01 = - J_M(3,:)' * TC_JO1 * 32e3/ 24;         % µl O2/h, O2 consumption 
  %
  L = (WwJO2(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_02 = - J_M(3,:)' * TC_JO2 * 32e3/ 24;         % mg O2/h, O2 consumption 

  L = (WwJO3(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O3 = - J_M(3,:)' * TC_JO3 * 32e3/ 24;         % mg O2/h, O2 consumption 

  % time-length 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_tL; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; 
  L = L_i - (L_i - L_j) * exp( - rT_B * tL(:,1)); % cm, structural length at time
  ELw = L/ del_M;                                 % cm, test diameter

  % length - chnage in length
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);
  rT_B = TC_LdL * rho_B * k_M;  % 1/d, von Bert growth rate   
  Lw_i = l_i * L_m/ del_M;
  ELdL = rT_B * (Lw_i - LdL(:,1));   

  % length-wet weight (wet weights including calcareaous structures such as spines)
  EWw1 = (LW1(:,1) * del_M).^3 * (1 + f * ome);
  EWw2 = (LW2(:,1) * del_M).^3 * (1 + f * ome);
  EWw3 = (LW3(:,1) * del_M).^3 * (1 + f * ome);

  % length-gonad weight
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Ww_0 = U_E0 * J_E_Am * w_E/ d_E;  % g, wet weight of egg
  %
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EWw_R1 = Ww_0 * (365/2) * TC_LR1 * reprod_rate_j(LR1(:,1) * del_M, f, pars_R); % g, gonad weight at L
  %
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  EWw_R2 = Ww_0 * (365/2) * TC_LR2 * reprod_rate_j(LR2(:,1) * del_M, f, pars_R); % g, gonad weight at L
  %
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  EWw_R3 = Ww_0 * (365/2) * TC_LR3 * reprod_rate_j(LR3(:,1) * del_M, f, pars_R); % g, gonad weight at L


  % pack to output
  prdData.tL = ELw;
  prdData.LdL = ELdL;
  prdData.WwJO1 = EJT_01;
  prdData.WwJO2 = EJT_02;
  prdData.WwJO3 = EJT_O3;
  prdData.LW1 = EWw1;
  prdData.LW2 = EWw2;
  prdData.LW3 = EWw3;
  prdData.LR1 = EWw_R1;
  prdData.LR2 = EWw_R2;
  prdData.LR3 = EWw_R3; 
  
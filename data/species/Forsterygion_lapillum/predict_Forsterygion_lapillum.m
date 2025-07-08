function [prdData, info] = predict_Forsterygion_lapillum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); vars_pull(cPar);  
  vars_pull(data); vars_pull(auxData);
  
  
  if E_Hh >= E_Hb || E_Hh < 0 || f_TJO1 > 1 || f_TJO2 > 1 || f_tL > 1
    info = 0; prdData = []; return
  end

  % compute temperature correction factors 
  TC_ah= tempcorr(temp.ah, T_ref, T_A); 
  TC_tb = tempcorr(temp.tb, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_rB = tempcorr(temp.rB, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_TJO1 = tempcorr(C2K(TJO1(:,1)), T_ref, T_A);
  TC_TJO2 = tempcorr(C2K(TJO2(:,1)), T_ref, T_A);

  
  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, ~, ~, info] = get_tj(pars_tj, f);
  if info == 0
    prdData = []; return
  end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatching   
  [~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC_ah;            % d, age at hatch at f and T
  L_h = aUL(2,3);                    % cm, structural length at f
  Lw_h = L_h/ del_Mlrv;              % cm, total length at hatch at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  tT_b = t_b/ k_M/ TC_tb - aT_h;    % d, time since hatch at birth at f, temp corrected
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  Ww_j = L_j^3 * (1 + f * w);       % g, metam wet weight
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  s_M = l_j/ l_b;                   % -, acceleration factor
     
  % puberty 
  L_p = l_p * L_m;                  % cm, structural at puberty
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, puberty wet weight
  tT_p = t_p/ k_M/ TC_tp - aT_h;    % d, time since hatch at puberty
  
  % ultimate 
  L_i = L_m * l_i;                  % cm, ultimate structural length
  Lw_i = L_i/ del_M;                % cm, ultimate total length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

  
  % maximum GSI (female)
  GSI = TC_GSI * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - ...
     k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^2); % mol E_R/ mol W

  % von Bert growth
  rT_B = TC_rB * k_M/ 3/ (1 + f/ g); % d, 1/von Bert growth rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  
  % pack to output
  prdData.ah = aT_h;
  prdData.tb = tT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.Lh = Lw_h;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  prdData.rB = rT_B;
  prdData.am = aT_m;
  
  %% uni-variate data
  

  % time-length  
  [t_j, ~, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_tL; rT_B = rho_B * kT_M;   rT_j = rho_j * kT_M;   tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;   L_j = L_m * l_j;   L_i = L_m * l_i;
  L_bj = L_b * exp(tL(tL(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(tL(:,1) >= tT_j,1) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_ji]/ del_M;
  
  % length-weight data
  EWw = (LW(:,1) * del_M).^3 * (1 + f_tL * w); % g, wet weight
  
  % temp-respiration, TJO1
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];     % compose pars
  p_ref = p_Am * L_m^2;                                             % J/d, max assimilation power at max size
  L = (Ww_TJO1/ (1 + f_TJO1 * w)) .^ (1/3);                        % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f_TJO1, pars_p, l_b, l_j, l_p);   % J/d, powers
  pACSJGRD(:,1) = 0; % exclude assimilation
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';               % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O1 = - J_M(3,:) * TC_TJO1 * 32e3/ 24/ Ww_TJO1;            % mg O2/h.g, spec O2 consumption
  
  % temp-respiration, TJO2
  L = (Ww_TJO2/ (1 + f_TJO2 * w)) .^ (1/3);                       % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f_TJO2, pars_p, l_b, l_j, l_p);   % J/d, powers
  pACSJGRD(:,1) = 0; % exclude assimilation
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';              % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O2 = - J_M(3,:) * TC_TJO2 * 32e3/ 24/ Ww_TJO2;           % mg O2/h.g, spec O2 consumption
  

  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
  prdData.TJO1 = EJT_O1;
  prdData.TJO2 = EJT_O2;

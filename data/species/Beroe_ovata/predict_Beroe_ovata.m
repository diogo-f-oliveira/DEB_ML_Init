function [prdData, info] = predict_Beroe_ovata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_R7 = tempcorr(temp.R7, T_ref, T_A);
  TC_WdJO = tempcorr(temp.WdJO, T_ref, T_A);  
  TC_21 = tempcorr(temp.WwJO_21, T_ref, T_A);
  TC_26 = tempcorr(temp.WwJO_26, T_ref, T_A);
  TC_WwR = tempcorr(temp.WwR, T_ref, T_A);
  TC_tW = tempcorr(temp.tWw, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0);  % d.cm^2, initial scaled reserve
  Lw_0 = (U_E0 * p_Am * w_E/ mu_E/ d_E)^(1/3)/ del_Y;  % cm, egg diameter
  WC_0 = U_E0 * p_Am * 12e6/ mu_E;             % µg, carbon weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (t_j - t_b)/ k_M/ TC_tW;   % d, time since birth at metam at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_7 = TC_R7 * reprod_rate_j(7 * del_M, f, pars_R);           % #/d, eproduction rate at 7 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.L0 = Lw_0;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.WC0 = WC_0;
  prdData.Wwi = Ww_i;
  prdData.R7 = RT_7;
  
  % uni-variate data
  
  % weight - respiration
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  L = (WdJO(:,1)/ (1 + f * w)/ d_V/ del_W) .^ (1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O = - J_M(3,:)' * TC_WdJO * 24.4e3/ 24;         % ml O2/h, O2 consumption 
  %
  L = (WwJO_21(:,1)/ (1 + f * w)) .^ (1/3);           % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O21 = - J_M(3,:)' * TC_21/ 24/ 32e-6;           % µg O2/h, O2 consumption 
  %
  L = (WwJO_26(:,1)/ (1 + f * w)) .^ (1/3);           % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O26 = - J_M(3,:)' * TC_26/ 24/ 32e-6;           % µg O2/h, O2 consumption 

  % weight - reprod rate
  ERT = TC_WwR * reprod_rate_j((WwR(:,1)/ (1 + f * w)).^(1/3), f, pars_R);     % #/d, reprod rate          % #/d, eproduction rate at 7 cm

  % time-weight 
  kT_M = k_M * TC_tW; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_bj = L_b * exp(tWw((tWw(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWw((tWw(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  L = [L_bj; L_jm]; EWw = L.^3 * (1 + f * w) * 1e3;                            % mg, wet weight
  %
  L_bj = L_b * exp(tWC((tWC(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWC((tWC(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  L = [L_bj; L_jm]; EWC = L.^3 * (1 + f * w) * d_V * 1e6;              % µg, ashfree dry weight

  % length-weight
  EWw_L = (LWw(:,1) * del_M).^3 * (1 + f * w);
  EWw_L2 = (LWw2(:,1) * del_M).^3 * (1 + f * w);
  
  % pack to output
  prdData.WdJO = EJT_O;
  prdData.WwJO_21 = EJT_O21;
  prdData.WwJO_26 = EJT_O26;
  prdData.WwR = ERT;
  prdData.tWw = EWw;
  prdData.tWC = EWC;
  prdData.LWw = EWw_L;
  prdData.LWw2 = EWw_L2;
  
function [prdData, info] = predict_Eriphia_verrucosa(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_JO1 = tempcorr(temp.WwJO1, T_ref, T_A);
  TC_JO2 = tempcorr(temp.WwJO2, T_ref, T_A);
  TC_JO3 = tempcorr(temp.WwJO3, T_ref, T_A);
  TC_JO4 = tempcorr(temp.WwJO4, T_ref, T_A);
  TC_JO5 = tempcorr(temp.WwJO5, T_ref, T_A);
  TC_JO6 = tempcorr(temp.WwJO6, T_ref, T_A);
  TC_JO7 = tempcorr(temp.WwJO7, T_ref, T_A);
  TC_JO8 = tempcorr(temp.WwJO8, T_ref, T_A);
  TC_JO9 = tempcorr(temp.WwJO9, T_ref, T_A);
  TC_JO10 = tempcorr(temp.WwJO10, T_ref, T_A);
  TC_JO11 = tempcorr(temp.WwJO11, T_ref, T_A);
  TC_JO12 = tempcorr(temp.WwJO12, T_ref, T_A);
  TC_JO13 = tempcorr(temp.WwJO13, T_ref, T_A);
  TC_JO14 = tempcorr(temp.WwJO14, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
   
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  % metamorphosis
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (t_j - t_b) / k_M/ TC_tj;  % d, time since birth at metam at 25°C
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  tT_p = (t_p - t_b) / k_M/ TC_tp;  % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  [R_i, UE0, Lb, Lj, Lp, info]  =  reprod_rate_j(L_i, f, pars_R);
  RT_i = TC_Ri * R_i;% #/d, max reprod rate
  
  % Gonadosomatic index
  GSI = 365 * TC_GSI * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^2); % mol E_R/ mol W
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.GSI = GSI;

  % uni-variate data

  % respiration 
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size

  % 11°C
  L = (WwJO1(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O3 = - J_M(3,:)' * TC_JO1 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  % 14°C
  L = (WwJO2(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O4 = - J_M(3,:)' * TC_JO2 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  % 17°C
  L = (WwJO3(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O5 = - J_M(3,:)' * TC_JO3 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  % 20°C
  L = (WwJO4(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O6 = - J_M(3,:)' * TC_JO4 * 1e6/ 24;      % µmol O2/h, O2 consumption  
   % 23°C
  L = (WwJO5(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O7 = - J_M(3,:)' * TC_JO5 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  % 26°C
  L = (WwJO6(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O8 = - J_M(3,:)' * TC_JO6 * 1e6/ 24;      % µmol O2/h, O2 consumption 
    % 29°C
  L = (WwJO7(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O9 = - J_M(3,:)' * TC_JO7 * 1e6/ 24;      % µmol O2/h, O2 consumption
  % 30°C
  L = (WwJO8(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O10 = - J_M(3,:)' * TC_JO8 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 31°C
  L = (WwJO9(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O11 = - J_M(3,:)' * TC_JO9 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 32°C
  L = (WwJO10(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O12 = - J_M(3,:)' * TC_JO10 * 1e6/ 24;      % µmol O2/h, O2 consumption 
   % 33°C
  L = (WwJO11(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O13 = - J_M(3,:)' * TC_JO11 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  % 34°C
  L = (WwJO12(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O14 = - J_M(3,:)' * TC_JO12 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 35°C
  L = (WwJO13(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O15 = - J_M(3,:)' * TC_JO13 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 36°C
  L = (WwJO14(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O16 = - J_M(3,:)' * TC_JO14 * 1e6/ 24;      % µmol O2/h, O2 consumption 
   
% length - wet weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight 
  
  % pack to output
  prdData.LW = EWw;
  prdData.WwJO1 = EJT_O3;
  prdData.WwJO2 = EJT_O4;
  prdData.WwJO3 = EJT_O5;
  prdData.WwJO4 = EJT_O6;
  prdData.WwJO5 = EJT_O7;
  prdData.WwJO6 = EJT_O8;
  prdData.WwJO7 = EJT_O9;
  prdData.WwJO8 = EJT_O10;
  prdData.WwJO9 = EJT_O11;
  prdData.WwJO10 = EJT_O12;
  prdData.WwJO11 = EJT_O13;
  prdData.WwJO12 = EJT_O14;
  prdData.WwJO13 = EJT_O15;
  prdData.WwJO14 = EJT_O16;
  

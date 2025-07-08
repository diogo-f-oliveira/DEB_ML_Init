function [prdData, info] = predict_Chromis_chromis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if T_H < T_ref || T_L > T_ref
      prdData = []; info = 0; return;
  end
  
  % compute temperature correction factors
  pars_T = [T_A; T_L; T_H; T_AL; T_AH];
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_aj = tempcorr(temp.aj, T_ref, pars_T);
  TC_ap = tempcorr(temp.ap, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  TC_tL = tempcorr(temp.tL, T_ref, pars_T);
  TC_JO1 = tempcorr(temp.WwJO1, T_ref, pars_T);
  TC_JO2 = tempcorr(temp.WwJO2, T_ref, pars_T);
  TC_JO3 = tempcorr(temp.WwJO3, T_ref, pars_T);
  TC_JO4 = tempcorr(temp.WwJO4, T_ref, pars_T);
  TC_JO5 = tempcorr(temp.WwJO5, T_ref, pars_T);
  TC_JO6 = tempcorr(temp.WwJO6, T_ref, pars_T);
  TC_JO7 = tempcorr(temp.WwJO7, T_ref, pars_T);
  TC_JO8 = tempcorr(temp.WwJO8, T_ref, pars_T);
  TC_JO9 = tempcorr(temp.WwJO9, T_ref, pars_T);
  TC_JO10 = tempcorr(temp.WwJO10, T_ref, pars_T);
  TC_JO11 = tempcorr(temp.WwJO11, T_ref, pars_T);
  TC_JO12 = tempcorr(temp.WwJO12, T_ref, pars_T);
  TC_JO13 = tempcorr(temp.WwJO13, T_ref, pars_T);
  TC_JO14 = tempcorr(temp.WwJO14, T_ref, pars_T);
  TC_JO15 = tempcorr(temp.WwJO15, T_ref, pars_T);
  TC_JO16 = tempcorr(temp.WwJO16, T_ref, pars_T);
  TC_JO17 = tempcorr(temp.WwJO17, T_ref, pars_T);
%   TC_JO18 = tempcorr(temp.WwJO18, T_ref, pars_T);
  
% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % egg
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  [U_E0, L_b, info] = initial_scaled_reserve(f, pars_UE0);
  E_0 = U_E0 * p_Am; % J, energy in egg
  Wd_0 = w_E/ mu_E * E_0; % g, dry weight of egg
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  aT_j = t_j/ k_M/ TC_aj;           % d, age at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % g, wet weight at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.E0 = E_0;
  prdData.Wd0 = Wd_0;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_tL; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, total length 
  ELw = [L_bj; L_jm]/ del_M; % cm, standard length
  
  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w);                  % g, wet weight
  
  % weight-respiration 
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  % 9°C
  L = (WwJO1(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O1 = - J_M(3,:)' * TC_JO1 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 11°C
  L = (WwJO2(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O2 = - J_M(3,:)' * TC_JO2 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  % 13°C
  L = (WwJO3(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O3 = - J_M(3,:)' * TC_JO3 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 15°C
  L = (WwJO4(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O4 = - J_M(3,:)' * TC_JO4 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 17°C
  L = (WwJO5(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O5 = - J_M(3,:)' * TC_JO5 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 19°C
  L = (WwJO6(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O6 = - J_M(3,:)' * TC_JO6 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 21°C
  L = (WwJO7(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O7 = - J_M(3,:)' * TC_JO7 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  % 23°C
  L = (WwJO8(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O8 = - J_M(3,:)' * TC_JO8 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 25°C
  L = (WwJO9(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O9 = - J_M(3,:)' * TC_JO9 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  % 27°C
  L = (WwJO10(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O10 = - J_M(3,:)' * TC_JO10 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 29°C
  L = (WwJO11(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O11 = - J_M(3,:)' * TC_JO11 * 1e6/ 24;      % µmol O2/h, O2 consumption 
  % 30°C
  L = (WwJO12(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O12 = - J_M(3,:)' * TC_JO12 * 1e6/ 24;      % µmol O2/h, O2 consumption  
   % 31°C
  L = (WwJO13(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O13 = - J_M(3,:)' * TC_JO13 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  % 32°C
  L = (WwJO14(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O14 = - J_M(3,:)' * TC_JO14 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  % 33°C
  L = (WwJO15(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O15 = - J_M(3,:)' * TC_JO15 * 1e6/ 24;      % µmol O2/h, O2 consumption  
   % 34°C
  L = (WwJO16(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O16 = - J_M(3,:)' * TC_JO16 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  % 35°C
  L = (WwJO17(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O17 = - J_M(3,:)' * TC_JO17 * 1e6/ 24;      % µmol O2/h, O2 consumption  
  
  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
  prdData.WwJO1 = EJT_O1;
  prdData.WwJO2 = EJT_O2;
  prdData.WwJO3 = EJT_O3;
  prdData.WwJO4 = EJT_O4;
  prdData.WwJO5 = EJT_O5;
  prdData.WwJO6 = EJT_O6;
  prdData.WwJO7 = EJT_O7;
  prdData.WwJO8 = EJT_O8;
  prdData.WwJO9 = EJT_O9;
  prdData.WwJO10 = EJT_O10;
  prdData.WwJO11 = EJT_O11;
  prdData.WwJO12 = EJT_O12;
  prdData.WwJO13 = EJT_O13;
  prdData.WwJO14 = EJT_O14;
  prdData.WwJO15 = EJT_O15;
  prdData.WwJO16 = EJT_O16;
  prdData.WwJO17 = EJT_O17;
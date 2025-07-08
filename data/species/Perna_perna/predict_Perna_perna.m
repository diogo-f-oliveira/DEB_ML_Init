function [prdData, info] = predict_Perna_perna(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  pars_TC = [T_A T_L T_H T_AL T_AH];
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_GSI_f = tempcorr(temp.GSI_f, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_TJO = tempcorr(C2K(TjO(:,1)), T_ref, pars_TC);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp]; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mb;               % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  Wd_j = L_j^3 * d_V * (1 + f * w); % g, dry weight at metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  
  s_M = L_j/ L_b;                   % -, acceleration factor
  
  % puberty 
  pars_tj = [g k l_T v_Hb v_Hj v_Hp]; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty at f 
  
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

 % ultimate   
  pars_tj = [g k l_T v_Hb v_Hj v_Hp]; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight at f
 
  % reproduction GSI
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  GSI_f = TC_GSI_f * 365 * k_M * g/ f.^3./ (f + kap * g * y_V_E);  % see eqn 2 LikaKooy2014
  GSI_f = GSI_f .* ((1 - kap) * f.^3 - ...
     k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W, gonado-somatic index at fsub
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.GSI_f = GSI_f;
  prdData.Wwb = Ww_b;
  
% uni-variate data
  
  % time-length 1 - Subtidal Durban, South Africa
  TC = TC_tL;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;      
  L_b = l_b * L_m; L_i = l_i * L_m; 
  tT_j = (t_j - t_b)/ k_M/ TC;   % d, time since birth at metam
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) * rT_j/ 3);
  
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_subt = [L_bj; L_jm]/ del_M;    % cm, physical length 
       
  % length-weight
  EWd_L = (LW(:,1) * del_M).^3 * d_V * (1 + f * w); % g, dry weight
  
  % temperature - specific respiration
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  Wd = 0.1; Lw = 3.5;  % g, cm, dry weight, physical length
  L = Lw * del_M; % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_R, l_b, l_j, l_p); % J/d, powers
  pACSJGRD(:, 1) = 0;   % Assimilation is zero for starved animals
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';       % mol/d: J_C, J_H, J_O, J_N in rows
  EjT_O = - J_M(3,:)' * TC_TJO * 24.4e3/ 24/ Wd;          % ml O2/h.g, O2 consumption
  
%   ELw_subt  
  %length min 1.116188276 max 19.48156523 (linspace(1.116188276, 19.48156523, 100))'*30
  
%   EWd_L
    %length min 2.8240 max 11.2810 

%     EjT_O  
  %length min 9 max 36
   
  % pack to output
  prdData.tL = ELw_subt;
  prdData.LW = EWd_L;
  prdData.TjO = EjT_O;
  
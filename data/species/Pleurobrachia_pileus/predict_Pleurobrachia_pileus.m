function [prdData, info] = predict_Pleurobrachia_pileus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_LCR = tempcorr(temp.LCR, T_ref, T_A);
  TC_6 = tempcorr(temp.tL_6, T_ref, T_A);
  TC_10 = tempcorr(temp.tL_10, T_ref, T_A);
  TC_15 = tempcorr(temp.tL_15, T_ref, T_A);
  TC_20 = tempcorr(temp.tL_20, T_ref, T_A);
  TC_2 = tempcorr(temp.WJO_2, T_ref, T_A);
  TC_8 = tempcorr(temp.WJO_8, T_ref, T_A);
  TC_12 = tempcorr(temp.WJO_12, T_ref, T_A);
  TC_18 = tempcorr(temp.WJO_18, T_ref, T_A);
  TC_24 = tempcorr(temp.WJO_24, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = del_W * L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % RQ
  n = n_HN - 2 * n_ON; % (4.36) for Kooy2010
  RQ = 1/ (1 + n_HV/ 4 - n_OV/ 2 - n * n_NV/ 4/ n_NN); %-, repiratory quotient
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  prdData.RQ = RQ;
  
  % uni-variate data
  
  % filtering
  ECR   = TC_LCR * F_m * (LCR(:,1) * del_M) .^ 2; % l/d, clearance rate
  
  % growth
  r_B = rho_B * k_M;
  ELw_6  = (L_i - (L_i - L_0) * exp( - TC_6 * r_B * tL_6(:,1)))/ del_M;   % cm, polar length
  ELw_10 = (L_i - (L_i - L_0) * exp( - TC_10 * r_B * tL_10(:,1)))/ del_M; % cm, polar length 
  ELw_15 = (L_i - (L_i - L_0) * exp( - TC_15 * r_B * tL_15(:,1)))/ del_M; % cm, polar length
  ELw_20 = (L_i - (L_i - L_0) * exp( - TC_20 * r_B * tL_20(:,1)))/ del_M; % cm, polar length 

  % respiration 
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  %
  L = (WJO_2(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O2 = - J_M(3,:)' * TC_2 * 24.4e6/ 24;           % µl O2/h, O2 consumption 
  %
  L = (WJO_8(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); pACSJGRD(:,1) = 0; % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O8 = - J_M(3,:)' * TC_8 * 24.4e6/ 24;           % µl O2/h, O2 consumption 
  %
  L = (WJO_12(:,1)/ (1 + f * w)) .^ (1/3);            % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O12 = - J_M(3,:)' * TC_12 * 24.4e6/ 24;         % µl O2/h, O2 consumption 
  %
  L = (WJO_18(:,1)/ (1 + f * w)) .^ (1/3);            % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O18 = - J_M(3,:)' * TC_18 * 24.4e6/ 24;         % µl O2/h, O2 consumption 
  %
  L = (WJO_24(:,1)/(1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O24 = - J_M(3,:)' * TC_24 * 24.4e6/ 24;         % µl O2/h, O2 consumption 

  % pack to output
  prdData.LCR = ECR;
  prdData.tL_6 = ELw_6;
  prdData.tL_10 = ELw_10;
  prdData.tL_15 = ELw_15;
  prdData.tL_20 = ELw_20;
  prdData.WJO_2 = EJT_O2;
  prdData.WJO_8 = EJT_O8;
  prdData.WJO_12 = EJT_O12;
  prdData.WJO_18 = EJT_O18;
  prdData.WJO_24 = EJT_O24;

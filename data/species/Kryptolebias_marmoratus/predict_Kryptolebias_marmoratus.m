function [prdData, info] = predict_Kryptolebias_marmoratus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL_0 = tempcorr(temp.tL_0, T_ref, T_A);
  TC_tL_1 = tempcorr(temp.tL_1, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  Ww_2 = (2.64 * del_M)^3 * (1 + f * w); % g, wet weight at Lw = 2.64 cm
  pars_UE0 = [V_Hb; g; k_J; k_M; v];      % compose parameter vector
  Ww_0 = w_E * J_E_Am * initial_scaled_reserve(f, pars_UE0)/ d_E;
  GSI = TC_GSI * reprod_rate(2.64 * del_M, f, pars_R) * Ww_0/ Ww_2; % -, GSI for 1 d accumulation

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww2 = Ww_2;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length 
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
  ELw_1 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tL_1 * r_B * tL_1(:,1)); % cm, expected physical length at time
  %  
  f = f_0; pars_lb = [g; k; v_Hb];                           % compose parameters
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_tL_0/ ir_B;      % d, 1/von Bert growth rate
  Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
  Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
  ELw_0 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL_0(:,1));   % cm, expected physical length at time
  %
  f = f_tL; pars_lb = [g; k; v_Hb];                          % compose parameters
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
  Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
  Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - TC_tL * r_B * tL(:,1));% cm, expected physical length at time
  

  % pack to output
  prdData.tL = ELw;
  prdData.tL_1 = ELw_1;
  prdData.tL_0 = ELw_0;
    
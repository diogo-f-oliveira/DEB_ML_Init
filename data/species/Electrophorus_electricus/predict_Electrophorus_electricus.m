function [prdData, info] = predict_Electrophorus_electricus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.ah, T_ref, T_A); % most rates/times at same temp
  TC_am = tempcorr(temp.am, T_ref, T_A); 

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_p t_b l_p l_b info] = get_tp(pars_tp, f); % -, scaled length at birth at f

  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  %E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap constant

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC;             % d, age at hatch at f and T
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_M;               % cm, total length at hatch at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Lw_b = L_b/ del_M;                % cm, standard length at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC;              % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length 
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B; % d, 1/von Bert growth rate
  Lw_19  = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * 19); % cm, expected physical length at time
  Lw_61  = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * 61); % cm, expected physical length at time
  Lw_915 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * 915); % cm, expected physical length at time

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.ah = aT_h;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.L19 = Lw_19;
  prdData.L61 = Lw_61;
  prdData.L915 = Lw_915;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;    % d, 1/von Bert growth rate
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL(:,1)); % cm, expected physical length at time

  prdData.tL = ELw;


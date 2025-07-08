function [prdData, info] = predict_Opsanus_tau(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
  %% customized filters
  if E_Hh >= E_Hb   % maturity level consistency
    info = 0;
    prdData = {};
    return
  end

%% compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_RL = tempcorr(temp.RL, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_15 = tempcorr(temp.tL_15, T_ref, T_A);  
  TC_19 = tempcorr(temp.tL_19, T_ref, T_A);  
  
  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p t_b l_p l_b info] = get_tp(pars_tp, f);

  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  %E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap constant

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch 
  U_Eh = aUL(2,2);                   % d.cm^2, scaled reserve at hatch
  L_h = aUL(2,3);                    % cm, structural length at hatch

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  a_b = t_b/ k_M;                   % d, age at birth at f and T_ref

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_L = TC_RL * reprod_rate(34.5*del_M, f, pars_R);      % reproduction rate at 34.5 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.ah = aT_h;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.RL = RT_L;

  %% uni-variate data
    
  [U_H LUH] = ode45(@dget_LUH, tL(:,1), [L_h; U_Eh/ TC_tL; U_Hh/ TC_tL], [], kap, TC_tL * v, TC_tL * k_J, g, L_m);
  ELw = LUH(:,1)/ del_M;          % cm, total length at hatch at f

  % L-W data
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

  % t-L and t-W data after b
  f = f_tL;   pars_lb = [g k v_Hb];
  t0_15 = (a_b - a_h)/ TC_15; t0_19 = (a_b - a_h)/ TC_19;
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  L_i = L_m * f; Lw_i = L_i/ del_M; L_b = L_m * get_lb(pars_lb, f); Lw_b = L_b/ del_M;
  ELw_15 = Lw_i - (Lw_i - Lw_b) * exp( - TC_15 * r_B * (tL_15(:,1)-t0_15)); % cm, expected physical length at time
  L_15 = L_i - (L_i - L_b) * exp( - TC_15 * r_B * (tW_15(:,1)-t0_15)); % cm, expected physical length at time
  EWw_15 = L_15.^3 * (1 + f * w);
  ELw_19 = Lw_i - (Lw_i - Lw_b) * exp( - TC_19 * r_B * (tL_19(:,1)-t0_19)); % cm, expected physical length at time
  L_19 = L_i - (L_i - L_b) * exp( - TC_19 * r_B * (tW_19(:,1)-t0_19)); % cm, expected physical length at time
  EWw_19 = L_19.^3 * (1 + f * w);

  % pack to output
  prdData.tL = ELw;
  prdData.tL_15 = ELw_15;
  prdData.tL_19 = ELw_19;
  prdData.tW_15 = EWw_15;
  prdData.tW_19 = EWw_19;
  prdData.LW = EWw;
     
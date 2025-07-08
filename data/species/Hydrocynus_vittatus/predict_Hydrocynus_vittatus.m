function [prdData, info] = predict_Hydrocynus_vittatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  %E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap constant

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC;             % d, age at hatch at f and T
  M_Eh = J_E_Am * aUL(end,2);      % mol, reserve at hatch at f
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_M;               % cm, total length at hatch at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Lw_b = L_b/ del_M;                % cm, standard length at birth
  aT_b = t_b/ kT_M;                 % d, age at birth of foetus at f and T

  % t-L data before j
  rT_j = TC * rho_j * k_M;          % 1/d, exponential growth rate
  Lw_13 = Lw_b * exp((13 - aT_b + aT_h) * rT_j/ 3); % cm, total length at 13 d since hatch
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, standard length at metam
  aT_j = t_j/ kT_M;                 % d, age at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  aT_p = t_p/ k_M/ TC;              % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % t-L data after j
  rT_B = kT_M * rho_B;     % d, 1/von Bert growth rate at T_ref             
  Lw_40 = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (40 - aT_j + aT_h)); % cm, total length at 40 d since hatch
  Lw_72 = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (72 - aT_j + aT_h)); % cm, total length at 72 d since hatch

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j((1700/(1+f*w))^(1/3), f, pars_R);  % reproduction rate at Ww = 1700

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.L13 = Lw_13;
  prdData.L40 = Lw_40;
  prdData.L72 = Lw_72;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data

  % time-length
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M;

  %% pack to output
  prdData.tL = ELw;

function [prdData, info] = predict_Chanos_chanos(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  TC_WN = tempcorr(temp.WN, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  %E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap constant

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  M_Eh = J_E_Am * aUL(end,2);      % mol, reserve at hatch at f
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_M;               % cm, S-V length at hatch at f
  aT_h = aUL(2,1)/ TC_ah;          % d, age at hatch at f and T

  % birth
  L_b = L_m * l_b;                 % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;               % cm, total length at birth
  aT_b = t_b/ k_M/ TC_ab;          % d, age at birth 

  % metamorphosis
  aT_j = t_j/ k_M/ TC_aj;          % d, age at metam
  
  % puberty 
  L_p = L_m * l_p;                 % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;               % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);      % g, wet weight at puberty
  aT_p = t_p/ k_M/ TC_ap;          % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                 % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;               % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);      % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j((6e3/(1+f*w))^(1/3), f, pars_R); % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  f = f_tL;
  kT_M = k_M * TC_tL;
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; % 1/d, von Bert, exponential growth rate
  aT_b = t_b/ kT_M; aT_j = t_j/ kT_M;
  t_j = aT_j - aT_h; % time since hatch at metamorphosis
  t_bj = tL(tL(:,1) < t_j,1); % select times between birth & metamorphosis
  Lw_b = l_b * L_m/ del_M; Lw_j = l_j * L_m/ del_M; Lw_i = l_i * L_m/ del_M;
  EL_bj = Lw_h * exp(t_bj * rT_j/3); % exponential growth as V1-morph
  t_ji = tL(tL(:,1) >= t_j,1); % selects times after metamorphosis
  EL_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (t_ji - t_j)); % cm, expected length at time
  ELw = [EL_bj; EL_ji]; % catenate lengths

  % tW
  f = f_tW;
  kT_M = k_M * TC_tW;
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B] = get_tj(pars_tj, f);
  L_i = L_m * l_i;
  rT_B = rho_B * kT_M; % 1/d, von Bert
  L_0 = (W_0/ (1 + f * w))^(1/3); % initial weight 
  L = L_i - (L_i - L_0) * exp( - rT_B * tW(:,1)); % cm, expected length at time
  EWw = L.^3 * (1 + f * w); % g, wet weight

  % LN
  f = 1;
  EN_L = TC_LN * 365 * reprod_rate_j(LN(:,1) * del_M, f, pars_R)/ 1e6; % yearly reproductive output at length  in 1e6 eggs  

  % WN
  f = 1;
  EN_W = TC_WN * 365 * reprod_rate_j((WN(:,1)/ (1 + f * w)).^(1/3), f, pars_R)/ 1e6; % yearly reproductive output at length  in 1e6 eggs  

  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;
  prdData.LN = EN_L;
  prdData.WN = EN_W;
     
end

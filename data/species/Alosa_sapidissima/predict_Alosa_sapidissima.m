function [prdData, info] = predict_Alosa_sapidissima(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
 
%% compute temperature correction factors
  TC_ah14 = tempcorr(temp.ah14, T_ref, T_A);
  TC_ah17 = tempcorr(temp.ah17, T_ref, T_A);
  TC_ah24 = tempcorr(temp.ah24, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_RtL = tempcorr(temp.tL, T_ref, T_A);

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
  aT_h14 = aUL(2,1)/ TC_ah14;      % d, age at hatch at f and T
  aT_h17 = aUL(2,1)/ TC_ah17;      % d, age at hatch at f and T
  aT_h24 = aUL(2,1)/ TC_ah24;      % d, age at hatch at f and T

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth of foetus at f and T

  % metamorphosis
  L_j = l_j * L_m;                  % Lw_j= L_j/ del_M;
  s_M = L_j/ L_b;                   % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.ah14 = aT_h14;
  prdData.ah17 = aT_h17;
  prdData.ah24 = aT_h24;
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  % t-L data for T(t): linear increase from 9.5C at 0 d till 21.1C at 50 d
  % L_b at f = 1, since eggs are from field population
  [t LH] = ode45(@get_dLH, [-1e-8; tL(:,1)], [L_b; E_Hb], [], E_Hj, f_tL, kap, g, E_m, k_J, k_M, v, L_b, L_m, s_M, T_ref, T_A); LH(1,:) = [];
  ELw = LH(:,1)/ del_M; % cm, convert structural to total length

  % pack to output
  prdData.tL = ELw;
     
end

%% subfunction

function dLH = get_dLH(t, LH, E_Hj, f, kap, g, E_m, k_J, k_M, v, L_b, L_m, s_M, T_ref, T_A)
  L = LH(1); E_H = LH(2); % unpack state variables
  T = 273 + 9.5 + (t/50) * (21.1 - 9.5); % K, temperature at t in inverval (0,50) d
  TC = tempcorr(T, T_ref, T_A);          % -, Temperature Correction factor
  if E_H < E_Hj % acceleration phase
    r = k_M * (f * L_m/ L_b - 1)/ (1 + f/ g); % 1/d, spec growth rate
    p_C = f * E_m * L^3 * (v/ L_b - r);       % J/d, mobilisation rate
  else % isomorphic phase
    r = v/ (f + g) * (f * s_M - L/ L_m)/ L;
    p_C = f * E_m * L^3 * (v * s_M/ L - r);
  end
  dL = TC * L * r/ 3;
  dE_H = TC * ((1 - kap) * p_C - k_J * E_H);
  
  dLH = [dL; dE_H];
end
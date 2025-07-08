function [prdData, info] = predict_Barbronia_weberi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
      
  if U_Hh >= U_Hb || ~(U_Hh > 0)
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  kT_M = k_M * TC; % 1/d, som maint rate coefficient
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  pars_tb = [g*v_b/v k v_Hb];
  [t_bb, l_bb] = get_tb(pars_tb, f);
 
  % initial
  pars_UE0 = [V_Hb; g*v_b/v; k_J; k_M; v_b];  % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, scaled initial energy in egg
  u_E0 = U_E0 * k_M/ L_m^2;             % -, scaled initial energy in egg
  
  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v_b, k_J, g*v_b/v, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC; % d, age at hatch at f and T

  % birth
  L_b = L_m * l_bb;                 % cm, structural length at birth at f
  L2w_b = L_b^2/ del_M;             % cm^2, surface at birth 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth 
  aT_b = t_bb/ kT_M;                % d, age at birth

  % puberty
  tT_p = (t_p - t_b)/kT_M;          % d, time since birth at puberty
  L_p = l_p * L_m;                  % cm, structural length at puberty
  L2w_p = L_p^2/ del_M;             % cm^2, surface at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  L2w_i = L_i^2/ del_M;             % cm^2, ultimate surface at f 
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % reproduction
  v_E0 = u_E0/ (1 - kap);
  RT_i = kap_R * kT_M * (1 - k * v_Hp)/ v_E0;   % #/d, ultimate reproduction rate at T

  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.L2b = L2w_b;
  prdData.L2p = L2w_p;
  prdData.L2i = L2w_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-embryo length
  [a LUH] = ode45(@dget_LUH, [0; 1; tL2(tL2(:,1) < aT_b, 1)], [0 U_E0/ TC 0], [], kap, v_b * TC, k_J * TC, g*v_b/v, L_m);
  LUH([1 2],:) = [];
  L_0b = LUH(:,1); % cm, embryo structural length
  % time-length post birth
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;   % d, 1/von Bert growth rate
  L_bi = L_i - (L_i - L_b) * exp( - rT_B * (tL2(tL2(:,1) >= aT_b, 1) - aT_b)); % cm, structural length post birth
  % time-surface
  EL2w = [L_0b; L_bi].^2/ del_M; % cm, surface

  % pack to output
  prdData.tL2 = EL2w;
  
function [prdData, info] = predict_Astropecten_aranciacus(par, data, auxData)
  
  global tT_20 tT_80
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wegt weight at birth 

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam at f
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ s_M^2/ L_m^2);

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length post metam
  % 20 m depth
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_20);
  r_B = rho_B * k_M; L_i = L_m * l_i;
  [t EL_20_1] = ode45(@get_L, tL_20_1(:,1) - t0_20_1, L0_20_1, [], r_B, L_i, tT_20, T_ref, T_A);
   if size(tL_20_1(:,1),1) == 2
     EL_20_1 = EL_20_1([1 end],:); % stupid Matlab
   end
  [t EL_20_2] = ode45(@get_L, tL_20_2(:,1) - t0_20_2, L0_20_2, [], r_B, L_i, tT_20, T_ref, T_A);
  [t EL_20_3] = ode45(@get_L, tL_20_3(:,1) - t0_20_3, L0_20_3, [], r_B, L_i, tT_20, T_ref, T_A);
  % 80 m depth
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  r_B = rho_B * k_M; L_i = L_m * l_i;
  [t EL_80_4] = ode45(@get_L, tL_80_4(:,1) - t0_80_4, L0_80_4, [], r_B, L_i, tT_80, T_ref, T_A);
  [t EL_80_5] = ode45(@get_L, tL_80_5(:,1) - t0_80_5, L0_80_5, [], r_B, L_i, tT_80, T_ref, T_A);
  [t EL_80_6] = ode45(@get_L, tL_80_6(:,1) - t0_80_6, L0_80_6, [], r_B, L_i, tT_80, T_ref, T_A);

  % pack to output
  prdData.tL_20_1 = EL_20_1;
  prdData.tL_20_2 = EL_20_2;
  prdData.tL_20_3 = EL_20_3;
  prdData.tL_80_4 = EL_80_4;
  prdData.tL_80_5 = EL_80_5;
  prdData.tL_80_6 = EL_80_6;
  
end

function dL = get_L(t, L, r_B, L_i, tT, T_ref, T_A)
  TC = tempcorr(C2K(spline1(t,tT)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
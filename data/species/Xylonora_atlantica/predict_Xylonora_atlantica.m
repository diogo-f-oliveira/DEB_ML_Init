function [prdData, info] = predict_Xylonora_atlantica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if E_Hh >= E_Hb || E_Hh < 0 
    info = 0; prdData = []; return
  end

  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_tL_1 = tempcorr(temp.tL_1, T_ref, T_A);
  TC_tL_2 = tempcorr(temp.tL_2, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
   
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if info ~= 1 % numerical procedure failed
    fprintf('warning: invalid parameter value combination for get_tj \n');
    prdData = []; return
  end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
 
  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
  L_h = aUL(2,3);                    % cm, structural length at birth at f
  Lw_h = L_h/ del_Me;                % cm, physical length at birth at f

  % birth
  L_b = L_m * l_b;                   % cm, structural length at birth at f
  Lw_b = L_b/ del_Me;                % cm, physical length at birth at f
  aT_b = tau_b/ k_M/ TC_ab;          % d, age at birth at f and T

  % metamorphosis
  L_j = L_m * l_j;                   % cm, structural length at metam
  Lw_j = L_j/ del_M;                 % cm, shell height at metam at f
  tT_j = (tau_j - tau_b) / k_M/ TC_tj;  % d, time since birth at metam          
  s_M = l_j / l_b;                   % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                   % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                 % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);       % g, wet weight at puberty 
  tT_p = (tau_p - tau_b)/ k_M/ TC_tp; % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                   % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                 % cm, ultimate physical length at f
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % reproduction
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  RT_i  =  TC_Ri * reprod_rate_j(length.Ri * del_M, f, pars_R); % #/d, max reprod rate
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwp = Ww_p;
  prdData.Ri = RT_i;

  % uni-variate data
  
  % time-length, post metam
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL_1);
  rT_B = TC_tL_1 * rho_B * k_M;  % 1/d, von Bert growth rate   
  Lw_j = l_j * L_m/ del_M; Lw_i = l_i * L_m/ del_M;
  tau_j = (tau_j - tau_b)/ k_M/ TC_tL_1; % time since birth at metamorphosis
  ELw_1 = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL_1(:,1) - tau_j)); % cm, expected length at time
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL_2);
  rT_B = TC_tL_2 * rho_B * k_M;  % 1/d, von Bert growth rate   
  Lw_j = l_j * L_m/ del_M; Lw_i = l_i * L_m/ del_M;
  tau_j = (tau_j - tau_b)/ k_M/ TC_tL_2; % time since birth at metamorphosis
  ELw_2 = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL_2(:,1) - tau_j)); % cm, expected length at time
   
  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight

  % pack to output
  prdData.tL_1 = ELw_1;
  prdData.tL_2 = ELw_2;
  prdData.LW = EWw;
  
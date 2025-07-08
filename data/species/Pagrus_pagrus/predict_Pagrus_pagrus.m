function [prdData, info] = predict_Pagrus_pagrus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p-t_b)/ k_M/ TC_tp;     % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  options = odeset('Events',@eoa);
  tf = [0 f_00; 11*365 f_11];
  [t, HeL] = ode45(@get_HeL, [0;tL(:,1)], [E_Hb, 1, L_b], options, tf, v, g, E_m, L_b, L_m, kap, k_J, E_Hj);
  HeL(1,:)=[]; ELw = HeL(:,3)/ del_M;  % cm, total length

  % length-weight
  EWw = (LW(:,1) * del_M) .^3 * (1 + f_tL * w);  % g, wet weight

  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
end

function dHeL = get_HeL(t, HeL, tf, v, g, E_m, L_b, L_m, kap, k_J, E_Hj)
  persistent s_M
  
  E_H = HeL(1); % J, maturity
  e = HeL(2); % -, scaled reserve density 
  L = HeL(3); % cm, structural length
  f = spline1(t, tf); % -, scaled functional response at t
  
  if E_H < E_Hj; s_M = L/ L_b; end % set acceleration factor
  v = v * s_M;              % cm/d, acceleration correction
  L_m = L_m * s_M;          % cm, acceleration correction
  
  de = (f - e) * v/ L;      % 1/d, change in scaled reserve density
  r = v * (e/ L - 1/ L_m)/ (e + g); % 1/d, specific growth rate
  dL = L * r/ 3;                    % cm/d, change in structural length d/dt L
  dE_H = (1 - kap) * e * E_m * L^3 * (v/ L - r) - k_J * E_H; % J/d, change in E_H
  
  dHeL = [dE_H; de; dL];    % catenate for output
end

% event end-of-acceleration
function [value,isterminal,direction] = eoa(a, HeL, tf, v, g, E_m, L_b, L_m, kap, k_J, E_Hj)
  value = HeL(1) - E_Hj; % trigger E_H = E_Hj
  isterminal = 0; % terminate after the first event
  direction  = []; % get all the zeros
end 
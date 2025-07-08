function [prdData, info] = predict_Eulimnadia_diversa(par, data, auxData)
 
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if f_08 < 0; prdData = []; info = 0; return; end
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  tTC = temp.tL; tTC(:,2) = tempcorr(C2K(tTC(:,2)), T_ref, T_A);
 
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled structural length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Ww_i = L_i.^3 * (1 + f * ome);    % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  tf = [0 f_00; 2 f_02; 4 f_04; 6 f_06; 8 f_08; 10 f_10; 12 f_12]; 
  [t, HeL] = ode45(@get_HeL, tL(:,1), [E_Hb, 1, L_b], [], tf, tTC, v, g, E_m, L_b, L_m, kap, k_J);
  ELw = HeL(:,3)/ del_M;  % cm, total length
  
  % pack to output
  prdData.tL = ELw;
end

function dHeL = get_HeL(t, HeL, tf, tTC, v, g, E_m, L_b, L_m, kap, k_J)
  
  E_H = HeL(1); % J, maturity
  e = HeL(2); % -, scaled reserve density 
  L = HeL(3); % cm, structural length
  f = spline1(t, tf); % -, scaled functional response at t
  TC = spline1(t, tTC); %-, temp corr factor
  
  v = TC * v;              % cm/d, acceleration correction
  
  de = (f - e) * v/ L;      % 1/d, change in scaled reserve density
  r = v * (e/ L - 1/ L_m)/ (e + g); % 1/d, specific growth rate
  dL = L * r/ 3;                    % cm/d, change in structural length d/dt L
  dE_H = (1 - kap) * e * E_m * L^3 * (v/ L - r) - TC * k_J * E_H; % J/d, change in E_H
  
  dHeL = [dE_H; de; dL];    % catenate for output
end

function [prdData, info] = predict_Squalius_cii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); 
  kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  
  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = 100 * GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.GSI = GSI;

  % univariate data

  % length-weight
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

%   time-length, constant food
%   % females
%   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
%   rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_j = L_m * l_j; L_i = L_m * l_i;
%   ELw_f = (L_i - (L_i - L_j) * exp( - rT_B * (tL_f(:,1) - tT_j)))/ del_M; % cm, total length
%   % males
%   ELw_m = (L_i - (L_i - L_j) * exp( - rT_B * (tL_m(:,1) - tT_j)))/ del_M; % cm, total length

  % time-length post metam, varying food
  tf = [0000 1000 1500 2000 2600; f_0000 f_1000 f_1500 f_2000 f_2600]';
  [t, EL] = ode45(@get_EL, tL_f(:,1) - tT_j, [E_m, L_j], [], tf, s_M * v * TC, g, E_m, s_M * L_m, s_M * p_Am * TC); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_f= EL(:,2)/ del_M; % cm, fork length
  %
  [t, EL] = ode45(@get_EL, tL_m(:,1) - tT_j, [E_m, L_j], [], tf, s_M * v * TC, g, E_m, s_M * L_m, s_M * p_Am * TC); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_m= EL(:,2)/ del_M; % cm, fork length
  
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
end

function dEL = get_EL(t, EL, tf, v, g, E_m, L_m, p_Am)
  E = EL(1); % J/cm^3, reserve density [E}
  L = EL(2); % cm, structural length
  
  f = spline1(t, tf);                    % -, scaled functional response at t
  dE = (f * p_Am - E * v)/ L;            % J/d.cm^3, change in reserve density d/dt [E]
  e = E/ E_m;                            % -, scaled reserve density
  r = v * (e/ L - 1/ L_m)/ (e + g);      % 1/d, specific growth rate
  dL = L * r/ 3;                         % cm/d, change in structural length d/dt L
  
  dEL = [dE; dL]; % catenate for output
end

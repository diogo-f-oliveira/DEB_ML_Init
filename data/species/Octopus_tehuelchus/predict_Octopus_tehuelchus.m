function [prdData, info] = predict_Octopus_tehuelchus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p^3/ del_M;              % cm, DML at puberty

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % ultimate
  L_i = L_m * l_i; rT_B = rho_B * kT_M;  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m  - t_j/ kT_M));  
  Lw_am = L_am/ del_M;                   % cm, DML at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC*k_J; kT_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, cum no of eggs at L
 
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jmm t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_pm = L_mm * l_pm;  L_im = L_mm * l_im; % cm, struc length

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_am;
  prdData.Wwb = Ww_b;
  prdData.Ni = NT_i;
  
  % uni-variate data
  % time-length
  tf_B = [0 60 120 140 220 240 300; f_B000 f_B060 f_B120 f_B140 f_B220 f_B240 f_B300]'; % time since 1 jan, scaled func response
  tf_E = [0 60 120 180 240 300; f_B000 f_E060 f_E120 f_E180 f_E240 f_E300]'; % time since 1 jan, scaled func response
  tf_I = [0 60 120 180 240 300; f_B000 f_I060 f_I120 f_I180 f_I240 f_I300]'; % time since 1 jan, scaled func response
  %
  [t, EL] = ode45(@get_EL_BA, tL_fBA(:,1), [E_m, L_b],    [], tf_B, T_ref, T_A, v, g,   E_m,   L_i,  p_Am,   L_b,  L_j); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_fBA = EL(:,2)/ del_M; % cm, DML
  %
  [t, EL] = ode45(@get_EL_BA, tL_mBA(:,1), [E_m_m, L_bm], [], tf_B, T_ref, T_A, v, g_m, E_m_m, L_im, p_Am_m, L_bm, L_jm); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_mBA = EL(:,2)/ del_M; % cm, DML
  %
  [t, EL] = ode45(@get_EL_BD, tL_fBD(:,1), [E_m, L_b],    [], tf_B, T_ref, T_A, v, g,   E_m,   L_i,  p_Am,   L_b,  L_j); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_fBD = EL(:,2)/ del_M; % cm, DML
  %
  [t, EL] = ode45(@get_EL_BD, tL_mBD(:,1), [E_m_m, L_bm], [], tf_B, T_ref, T_A, v, g_m, E_m_m, L_im, p_Am_m, L_bm, L_jm); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_mBD = EL(:,2)/ del_M; % cm, DML
  %
  [t, EL] = ode45(@get_EL_EA, tL_fEA(:,1), [E_m, L_b],    [], tf_E, T_ref, T_A, v, g,   E_m,   L_i,  p_Am,   L_b,  L_j); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_fEA = EL(:,2)/ del_M; % cm, DML
  %
  [t, EL] = ode45(@get_EL_EA, tL_mEA(:,1), [E_m_m, L_bm], [], tf_E, T_ref, T_A, v, g_m, E_m_m, L_im, p_Am_m, L_bm, L_jm); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_mEA = EL(:,2)/ del_M; % cm, DML
  %
  [t, EL] = ode45(@get_EL_IS, tL_fIS(:,1), [E_m, L_b],    [], tf_I, T_ref, T_A, v, g,   E_m,   L_i,  p_Am,   L_b,  L_j); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_fIS = EL(:,2)/ del_M; % cm, DML
  %
  [t, EL] = ode45(@get_EL_IS, tL_mIS(:,1), [E_m_m, L_bm], [], tf_I, T_ref, T_A, v, g_m, E_m_m, L_im, p_Am_m, L_bm, L_jm); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_mIS = EL(:,2)/ del_M; % cm, DML

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w);%
  
  % pack to output
  prdData.tL_fBA = ELw_fBA;
  prdData.tL_mBA = ELw_mBA;
  prdData.tL_fBD = ELw_fBD;
  prdData.tL_mBD = ELw_mBD;
  prdData.tL_fEA = ELw_fEA;
  prdData.tL_mEA = ELw_mEA;
  prdData.tL_fIS = ELw_fIS;
  prdData.tL_mIS = ELw_mIS;
  prdData.LW = EWw;
end

function dEL = get_EL_BA(t, EL, tf, T_ref, pars_T, v, g, E_m, L_i, p_Am, L_b, L_j)
  % abj model, but the isomorphic phase after acceleration
  E = max(1e-8, EL(1)); % J/cm^3, reserve density [E]
  L = max(1e-8, EL(2)); % cm, structural length
  
  T = 13.5+8.5*sin((t+50+244)*2*pi/365);% C, temperature at t
  TC = tempcorr(C2K(T), T_ref, pars_T); % -, temp correction factor
  f = spline1(mod(t+244,365), tf); % -, scaled functional respons at t
  
  v = v * min(L_j, L)/L_b;
  p_Am = p_Am * min(L_j, L)/L_b;
  
  dE = TC * (f * p_Am - E * v)/ L;      % J/d.cm^3, change in reserve density d/dt [E]
  e = E/ E_m;                           % -, scaled reserve density
  r = v * (e/ L - 1/ L_i)/ (e + g);     % 1/d, specific growth rate
  dL = TC * L * r/ 3;                   % cm/d, change in structural length d/dt L
  
  dEL = [dE; dL]; % catenate for output
end

function dEL = get_EL_BD(t, EL, tf, T_ref, pars_T, v, g, E_m, L_i, p_Am, L_b, L_j)
  % abj model, but the isomorphic phase after acceleration
  E = max(1e-8, EL(1)); % J/cm^3, reserve density [E]
  L = max(1e-8, EL(2)); % cm, structural length
  
  T = 13.5+8.5*sin((t+50+334)*2*pi/365);     % C, temperature at t
  TC = tempcorr(C2K(T), T_ref, pars_T); % -, temp correction factor
  f = spline1(mod(t+334,365), tf); % -, scaled functional respons at t

  v = v * min(L_j, L)/L_b;
  p_Am = p_Am * min(L_j, L)/L_b;

  dE = TC * (f * p_Am - E * v)/ L;      % J/d.cm^3, change in reserve density d/dt [E]
  e = E/ E_m;                           % -, scaled reserve density
  r = v * (e/ L - 1/ L_i)/ (e + g);     % 1/d, specific growth rate
  dL = TC * L * r/ 3;                   % cm/d, change in structural length d/dt L
  
  dEL = [dE; dL]; % catenate for output
end

function dEL = get_EL_EA(t, EL, tf, T_ref, pars_T, v, g, E_m, L_i, p_Am, L_b, L_j)
  % abj model, but the isomorphic phase after acceleration
  E = max(1e-8, EL(1)); % J/cm^3, reserve density [E]
  L = max(1e-8, EL(2)); % cm, structural length
  
  T = 14+3*sin((t+15+244)*2*pi/365);        % C, temperature at t
  TC = tempcorr(C2K(T), T_ref, pars_T); % -, temp correction factor
  f = spline1(mod(t+244,365), tf); % -, scaled functional respons at t

  v = v * min(L_j, L)/L_b;
  p_Am = p_Am * min(L_j, L)/L_b;

  dE = TC * (f * p_Am - E * v)/ L;      % J/d.cm^3, change in reserve density d/dt [E]
  e = E/ E_m;                           % -, scaled reserve density
  r = v * (e/ L - 1/ L_i)/ (e + g);     % 1/d, specific growth rate
  dL = TC * L * r/ 3;                   % cm/d, change in structural length d/dt L
  
  dEL = [dE; dL]; % catenate for output
end

function dEL = get_EL_IS(t, EL, tf, T_ref, pars_T, v, g, E_m, L_i, p_Am, L_b, L_j)
  % abj model, but the isomorphic phase after acceleration
  E = max(1e-8, EL(1)); % J/cm^3, reserve density [E]
  L = max(1e-8, EL(2)); % cm, structural length
  
  T = 14+3*sin((t+15+275)*2*pi/365);        % C, temperature at t
  TC = tempcorr(C2K(T), T_ref, pars_T); % -, temp correction factor
  f = spline1(mod(t+244,365), tf); % -, scaled functional respons at t

  v = v * min(L_j, L)/L_b;
  p_Am = p_Am * min(L_j, L)/L_b;

  dE = TC * (f * p_Am - E * v)/ L;      % J/d.cm^3, change in reserve density d/dt [E]
  e = E/ E_m;                           % -, scaled reserve density
  r = v * (e/ L - 1/ L_i)/ (e + g);     % 1/d, specific growth rate
  dL = TC * L * r/ 3;                   % cm/d, change in structural length d/dt L
  
  dEL = [dE; dL]; % catenate for output
end

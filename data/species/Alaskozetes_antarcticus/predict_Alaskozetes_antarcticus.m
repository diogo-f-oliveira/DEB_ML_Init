function [prdData, info] = predict_Alaskozetes_antarcticus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if T_L > T_ref || T_H < T_ref
      info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  pars_T = [T_A, T_L, T_H, T_AL, T_AH];
  TC = tempcorr(temp.ab, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * w) * 1e6; % mug, wet weight at birth
  Wd_b = d_V * Ww_b;                % mug, dry weight at birth
  aT_b = t_0 + t_b/ k_M/ TC;        % d, age at birth 

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Ww_j = L_j^3 * (1 + f * w) * 1e6; % mug, wet weight at metam
  Wd_j = d_V * Ww_j;                % mug, dry weight at metam
  s_M = L_j/ L_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Ww_p = L_p^3 *(1 + f * w) * 1e6;  % mug, wet weight at puberty
  Wd_p = Ww_p * d_V;                % mug, dry weight at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % mud, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length
  Ww_i = L_i^3 * (1 + f * w) * 1e6; % mug, ultimate wet weight
  Wd_i = d_V * Ww_i;                % mug, ultimate dry weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector 
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                % #/d, ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wdb = Wd_b;
  prdData.Wdj = Wd_j;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % uni-variate data
  % time-dry weight field
  L_0 = (1e-6 * Wd_p0/(1 + f * w)/d_V)^(1/3); % cm, initial struct length
  [t, EL] = ode45(@get_EL, tW_p(:,1), [E_m, L_0], [], T_ref, pars_T, v * s_M, g, E_m, L_i, s_M * p_Am); % EL: {J/cm^3, cm}, with {[E], L}
  EWd_p = EL(:,2).^3 .* (d_V + EL(:,1) * w_E/ mu_E) * 1e6; % mug, dry weight
  %
  L_0 = (1e-6 * Wd_d0/(1 + f * w)/d_V)^(1/3); % cm, initial struct length
  [t, EL] = ode45(@get_EL, tW_d(:,1), [E_m, L_0], [], T_ref, pars_T, v, g, E_m, L_m, p_Am); % EL: {J/cm^3, cm}, with {[E], L}
  EWd_d = EL(:,2).^3 .* (d_V + EL(:,1) * w_E/ mu_E) * 1e6; % mug, dry weight
  %
  L_0 = (1e-6 * Wd_t0/(1 + f * w)/d_V)^(1/3); % cm, initial struct length
  [t, EL] = ode45(@get_EL, tW_t(:,1), [E_m, L_0], [], T_ref, pars_T, v, g, E_m, L_m, p_Am); % EL: {J/cm^3, cm}, with {[E], L}
  EWd_t = EL(:,2).^3 .* (d_V + EL(:,1) * w_E/ mu_E) * 1e6; % mug, dry weight
  %
  L_0 = (1e-6 * Wd_a0/(1 + f * w)/d_V)^(1/3); % cm, initial struct length
  [t, EL] = ode45(@get_EL, tW_a(:,1), [E_m, L_0], [], T_ref, pars_T, v, g, E_m, L_m, p_Am); % EL: {J/cm^3, cm}, with {[E], L}
  EWd_a = EL(:,2).^3 .* (d_V + EL(:,1) * w_E/ mu_E) * 1e6; % mug, dry weight
  
  % time-wet weight lab
  rT_B = tempcorr(C2K(2), T_ref, pars_T) * k_M * rho_B; % 1/d, von Bert growth rate
  L_0 = (Ww_tW0 * 1e-6/(1 + f * w))^(1/3); % cm, struc length
  L = L_i - (L_i - L_0) * exp(-rT_B * tWw_d02(:,1));
  EWw_02 = L.^3 * (1 + f * w) * 1e6; % mug, wet weight
  %
  rT_B = tempcorr(C2K(7), T_ref, pars_T) * k_M * rho_B; % 1/d, von Bert growth rate
  L_0 = (Ww_tW0 * 1e-6/(1 + f * w))^(1/3); % cm, struc length
  L = L_i - (L_i - L_0) * exp(-rT_B * tWw_d07(:,1));
  EWw_07 = L.^3 * (1 + f * w) * 1e6; % mug, wet weight
  %
  rT_B = tempcorr(C2K(12), T_ref, pars_T) * k_M * rho_B; % 1/d, von Bert growth rate
  L_0 = (Ww_tW0 * 1e-6/(1 + f * w))^(1/3); % cm, struc length
  L = L_i - (L_i - L_0) * exp(-rT_B * tWw_d12(:,1));
  EWw_12 = L.^3 * (1 + f * w) * 1e6; % mug, wet weight

  %[[2;7;12], tempcorr(C2K([2; 7; 12]),T_ref,pars_T)]

  % pack to output
  prdData.tW_p = EWd_p;
  prdData.tW_d = EWd_d;
  prdData.tW_t = EWd_t;
  prdData.tW_a = EWd_a;
  prdData.tWw_d02 = EWw_02;
  prdData.tWw_d07 = EWw_07;
  prdData.tWw_d12 = EWw_12;

end

function dEL = get_EL(t, EL, T_ref, pars_T, v, g, E_m, L_i, p_Am)
  % abj model, but the isomorphic phase after acceleration
  E = max(1e-8, EL(1)); % J/cm^3, reserve density [E]
  L = max(1e-8, EL(2)); % cm, structural length
  
  T = 15*cos((t-20)*2*pi/365)-5;        % C, temperature at t
  TC = tempcorr(C2K(T), T_ref, pars_T); % -, temp correction factor
  f = T > 0;                            % -, scaled functional response, either 1 or 0

  dE = TC * (f * p_Am - E * v)/ L;      % J/d.cm^3, change in reserve density d/dt [E]
  e = E/ E_m;                           % -, scaled reserve density
  r = v * (e/ L - 1/ L_i)/ (e + g);     % 1/d, specific growth rate
  dL = TC * L * r/ 3;                   % cm/d, change in structural length d/dt L
  
  dEL = [dE; dL]; % catenate for output
end
  
function [prdData, info] = predict_Lepisosteus_osseus(par, data, auxData)  

  % unpack par, data, auxData
  cPar = parscomp_st(par);
  vars_pull(par); vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  %% compute temperature correction factors
  TC = tempcorr(temp.tp, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  if info == 0
    prdData = []; return
  end

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, physical length at puberty
  tT_p = (tau_p - tau_b)/ k_M/ TC;  % d, age at puberty 
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_68 = TC * reprod_rate(68.6 * del_M, f, pars_R);      % #/d, reproduction rate at TL 68 cm
  RT_114 = TC * reprod_rate(114.2 * del_M, f, pars_R);      % #/d, reproduction rate at TL 114 cm
  RT_142 = TC * reprod_rate(142.2 * del_M, f, pars_R);      % #/d, reproduction rate at TL 142 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [tau_pm, tau_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f); % -, scaled times & lengths
  if info == 0
    prdData = []; return
  end
  tT_pm = (tau_pm - tau_bm)/ k_M/ TC;  % d, time since birth at puberty

  %% pack to output
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.R68 = RT_68;
  prdData.R114 = RT_114;
  prdData.R142 = RT_142;
  
  %% uni-variate data
  % length - weight
  EWw_f = (LWw_f(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  EWw_m = (LWw_m(:,1) * del_M).^3 * (1 + f * w_m); % g, wet weight

  % time-length 
  tf = [0 1500 2500 9000; f_0000 f_1500 f_2500 f_9999]';
  [t, EL] = ode45(@get_EL, [0;tL_f(:,1)], [E_m, L_b], [], tf, v * TC, g, E_m, L_m, p_Am * TC); % EL: {J/cm^3, cm}, with {[E], L}
  EL(1,:)=[]; ELw_f = EL(:,2)/ del_M; % cm, length
  %
  [t, EL] = ode45(@get_EL, [0;tL_m(:,1)], [E_m, L_b], [], tf, v * TC, g_m, E_m_m, L_mm, p_Am_m * TC); % EL: {J/cm^3, cm}, with {[E], L}
  EL(1,:)=[]; ELw_m = EL(:,2)/ del_M; % cm, length
  
  %% pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LWw_f = EWw_f;
  prdData.LWw_m = EWw_m;

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
  

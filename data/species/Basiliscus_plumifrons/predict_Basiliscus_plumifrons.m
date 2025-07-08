function [prdData, info] = predict_Basiliscus_plumifrons(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, struc length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_im = f * L_mm; Lw_im = L_im/ del_M;    % cm, ultimate SVL
  L_bm = l_bm * L_mm; Lw_bm = L_bm/ del_M; % cm,  SVL at puberty
  L_pm = l_pm * L_mm; Lw_pm = L_pm/ del_M; % cm,  SVL at puberty
  tT_pm = (t_pm - t_bm)/ k_M/ TC;          % d, time since birth at puberty
  Ww_im = L_im^3 * (1 + f * w_m);          % g, ltimate wet weight
  L_bm = L_mm * l_bm; Lw_bm = L_bm/ del_M; % cm, struc/total length
  Ww_bm = L_bm^3 * (1 + f * w_m);          % g, weight at birth

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_bm; % data is for male
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_bm; % data is for male
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univar data
  tf = [050 120 200 300 365; f_050 f_120 f_200 f_300 f_365]';
  [t, EL] = ode45(@get_EL, tL_m(:,1), [E_m_m, L_bm], [], tf, v * TC, g_m, E_m_m, L_mm, p_Am_m * TC); % EL: {J/cm^3, cm}, with {[E], L}
  ELw = EL(:,2)/ del_M; % cm, total length
  EWw = EL(:,2).^3 .* (1 + EL(:,1) * w_E/ mu_E/ d_E); % g, wet weight
  %
  tf = [050 120 200 300 365; f_050 f_120 f1_200 f1_300 f1_365]';
  [t, EL] = ode45(@get_EL, tL_m(:,1), [E_m_m, L_bm], [], tf, v * TC, g_m, E_m_m, L_mm, p_Am_m * TC); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_1 = EL(:,2)/ del_M; % cm, total length
  EWw_1 = EL(:,2).^3 .* (1 + EL(:,1) * w_E/ mu_E/ d_E); % g, wet weight
  
  % pack to output
  prdData.tL_m = [ELw ELw_1];
  prdData.tW_m = [EWw EWw_1];

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
  
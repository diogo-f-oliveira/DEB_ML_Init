function [prdData, info] = predict_Pelodytes_punctatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hj < E_Hb || E_Hj > E_Hp || f_00 < 0 || f_90 < 0
      info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
  TC_tLt = tempcorr(temp.tL_tf, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tj, f);       % -, scaled times & lengths at f
  if ~info; prdData = []; return; end
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL of tadpole
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  a_b = t_b/ k_M;                   % d, age at birth 

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_jb = L_j/ del_M;              % cm, SVL of tadpole at metam at f
  Lw_j = L_j/ del_M;                % cm, SVL at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, SVL at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_j)/ k_M/ TC;      % d, time since metam at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

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
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate structural, body length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj]; % compose parameter vector
  [t_jm, t_bm, l_jm, l_bm] = get_tp(pars_tj, f_tL); % -, scaled times & lengths at f
  
  % pack to output
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-length
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tL, [t_j, f_tL, l_j], tL_f(:,1)*k_M*TC_tL);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tpm(pars_tpm, f_tL, [t_jm, f_tL, l_jm], tL_m(:,1)*k_M*TC_tL);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 
  %
  tf = [0 20 40 60 90; f_00 f_20 f_40 f_70 f_90]';
  [t, EL] = ode45(@get_EL, tL_tf(:,1), [E_m, L_b], [], tf, v * TC_tLt, g, E_m, L_m, p_Am * TC_tLt); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_tf = EL(:,2)/ del_M; % cm, SVL
  %
  [t, EL] = ode45(@get_EL, tL_tm(:,1), [E_m_m, L_b], [], tf, v * TC_tLt, g, E_m_m, L_mm, p_Am_m * TC_tLt); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_tm = EL(:,2)/ del_M; % cm, SVL
  
  % temp-age at birth
  EaT_b = a_b ./ TC_ab; % d, age at birth
  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tL_tf = ELw_tf;
  prdData.tL_tm = ELw_tm;
  prdData.Tab = EaT_b;

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
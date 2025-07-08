function [prdData, info] = predict_Peponocephala_electra(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hb >= E_Hx || E_Hx >= E_Hp 
      prdData = []; info = 0; return
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp]; 
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ kT_M;           % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at fledging at f and T
  Ww_x = L_x^3 * (1 + f * ome);     % g, weight at weaning
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, length at puberty at f
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

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
  pars_tpm = [g_m k l_T v_Hb v_Hpm];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f, [t_b f*z/z_m l_b*z/z_m]);
  tT_pm = (t_pm - t_bm)/ kT_M;         % d, time since birth at puberty at f and T
  L_im = f * L_mm; L_bm = l_bm * L_mm; % cm, ultimate structural length
  Lw_im = L_im/ del_M;                 % cm, ultimate length
  L_pm = l_pm * L_mm; Lw_pm = L_pm/ del_M; % cm, struct length at puberty
  
  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  % female  
  tf = [tT_x f_bx; tT_x+30 f_tL];
  [t, EL] = ode45(@get_EL, [0;tL_f(:,1)], [E_m, L_b], [], tf, v * TC, g, E_m, L_m, p_Am * TC); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_f = EL(2:end,2)/ del_M; % cm, length
  % male
  [t, EL] = ode45(@get_EL, [0;tL_m(:,1)], [E_m_m, L_b], [], tf, v * TC, g_m, E_m_m, L_mm, p_Am_m * TC); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_m = EL(2:end,2)/ del_M; % cm, length
  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;

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

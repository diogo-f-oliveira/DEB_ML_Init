function [prdData, info] = predict_Dormitator_latifrons(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if f_tL > 1
    info = 0; prdCode = []; return
  end

  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_dWw = tempcorr(temp.dWw, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if info == 0
    prdData = []; return
  end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % growth
  L = (15/(1 + f * ome))^(1/3);
  rT_B = TC_dWw * k_M/ 3/ (1 + f/ g); % cm/d, von Bert growth rate
  dL = rT_B * (L_i - L);            % cm/d, change in struct length
  dWw = (1 + f * ome) * 3 * L^2 * dL; % g/d, chnage in wet weight
  
  % reproduction
  GSI = 365 * kT_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2); % mol E_R/ mol W

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
  L_im = f * L_mm; Lw_im = L_im/ del_M; % cm, ultimate length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate weight

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.dWw = dWw;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time - length 
  Lw_i = L_m * f_tL/ del_M; rT_B = kT_M/ 3/ (1 + f_tL/g); % 1/d, von Bert growth rate
  ELw = Lw_i - (Lw_i - Lw_0) * exp(- rT_B * tL(:,1)); % cm, TL

  % pack to output
  prdData.tL = ELw;
  

function [prdData, info] = predict_Acanthodactylus_harranensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J ;k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm2, initial scaled reserve
  Ww_0 = U_E0 * p_Am * w_E / mu_E /d_V; % g, initial wet weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

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
  L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  Lw_im = L_im/ del_M;                 % cm, ultimate SVL
  pars_lpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm, info] = get_tp(pars_lpm, f); 
  Lw_pm = L_mm * l_pm/ del_M; % cm, SVL at puberty
  tT_pm = (t_pm - t_bm)/ k_M/ TC; % d, time since birth at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-length
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL;
  rT_B = TC * k_M/ 3/ (1 + f_tL/g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(-rT_B * tL_fm(:,1)); % cm, struc length
  ELw_f = L/del_M; % cm, SVL
  %
  L_bm = L_mm * get_lb([g_m k v_Hb], f_tL); L_im = L_mm * f_tL;
  rT_Bm = TC * k_M/ 3/ (1 + f_tL/g_m); % 1/d, von Bert growth rate
  L = L_im - (L_im - L_bm) * exp(-rT_Bm * tL_fm(:,1)); % cm, struc length
  ELw_m = L/del_M; % cm, SVL
  
  % pack to output
  prdData.tL_fm = [ELw_f ELw_m];
 
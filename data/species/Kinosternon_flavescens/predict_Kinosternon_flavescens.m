function [prdData, info] = predict_Kinosternon_flavescens(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if ~info
    prdData = []; return
  end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Ww_0 = U_E0 * p_Am * w_E/ mu_E/ d_E; % g, egg wet weight
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, carapace length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ kT_M;                 % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, plastron length
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate plastron length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

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
  L_im = L_mm * f; Lw_im= L_im/ del_M; Ww_im = L_im^3 * (1 + f * w_m); 
  pars_tpm = [g_m k l_T v_Hb v_Hpm];    % compose par-vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  tT_pm = (t_pm - t_bm)/ kT_M; Lw_pm = L_mm * l_pm/ del_M;


  % pack to output
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
    
  % time-length
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = f_tL * L_m;
  rT_B = kT_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  ELw = (L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)))/ del_M; % cm, plastron length
  
  % weight - clutch weight
  EWw_R = Ww_0 * 365 * TC * reprod_rate((WwWwR(:,1)/(1 + f_tL * ome)).^(1/3), f_tL, pars_R); % g, clutch wet weight

  % pack to output
  prdData.tL = ELw;
  prdData.WwWwR = EWw_R;


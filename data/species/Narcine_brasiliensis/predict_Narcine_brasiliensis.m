function [prdData, info] = predict_Narcine_brasiliensis(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f (remove d_V for wet weight)
  aT_b = t_b/ kT_M;                 % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  aT_p = t_p/ kT_M;                 % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight (remove d_V for wet weight)
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate((100 * del_M), f, pars_R);       % #/d, ultimate reproduction rate at T

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
  L_im = L_mm * (f - l_T); Lw_im = L_im/del_M;      % cm, max total length
  pars_tpm = [g_m k l_T v_Hb v_Hp];    % pars for males
  [t_p, t_b, l_pm, l_bm] = get_tp_foetus(pars_tpm, f);
  Lw_pm = L_mm * l_pm/del_M;  % cm, total length at puberty
  L_im = L_mm * f; Lw_im = L_im/ del_M; % ultimate length

  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  % time-length
  % females post birth
  rT_B = kT_M/ 3/ (1 + f_tL/ g); Lw_b = L_m * get_lb([g k v_Hb], f_tL)/ del_M; Lw_i = L_m * f_tL/ del_M;
  ELw_f = Lw_i - (Lw_i - Lw_b) * exp(- rT_B * tL_f(:,1)); % cm, total length
  % males post birth
  rT_Bm = kT_M/ 3/ (1 + f_tL/ g_m); Lw_bm = L_mm * get_lb([g_m k v_Hb], f_tL)/ del_M; Lw_im = L_mm * f_tL/ del_M;
  ELw_m = Lw_im - (Lw_im - Lw_bm) * exp(- rT_Bm * tL_m(:,1)); % cm, total length
  
  % length - weight 
  EWw = (LW(:,1) * del_M) .^3 .* (1 + f_tL * w);  % g, wet weigth in g assuming density of 1 g cm^3

  %% pack to output
  prdData.tL_f = ELw_f;  
  prdData.tL_m = ELw_m;
  prdData.LW = EWw;
  

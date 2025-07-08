function [prdData, info] = predict_Siren_intermedia(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  %% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth 

  % puberty
  L_p = L_m * l_p;                  % cm, structural length at 1st brood 
  Lw_p = L_p/ del_M;                % cm, total length at 1st brood 
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at 1st brood 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at 1st brood

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);               % #/d, ultimate reproduction rate at T

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
  pars_tpm = [g_m k l_T v_Hb v_Hp];    % pars
  [t_pm, t_bm, l_pm, l_jm, info] = get_tp(pars_tpm, f);
  if ~info; prdData = []; return; end
  tT_pm = (t_pm - t_bm)/ k_M/ TC;      % d, time since birth at puberty
  Lw_pm = L_mm * l_pm/ del_M;          % cm, SL at puberty

  % length at 1 yr
  L_b = L_m * get_lb([g; k; v_Hb], f_tL); L_i = f_tL * L_m; rT_B = TC * k_M/ 3/ (1 + f_tL/g);
  Lw_1f = (L_i - (L_i - L_b) * exp(- rT_B * 365))/ del_M;
  %
  L_bm = L_mm * get_lb([g_m; k; v_Hb], f_tL); L_im = f_tL * L_mm; rT_Bm = TC * k_M/ 3/ (1 + f_tL/g_m);
  Lw_1m = (L_im - (L_im - L_bm) * exp(- rT_Bm * 365))/ del_M;
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.L1_f = Lw_1f;
  prdData.L1_m = Lw_1m;
  prdData.Wwb = Ww_b;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  %% uni-variate data
    
  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f_tL * w);
    
  % pack to output
  prdData.LW = EWw;


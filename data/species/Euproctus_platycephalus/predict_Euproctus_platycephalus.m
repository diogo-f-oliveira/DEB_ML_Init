function [prdData, info] = predict_Euproctus_platycephalus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if E_Hj < E_Hb || E_Hj > E_Hp || kap < 0.1
     prdData = []; info = 0; return
  end
  
  %% compute temperature correction factors
  TC_15 = tempcorr(temp.ab_15, T_ref, T_A);
  TC_24 = tempcorr(temp.ab_24, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_N = tempcorr(temp.tLN, T_ref, T_A);
  TC_S = tempcorr(temp.tLS, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b] = get_tp(pars_tj, f);       % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  a15_b = t_b/ k_M/ TC_15;           % d, age at birth
  a24_b = t_b/ k_M/ TC_24;           % d, age at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, SVL at metam
  t15_j = (t_j - t_b)/ k_M/ TC_15;  % d, time since birth at metam
  t20_j = (t_j - t_b)/ k_M;         % d, time since birth at metam

  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, SVP at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  Lw_i = L_i/ del_M;                % cm, ultimet SVL
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

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
  L_pm = l_pm * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Lw_bm = L_mm * l_bm/ del_M; Lw_im = L_im/ del_M;
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  %% pack to output
  prdData.ab_15 = a15_b;
  prdData.ab_24 = a24_b;
  prdData.tj_15 = t15_j;
  prdData.tj_20 = t20_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-length
  L_b = L_m * get_lb([g; k; v_Hb], f_N); L_i = L_m * f_N;
  rT_B = TC_N * k_M/ 3/ (1 + f_N/ g); % 1/d, von Bert growth rate
  ELw_N = (L_i - (L_i - L_b) * exp(-rT_B * tLN(:,1)))/ del_M; % cm, SVL
  %
  L_b = L_m * get_lb([g; k; v_Hb], f_S); L_i = L_m * f_S;
  rT_B = TC_S * k_M/ 3/ (1 + f_S/ g); % 1/d, von Bert growth rate
  ELw_S = (L_i - (L_i - L_b) * exp(-rT_B * tLS(:,1)))/ del_M; % cm, SVL
  
  %% pack to output
  prdData.tLN = ELw_N;
  prdData.tLS = ELw_S;
  
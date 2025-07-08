function [prdData, info] = predict_Euphlyctis_cyanophlyctis(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hj < E_Hb || E_Hj > E_Hp
    prdData = []; info = 0; return
  end

  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  
  % metam
  pars_tj = [g; k; l_T; v_Hb; v_Hj];% compose parameter vector
  [t_j, t_b, l_j, l_b] = get_tp(pars_tj, f); % -, scaled times & lengths at f
  L_j = L_m * l_j; Lw_j = L_j/ del_M; % cm, SVL at metam
  Ww_j = L_j^3 * (1 + f);             % g, wet weight at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, SVL at puberty at f
  Ww_p = L_p^3 * (1 + f_tLl * w);   % g, wet weight at puberty
  tT_p = (t_p - t_j)/ k_M/ TC;      % d, time since metam at puberty
  
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
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];% compose parameter vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f); % -, scaled times & lengths at f
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj];% compose parameter vector
  [t_jm, t_bm, l_jm, l_bm] = get_tp(pars_tjm, f); % -, scaled times & lengths at f
  L_pm = l_pm * L_mm; Lw_pm = L_pm/ del_M; % cm, structural length at birth
  tT_pm = (t_pm - t_jm)/ k_M/ TC;      % time since birth at puberty
  Ww_pm = L_pm^3 * (1 + f_tLl * w_m);     % g, wet weight at puberty 
  Ww_jm = L_j^3 * (1 + f * w_m);       % g, wet weight at puberty 
  
  % pack to output
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwjm = Ww_jm;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-length
  rT_B = TC * k_M/ 3/ (1 + f_tL/ g); L_i = L_m * f_tL; L_j = L_m * get_lp(pars_tj, f_tL);
  ELw_f = (L_i - (L_i - L_j) * exp(- rT_B * tL_f(:,1)))/ del_M; % cm, SVL
  EWw_f = (L_i - (L_i - L_j) * exp(- rT_B * tW_f(:,1))).^3 * (1 + f_tL * w); % g, wet weight
  %
  rT_Bm = TC * k_M/ 3/ (1 + f_tL/ g_m); L_im = L_mm * f_tL; 
  ELw_m = (L_im - (L_im - L_j) * exp(- rT_Bm * tL_m(:,1)))/ del_M; % cm, SVL
  EWw_m = (L_im - (L_im - L_j) * exp(- rT_Bm * tW_m(:,1))).^3 * (1 + f_tL * w); % g, wet weight
  %
  rT_B = TC * k_M/ 3/ (1 + f_tLl/ g); L_i = L_m * f_tLl; L_j = L_m * get_lp(pars_tj, f_tLl);
  ELw_fl = (L_i - (L_i - L_j) * exp(- rT_B * tL_fl(:,1)))/ del_M; % cm, SVL
  EWw_fl = (L_i - (L_i - L_j) * exp(- rT_B * tW_fl(:,1))).^3 * (1 + f_tLl * w); % g, wet weight
  %
  rT_Bm = TC * k_M/ 3/ (1 + f_tLl/ g_m); L_im = L_mm * f_tLl;
  ELw_ml = (L_im - (L_im - L_j) * exp(- rT_Bm * tL_ml(:,1)))/ del_M; % cm, SVL
  EWw_ml = (L_im - (L_im - L_j) * exp(- rT_Bm * tW_ml(:,1))).^3 * (1 + f_tLl * w); % g, wet weight

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
  prdData.tL_fl = ELw_fl;
  prdData.tL_ml = ELw_ml;
  prdData.tW_fl = EWw_fl;
  prdData.tW_ml = EWw_ml;


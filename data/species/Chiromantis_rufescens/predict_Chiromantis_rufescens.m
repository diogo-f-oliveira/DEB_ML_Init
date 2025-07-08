function [prdData, info] = predict_Chiromantis_rufescens(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hj  < E_Hb || E_Hj > E_Hp
    info = 0; prdData = []; return
  end

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
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
  Lw_b = L_b/ del_ML05;               % cm, TL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = t_0 + t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, SVL at metam
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam at T_ref
  
  % puberty 
  tT_p = (t_p - t_j)/ k_M/ TC;      % d, time since metam at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty

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
  pars_tpm = [g_m k l_T v_Hb v_Hp];    % pars for toad
  [t_pm, t_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f); % -, scaled times & lengths at f
  if ~info; prdData = []; return; end
  tT_pm = (t_pm - t_bm)/ k_M/ TC;      % d, time since metam at puberty
  L_pm = l_pm * L_mm; Lw_pm = L_pm/ del_M; % cm, struc, SVL
  Ww_pm = L_pm^3 * (1 + f * w_m);      % g, wet weight at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-length
  L_b = L_m * get_lb([g; k; v_Hb], f_tL); L_i = L_m * f_tL;
  rT_B = TC_tL * k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(- rT_B * tL(:,1)); % cm, struc length
  Ldel = [0.19 0.20 .21 .22 .23 .24 0.25; del_ML05 del_ML08 del_ML11 del_ML14 del_ML17 del_ML20 del_ML23]';
  ELw = L ./ spline(L,Ldel); % cm, TL tadpole

  % pack to output
  prdData.tL = ELw;


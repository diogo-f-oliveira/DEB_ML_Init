function [prdData, info] = predict_Nanorana_parkeri(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hj < E_Hb || E_Hj > E_Hp || p_M > 200
    prdData = []; info = 0; return
  end

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A);
  TC_38 = tempcorr(temp.tL_3800fm, T_ref, T_A);
  TC_39 = tempcorr(temp.tL_3900fm, T_ref, T_A);
  TC_40 = tempcorr(temp.tL_4000fm, T_ref, T_A);
  TC_43 = tempcorr(temp.tL_4300fm, T_ref, T_A);
  TC_44 = tempcorr(temp.tL_4400fm, T_ref, T_A);
  TC_47 = tempcorr(temp.tL_4700fm, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth
  
  % metam
  pars_tj = [g; k; l_T; v_Hb; v_Hj];% compose parameter vector
  [t_j, t_b, l_j, l_b] = get_tp(pars_tj, f); % -, scaled times & lengths at f
  L_j = L_m * l_j; Lw_j = L_j/ del_M; % cm, SVL at metam
  Ww_j = L_j^3 * (1 + f);             % g, wet weight at metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, SVL at puberty at f
  Ww_p = L_p^3 * (1 + f * w);        % g, wet weight at puberty
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
  Ww_pm = L_pm^3 * (1 + f * w_m);      % g, wet weight at puberty 
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
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
  rT_B = TC_38 * k_M/ 3/ (1 + f_38/ g); L_i = L_m * f_38; L_j = L_m * get_lp(pars_tj, f_38);
  ELw_38f = (L_i - (L_i - L_j) * exp(- rT_B * tL_3800fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_38 * k_M/ 3/ (1 + f_38/ g_m); L_im = L_mm * f_38; 
  ELw_38m = (L_im - (L_im - L_j) * exp(- rT_Bm * tL_3800fm(:,1)))/ del_M; % cm, SVL
%
  rT_B = TC_39 * k_M/ 3/ (1 + f_39/ g); L_i = L_m * f_39; L_j = L_m * get_lp(pars_tj, f_39);
  ELw_39f = (L_i - (L_i - L_j) * exp(- rT_B * tL_3900fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_39 * k_M/ 3/ (1 + f_39/ g_m); L_im = L_mm * f_38; 
  ELw_39m = (L_im - (L_im - L_j) * exp(- rT_Bm * tL_3900fm(:,1)))/ del_M; % cm, SVL
%
  rT_B = TC_40 * k_M/ 3/ (1 + f_40/ g); L_i = L_m * f_40; L_j = L_m * get_lp(pars_tj, f_40);
  ELw_40f = (L_i - (L_i - L_j) * exp(- rT_B * tL_4000fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_40 * k_M/ 3/ (1 + f_40/ g_m); L_im = L_mm * f_40; 
  ELw_40m = (L_im - (L_im - L_j) * exp(- rT_Bm * tL_4000fm(:,1)))/ del_M; % cm, SVL
%
  rT_B = TC_43 * k_M/ 3/ (1 + f_43/ g); L_i = L_m * f_43; L_j = L_m * get_lp(pars_tj, f_43);
  ELw_43f = (L_i - (L_i - L_j) * exp(- rT_B * tL_4300fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_43 * k_M/ 3/ (1 + f_43/ g_m); L_im = L_mm * f_43; 
  ELw_43m = (L_im - (L_im - L_j) * exp(- rT_Bm * tL_4300fm(:,1)))/ del_M; % cm, SVL
%
  rT_B = TC_44 * k_M/ 3/ (1 + f_44/ g); L_i = L_m * f_44; L_j = L_m * get_lp(pars_tj, f_44);
  ELw_44f = (L_i - (L_i - L_j) * exp(- rT_B * tL_4400fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_44 * k_M/ 3/ (1 + f_44/ g_m); L_im = L_mm * f_44; 
  ELw_44m = (L_im - (L_im - L_j) * exp(- rT_Bm * tL_4400fm(:,1)))/ del_M; % cm, SVL
%
  rT_B = TC_47 * k_M/ 3/ (1 + f_47/ g); L_i = L_m * f_47; L_j = L_m * get_lp(pars_tj, f_47);
  ELw_47f = (L_i - (L_i - L_j) * exp(- rT_B * tL_4700fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_47 * k_M/ 3/ (1 + f_47/ g_m); L_im = L_mm * f_47; 
  ELw_47m = (L_im - (L_im - L_j) * exp(- rT_Bm * tL_4700fm(:,1)))/ del_M; % cm, SVL

  % pack to output
  prdData.tL_3800fm = [ELw_38f ELw_38m];
  prdData.tL_3900fm = [ELw_39f ELw_39m];
  prdData.tL_4000fm = [ELw_40f ELw_40m];
  prdData.tL_4300fm = [ELw_43f ELw_43m];
  prdData.tL_4400fm = [ELw_44f ELw_44m];
  prdData.tL_4700fm = [ELw_47f ELw_47m];


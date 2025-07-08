function [prdData, info] = predict_Cynops_pyrrhogaster(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);  

  if E_Hj < E_Hb || E_Hj > E_Hp || E_Hpm < E_Hj 
    prdData = []; info = 0; return
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_T1 = tempcorr(temp.tL_T1fm, T_ref, T_A);
  TC_T4 = tempcorr(temp.tL_T4fm, T_ref, T_A);
  TC_S1 = tempcorr(temp.tL_S1fm, T_ref, T_A);
  TC_S3 = tempcorr(temp.tL_S3fm, T_ref, T_A);
  TC_I1 = tempcorr(temp.tL_I1fm, T_ref, T_A);
  TC_I5 = tempcorr(temp.tL_I5fm, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tj, f); % -, scaled times & lengths at 
  if ~info; prdData = []; end
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  if ~info; prdData = []; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;              % d, age at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, age at metam at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);% #/d, max reprod rate

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
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hpm]; % compose parameter vector
  [l_pm, l_bm, info] = get_lp(pars_tpm, f); % -, scaled times & lengths at f
  if ~info; prdData = []; end
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, SVL at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-length
  rT_B = TC_T1 * k_M/ 3/ (1 + f_T1/ g); L_i = f_T1 * L_m; L_b = L_m * get_lb([g; k; v_Hb], f_T1);
  ELw_T1f = (L_i - (L_i - L_b) * exp(-rT_B * tL_T1fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_T1 * k_M/ 3/ (1 + f_T1/ g_m); L_im = f_T1 * L_mm; L_bm = L_mm * get_lb([g_m; k; v_Hb], f_T1);
  ELw_T1m = (L_im - (L_im - L_bm) * exp(-rT_Bm * tL_T1fm(:,1)))/ del_M; % cm, SVL
  %
  rT_B = TC_T4 * k_M/ 3/ (1 + f_T4/ g); L_i = f_T4 * L_m; L_b = L_m * get_lb([g; k; v_Hb], f_T4);
  ELw_T4f = (L_i - (L_i - L_b) * exp(-rT_B * tL_T4fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_T4 * k_M/ 3/ (1 + f_T4/ g_m); L_im = f_T4 * L_mm; L_bm = L_mm * get_lb([g_m; k; v_Hb], f_T4);
  ELw_T4m = (L_im - (L_im - L_bm) * exp(-rT_Bm * tL_T4fm(:,1)))/ del_M; % cm, SVL
  %
  rT_B = TC_S1 * k_M/ 3/ (1 + f_S1/ g); L_i = f_S1 * L_m; L_b = L_m * get_lb([g; k; v_Hb], f_S1);
  ELw_S1f = (L_i - (L_i - L_b) * exp(-rT_B * tL_S1fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_S1 * k_M/ 3/ (1 + f_S1/ g_m); L_im = f_S1 * L_mm; L_bm = L_mm * get_lb([g_m; k; v_Hb], f_S1);
  ELw_S1m = (L_im - (L_im - L_bm) * exp(-rT_Bm * tL_S1fm(:,1)))/ del_M; % cm, SVL
  %
  rT_B = TC_S3 * k_M/ 3/ (1 + f_S3/ g); L_i = f_S3 * L_m; L_b = L_m * get_lb([g; k; v_Hb], f_S3);
  ELw_S3f = (L_i - (L_i - L_b) * exp(-rT_B * tL_S3fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_S3 * k_M/ 3/ (1 + f_S3/ g_m); L_im = f_S3 * L_mm; L_bm = L_mm * get_lb([g_m; k; v_Hb], f_S3);
  ELw_S3m = (L_im - (L_im - L_bm) * exp(-rT_Bm * tL_S3fm(:,1)))/ del_M; % cm, SVL
  %
  rT_B = TC_I1 * k_M/ 3/ (1 + f_I1/ g); L_i = f_I1 * L_m; L_b = L_m * get_lb([g; k; v_Hb], f_I1);
  ELw_I1f = (L_i - (L_i - L_b) * exp(-rT_B * tL_I1fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_I1 * k_M/ 3/ (1 + f_I1/ g_m); L_im = f_I1 * L_mm; L_bm = L_mm * get_lb([g_m; k; v_Hb], f_I1);
  ELw_I1m = (L_im - (L_im - L_bm) * exp(-rT_Bm * tL_I1fm(:,1)))/ del_M; % cm, SVL
  %
  rT_B = TC_I5 * k_M/ 3/ (1 + f_I5/ g); L_i = f_I5 * L_m; L_b = L_m * get_lb([g; k; v_Hb], f_I5);
  ELw_I5f = (L_i - (L_i - L_b) * exp(-rT_B * tL_I5fm(:,1)))/ del_M; % cm, SVL
  %
  rT_Bm = TC_I5 * k_M/ 3/ (1 + f_I5/ g_m); L_im = f_I5 * L_mm; L_bm = L_mm * get_lb([g_m; k; v_Hb], f_I5);
  ELw_I5m = (L_im - (L_im - L_bm) * exp(-rT_Bm * tL_I5fm(:,1)))/ del_M; % cm, SVL

  prdData.tL_T1fm = [ELw_T1f ELw_T1m];
  prdData.tL_T4fm = [ELw_T4f ELw_T4m];
  prdData.tL_S1fm = [ELw_S1f ELw_S1m];
  prdData.tL_S3fm = [ELw_S3f ELw_S3m];
  prdData.tL_I1fm = [ELw_I1f ELw_I1m];
  prdData.tL_I5fm = [ELw_I5f ELw_I5m];

end

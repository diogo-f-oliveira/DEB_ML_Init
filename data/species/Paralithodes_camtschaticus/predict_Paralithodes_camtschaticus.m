function [prdData, info] = predict_Paralithodes_camtschaticus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC = tempcorr(temp.tp, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
  TC_WdW = tempcorr(temp.WdW_m, T_ref, T_A);
  TC_WJX = tempcorr(temp.WJX, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj; % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  Wd_j = L_j^3 * d_V * (1 + f * w); % g, dry weight at metam
  s_M = t_j/ t_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_j)/ k_M/ TC;      % d, time since metam at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

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
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_im = l_i * L_mm;                   % cm, ultimate total length
  r_Bm = rho_Bm * k_M;                 % 1/d, von Bert growth rate
  L_pm = l_pm * L_mm; Lw_pm = L_pm/ del_M; % cm, struc length, carapace width
  tT_pm = (t_jm - t_bm)/ k_M/ TC_tj;   % d, time since birth at metam
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdj = Wd_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
    
  % univariate data
  
  % feeding rate
  L = (WJX(:,1)/ (1 + f * w)).^(1/3);
  EJT_X = TC_WJX * s_M * p_Am * L.^2/ kap_X/ mu_X/ d_X; % g/d, feeding rate
  
  % weight-growth
  L = (WdW_m(:,1)/ (1 + f * w_m)).^(1/3); rT_Bm = rho_Bm * k_M * TC_WdW; 
  dL = rT_Bm * (L_im - L); % cm/d, change in structural length
  EdWw = (1 + f * w_m) * 3 * L.^2 .* dL; % g/d, change in male wet weight
  
  % time-length post metam
  % females
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  L_j = L_m * l_j; L_i = L_m * l_i; kT_M = k_M * TC_tL; rT_B = rho_B * kT_M; 
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_f(:,1)); % cm, struc length females
  ELw_f = L/ del_M; % cm, carapace length
  %  males
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tL);
  L_jm = L_mm * l_jm; L_im = L_mm * l_im; rT_Bm = rho_Bm * kT_M; 
  L = L_im - (L_im - L_jm) * exp( - rT_Bm * tL_m(:,1)); % cm, struc length males
  ELw_m = L/ del_M; % cm, carapace length

  prdData.WJX = EJT_X;
  prdData.WdW_m = EdWw;
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
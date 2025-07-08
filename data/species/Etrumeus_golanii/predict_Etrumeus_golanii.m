function [prdData, info] = predict_Etrumeus_golanii(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;            % d, age at birth at f and T
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  tT_j = (t_j - t_b)/ kT_M;         % d, age at metam at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vecto

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % male
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f, [0, f*z/z_m, l_b*z/z_m]);
  tT_jm = (t_jm - t_bm)/ kT_M;         % d, time since birth at metam
  L_bm= L_mm * l_bm; L_pm = L_mm * l_pm; L_im = L_mm * l_im; % cm, structural lengths at f
  Lw_im = L_im/ del_M;                % cm, std length at death
  Lw_pm = L_pm/ del_M;                % cm, std length at puberty
  Ww_pm = L_pm^3*(1+f*ome_m);         % g, weight at puberty

  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  
  %% uni-variate data
  
  % time-length
  tvel = get_tj(pars_tj, f_tL, [], tL_fm(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M; % cm, total length
  %
  tvel = get_tj(pars_tj, f_tL, [0 z/z_m l_b*z/z_m], tL_fm(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M; % cm, total length

  
  % weight-fecundity
  EN = TC * 365 * reprod_rate_j((WN(:,1)/(1+ome)).^(1/3), f, pars_R); % #, fecundity


  %% pack to output
  prdData.tL_fm = [ELw_f ELw_m];
  prdData.WN = EN;

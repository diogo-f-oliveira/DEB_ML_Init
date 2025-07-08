function [prdData, info] = predict_Doryteuthis_pleii(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  r_B = rho_B * k_M; % 1/d, von Bert growth rate
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, mantle length at birth at f
  aT_b = tau_b/ kT_M;               % d, age at birth at f and T_ref
  Ww_b = L_b^3 * (1 + f * ome);     % g, weight at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  tj = (tau_j - tau_b)/ kT_M; % d, time since birth at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  tau_m = get_tm_j(pars_tm, f);         % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T
  
  % ultimate
  tvel = get_tj(pars_tj, f, [], aT_m*kT_M);
  L_i = L_m * tvel(:,4); Lw_i = L_i/ del_M; % cm, dorsal mantle length at 296 d
  Ww_i = L_i^3 * (1 + f * ome); % g, weight at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  GSI = Ww_b * cum_reprod_j(aT_m, f, pars_R)/ Ww_i; % g/g, GSI at death

  % male
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f, [tau_b, f*z/z_m, l_b*z/z_m]);
  tjm = (t_jm - t_bm)/ kT_M;           % d, time since birth at metam
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, dorsal mantle length at puberty
  pars_tmm = [pars_tjm; h_am/ k_M^2; s_G]; % compose parameter vector at T_ref
  aT_mm = get_tm_j(pars_tmm, f)/ kT_M; % d, mean life span at T
  tvel = get_tj(pars_tjm, f, [], aT_mm*kT_M);
  L_im = L_mm * tvel(:,4); Lw_im = L_im/ del_M; % cm, dorsal mantle length at 296 d
  Ww_im = L_im^3 * (1 + f * ome_m); % g, weight at death
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.amm = aT_mm;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length
  tvel = get_tj(pars_tj, f, [], tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M;   % cm, dorsal mantle length at time
    
  % length-weight
  EWw_f = (LW_f(:,1)*del_M).^3 * (1 + f * ome); % g, weight
  EWw_m = (LW_m(:,1)*del_M).^3 * (1 + f * ome_m); % g, weight

  % pack to output
  prdData.tL = ELw;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  
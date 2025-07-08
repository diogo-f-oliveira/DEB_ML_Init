function [prdData, info] = predict_Sepia_elegans(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if p_M > 1000
    info = 0; prdData = []; return
  end
    
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  
  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, mantle length at puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % ultimate
  L_i = L_m * l_i; rT_B = TC * rho_B * k_M;  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m  - t_j/ kT_M));  
  Lw_i = L_am/ del_M;              % cm, mantle length at death
  Ww_i = L_am^3 * (1 + f * w);       % g, wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, cum no of eggs at 120 d

  % male
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m]);
  L_jm = L_mm * l_jm; Lw_pm = L_mm * l_pm/ del_M; L_im = L_mm * l_im; % cm, structural lengths at f
  rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm)/ kT_M;
  pars_tmm = [pars_tjm; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  aT_mm = get_tm_j(pars_tmm, f)/ kT_M;  % -, scaled mean life span at T_ref
  L_amm = L_im - (L_im - L_jm) * exp(- rT_Bm * (aT_mm  - t_jm/ kT_M));  
  Lw_im = L_amm/ del_M;              % cm, mantle length at death

  % change in length at birth
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_b = l_b * L_m; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  dLw_bf = L_b * rT_j/ 3 / del_M;
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_bm = l_bm * L_mm; rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M; 
  dLw_bm = L_bm * rT_jm/ 3 / del_M;

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.dLb = dLw_bf;
  prdData.dLbm = dLw_bm;
  prdData.Ni = NT_i;
  
  % uni-variate data
  % length-weight
  EWw_f = (LWw_f(:,1) * del_M).^3 * (1 + f * w); % g, wet weight 
  EWw_m = (LWw_m(:,1) * del_M).^3 * (1 + f * w_m); % g, wet weight 

  % pack to output
  prdData.LWw_f = EWw_f;
  prdData.LWw_m = EWw_m;


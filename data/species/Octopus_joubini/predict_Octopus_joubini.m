function [prdData, info] = predict_Octopus_joubini(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if kap_X > 0.95
    info = 0; prdData = []; return
  end
    
  % compute temperature correction factors
  TC = tempcorr(temp.Ni, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  
  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_0 + t_b/ kT_M;           % d, age at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty at f
  tT_p = (t_p - t_b)/ kT_M;         % d, age at birth

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % ultimate
  L_i = L_m * l_i; rT_B = rho_B * kT_M;  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m  - t_j/ kT_M));  
  Ww_i = L_am^3 * (1 + f * w);     % g, wet weight at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC*k_J; kT_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, cum no of eggs at L

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hp];

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % time-weight, feeding rate
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tW, [], tW_f(:,1)*kT_M);
  EWw_f = (L_m * tvel(:,4)).^3 * (1 + f_tW * w);   % g, weight
  % male
  [tvel, t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm rho_Bm] = get_tj(pars_tjm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], tW_m(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  % time-feeding rate
  % female
  tvel = get_tj(pars_tj, f_tW, [], tJX_f(:,1)*kT_M);
  L = L_m * tvel(:,4); s_M = min(l_j, tvel(:,4))/l_b;
  EJX_f = L.^2 * p_Am .* s_M/ kap_X/ mu_X * w_X/ d_X; % g/d, feeding rate (wet crab flesh)
  % male
  tvel = get_tj(pars_tjm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], tJX_m(:,1)*kT_M);
  L = L_mm * tvel(:,4); s_M = min(l_jm, tvel(:,4))/l_bm;
  EJX_m = L.^2 * p_Am_m .* s_M/ kap_X/ mu_X * w_X/ d_X; % g/d, feeding rate (wet crab flesh)
 
  % pack to output
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
  prdData.tJX_f = EJX_f;
  prdData.tJX_m = EJX_m;


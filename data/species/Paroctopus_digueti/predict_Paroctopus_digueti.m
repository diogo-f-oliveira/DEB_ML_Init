function [prdData, info] = predict_Paroctopus_digueti(par, data, auxData)

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
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if info == 0
      prdData = []; return
  end
  rT_B = rho_B * kT_M; % 1/d, von Bert growth rate
  rT_j = rho_j * kT_M; % 1/d, exponential growth rate
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (tau_j - tau_b)/ kT_M;         % d, time since birth at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * ome);     % g, weight at puberty

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m - tau_j/ kT_M));  
  Ww_i = L_am^3 * (1 + f * ome);   % g, weight at 220 d
 
  % reproduction: GSI at death
  pars_R = [kap; kap_R; g; TC*k_J; kT_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, fecundity
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm, info] = get_tj(pars_tjm, f, [tau_b, f*z/z_m, l_b*z/z_m]);
  if info == 0
      prdData = []; return
  end
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm;  L_im = L_mm * l_im; 
  tT_jm = (tau_jm - tau_bm)/ kT_M; rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M;

  % pack to output
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
    
  % uni-variate data
  
  % time-length
  tvel = get_tj(pars_tj, f, [], tL(:,1) * kT_M);
  ELw = L_m * tvel(:,4)/ del_M; % cm, dorsal mantle length

  % time-weight
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tWw_f(:,1)*kT_M);
  EWw_f = (L_m * tvel(:,4)).^3 * (1 + f * w);   % g, weight
  % male
  tvel = get_tj(pars_tj, f, [t_b, f*z/z_m, l_b*z/z_m], tWw_m(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  
  % pack to output
  prdData.tL = ELw;
  prdData.tWw_f = EWw_f;
  prdData.tWw_m = EWw_m;
  
  
  
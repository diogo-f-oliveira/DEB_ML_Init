function [prdData, info] = predict_Charybdis_bimaculata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  Lw_b = 2*(Ww_b * 3/4/pi)^(1/3);   % cm, egg diameter at birth at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_pf = L_p/ del_Mf;              % cm, carapace length at puberty for females

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
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_Mm; % cm, total length at puberty
  L_im = l_im * L_mm; Lw_im = L_im/ del_Mm;  % cm, ultimate total length

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_pf;
  prdData.Lpm = Lw_pm;
  prdData.Wwb = Ww_b;
  
  % uni-variate data
  
  % time-length
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_f((tL_f(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_f((tL_f(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  ELw_f = [L_bj; L_jm]/ del_Mf; % cm, carapace length, females
  %
  rT_j = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M;        
  L_bm = L_mm * l_bm;  L_jm = L_mm * l_jm; L_im = L_mm * l_im; tT_jm = (t_j - t_b)/ kT_M;
  L_bj = L_bm * exp(tL_m((tL_m(:,1) <= tT_jm),1) * rT_j/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tL_m((tL_m(:,1) > tT_jm),1) - tT_jm)); % cm, structural length at time
  ELw_m = [L_bj; L_ji]/ del_Mm; % cm, carapace length, males
  
  EWw_f = (LW_f(:,1) * del_Mf).^3 * (1 + w * f);   % g, wet weight females
  EWw_m = (LW_m(:,1) * del_Mm).^3 * (1 + w_m * f); % g, wet weight males
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN = TC * 365 * reprod_rate_j(LN(:,1) * del_Mf, f, pars_R)/1e4; % 10^4 eggs, fecundity at T

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  prdData.LN = EN;
  
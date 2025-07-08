function [prdData, info] = predict_Austrolebias_adloffi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
    
  % compute temperature correction factors
  TC    = tempcorr(temp.tp, T_ref, T_A); kT_M = TC * k_M;
  TC_22 = tempcorr(temp.tL_22f, T_ref, T_A); kT_M = TC * k_M; 
  TC_16 = tempcorr(temp.tL_16f, T_ref, T_A); 
    
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth
    
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  NT_i = TC * cum_reprod_j(335, f, pars_R);  % #, total # of eggs

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];

  % pack to output
  prdData.tp = tT_p;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Ni = NT_i;
  
  % univariate data

  % time-length/weight post metam
  L_0f = Lw_0f * del_M; L_0m = Lw_0m * del_M;
  % females
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_22);
  kT_M = TC_22 * k_M; rT_B = rho_B * kT_M; L_i = L_m * l_i;
  L = L_i - (L_i - L_0f) * exp( - rT_B * tL_22f(:,1)); ELw_22f = L/ del_M; 
  L = L_i - (L_i - L_0f) * exp( - rT_B * tWw_22f(:,1)); EWw_22f = L.^3 * (1 + f_22 * ome); 
  % males
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_22);
  rT_Bm = rho_Bm * kT_M; L_im = L_mm * l_im;
  L = L_im - (L_im - L_0m) * exp( - rT_Bm * tL_22m(:,1)); ELw_22m = L/ del_M; 
  L = L_im - (L_im - L_0m) * exp( - rT_Bm * tWw_22m(:,1)); EWw_22m = L.^3 * (1 + f_22 * ome); 
  %
  % females
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_16);
  kT_M = TC_16 * k_M; rT_B = rho_B * kT_M; L_i = L_m * l_i;
  L = L_i - (L_i - L_0f) * exp( - rT_B * tL_16f(:,1)); ELw_16f = L/ del_M; 
  L = L_i - (L_i - L_0f) * exp( - rT_B * tWw_16f(:,1)); EWw_16f = L.^3 * (1 + f_16 * ome); 
  % males
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_16);
  rT_Bm = rho_Bm * kT_M; L_im = L_mm * l_im;
  L = L_im - (L_im - L_0m) * exp( - rT_Bm * tL_16m(:,1)); ELw_16m = L/ del_M; 
  L = L_im - (L_im - L_0m) * exp( - rT_Bm * tWw_16m(:,1)); EWw_16m = L.^3 * (1 + f_16 * ome); 

  % time - survival: Eq (6.5) of Kooy2010 for short growth periods, e = 1, L = L_i
  h3_W = TC_22^3 * h_a * v/ 6/ L_i; h_G = TC_22 * s_G * v/ L_i; h3_G = h_G^3; 
  th_G = h_G * tS_f(:,1);
  ES_f = exp(6 * h3_W/ h3_G * (1 - exp(th_G) + th_G + th_G.^2/ 2));
  %
  h3_W = TC_22^3 * h_a * v/ 6/ L_im; h_G = TC_22 * s_G * v/ L_im; h3_G = h_G^3; 
  th_G = h_G * tS_m(:,1);
  ES_m = exp(6 * h3_W/ h3_G * (1 - exp(th_G) + th_G + th_G.^2/ 2));
  

  % pack to output
  prdData.tL_22f = ELw_22f;
  prdData.tL_22m = ELw_22m;
  prdData.tWw_22f = EWw_22f;
  prdData.tWw_22m = EWw_22m;
  prdData.tL_16f = ELw_16f;
  prdData.tL_16m = ELw_16m;
  prdData.tWw_16f = EWw_16f;
  prdData.tWw_16m = EWw_16m;
  prdData.tS_f = ES_f;
  prdData.tS_m = ES_m;
  
  
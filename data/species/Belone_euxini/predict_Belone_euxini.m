function [prdData, info] = predict_Belone_euxini(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];               % compose parameter vector
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); % -, scaled times & lengths at f
  
  % hatch
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, weight at birth
  aT_b = tau_b/ kT_M;                 % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_pf = L_p/ del_M;              % cm, total length at puberty for female
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight for female
 
  % length/weight-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);              % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                    % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;         % J/d.cm^2, {p_Am} max spec assimilation flux for female
  E_m_m = p_Am_m/ v;               % J/cm^3, [E_m] reserve capacity for male
  m_Em_m = y_E_V * E_m_m/ E_G;     % mol/mol, reserve capacity for male
  g_m = E_G/ kap/ E_m_m;           % -, energy investment ratio for male
  w_m = m_Em_m * w_E/ w_V;         % -, contribution of reserve to weight for male
  L_mm = kap * p_Am_m/ p_M;        % cm, maximum structural length for male
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hpm]; % compose parameter vector
  [l_jm, l_pm, l_bm] = get_lj(pars_tjm, f); % -, scaled times & lengths at f
  Lw_pm = l_pm * L_mm/ del_M;     % cm, total length at puberty for males
  Lw_im = L_mm/ del_M;            % cm, ultimate total length for males
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp_f = Lw_pf;
  prdData.Lp_m = Lw_pm;
  prdData.Li_f = Lw_i;
  prdData.Li_m = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  % female
  tvel = get_tj(pars_tj, f_tL, [], tL_fm(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tj(pars_tjm, f_tL, [0, f_tL*z/z_m, l_b*z/z_m], tL_fm(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % pack to output
  prdData.tL_fm = [ELw_f ELw_m];
    
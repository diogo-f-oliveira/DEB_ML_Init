function [prdData, info] = predict_Buccinum_undatum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_7 = tempcorr(temp.WJO7, T_ref, T_A); 
  TC_10 = tempcorr(temp.WJO10, T_ref, T_A); 
    
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, shell length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);          % #/d, ultimate reproduction rate at T

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
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f);

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  % uni-variate data

  % weight-respiration
  p_ref = p_Am * L_m^2;               % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  % molar volume of gas at 1 bar and 20 C is 24.4 L/mol
  X_gas = 1/ 24.4;                  % M, mol of gas per litre at 20 C and 1 bar 
  % 7.5 C
  L = (WJO7(:,1)/ (1 + f * w)/ d_V).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM = pADG * eta_O' * O2M;         % mineral fluxes
  EJT_O7 = - TC_7 * JM(:,3) * 1e3/ 24/ X_gas; % ml/h, oxygen consumption rate
  % 10.5 C
  L = (WJO10(:,1)/ (1 + f * w)/ d_V).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM = pADG * eta_O' * O2M;          % mineral fluxes
  EJT_O10 = - TC_10 * JM(:,3) * 1e3/ 24/ X_gas; % ml/h, oxygen consumption rate

  % time-length females
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M; % cm, shell length females
  % time-length males
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tjm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M; % cm, shell length females

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, flesh wet weight
  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;  
  prdData.LW = EWw;  
  prdData.WJO7 = EJT_O7;  
  prdData.WJO10 = EJT_O10;  
function [prdData, info] = predict_Pleurodeles_waltl(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;


  %% zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tj, f); % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ kT_M;                 % d, age at birth at f and T

  % metamorphosis
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam at f 
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm;                     % cm, ultimate struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_bm = L_mm * l_bm;  L_pm = L_mm * l_pm;  % cm, struc length at birth, puberty
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  %% pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-weight
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f, [], tW_f(:,1)*kT_M);
  EWw_f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male
  tvel = get_tpm(pars_tpm, f, [t_b, f*z/z_m, l_b*z/z_m], tW_m(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  
  % time-respiration
  p_ref = p_Am * L_m^2;               % J/d, max assimilation power at max size
  %
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  tvel = get_tp(pars_tp, f, [], tJO_f(:,1)*kT_M); L = L_m * tvel(:,4);
  pACSJGRD = p_ref * scaled_power(L, f, pars_power, l_b, l_p);
  pADG = pACSJGRD(:, [1 7 5])'; pADG(1,:) = 0;  % J/d, select assim, dissip, growth, set assim to zero
  J_O = eta_O * pADG;               % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;          % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  X_gas = 1/ 24.4;     % M, mol of gas per litre at 20 C and 1 bar 
  EJO_f = - 1e3 * J_M(3,:)'/ 24/ X_gas;  % ml/h, dioxygen use
  %
  pars_power_m = [kap; kap_R; g_m; k_J; k_M; L_T; v; U_Hb; U_Hp];
  tvel = get_tp(pars_tpm, f, [], tJO_m(:,1)*kT_M); L = L_mm * tvel(:,4);
  pACSJGRD = p_ref * scaled_power(L, f, pars_power_m, l_bm, l_pm);
  pADG = pACSJGRD(:, [1 7 5])'; pADG(1,:) = 0;  % J/d, select assim, dissip, growth, set assim to zero
  J_O = eta_O * pADG;               % mol/d, J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;          % mol/d, J_C, J_H, J_O, J_N in rows, A, D, G in cols
  X_gas = 1/ 24.4;     % M, mol of gas per litre at 20 C and 1 bar 
  EJO_m = - 1e3 * J_M(3,:)'/ 24/ X_gas;  % ml/h, dioxygen use
 
  %% pack to output
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
  prdData.tJO_f = EJO_f;
  prdData.tJO_m = EJO_m;
  
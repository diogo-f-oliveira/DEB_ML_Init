function [prdData, info] = predict_Cornu_aspersum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if kap_X + kap_P > 1
    info = 0; prdData = []; return;
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
    
  % growth selection
  p_Am_m = p_Am * kap_X1/kap_X;        % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tj_m = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tj_m, f);
  L_bm = l_b * L_mm; L_jm = l_jm * L_mm; L_im = l_im * L_mm;  % cm, struct length, birth & ultimate

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  % uni-variate data
    
  % time-weight at T_ref
  % control
  kT_M = k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_bj = L_b * exp(tW((tW(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tW((tW(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  EWw = [L_bj; L_ji].^3 * (1 + f * w);                               % g, wet weight
  % growth selected
  rT_jm = rho_jm * kT_M; rT_Bm = rho_B * kT_M;        
  L_bj = L_bm * exp(tW1((tW1(:,1) <= tT_j),1) *  rT_jm/ 3);
  L_ji = L_im - (L_im - L_jm) * exp( - rT_Bm * (tW1((tW1(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  EWw_m = [L_bj; L_ji].^3 * (1 + f * w);                             % g, wet weight
 
  % weight-feeding rate at T_ref
  EJT_X = log10((10.^WJX(:,1)/ (1 + f * w)).^(2/3) * p_Am/ kap_X/ mu_X * w_X);        % g/d, log10 food consumption rate in control
  EJT_Xm = log10((10.^WJX1(:,1)/ (1 + f * w_m)).^(2/3) * p_Am_m/ kap_X1/ mu_X * w_X); % g/d, log10 food consumption rate in growth-selected
  
  % weight-respiration at T_ref
  % control
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  L = (10.^WJO(:,1)/ (1 + f * w)) .^ (1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O = log10(- J_M(3,:)' * 24.4e6/ 24);            % mul O2/h, log10 O2 consumption 
  % growth-selected
  pars_p = [kap; kap_R; g_m; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am_m * L_m^2; % J/d, max assimilation power at max size
  L = (10.^WJO1(:,1)/ (1 + f * w)) .^ (1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_Om = log10(- J_M(3,:)' * 24.4e6/ 24);           % mul O2/h, log10 O2 consumption 

  % time-length 
  f = f_tL; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  L_b = l_b * L_m; L_i = l_i * L_m; kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  ELw = [L_bj; L_ji]/ del_M;                               % cm, shell length

  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;
  prdData.tW1 = EWw_m;
  prdData.WJX = EJT_X;
  prdData.WJX1 = EJT_Xm;
  prdData.WJO = EJT_O;
  prdData.WJO1 = EJT_Om;
  
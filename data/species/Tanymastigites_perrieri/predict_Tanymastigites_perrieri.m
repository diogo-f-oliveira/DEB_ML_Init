function [prdData, info] = predict_Tanymastigites_perrieri(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(C2K(Tam(:,1)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_i, rho_rB, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  a_b = tau_b/ k_M;                 % d, age at birth at f and T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  t_p = (tau_p - tau_b)/ k_M;       % d, time since birth at puberty
  
  % ultimate
  L_i = L_m * l_i;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                  % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * ome); % g, ultimate dry weight
 
  % reprod
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b); % -, scaled mean life span at T_ref
  a_m = tau_m/ k_M;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];

  % pack to output
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  
  % uni-variate data
  
  % time-length
  tf = [5 f10_05; 10 f10_10; 30 f10_30; 60 f10_60; 80 f10_80]; tf(:,1) = tf(:,1)*k_M*TC(1);
  [tvel,~,tau10_p] = get_tj(pars_tj, tf,[],tL_10f(:,1)*k_M*TC(1)); 
  ELw_10f = L_m*tvel(:,4)/del_M; t10_p = tau10_p/k_M/TC(1);
  %
  tvel = get_tj(pars_tjm, tf,[0 1 l_b*z/z_m],tL_10m(:,1)*k_M*TC(1)); 
  ELw_10m = L_mm*tvel(:,4)/del_M;
  %
  tf = [5 f20_05; 10 f20_10; 30 f20_30; 60 f20_60]; tf(:,1) = tf(:,1)*k_M*TC(2);
  [tvel,~,tau20_p] = get_tj(pars_tj, tf,[],tL_20f(:,1)*k_M*TC(2)); 
  ELw_20f = L_m*tvel(:,4)/del_M; t20_p = tau20_p/k_M/TC(2);
  %
  tvel = get_tj(pars_tjm, tf,[0 1 l_b*z/z_m],tL_20m(:,1)*k_M*TC(2)); 
  ELw_20m = L_mm*tvel(:,4)/del_M;
  %
  tf = [2 f25_02; 5 f25_05; 10 f25_10]; tf(:,1) = tf(:,1)*k_M*TC(3);
  [tvel,~,tau25_p] = get_tj(pars_tj, tf,[],tL_25f(:,1)*k_M*TC(3)); 
  ELw_25f = L_m*tvel(:,4)/del_M; t25_p = tau25_p/k_M/TC(3);
  %
  tvel = get_tj(pars_tjm, tf,[0 1 l_b*z/z_m],tL_25m(:,1)*k_M*TC(3)); 
  ELw_25m = L_mm*tvel(:,4)/del_M;
  %
  tf = [2 f30_02; 5 f30_05; 10 f30_10]; tf(:,1) = tf(:,1)*k_M*TC(4);
  [tvel,~,tau30_p] = get_tj(pars_tj, tf,[],tL_30f(:,1)*k_M*TC(4)); 
  ELw_30f = L_m*tvel(:,4)/del_M; t30_p = tau30_p/k_M/TC(4);
  %
  tvel = get_tj(pars_tjm, tf,[0 1 l_b*z/z_m],tL_30m(:,1)*k_M*TC(4)); 
  ELw_30m = L_mm*tvel(:,4)/del_M;
  %
  tf = [2 f35_02; 15 f35_05; 0 f35_10]; tf(:,1) = tf(:,1)*k_M*TC(5);
  [tvel,~,tau35_p] = get_tj(pars_tj, tf,[],tL_35f(:,1)*k_M*TC(5)); 
  ELw_35f = L_m*tvel(:,4)/del_M; t35_p = tau35_p/k_M/TC(5);
  %
  tvel = get_tj(pars_tjm, tf,[0 1 l_b*z/z_m],tL_35m(:,1)*k_M*TC(5)); 
  ELw_35m = L_mm*tvel(:,4)/del_M;
  
  % temperature-time since birth at puberty
  Et_p = [t10_p;t20_p;t25_p;t30_p;t35_p];

  % temperature-life span
  tau_m = get_tm_s(pars_tm, f10_60, l_b); % -, scaled mean life span at T_ref
  a10_m = tau_m/ k_M/ TC(1);            % d, mean life span at T
  %
  tau_m = get_tm_s(pars_tm, f20_60, l_b); % -, scaled mean life span at T_ref
  a20_m = tau_m/ k_M/ TC(2);            % d, mean life span at T
  %
  tau_m = get_tm_s(pars_tm, f25_10, l_b); % -, scaled mean life span at T_ref
  a25_m = tau_m/ k_M/ TC(3);            % d, mean life span at T
  %
  tau_m = get_tm_s(pars_tm, f30_10, l_b); % -, scaled mean life span at T_ref
  a30_m = tau_m/ k_M/ TC(4);            % d, mean life span at T
  %
  tau_m = get_tm_s(pars_tm, f35_10, l_b); % -, scaled mean life span at T_ref
  a35_m = tau_m/ k_M/ TC(5);            % d, mean life span at T
  Ea_m = [a10_m;a20_m;a25_m;a30_m;a35_m];

  % temperature-reprod rate
  R10_i = TC(1) * reprod_rate_j(L_i, f10_60, pars_R); % #/d, max reprod rate
  R20_i = TC(1) * reprod_rate_j(L_i, f20_60, pars_R); % #/d, max reprod rate
  R25_i = TC(1) * reprod_rate_j(L_i, f25_10, pars_R); % #/d, max reprod rate
  R30_i = TC(1) * reprod_rate_j(L_i, f25_10, pars_R); % #/d, max reprod rate
  R35_i = TC(1) * reprod_rate_j(L_i, f35_10, pars_R); % #/d, max reprod rate
  ER_i = [R10_i;R20_i;R25_i;R30_i;R35_i];
  
  % pack to output
  prdData.tL_10f = ELw_10f;
  prdData.tL_10m = ELw_10m;
  prdData.tL_20f = ELw_20f;
  prdData.tL_20m = ELw_20m;
  prdData.tL_25f = ELw_25f;
  prdData.tL_25m = ELw_25m;
  prdData.tL_30f = ELw_30f;
  prdData.tL_30m = ELw_30m;
  prdData.tL_35f = ELw_35f;
  prdData.tL_35m = ELw_35m;
  prdData.Ttp = Et_p;
  prdData.Tam = Ea_m;
  prdData.TRi = ER_i;
  
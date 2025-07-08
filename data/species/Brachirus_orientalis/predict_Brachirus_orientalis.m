function [prdData, info] = predict_Brachirus_orientalis(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                     % cm, structural, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f
  
  % puberty and ultimate size
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);          % g, wet weight at puberty at f
 
  % ultimate size
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reproduction 
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];

%% pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
%% uni-variate data

  % time-length
  tf = [1000 f_1000; 6000 f_6000]; tf(:,1) = tf(:,1) * kT_M;
  % female
  tvel = get_tj(pars_tj, tf, [], tL_fm(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, tf, [0, z/z_m, l_b*z/z_m], tL_fm(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length
 
  % time-weight
  % female
  tvel = get_tj(pars_tj, tf, [], tW_fm(:,1)*kT_M);
  EWw_f = (L_m * tvel(:,4)).^3 .* (1 + ome*tvel(:,3)); % g, weight 
  % male
  tvel = get_tj(pars_tjm, tf, [0, z/z_m, l_b*z/z_m], tW_fm(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + ome_m*tvel(:,3)); % g, weight 
  
  % length-fecundity
  EN_L = TC * 365 * reprod_rate_j(LN(:,1)*del_M, f, pars_R); % #, fecundity

  % weight-fecundity
  EN_W = TC * 365 * reprod_rate_j((WN(:,1)/(1+f*ome)).^(1/3), f, pars_R); % #, fecundity

%% pack to output
  prdData.tL_fm = [ELw_f ELw_m];
  prdData.tW_fm = [EWw_f EWw_m];
  prdData.LN = EN_L;
  prdData.WN = EN_W;


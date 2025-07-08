function [prdData, info] = predict_Chelidonichthys_queketti(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                     % cm, structural, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC_ab;              % d, age at birth at f, temp corrected
  
  % metam
  s_M = l_j/ l_b;                      % -, acceleration factor

  % puberty 
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);          % g, wet weight at puberty
  aT_p = t_p/ k_M/ TC;                 % d, age at puberty
  
  % ultimate size
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;         % J/d.cm^2, {p_Am} spec assimilation flux for male
  E_m_m = p_Am_m/ v;               % J/cm^3, reserve capacity [E_m] for male
  m_Em_m = y_E_V * E_m_m/ E_G;     % mol/mol, reserve capacity for male
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  g_m = E_G/ (kap* E_m_m);         % -, energy investment ratio for male
  L_mm = v/ k_M/ g_m;              % cm, maximum length for male
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm, info] = get_tj(pars_tjm, f);
  if ~info; prdData = []; return; end
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, lengths at puberty
  Lw_im = L_mm * l_im/ del_M;      % cm, untimate length

%% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
 
%% uni-variate data

  % time-length 
  tvel = get_tj(pars_tj,f_tL,[],tL_fm(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M; % cm, length
  %
  tvel = get_tj(pars_tjm,f_tL,[],tL_fm(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M; % cm, length
   
  %% pack to output
  prdData.tL_fm = [ELw_f ELw_m];  
  

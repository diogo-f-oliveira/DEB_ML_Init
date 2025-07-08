function [prdData, info] = predict_Chirocentrus_nudus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  %Ww_b = L_b^3 * (1 + f * w);      % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth of foetus at f and T

  % metamorphosis
  L_j = l_j * L_m; Lw_j= L_j/ del_M;
  %s_M = L_j/ L_b;                  % -, acceleration factor
  %aT_j = t_j/ k_M/ TC;             % d, age at metamorphosis at f
  tT_j = (t_j - t_b)/ kT_M;         % d, age at metamorphosis at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  %Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = t_p/ kT_M;                 % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(58.7*del_M, f, pars_R);             % reproduction rate at TL = 58.7 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;         % J/d.cm^2, {p_Am} spec assimilation flux for male
  E_m_m = p_Am_m/ v;               % J/cm^3, reserve capacity [E_m] for male
  m_Em_m = y_E_V * E_m_m/ E_G;     % mol/mol, reserve capacity for male
  g_m = E_G/ (kap* E_m_m);         % -, energy investment ratio for male
  L_mm = v/ k_M/ g_m;              % cm, maximum length for male
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm, info] = get_tj(pars_tjm, f);
  if ~info; prdData = []; return; end
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, lengths at puberty
  Lw_im = L_mm * l_im/ del_M;      % cm, untimate length

  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  % time-length
  % female
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M;   % cm, length

  % pack to output
  prdData.tL = ELw;
     
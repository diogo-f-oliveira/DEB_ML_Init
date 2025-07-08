function [prdData, info] = predict_Ramnogaster_arcuata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  
%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth of foetus at f and T
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W

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
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f);
  L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M; % cm, total length at puberty
  Ww_pm = L_pm.^3 * (1 + f * ome_m);     % g, wet weight at puberty
  L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * ome_m);      % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;

  %% uni-variate data
  
  % time-length/weight
  tvel = get_tj(pars_tj, f_tL, [], tL_fm(:,1)*kT_M);
  ELw_f = L_m*tvel(:,4)/ del_M; % cm, total length
  EWw_f = (L_m*tvel(:,4)).^3 * (1 + f_tL * ome); % g, weight
  %
  tvel = get_tj(pars_tjm, f_tL, [0 z/z_m l_b*z/z_m], tL_fm(:,1)*kT_M);
  ELw_m = L_mm*tvel(:,4)/ del_M; % cm, total length
  EWw_m = (L_mm*tvel(:,4)).^3 * (1 + f_tL * ome_m); % g, weight

  % length-weight
  EWw_Lf = (LW_f(:,1)*del_M).^3*(1+f_tL*ome); % g, weight
  EWw_Lm = (LW_m(:,1)*del_M).^3*(1+f_tL*ome_m); % g, weight
  
  % pack to output
  prdData.tL_fm = [ELw_f ELw_m];
  prdData.tW_fm = [EWw_f EWw_m];
  prdData.LW_f = EWw_Lf;
  prdData.LW_m = EWw_Lm;
  
     
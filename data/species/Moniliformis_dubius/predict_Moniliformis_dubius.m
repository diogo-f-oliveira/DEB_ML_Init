function [prdData, info] = predict_Moniliformis_dubius(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tp, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; 
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth
  
  % puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction: (4.89) of Kooy2010
  GSI = 30 * kT_M * g/ f^3/ (f + kap * g * y_V_E); % -, GSI based on 10 d accumulation (wild guess)
  GSI = GSI * ((1 - kap)/f^3 - k_J * U_Hp/ L_m^2); % mol E_R/ mol W

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
  L_im = f * L_mm   ;                  % cm, ultimate struct length of male
  Lw_im = L_im/ del_M;                 % cm, length of male
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight of male
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp]; 

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-N
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f, [], tM_Nf(:,1)*kT_M); 
  e = tvel(:,3); L = L_m * tvel(:,4); 
  EM_Nf = 1e3 * L.^3 * d_V .* (n_NV * 14/ w_V + e * w * n_NE * 14/ w_E); % mg N
  % male
  tvel = get_tp(pars_tpm, f, [t_b, f*z/z_m, l_b*z/z_m], tM_Nm(:,1)*kT_M);
  e = tvel(:,3); L = L_mm * tvel(:,4); 
  EM_Nm = 1e3 * L.^3 * d_V .* (n_NV * 14/ w_V + e * w_m * n_NE * 14/ w_E); % mg N
  
  % time-DNA
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f, [], tM_DNAf(:,1)*kT_M); 
  L = L_m * tvel(:,4);
  EM_DNAf = 1e6 * Y_DNA_V * L.^3 * d_V; % mug DNA
  % male
  tvel = get_tp(pars_tpm, f, [t_b, f*z/z_m, l_b*z/z_m], tM_DNAm(:,1)*kT_M); 
  L = L_mm * tvel(:,4);
  EM_DNAm = 1e6 * Y_DNA_V * L.^3 * d_V; % mug DNA

  % time-RNA
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f, [], tM_RNAf(:,1)*kT_M); 
  e = tvel(:,3); L = L_m * tvel(:,4); 
  EM_RNAf = 1e3 * Y_RNA_E * L.^3 * d_V .* e * w; % mg RNA
  % male
  tvel = get_tp(pars_tpm, f, [t_b, f*z/z_m, l_b*z/z_m], tM_RNAm(:,1)*kT_M);
  e = tvel(:,3); L = L_mm * tvel(:,4); 
  EM_RNAm = 1e3 * Y_RNA_E * L.^3 * d_V .* e * w_m; % mg RNA 
  
  % pack to output
  prdData.tM_Nf = EM_Nf;
  prdData.tM_Nm = EM_Nm;
  prdData.tM_DNAf = EM_DNAf;
  prdData.tM_DNAm = EM_DNAm;
  prdData.tM_RNAf = EM_RNAf;
  prdData.tM_RNAm = EM_RNAm;
  
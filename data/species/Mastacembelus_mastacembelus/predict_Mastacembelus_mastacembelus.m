function [prdData, info] = predict_Mastacembelus_mastacembelus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                 % cm, structural length
  Ww_b = L_b^3 * (1 + f * ome);     % g, weight at birth
  aT_b = t_b/ kT_M;                % d, age at birth at f and T

  % metam
  s_M = 1;                         % -, acceleration factor
 
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
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
  pars_tpm = [g_m k l_T v_Hb v_Hp];

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.GSI = GSI;
  
  % univariate data
  % time-length-weight
  % female
  tvel = get_tp(pars_tp, f_tL, [], tL_fm(:,1)*kT_M);
  L = L_m * tvel(:,4); ELw_f = L/ del_M;   % cm, length
  EWw_f = L.^3 .* (1 + ome * tvel(:,3)); % g, weight
  % male
  tvel = get_tp(pars_tpm, f_tL, [0, f_tL*z/z_m, l_b*z/z_m], tL_fm(:,1)*kT_M);
  L = L_mm * tvel(:,4); ELw_m = L/ del_M;   % cm, length
  EWw_m = L.^3 .* (1 + ome_m * tvel(:,3)); % g, weight

  %% pack to output
  prdData.tL_fm = [ELw_f ELw_m];
  prdData.tW_fm = [EWw_f EWw_m];


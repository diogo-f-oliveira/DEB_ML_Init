function [prdData, info] = predict_Misgurnus_anguillicaudatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  a_b = t_b/ k_M;                   % d, age at birth at T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  Ri = TC * reprod_rate_j(23*del_M, f, pars_R);                 % #/d, reprod rate at TL 23 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % males (diploid)
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  % tetraploid females
  p_Am_4 = z_4 * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_4 = p_Am_4/ v;                   % J/cm^3, reserve capacity [E_m]
  g_4 = E_G/ (kap* E_m_4);             % -, energy investment ratio
  pars_tj4 = [g_4 k l_T v_Hb v_Hj v_Hp];
  % tetraploid males
  p_Am_4m = z_4m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_4m = p_Am_4m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_4m = E_G/ (kap* E_m_4m);             % -, energy investment ratio
  pars_tj4m = [g_4m k l_T v_Hb v_Hj v_Hp];

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = Ri;

  % time-length-weight
  % female 2n
  tvel = get_tj(pars_tj, f_tL, [], tL_fm2n(:,1)*kT_M);
  L = L_m * tvel(:,4); ELw_f2n = L/ del_M;   % cm, length 
  EWw_f2n = L.^3 .* (1 + ome * tvel(:,3)); % g, weight
  % male 2n
  tvel = get_tj(pars_tjm, f_tL, [0, f_tL*z/z_m, l_b*z/z_m], tL_fm2n(:,1)*kT_M);
  L = L_mm * tvel(:,4); ELw_m2n = L/ del_M; % cm, length 
  EWw_m2n = L.^3 .* (1 + ome_m * tvel(:,3)); % g, weight
  %
  % female 4n
  tvel = get_tj(pars_tj4, f_tL, [], tL_fm4n(:,1)*kT_M);
  L = L_m * tvel(:,4); ELw_f4n = L/ del_M;   % cm, length 
  EWw_f4n = L.^3 .* (1 + ome * tvel(:,3)); % g, weight
  % male 4n
  tvel = get_tj(pars_tj4m, f_tL, [0, f_tL*z/z_m, l_b*z/z_m], tL_fm4n(:,1)*kT_M);
  L = L_mm * tvel(:,4); ELw_m4n = L/ del_M;   % cm, length 
  EWw_m4n = L.^3 .* (1 + ome_m * tvel(:,3)); % g, weight
    
%% pack to output
  prdData.tL_fm2n = [ELw_f2n ELw_m2n];
  prdData.tL_fm4n = [ELw_f4n ELw_m4n];
  prdData.tW_fm2n = [EWw_f2n EWw_m2n];
  prdData.tW_fm4n = [EWw_f4n EWw_m4n];


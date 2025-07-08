function [prdData, info] = predict_Lacerta_agilis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.tLW, T_ref, T_A); kT_M = TC * k_M;
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  aT_p = t_p/ kT_M;                 % d, age at puberty at f and T
  L_p = L_m * l_p;                  % cm, struct length at puberty
  Ww_p = L_p^3 * (1 + f * ome);     % g, weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  Lw_im = f * L_mm/del_M;              % cm, max SVL       
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];% compose parameter vector

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
  % univar data
 
  % time-length-weight
  tvel = get_tp(pars_tp, f_tL, [], tLW(:,1) * k_M * TC);
  L = L_m * tvel(:,4); ELw = L/ del_M;   % cm, snout-vent length
  EWw = L.^3 * (1 + f_tL * ome); % g, wet weight
  %
  tvel = get_tp(pars_tp, f_tL, [0 1 l_b*z/z_m], (tL_fm(:,1)-t_0) * k_M * TC);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, snout-vent length
  %
  tvel = get_tp(pars_tpm, f_tL, [], (tL_fm(:,1)-t_0) * k_M * TC);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, snout-vent length
  
  % time-cum # eggs
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hp/TC]; % compose param vector
  EN = 365*reprod_rate(L, f_tL, pars_R); % #, number of eggs per yr

  % pack to output
  prdData.tLW = [ELw  EWw];  
  prdData.tN = EN;
  prdData.tL_fm = [ELw_f  ELw_m];  

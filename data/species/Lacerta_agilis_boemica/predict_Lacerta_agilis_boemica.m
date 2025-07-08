function [prdData, info] = predict_Lacerta_agilis_boemica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);  % a large number of compound params and scaled quantities are calculated (includig L_M used e.g. in L. 31)
  vars_pull(par); vars_pull(cPar); vars_pull(data); vars_pull(auxData); % unpack all variables from the different structures
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M; 
  TC_Ko = tempcorr(temp.tL_Kof, T_ref, T_A);  
  TC_Se = tempcorr(temp.tL_Sef, T_ref, T_A); 
  TC_Kh = tempcorr(temp.tL_Khf, T_ref, T_A);
  TC_Te = tempcorr(temp.tL_Tef, T_ref, T_A);
  TC_Ku = tempcorr(temp.tL_Kuf, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth at f and T

  % puberty 
  tT_p = (tau_p-tau_b)/ kT_M;       % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Ww_im = L_im^3 * (1 + f * ome_m);      % g, ultimate wet weight
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];% compose parameter vector

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % univar data 
    
  % time-length-weight
  tvel = get_tp(pars_tp, f_Ko, [], (tL_Kof(:,1)-t_0)*k_M*TC_Ko);
  ELw_Kof = L_m * tvel(:,4)/ del_M;   % cm, snout-vent length
  %
  tvel = get_tp(pars_tpm, f_Ko, [], (tL_Kom(:,1)-t_0)*k_M*TC_Ko);
  ELw_Kom = L_mm * tvel(:,4)/ del_M;  % cm, snout-vent length
  %
  tvel = get_tp(pars_tp, f_Se, [], (tL_Sef(:,1)-t_0)*k_M*TC_Se);
  ELw_Sef = L_m * tvel(:,4)/ del_M;   % cm, snout-vent length
  %
  tvel = get_tp(pars_tpm, f_Se, [], (tL_Sem(:,1)-t_0)*k_M*TC_Se);
  ELw_Sem = L_mm * tvel(:,4)/ del_M;  % cm, snout-vent length
  %
  tvel = get_tp(pars_tp, f_Kh, [], (tL_Khf(:,1)-t_0)*k_M*TC_Kh);
  ELw_Khf = L_m * tvel(:,4)/ del_M;   % cm, snout-vent length
  %
  tvel = get_tp(pars_tpm, f_Kh, [], (tL_Khm(:,1)-t_0)*k_M*TC_Kh);
  ELw_Khm = L_mm * tvel(:,4)/ del_M;  % cm, snout-vent length
  %
  tvel = get_tp(pars_tp, f_Te, [], (tL_Tef(:,1)-t_0)*k_M*TC_Te);
  ELw_Tef = L_m * tvel(:,4)/ del_M;   % cm, snout-vent length
  %
  tvel = get_tp(pars_tpm, f_Te, [], (tL_Tem(:,1)-t_0)*k_M*TC_Te);
  ELw_Tem = L_mm * tvel(:,4)/ del_M;  % cm, snout-vent length
  %
  tvel = get_tp(pars_tp, f_Ko, [], (tL_Kuf(:,1)-t_0)*k_M*TC_Ku);
  ELw_Kuf = L_m * tvel(:,4)/ del_M;   % cm, snout-vent length
  %
  tvel = get_tp(pars_tpm, f_Ko, [], (tL_Kum(:,1)-t_0)*k_M*TC_Ku);
  ELw_Kum = L_mm * tvel(:,4)/ del_M;  % cm, snout-vent length
  
  % pack to output
  prdData.tL_Kof = ELw_Kof;
  prdData.tL_Kom = ELw_Kom;
  prdData.tL_Sef = ELw_Sef;
  prdData.tL_Sem = ELw_Sem;
  prdData.tL_Khf = ELw_Khf;
  prdData.tL_Khm = ELw_Khm;
  prdData.tL_Tef = ELw_Tef;
  prdData.tL_Tem = ELw_Tem;
  prdData.tL_Kuf = ELw_Kuf;
  prdData.tL_Kum = ELw_Kum;
  
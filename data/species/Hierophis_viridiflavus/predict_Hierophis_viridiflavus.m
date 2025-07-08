function [prdData, info] = predict_Hierophis_viridiflavus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tLC = tempcorr(temp.tL_fC, T_ref, T_A);
  TC_tLM = tempcorr(temp.tL_fM, T_ref, T_A);
  TC_tLc = tempcorr(temp.tL_fc, T_ref, T_A);
      
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  
  % puberty 
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty at f

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  %
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_bm = L_mm * l_bm; Lw_bm = L_bm/ del_M; % cm, length at birth

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length

  % pack to output
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  % time-length
  % female C
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tLC, [], tL_fC(:,1)*k_M*TC_tLC);
  ELw_fC = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male C
  tvel = get_tpm(pars_tpm, f_tLC, [t_b, f_tLC*z/z_m, l_b*z/z_m], tL_mC(:,1)*k_M*TC_tLC);
  ELw_mC = L_mm * tvel(:,4)/ del_M;   % cm, length 
  % female M
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tLM, [], tL_fM(:,1)*k_M*TC_tLM);
  ELw_fM = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male M
  tvel = get_tpm(pars_tpm, f_tLM, [t_b, f_tLM*z/z_m, l_b*z/z_m], tL_mM(:,1)*k_M*TC_tLM);
  ELw_mM = L_mm * tvel(:,4)/ del_M;   % cm, length 
  % female c
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tLc, [], tL_fc(:,1)*k_M*TC_tLc);
  ELw_fc = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male c
  tvel = get_tpm(pars_tpm, f_tLc, [t_b, f_tLc*z/z_m, l_b*z/z_m], tL_mc(:,1)*k_M*TC_tLc);
  ELw_mc = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % pack to output
  prdData.tL_fC = ELw_fC;
  prdData.tL_mC = ELw_mC;
  prdData.tL_fM = ELw_fM;
  prdData.tL_mM = ELw_mM;
  prdData.tL_fc = ELw_fc;
  prdData.tL_mc = ELw_mc;


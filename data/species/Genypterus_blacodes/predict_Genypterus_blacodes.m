function [prdData, info] = predict_Genypterus_blacodes(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3*(1+f*ome);           % g, weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % weight-at-length
  Ww_118 = (118.8 * del_M)^3 * (1 + f * w);   % g, wet weight at 118.8 cm

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
  L_im = f * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ww118 = Ww_118;
  
  % uni-variate data
  
  % time-length northern Austral-zone
  % female 
  [tvel, t_p, t_b, l_p, l_b] = get_tpm(pars_tp, f_N, [], tL_fN(:,1)*kT_M);
  ELw_fN = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tpm(pars_tpm, f_N, [0, f_N*z/z_m, l_b*z/z_m], tL_mN(:,1)*kT_M);
  ELw_mN = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % time-length southern Austral-zone
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tpm(pars_tp, f_S, [], tL_fS(:,1)*kT_M);
  ELw_fS = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tpm(pars_tpm, f_S, [0, f_S*z/z_m, l_b*z/z_m], tL_mS(:,1)*kT_M);
  ELw_mS = L_mm * tvel(:,4)/ del_M;   % cm, length 
  
  % length-fecundity 
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector 
  EN_L = TC * 365 * reprod_rate(LN(:,1) * del_M, f, pars_R);
  EN_W = TC * 365 * reprod_rate((WN(:,1)/ (1 + f * w)).^(1/3), f, pars_R); 
  
  % pack to output
  prdData.tL_fN = ELw_fN;
  prdData.tL_fS = ELw_fS;
  prdData.tL_mN = ELw_mN;
  prdData.tL_mS = ELw_mS;
  prdData.LN = EN_L;
  prdData.WN = EN_W;
  
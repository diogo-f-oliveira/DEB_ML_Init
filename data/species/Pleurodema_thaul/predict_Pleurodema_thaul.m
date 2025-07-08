function [prdData, info] = predict_Pleurodema_thaul(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_Ch = tempcorr(temp.tL_fCh, T_ref, T_A);
  TC_Li = tempcorr(temp.tL_fLi, T_ref, T_A);
  TC_La = tempcorr(temp.tL_fLa, T_ref, T_A);
  TC_It = tempcorr(temp.tL_fIt, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length of tadpole
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, SVL at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate structural, body length
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];% compose parameter vector
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
    % time-length
  % female Ch
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_Ch, [], tL_fCh(:,1)*k_M*TC_Ch);
  ELw_fCh = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male Ch
  tvel = get_tpm(pars_tpm, f_Ch, [t_b, f_Ch*z/z_m, l_b*z/z_m], tL_mCh(:,1)*k_M*TC_Ch);
  ELw_mCh = L_mm * tvel(:,4)/ del_M;   % cm, length 
  % female Li
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_Li, [], tL_fLi(:,1)*k_M*TC_Li);
  ELw_fLi = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male Li
  tvel = get_tpm(pars_tpm, f_Li, [t_b, f_Li*z/z_m, l_b*z/z_m], tL_mLi(:,1)*k_M*TC_Li);
  ELw_mLi = L_mm * tvel(:,4)/ del_M;   % cm, length 
  % female La
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_La, [], tL_fLa(:,1)*k_M*TC_La);
  ELw_fLa = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male La
  tvel = get_tpm(pars_tpm, f_La, [t_b, f_La*z/z_m, l_b*z/z_m], tL_mLa(:,1)*k_M*TC_La);
  ELw_mLa = L_mm * tvel(:,4)/ del_M;   % cm, length 
  % female It
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_It, [], tL_fIt(:,1)*k_M*TC_It);
  ELw_fIt = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male It
  tvel = get_tpm(pars_tpm, f_It, [t_b, f_It*z/z_m, l_b*z/z_m], tL_mIt(:,1)*k_M*TC_It);
  ELw_mIt = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % pack to output
  prdData.tL_fCh = ELw_fCh;
  prdData.tL_fLi = ELw_fLi;
  prdData.tL_fLa = ELw_fLa;
  prdData.tL_fIt = ELw_fIt;
  prdData.tL_mCh = ELw_mCh;
  prdData.tL_mLi = ELw_mLi;
  prdData.tL_mLa = ELw_mLa;
  prdData.tL_mIt = ELw_mIt;
  
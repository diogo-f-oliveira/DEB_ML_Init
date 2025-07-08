function [prdData, info] = predict_Pseudorca_crassidens(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = TC * k_M;

  % foetal development
  pars_tp = [g; k; l_T; v_Hb; v_Hp];        % compose pars for get_tx
  pars_tx = [g; k; l_T; v_Hb; v_Hx; v_Hp];  % compose pars for get_tx
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f); % -, scaled age at puberty

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  tT_g = t_0 + t_b/ kT_M;           % d, gestation time at f and T

  % weaning
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at weaning at f and T

  % puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

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
  pars_tpm = [g_m k l_T v_Hb v_Hpm];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f, [t_b f*z/z_m l_b*z/z_m]);
  tT_pm = (t_pm - t_bm)/ kT_M;         % d, time since birth at puberty at f and T
  L_im = f * L_mm; L_bm = l_bm * L_mm; % cm, ultimate structural length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  Lw_im = L_im/ del_M;                 % cm, ultimate length

  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % un-variate data
  % time-length
  % female SA
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_SA, [], tL_fSA(:,1)*kT_M);
  ELw_fSA = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male SA
  tvel = get_tp(pars_tpm, f_SA, [t_b, f_SA*z/z_m, l_b*z/z_m], tL_mSA(:,1)*kT_M);
  ELw_mSA = L_mm * tvel(:,4)/ del_M;   % cm, length 
  % female J
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_J, [], tL_fJ(:,1)*kT_M);
  ELw_fJ = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male J
  tvel = get_tp(pars_tpm, f_J, [t_b, f_J*z/z_m, l_b*z/z_m], tL_mJ(:,1)*kT_M);
  ELw_mJ = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % pack to output
  prdData.tL_fSA = ELw_fSA;
  prdData.tL_mSA = ELw_mSA;  
  prdData.tL_fJ = ELw_fJ;  
  prdData.tL_mJ = ELw_mJ;
  
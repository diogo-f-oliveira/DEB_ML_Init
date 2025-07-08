function [prdData, info] = predict_Peltophryne_lemur(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % tadpole
  p_Am_b = z_b * p_M/ kap;         % J/d.cm^2, {p_Am} max spec assimilation flux for frog
  J_E_Am_b = p_Am_b/ mu_E;         % mol/d.cm^2, {J_EAm}, max surface-spec assimilation  for frog
  E_m_b = p_Am_b/ v;               % J/cm^3, [E_m] reserve capacity for frog
  m_Em_b = y_E_V * E_m_b/ E_G;     % mol/mol, reserve capacity for frog
  g_b = E_G/ kap/ E_m_b;           % -, energy investment ratio for frog
  w_b = m_Em_b * w_E/ w_V;         % -, contribution of reserve to weight for frog
  L_m_b = v/ k_M/ g_b;             % cm, maximum structural length for frog
  % maturity at birth
  M_Hb_b = E_Hb/ mu_E;               % mol, maturity at birth  
  U_Hb_b = M_Hb_b/ J_E_Am_b;             % cm^2 d, scaled maturity at birth
  V_Hb_b = U_Hb_b/ (1 - kap);          % cm^2 d, scaled maturity at birth
  v_Hb_b = V_Hb_b * g_b^2 * k_M^3/ v^2;  % -, scaled maturity at birth
  % maturity at metamorphosis
  M_Hj_b = E_Hj/ mu_E;               % mol, maturity at metamorphosis  
  U_Hj_b = M_Hj_b/ J_E_Am_b;             % cm^2 d, scaled maturity at metamorphosis
  V_Hj_b = U_Hj_b/ (1 - kap);          % cm^2 d, scaled maturity at metamorphosis
  v_Hj_b = V_Hj_b * g_b^2 * k_M^3/ v^2;  % -, scaled maturity at metamorphosis
  
  % life cycle for tadpole
  pars_tp = [g_b k l_T v_Hb_b v_Hj_b]; % for tadpole
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m_b * l_b;                % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total tadpole length at birth at f
  Ww_b = L_b^3 * (1 + f * w_b);     % g, wet weight at birth at f 
  aT_b = t_b/ kT_M;                 % d, age at birth at f and T

  % metam
  L_j = L_m_b * l_j;            % cm, structural length at metam at f
  Lw_j = L_j/ del_M;            % cm, total tadpole length at metam at f
  Lw_jb = L_j/ del_Mj;          % cm, frog SVL at metam at f
  Ww_j = L_j^3 * (1 + f * w_b); % g, wet weight at puberty 
  tT_j = (t_j - t_b)/ kT_M;     % d, time since birth at puberty at f and T
  
  % ultimate for tadpole (for tL-data)
  Lw_bi = f * L_m_b/ del_M;

  % puberty for toad
  pars_tp = [g; k; l_T; v_Hj; v_Hp]; % compose parameter vector
  [t_p, t_jb, l_p, l_jb] = get_tp(pars_tp, f, L_j/ L_m); % -, scaled length at birth at f
  L_p = L_m * l_p;               % cm, structural length at puberty at f
  Lw_p = L_p/ del_Mj;            % cm, frog SVL at puberty at f
  Ww_p = L_p^3 * (1 + f * w);    % g, wet weight at puberty 
  tT_p = (t_p - t_jb)/ kT_M;     % d, time time metam at puberty at f and T
  
  % ultimate for toad
  l_i = f - l_T;                  % -, scaled ultimate length at f
  L_i = L_m * l_i;                % cm, ultimate structural length at f
  Lw_i = L_i/ del_Mj;             % cm, ultimate frog SVL at f
  Ww_i = L_i^3 * (1 + f * w);     % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                  % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                 % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_txm = [g_m k l_T v_Hb v_Hj v_Hp]; 
  [t_pm, t_xm, t_bm, l_pm, l_xm, l_bm] = get_tx(pars_txm, f_tW);
  L_bm = L_mm * l_bm; L_im = (f - l_T) * L_mm; Lw_im = L_im/ del_M;
  Ww_im = L_im^3 * (1 + f * w_m);
  pars_tpm = [g_m k l_T v_Hb v_Hp]; 

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Ljb = Lw_jb;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
    
  % uni-variate data
  
  % time-weight
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tW, [], tW_f(:,1)*kT_M);
  EWw_f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male
  tvel = get_tpm(pars_tpm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], tW_m(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  % pack to output
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;


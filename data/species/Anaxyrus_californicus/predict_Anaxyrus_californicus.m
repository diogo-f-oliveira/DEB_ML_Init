function [prdData, info] = predict_Anaxyrus_californicus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
  
  % zero-variate data
  
  % life cycle for tadpole
  pars_tj = [g k l_T v_Hb v_Hj]; % for tadpole
  [t_j, t_b, l_j, l_b] = get_tp(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);     % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;          % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;              % cm, structural length at puberty at f
  Lw_j = L_j/ del_M;            % cm, SVL at puberty at f
  Ww_j = L_j^3 * (1 + f * w);   % g, wet weight at puberty 
  tT_j = (t_j - t_b)/ k_M/ TC_tj; % d, time since birth at puberty at f and T
  
  % puberty for toad
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled length at birth at f
  L_p = L_m * l_p;               % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;             % cm, SVL at puberty at f
  tT_p = (t_p - t_j)/ k_M/ TC;   % d, time time metam at puberty at f and T
  
  % ultimate for toad
  l_i = f - l_T;                  % -, scaled ultimate length at f
  L_i = L_m * l_i;                % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;              % cm, ultimate SVL at f
  Ww_i = L_i^3 * (1 + f * w);     % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

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
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_pm = l_pm * L_mm; L_im = f * L_mm; % cm, struct length, birth & ultimate
  Lw_bm = L_mm * l_bm/ del_M; Lw_im = L_im/ del_M;
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
    

  % time-weight
  L_j = L_m * get_lp(pars_tj, f_tL); L_i = L_m * f_tL; r_B = k_M/ 3/ (1 + f_tL/ g);
  L = L_i - (L_i - L_j) * exp(-TC_tL * r_B * tL_f(:,1)); 
  ELw_f = L/ del_M; % cm, SVL
  %
  pars_tjm = [g_m k l_T v_Hb v_Hj];
  L_jm = L_mm * get_lp(pars_tjm, f_tL); L_im = L_mm * f_tL; r_Bm = k_M/ 3/ (1 + f_tL/ g_m);
  L = L_im - (L_im - L_jm) * exp(-TC_tL * r_Bm * tL_m(:,1)); 
  ELw_m = L/ del_M; % cm, SVL

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
end


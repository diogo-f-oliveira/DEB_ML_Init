function [prdData, info] = predict_Darevskia_derjugini(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_H = tempcorr(temp.tL_Hfm, T_ref, T_A);
  TC_L = tempcorr(temp.tL_Lfm, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, weight at birth

  % puberty 
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

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
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate struct, SVL
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, SVL at puberty
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  % time-SVL
  L_b = L_m * get_lb([g k v_Hb], f_H); L_i = f_H * L_m;
  rT_B = TC_H * k_M/ 3/ (1 + f_H/ g); % 1/d, von Bert growth rate
  ELw_Hf = (L_i - (L_i - L_b) * exp( - rT_B * tL_Hfm(:,1)))/ del_M; % cm, SVL 
  %
  L_bm = L_mm * get_lb([g_m k v_Hb], f_H); L_im = f_H * L_mm;
  rT_Bm = TC_H * k_M/ 3/ (1 + f_H/ g_m); % 1/d, von Bert growth rate
  ELw_Hm = (L_im - (L_im - L_bm) * exp( - rT_Bm * tL_Hfm(:,1)))/ del_M; % cm, SVL 
   %
  L_b = L_m * get_lb([g k v_Hb], f_L); L_i = f_L * L_m;
  rT_B = TC_L * k_M/ 3/ (1 + f_L/ g); % 1/d, von Bert growth rate
  ELw_Lf = (L_i - (L_i - L_b) * exp( - rT_B * tL_Lfm(:,1)))/ del_M; % cm, SVL 
  %
  L_bm = L_mm * get_lb([g_m k v_Hb], f_L); L_im = f_L * L_mm;
  rT_Bm = TC_L * k_M/ 3/ (1 + f_L/ g_m); % 1/d, von Bert growth rate
  ELw_Lm = (L_im - (L_im - L_bm) * exp( - rT_Bm * tL_Lfm(:,1)))/ del_M; % cm, SVL 

  % pack to output
  prdData.tL_Hfm = [ELw_Hf ELw_Hm];
  prdData.tL_Lfm = [ELw_Lf ELw_Lm];


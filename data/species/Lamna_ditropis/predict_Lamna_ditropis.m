function [prdData, info] = predict_Lamna_ditropis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  kT_M = k_M * TC; 

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp_foetus(pars_tp, f);
  if info == 0
    prdData = []; return;
  end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, fork length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, fork length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate fork length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

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
  L_im = L_mm * (f - l_T); Lw_im = L_im/del_M;      % cm, max total length
  pars_tpm = [g_m k l_T v_Hb v_Hpm];    % pars for males
  [t_pm t_bm l_pm] = get_tp(pars_tpm, f);
  L_pm = L_mm * l_pm;  Lw_pm = L_pm/ del_M; % cm, total length at puberty
  Ww_pm = L_pm^3 * (1 + f * w_m);      % g, wet weight at puberty
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  tT_pm = (t_pm - t_bm)/ k_M/ TC;      % d, time since birth at puberty
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length: females post birth
  rT_B = kT_M/ 3/ (1 + f_tLW/ g); Lw_b = L_m * get_lb([g k v_Hb], f_tLW)/ del_M; Lw_i = L_m * f_tLW/ del_M;
  ELw_Wf = Lw_i - (Lw_i - Lw_b) * exp(- rT_B * tL_Wf(:,1)); % cm, total length
  % time-length: males post birth
  rT_Bm = kT_M/ 3/ (1 + f_tLW/ g_m); Lw_bm = L_mm * get_lb([g_m k v_Hb], f_tLW)/ del_M; Lw_im = L_mm * f_tLW/ del_M;
  ELw_Wm = Lw_im - (Lw_im - Lw_bm) * exp(- rT_Bm * tL_Wm(:,1)); % cm, total length
  %
  rT_B = kT_M/ 3/ (1 + f_tLE/ g); Lw_b = L_m * get_lb([g k v_Hb], f_tLE)/ del_M; Lw_i = L_m * f_tLE/ del_M;
  ELw_Ef = Lw_i - (Lw_i - Lw_b) * exp(- rT_B * tL_Ef(:,1)); % cm, total length
  % time-length: males post birth
  rT_Bm = kT_M/ 3/ (1 + f_tLE/ g_m); Lw_bm = L_mm * get_lb([g_m k v_Hb], f_tLE)/ del_M; Lw_im = L_mm * f_tLE/ del_M;
  ELw_Em = Lw_im - (Lw_im - Lw_bm) * exp(- rT_Bm * tL_Em(:,1)); % cm, total length

  % pack to output
  prdData.tL_Wf = ELw_Wf;
  prdData.tL_Wm = ELw_Wm;
  prdData.tL_Ef = ELw_Ef;
  prdData.tL_Em = ELw_Em;
  
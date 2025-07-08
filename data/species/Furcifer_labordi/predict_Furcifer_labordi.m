function [prdData, info] = predict_Furcifer_labordi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ni = tempcorr(temp.Ni, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
    
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_0 + tau_b/ k_M/ TC_ab;     % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  tT_p = (tau_p - tau_b)/ k_M/ TC_tp; % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_bm = L_mm * l_bm; Lw_bm = L_bm/ del_M; % cm, length at birth

  % life span
  pars_tm = [pars_tp; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm(pars_tm, f);             % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % life time reproductive output
  kT_M = TC_Ni * k_M; kT_J = TC_Ni * k_J; vT = TC_Ni * v; UT_Hb = U_Hb/ TC_Ni; UT_Hp = U_Hp/ TC_Ni;
  pars_R = [kap; kap_R; g; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hp]; % compose parameter vector at T
  NT_i = cum_reprod(aT_m, f, pars_R);             % #, life time reproductive output

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  
  % univar data
  
  % time-length
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f, [], tL_f(:,1)*k_M*TC_tL);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tpm(pars_tpm, f, [t_b, f*z/z_m, l_b*z/z_m], tL_m(:,1)*k_M*TC_tL);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;

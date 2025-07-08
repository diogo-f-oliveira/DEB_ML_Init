function [prdData, info] = predict_Darevskia_dryada(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, age at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, SVL at puberty

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
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  Lw_im = f * L_mm/ del_M;             % cm, ultimate SVL                

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-SVL
  pars_lb = [g k v_Hb]; pars_lbm = [g_m k v_Hb];
  %
  L_b = L_m * get_lb(pars_lb, f_tL); L_i = f_tL * L_m;
  ir_B = 3/ k_M + 3 * L_i/ v; rT_B = TC/ ir_B; % yr, 1/von Bert growth rate
  ELw_f = (L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)))/ del_M; % cm, SVL f_Ko
  %
  L_bm = L_mm * get_lb(pars_lbm, f_tL); L_im = f_tL * L_mm;
  ir_B = 3/ k_M + 3 * L_im/ v; rT_B = TC/ ir_B; % yr, 1/von Bert growth rate
  ELw_m = (L_im - (L_im - L_bm) * exp( - rT_B * tL(:,1)))/ del_M; % cm, SVL f_Ko

  % pack to output
  prdData.tL = [ELw_f ELw_m];


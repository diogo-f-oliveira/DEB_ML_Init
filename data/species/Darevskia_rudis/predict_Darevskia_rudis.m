function [prdData, info] = predict_Darevskia_rudis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_A = tempcorr(temp.tL_A, T_ref, T_A);
  TC_B = tempcorr(temp.tL_B, T_ref, T_A);
  TC_C = tempcorr(temp.tL_C, T_ref, T_A);
  
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
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data  
  % time-SVL
  L_b = L_m * get_lb([g k v_Hb], f_A); L_i = f_A * L_m;
  rT_B = TC_A * k_M/ 3/ (1 + f_A/ g); % 1/d, von Bert growth rate
  ELw_Af = (L_i - (L_i - L_b) * exp( - rT_B * tL_A(:,1)))/ del_M; % cm, SVL
  %
  L_bm = L_mm * get_lb([g_m k v_Hb], f_A); L_im = f_A * L_mm;
  rT_Bm = TC_A * k_M/ 3/ (1 + f_A/ g_m); % 1/d, von Bert growth rate
  ELw_Am = (L_im - (L_im - L_bm) * exp( - rT_B * tL_A(:,1)))/ del_M; % cm, SVL
  %
  L_b = L_m * get_lb([g k v_Hb], f_B); L_i = f_B * L_m;
  rT_B = TC_B * k_M/ 3/ (1 + f_B/ g); % 1/d, von Bert growth rate
  ELw_Bf = (L_i - (L_i - L_b) * exp( - rT_B * tL_B(:,1)))/ del_M; % cm, SVL
  %
  L_bm = L_mm * get_lb([g_m k v_Hb], f_B); L_im = f_B * L_mm;
  rT_Bm = TC_B * k_M/ 3/ (1 + f_B/ g_m); % 1/d, von Bert growth rate
  ELw_Bm = (L_im - (L_im - L_bm) * exp( - rT_B * tL_B(:,1)))/ del_M; % cm, SVL
  %
  L_b = L_m * get_lb([g k v_Hb], f_C); L_i = f_B * L_m;
  rT_B = TC_C * k_M/ 3/ (1 + f_C/ g); % 1/d, von Bert growth rate
  ELw_Cf = (L_i - (L_i - L_b) * exp( - rT_B * tL_C(:,1)))/ del_M; % cm, SVL
  %
  L_bm = L_mm * get_lb([g_m k v_Hb], f_C); L_im = f_C * L_mm;
  rT_Bm = TC_C * k_M/ 3/ (1 + f_C/ g_m); % 1/d, von Bert growth rate
  ELw_Cm = (L_im - (L_im - L_bm) * exp( - rT_B * tL_C(:,1)))/ del_M; % cm, SVL

  % pack to output
  prdData.tL_A = [ELw_Af ELw_Am];
  prdData.tL_B = [ELw_Bf ELw_Bm];
  prdData.tL_C = [ELw_Cf ELw_Cm];


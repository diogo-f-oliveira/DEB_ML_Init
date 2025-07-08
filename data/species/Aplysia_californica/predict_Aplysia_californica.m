function [prdData, info] = predict_Aplysia_californica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  
  % zero-variate data

  % life cycle in 2 steps: std before start acceleration and abj after, with another z, starting at s, rather than b
  
  % first part of life cycle with zoom factor z_b
  % maturity at birth
  p_Amb = z_b * p_M/ kap;           % J/d.cm^2, {p_Am} max spec assimilation flux
  J_E_Amb = p_Amb/ mu_E;            % mol/d.cm^2, {J_EAm}, max surface-spec assimilation flux
  U_Hbb = E_Hb/ mu_E/ J_E_Amb;      % cm^2 d, scaled maturity at birth
  V_Hbb = U_Hbb/ (1 - kap);         % cm^2 d, scaled maturity at birth
  v_Hbb = V_Hbb * g^2 * k_M^3/ v^2; % -, scaled maturity at birth
  % maturity at start acceleration
  U_Hsb = E_Hs/ mu_E/ J_E_Amb;      % cm^2 d, scaled maturity at start acceleration
  V_Hsb = U_Hsb/ (1 - kap);         % cm^2 d, scaled maturity at start acceleration
  v_Hsb = V_Hsb * g^2 * k_M^3/ v^2; % -, scaled maturity at start acceleration
  %
  pars_tp = [g k l_T v_Hbb v_Hsb];
  [t_s, t_b, l_s, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = z_b * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mb;               % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % settlement (start of acceleration)
  L_s = z_b * l_s;                  % cm, structural length at start acceleration
  Lw_s = L_s/ del_M;                % cm, total length at start accel
  Ww_s = L_s^3 * (1 + f * w);       % g, wet weight at start accel
  tT_s = t_s/ k_M/ TC;              % d, time since birth at start accel
  
  % second part of life cycle (s plays the role of b) with zoom factor z
  pars_tj = [g k l_T v_Hs v_Hj v_Hp];
  [t_j, t_p, t_s, l_j, l_p, l_s, l_i, rho_j, rho_B] = get_tj(pars_tj, f);

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (t_j - t_s)/ k_M/ TC;      % d, time since settlement at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3  * (1 + f * w);      % g, wet weight at puberty 
  tT_p = (t_p - t_s)/ k_M/ TC;      % d, time since settlement at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  l = (2600/ (1 + f * w))^(1/ 3)/ L_m; v_E0 = get_ue0([g; k; v_Hb], f)/ (1 - kap);
  RT_i = TC * kap_R * (f * l^2/ (f + g) * (g + l_T + l) - k * v_Hp)/ v_E0; % #/d, reprod rate for 2.6 kg

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ts = tT_s;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Ls = Lw_s;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wws = Ww_s;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; L_ib = f * z_b;    
  L_bs = L_ib - (L_ib - L_b) * exp( - rT_B * tL((tL(:,1) < tT_s),1));  
  L_sj = L_s * exp((tL((tL(:,1) >= tT_s) & (tL(:,1) < tT_j),1) - tT_s) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) >= tT_j),1) - tT_j)); % cm, expected length at time
  ELw = [L_bs; L_sj; L_jm]/ del_M;   % cm, body length

  % time-weight 
  L_bs = L_ib - (L_ib - L_b) * exp( - rT_B * tW((tW(:,1) < tT_s),1));  
  L_sj = L_s * exp((tW((tW(:,1) >= tT_s) & (tW(:,1) < tT_j),1) - tT_s) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tW((tW(:,1) >= tT_j),1) - tT_j)); % cm, expected length at time
  L = [L_bs; L_sj; L_jm]; EWw = L.^3 * (1 + f * w);   % g, wet weight
  
  % time-eggs
  
  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;
  
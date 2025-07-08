function [prdData, info] = predict_Larimichthys_polyactis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_WN = tempcorr(temp.WN, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
   
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T
  
  % metamorphosis
  s_M = l_j/ l_b;                   % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);   % #/d, ultimate reproduction rate at T
  
  GSI = TC_GSI * 365 * k_M * g/ f.^3./ (f + kap * g * y_V_E);  % see eqn 2 LikaKooy2014
  GSI = GSI .* ((1 - kap) * f.^3 - ...
  k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W, gonado-somatic index at fsub
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length post metam
  f = f_tL; % here f_tL is the data of line 31 (par.f_tL = 0.57) from pars_init_..m, but not par.f = 1 on line 30
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC_tL; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j)); % cm, structural length
  ELw = L/ del_M; % cm, total length  
  % time-weight
  EWw = (L_i - (L_i - L_j * del_M) * exp( - rT_B * tW(:,1))).^3 * (1 + f_tL * w); % g, wet weight
   
  % length-weight
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

  % weight-yearly fecundity
  L = (WN(:,1)./ (1 + f * w)).^(1/3);   % cm, structural length
  EN = TC_WN * 365 * reprod_rate_j(L, f, pars_R);  % #, yearly fecundity
  
  % pack to output
  prdData.tL = ELw;  % time (day) vs length (cm)
  prdData.tW = EWw;  % time (day) vs wet weight (g)
  prdData.LW = EWw_L;  % length (cm) vs wet weight (g)
  prdData.WN = EN;  % wet weight vs fecundity


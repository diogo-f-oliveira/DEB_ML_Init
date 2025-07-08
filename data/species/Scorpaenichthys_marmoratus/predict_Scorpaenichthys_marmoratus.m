function [prdData, info] = predict_Scorpaenichthys_marmoratus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                 % cm, structural length at metam
  Lw_j = L_j/ del_M;               % cm, physical length at metam
  aT_j = t_j/ k_M/ TC_tL;          % d, age at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Amm = z_m * p_M/ kap;              % J/d.cm^2, {p_Am} max spec assimilation flux for males
  E_mm = p_Amm/ v;                     % J/cm^3, [E_m] reserve capacity for males
  g_m = E_G/ kap/ E_mm;                % -, energy investment ratio for males
  L_mm = v/ k_M/ g_m;                  % cm, maximum structural length for males
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-length
  % post metam
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], (tL(:,1)-t_0)*k_M*TC_tL);
  ELw = L_m * tvel(:,4)/ del_M;   % cm, length
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_f(:,1)*k_M*TC_tL);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  [tvel t_jm, t_pm, t_bm, l_jm, l_pm] = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m], tL_m(:,1)*k_M*TC_tL);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w);                     % g, expected wet weight at time

  % fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  L = (WN(:,1)/ (1 + f * w)).^(1/3);
  EN = 365 * TC_tL * reprod_rate_j(L, f, pars_R);               % #/d, ultimate reproduction rate at T

  % pack to output
  prdData.apm = t_pm/ k_M/ TC_ap;  
  prdData.Lpm = L_mm * l_pm/ del_M;
  prdData.tL = ELw;
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LW = EWw;
  prdData.WN = EN;
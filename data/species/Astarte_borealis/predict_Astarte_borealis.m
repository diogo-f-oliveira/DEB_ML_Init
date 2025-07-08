function [prdData, info] = predict_Astarte_borealis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b,  info] = get_tp(pars_tp, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * f;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, max reproduction rate
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length post metam
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL; rT_B = kT_M/ 3/ (1 + f_tL/ g);
  L = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)); % cm, struc length
  ELw = L/ del_M;% cm, shell height
  %
  L_b = L_m * get_lb([g k v_Hb], f_tL1); L_i = L_m * f_tL1; rT_B = kT_M/ 3/ (1 + f_tL1/ g);
  L = L_i - (L_i - L_b) * exp( - rT_B * tL1(:,1)); % cm, struc length
  ELw_1 = L/ del_M;% cm, shell height
  
  % pack to output
  prdData.tL = ELw;
  prdData.tL1 = ELw_1;
 
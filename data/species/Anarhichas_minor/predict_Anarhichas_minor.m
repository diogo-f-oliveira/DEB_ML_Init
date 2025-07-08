function [prdData, info] = predict_Anarhichas_minor(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if T_L > T_ref || T_H < T_ref
    info = 0; prdData = {}; return;
  end  


  % compute temperature correction factors
  pars_T = [T_A, T_L, T_H, T_AL, T_AH];
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_ap = tempcorr(temp.ap, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  TC_12 = tempcorr(temp.tW12, T_ref, pars_T);
  TC_8  = tempcorr(temp.tW8, T_ref, pars_T);
  TC_6  = tempcorr(temp.tW6, T_ref, pars_T);
  TC_4  = tempcorr(temp.tW4, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  % time-weight post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tW);
  L_i = l_i * L_m;  L_0 = (Ww_0/ (1 + f * f_tW))^(1/3); r_B = k_M * rho_B;
  L = L_i - (L_i - L_0) * exp( - TC_12 * r_B * tW12(:,1)); % cm, struc length
  EWw_12 = L.^3 * (1 + f_tW * w);       % g, wet weight 
  %
  L = L_i - (L_i - L_0) * exp( - TC_8 * r_B * tW8(:,1)); % cm, struc length
  EWw_8 = L.^3 * (1 + f_tW * w);       % g, wet weight 
  %
  L = L_i - (L_i - L_0) * exp( - TC_6 * r_B * tW6(:,1)); % cm, struc length
  EWw_6 = L.^3 * (1 + f_tW * w);       % g, wet weight 
  %
  L = L_i - (L_i - L_0) * exp( - TC_4 * r_B * tW4(:,1)); % cm, struc length
  EWw_4 = L.^3 * (1 + f_tW * w);       % g, wet weight 

  % pack to output
  prdData.tW12 = EWw_12;
  prdData.tW8  = EWw_8;
  prdData.tW6  = EWw_6;
  prdData.tW4  = EWw_4;


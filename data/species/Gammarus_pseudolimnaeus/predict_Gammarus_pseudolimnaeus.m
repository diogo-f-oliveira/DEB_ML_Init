function [prdData, info] = predict_Gammarus_pseudolimnaeus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_19 = tempcorr(temp.LN_19, T_ref, T_A);
  TC_18 = tempcorr(temp.LN_18, T_ref, T_A);
  TC_16 = tempcorr(temp.LN_16, T_ref, T_A);
  TC_13 = tempcorr(temp.LN_13, T_ref, T_A);
  TC_12 = tempcorr(temp.LN_12, T_ref, T_A);
  TC_112 = tempcorr(temp.LN_112, T_ref, T_A);
  TC_11 = tempcorr(temp.LN_11, T_ref, T_A);
  TC_6 = tempcorr(temp.LN_6, T_ref, T_A);
  TC_3 = tempcorr(temp.LN_3, T_ref, T_A);
  TC_0 = tempcorr(temp.LN_0, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, L_j, l_p, l_b, l_i, rho_i, rho_B, info] = get_tj(pars_tj, f);
  
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

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
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % length-reprod 
  EN_19 = TC_19 * 365/3 * reprod_rate_j(LN_19(:,1) * del_M, f_LN_19, pars_R);
  EN_18 = TC_18 * 365/3 * reprod_rate_j(LN_18(:,1) * del_M, f_LN_18, pars_R);
  EN_16 = TC_16 * 365/3 * reprod_rate_j(LN_16(:,1) * del_M, f_LN_16, pars_R);
  EN_13 = TC_13 * 365/3 * reprod_rate_j(LN_13(:,1) * del_M, f_LN_13, pars_R);
  EN_12 = TC_12 * 365/3 * reprod_rate_j(LN_12(:,1) * del_M, f_LN_12, pars_R);
  EN_112 = TC_112 * 365/3 * reprod_rate_j(LN_112(:,1) * del_M, f_LN_112, pars_R);
  EN_11 = TC_11 * 365/3 * reprod_rate_j(LN_11(:,1) * del_M, f_LN_11, pars_R);
  EN_6  = TC_6 * 365/3 * reprod_rate_j(LN_6(:,1) * del_M, f_LN_6, pars_R);
  EN_3  = TC_3 * 365/3 * reprod_rate_j(LN_3(:,1) * del_M, f_LN_3, pars_R);
  EN_0  = TC_0 * 365/3 * reprod_rate_j(LN_0(:,1) * del_M, f_LN_0, pars_R);
  
  % pack to output
  prdData.LN_19 = EN_19;
  prdData.LN_18 = EN_18;
  prdData.LN_16 = EN_16;
  prdData.LN_13 = EN_13;
  prdData.LN_12 = EN_12;
  prdData.LN_112 = EN_112;
  prdData.LN_11 = EN_11;
  prdData.LN_6 = EN_6;
  prdData.LN_3 = EN_3;
  prdData.LN_0 = EN_0;
  
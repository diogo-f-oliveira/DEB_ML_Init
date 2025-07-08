function [prdData, info] = predict_Romanogobio_albipinnatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); 
  TC_20 = tempcorr(temp.tL20, T_ref, T_A); 
  TC_16 = tempcorr(temp.tL16, T_ref, T_A); 
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_A); 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

      
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  a_b = t_b/ k_M;                   % d, age at birth at T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];    % compose parameter vector
  Ri = TC * reprod_rate_j(L_i, f, pars_R);                 % #/d, reprod rate at max length

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = Ri;

  % univariate data
  % time-length/weight
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tW); kT_M = TC_20 * k_M;
  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tL20(tL20(:,1) <= tT_j, 1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL20(tL20(:,1) > tT_j,1) - tT_j)); % cm, structural length
  ELw_20 = [L_bj; L_ji]/ del_M;
  %
  L_bj = L_b * exp(rT_j * tW20(tW20(:,1) <= tT_j, 1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tW20(tW20(:,1) > tT_j,1) - tT_j)); % cm, structural length
  EWw_20 = [L_bj; L_ji].^3 * (1 + f_tW * w);
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tW); kT_M = TC_16 * k_M;
  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(rT_j * tL16(tL16(:,1) <= tT_j, 1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL16(tL16(:,1) > tT_j,1) - tT_j)); % cm, structural length
  ELw_16 = [L_bj; L_ji]/ del_M;
  %
  L_bj = L_b * exp(rT_j * tW16(tW16(:,1) <= tT_j, 1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tW16(tW16(:,1) > tT_j,1) - tT_j)); % cm, structural length
  EWw_16 = [L_bj; L_ji].^3 * (1 + f_tW * w);

  % temp-incub time
  EaT_b = a_b ./ TC_ab;
  
  prdData.tL20 = ELw_20;
  prdData.tL16 = ELw_16;
  prdData.tW20 = EWw_20;
  prdData.tW16 = EWw_16;
  prdData.Tab = EaT_b;
  
end
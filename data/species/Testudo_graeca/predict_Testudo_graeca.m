function [prdData, info] = predict_Testudo_graeca(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_25 = tempcorr(temp.ab_25, T_ref, T_A);
  TC_31 = tempcorr(temp.ab_31, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  a_b = t_b/ k_M; a25_b = a_b/ TC_25; a31_b = a_b/ TC_31; % d, age at birth at f and T

  % puberty 
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab_25 = a25_b;
  prdData.ab_31 = a31_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  kT_M = k_M * TC; rT_B = kT_M/ 3/ (1 + f/ g); 
  L= L_i - (L_i - L_b) * exp (- rT_B * tW(:,1)); % cm, struct langth
  EWw = L.^3 * (1 + f * w); % g, wet weight

  % pack to output
  prdData.tW = EWw;

function [prdData, info] = predict_Radix_natalensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_30 = tempcorr(temp.ab30, T_ref, T_A);
  TC_25 = tempcorr(temp.ab25, T_ref, T_A);
  TC_20 = tempcorr(temp.ab20, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  a30_b = t_0 + tau_b/ k_M/ TC_30;  % d, age at birth at f and T
  a25_b = t_0 + tau_b/ k_M/ TC_25;  % d, age at birth at f and T
  a20_b = t_0 + tau_b/ k_M/ TC_20;  % d, age at birth at f and T
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_25 * reprod_rate_j(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T
  
  % pack to output
  prdData.ab30 = a30_b;
  prdData.ab25 = a25_b;
  prdData.ab20 = a20_b;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_25; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(rT_j * tL(tL(:,1)<tT_j,1)/ 3); 
  L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tL(tL(:,1)>=tT_j,1) - tT_j)); % cm, struc length
  ELw = [L_bj; L_ji]/del_M;

  % time - survival: Eq (6.5) of Kooy2010 for short growth periods, e = 1, L = L_i, 20C
  h3_W = TC_30 * h_a * v/ 6/ L_i; h_G = TC_30 * s_G * v/ L_i; h3_G = h_G^3; th_G = h_G * tS30(:,1);
  ES_30 = exp(6 * h3_W/ h3_G * (1 - exp(th_G) + th_G + th_G.^2/ 2));
  %
  h3_W = TC_25 * h_a * v/ 6/ L_i; h_G = TC_30 * s_G * v/ L_i; h3_G = h_G^3; th_G = h_G * tS25(:,1);
  ES_25 = exp(6 * h3_W/ h3_G * (1 - exp(th_G) + th_G + th_G.^2/ 2));
  %
  h3_W = TC_20 * h_a * v/ 6/ L_i; h_G = TC_30 * s_G * v/ L_i; h3_G = h_G^3; th_G = h_G * tS20(:,1);
  ES_20 = exp(6 * h3_W/ h3_G * (1 - exp(th_G) + th_G + th_G.^2/ 2));

  % pack to output
  prdData.tL = ELw;
  prdData.tS30 = ES_30;
  prdData.tS25 = ES_25;
  prdData.tS20 = ES_20;
end

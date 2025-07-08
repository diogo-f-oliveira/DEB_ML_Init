function [prdData, info] = predict_Ariolimax_columbianus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty 
  Ww_p = L_p^3 * (1 + f * ome);     % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at 20 C
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span
  aT_m = t_m/ k_M/ TC;                  % d, mean life span

  % pack to output
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  % time-weight
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tWw);
  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tWw((tWw(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWw((tWw(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  EWw = [L_bj; L_jm].^3 * (1 + f_tWw * ome);               % g, wet weight

  % pack to output
  prdData.tWw = EWw;
 
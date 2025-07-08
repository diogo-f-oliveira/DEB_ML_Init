function [prdData, info] = predict_Platax_orbicularis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  aT_b = t_b/ kT_M;                 % d, age at birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  
  % metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  L_j = l_j * L_m;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam at f
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
   
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];         % compose parameter vector at T
  RT_i = 365 * TC * reprod_rate_j(L_i, f, pars_R);                           % #/d, fecundity

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  
  % time-weight
  f = f_tL; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  L_b = L_m * l_b; L_i = L_m * l_i; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; 
  L_bj = L_b * exp(tW(tW(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tW(tW(:,1) >= tT_j,1) - tT_j)); % cm, expected length at time
  EWw = [L_bj; L_ji].^3 * (1 + f * w); % g, wet weight
  
  %% pack to output
  prdData.tW = EWw;


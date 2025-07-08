function [prdData, info] = predict_Hippoglossus_stenolepis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
          
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.tp, T_ref, T_A);
  kT_M = k_M * TC; 
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  % metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam at f and T
  s_M = l_j/l_b;
  %v * s_M

  % puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                   % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  % tL for late juveniles and adults
  f = f_tL; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_j = l_j * L_m; L_i = l_i * L_m; tT_j = (t_j - t_b)/ kT_M; rT_B = rho_B * kT_M;  
  ELw = (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j)))/ del_M; % cm, total length at time
  % time-weight
  L = L_i - (L_i - L_j) * exp( - rT_B * (tW(:,1) - tT_j)); % cm, structural length at time
  EWw = L.^3 * (1 + f * w); % g, wet weight

  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;
  
end

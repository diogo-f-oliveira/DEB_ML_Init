function [prdData, info] = predict_Paracottus_knerii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_A = tempcorr(temp.tL_A, T_ref, T_A); 
  TC_B = tempcorr(temp.tL_B, T_ref, T_A); 
  TC_S = tempcorr(temp.tL_S, T_ref, T_A); 

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                 % cm, structural length at birth
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f

  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;               % d, mean life span at T


  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;

  % uni-variate data
  
  % time-length/weight 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_A);
  kT_M = k_M * TC_A; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_A(tL_A(:,1) < tT_j,1) * rT_j/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_A(tL_A(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_A = [L_bj; L_ji]/ del_M; % cm, total length
  EWw_A = [L_bj; L_ji].^3 * (1 + f_A * w); % g, wet weight
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_B);
  kT_M = k_M * TC_B; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_B(tL_B(:,1) < tT_j,1) * rT_j/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_B(tL_B(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_B = [L_bj; L_ji]/ del_M; % cm, total length
  EWw_B = [L_bj; L_ji].^3 * (1 + f_B * w); % g, wet weight
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_S);
  kT_M = k_M * TC_S; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_S(tL_S(:,1) < tT_j,1) * rT_j/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_S(tL_S(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_S = [L_bj; L_ji]/ del_M; % cm, total length
  EWw_S = [L_bj; L_ji].^3 * (1 + f_S * w); % g, wet weight

  
  
  % pack to output
  prdData.tL_A = ELw_A;
  prdData.tL_B = ELw_B;
  prdData.tL_S = ELw_S;
  prdData.tW_A = EWw_A;
  prdData.tW_B = EWw_B;
  prdData.tW_S = EWw_S;
  
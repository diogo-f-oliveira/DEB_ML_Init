function [prdData, info] = predict_Thymallus_tugarinae(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


   
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b.^3 * (1 + f * w);      % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;

  %% uni-variate data
  
  % time-length/weight
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_A);
  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp( rT_j * tL_Anyui(tL_Anyui(:,1) < tT_j,1)/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_Anyui(tL_Anyui(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_Anyui = [L_bj; L_ji]/ del_M; % cm, total length
  % time-weight
  L_bj = L_b * exp( rT_j * tW_Anyui(tW_Anyui(:,1) < tT_j,1)/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tW_Anyui(tW_Anyui(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  EWw_Anyui = [L_bj; L_ji].^3 * (1 + f_A * w); % g, wet weight
 
  % time-length/weight
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_L);
  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp( rT_j * tL_Limuri(tL_Limuri(:,1) < tT_j,1)/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_Limuri(tL_Limuri(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_Limuri = [L_bj; L_ji]/ del_M; % cm, total length
  % time-weight
  L_bj = L_b * exp( rT_j * tW_Limuri(tW_Limuri(:,1) < tT_j,1)/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tW_Limuri(tW_Limuri(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  EWw_Limuri = [L_bj; L_ji].^3 * (1 + f_L * w); % g, wet weight

  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  EN = TC * 365 * reprod_rate_j(LN_Anyui(:,1) * del_M, f_A, pars_R); % #, fecundity

  % pack to output
  prdData.tL_Anyui = ELw_Anyui;
  prdData.tL_Limuri = ELw_Limuri;
  prdData.tW_Anyui = EWw_Anyui;
  prdData.tW_Limuri = EWw_Limuri;
  prdData.LN_Anyui = EN;
     
end

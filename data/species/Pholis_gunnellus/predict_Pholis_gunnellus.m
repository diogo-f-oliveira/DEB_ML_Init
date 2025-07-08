function [prdData, info] = predict_Pholis_gunnellus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, weight at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
   

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span 
    
  % pack to output
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;

  % time-weight 
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;        
  L_bj = L_b * exp(tW((tW(:,1) <= tT_j),1) * rT_j/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tW((tW(:,1) > tT_j),1) - tT_j)); % cm, struc length
  EWw = [L_bj; L_ji].^3 * (1 + f * w); % g, weight
  
  % weight-gonadal weight
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  EWw_R = TC * Ww_b * 365 * reprod_rate_j((WWR(:,1)/ (1 + f * w)).^(1/3), f, pars_R); % g, gonadal weight

  
  % pack to output
  prdData.tW = EWw;
  prdData.WWR = EWw_R;


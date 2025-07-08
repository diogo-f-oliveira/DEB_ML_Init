function [prdData, info] = predict_Ictalurus_furcatus(par, data, auxData)
  
  % unpack par, data, auxData

  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_LN = tempcorr(temp.LN, T_ref, T_A); 
   
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
   
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);          % #/d, ultimate reproduction rate at T
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                    % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
  %% uni-variate data
 
  % time-lengtht post metam 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_j = L_m * l_j; L_i = L_m * l_i;
  ELw = (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j)))/ del_M; % cm, total length
  
  % length-weight
  EWw = (LWw(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight
  
  % length - fecundity
  EN =   365 * TC_LN * reprod_rate_j(LN(:,1)*del_M, f, pars_R); % #, yearly fecundity

  % length - gonad wet weight
  EWwR =   365 * TC_LN * Ww_b * reprod_rate_j(LWwR(:,1)*del_M, f, pars_R); % #, yearly fecundity
  
%% pack to output
  prdData.tL = ELw;
  prdData.LWw = EWw;
  prdData.LN = EN;
  prdData.LWwR = EWwR;
  
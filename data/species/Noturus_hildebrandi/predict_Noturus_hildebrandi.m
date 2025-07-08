function [prdData, info] = predict_Noturus_hildebrandi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
    
  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A);
    
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

  % time-length after metam at f_tL
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC; rT_B = rho_B * kT_M;  % 1/d, von Bert growth rate   
  L_j = L_m * l_j; L_i = l_i * L_m; % cm, structrual length at birth, ultimate
  tT_j = (tau_j - tau_b)/ kT_M; % d, time since birth at metam
  ELw = (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j)))/ del_M; % cm, std length 
  %
  EWw = (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j))).^3 * (1 + f_tL * ome); % g, wet weight

  % weight - fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN = TC * 365 * reprod_rate_j(LN(:,1) * del_M, f_LN, pars_R); % #, fecundity

  %% pack to output
  prdData.tL = ELw;
  prdData.tWw = EWw;
  prdData.LN = EN;
  

function [prdData, info] = predict_Thysanoteuthis_rhombus(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  rT_B = TC * rho_B * k_M; % 1/d, von Bert growth rate
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  kT_M = k_M * TC; tT_j = (t_j - t_b)/ kT_M; % d, time since birth at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m - t_j/ kT_M));  
  Lw_i = L_am/ del_M;               % cm, mantle length at death
  Ww_i = L_am^3 * (1 + f * w);      % g, wet weight
 
  % at 300 d
  L_300 = L_i - (L_i - L_j) * exp(- rT_B * (300 - tT_j));  
  Lw_300 = L_300/ del_M;               % cm, mantle length at death
  Ww_300 = L_300^3 * (1 + f * w);      % g, wet weight
  
  % reproduction
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, cum no of eggs at 300 d
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.L300 = Lw_300;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ww300 = Ww_300;
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % time-length
  tvel = get_tj(pars_tj, f, [], tL(:,1) * kT_M);
  ELw = L_m * tvel(:,4)/ del_M; % cm, dorsal mantle length at time 
    
  % pack to output
  prdData.tL = ELw;
  
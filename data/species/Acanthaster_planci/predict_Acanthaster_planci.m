function [prdData, info] = predict_Acanthaster_planci(par, data, auxData)
  
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
  Ww_b = L_b^3 * (1 + f * w);       % g, wegt weight at birth 

  % metam
  aT_j = t_j/ k_M/ TC;              % d, age at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/del_M;                 % cm, diameter at metam at f
  s_M = l_j/ l_b;                   % p-, acceleration factor
  
  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, diameter at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate diameter
 
  % reproduction
  t1 = 365; % d, period of accumulaton of reprod buffer
  GSI = TC * (t1 * k_M * g/ f^3)/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^3);
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.aj = aT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % length-change in length post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  rT_B = rho_B * k_M * TC;
  ELw = (L_i - (L_i - L_j) * exp(- rT_B * tL(:,1)))/ del_M; % cm, diameter
  
  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w);  % g, wet weight
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  ENT = TC * 365 * reprod_rate_j(LN(:,1) * del_M, f, pars_R);   % #, fecundity

  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
  prdData.LN = ENT;
function [prdData, info] = predict_Amphioctopus_fangsiao(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_20 = tempcorr(temp.tWw_20, T_ref, T_A);
  TC_25 = tempcorr(temp.tWw_25, T_ref, T_A);
  
  % zero-variate data

  
  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty at f

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % ultimate
  L_i = L_m * l_i; rT_B = rho_B * kT_M;  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m  - t_j/ kT_M));  
  Ww_i = L_am^3 * (1 + f * w);     % g, wet weight at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, cum no of eggs at 180 d

  % pack to output
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % time-weight
  tvel = get_tj(pars_tj, f_tW, [], tWw_20(:,1) * k_M * TC_20);
  EWw_20 = (L_m * tvel(:,4)).^3 * (1 + f_tW * w);   % g, wet weight
  %
  tvel = get_tj(pars_tj, f_tW, [], tWw_25(:,1) * k_M * TC_25);
  EWw_25 = (L_m * tvel(:,4)).^3 * (1 + f_tW * w);   % g, wet weight

  % pack to output
  prdData.tWw_20 = EWw_20;
  prdData.tWw_25 = EWw_25;


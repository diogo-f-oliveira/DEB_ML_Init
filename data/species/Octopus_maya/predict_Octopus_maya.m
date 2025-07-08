function [prdData, info] = predict_Octopus_maya(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_tW = tempcorr(temp.tW, T_ref, T_A);
  
  % zero-variate data

  
  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, mantle length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth
 
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tj = (t_j - t_b)/ kT_M; % d, time since birth at metam
  
  % puberty 
  tT_p = (t_p - t_b)/ kT_M;             % d, time since birth at puberty

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % ultimate
  L_i = L_m * l_i; rT_B = rho_B * kT_M;  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m - t_j/ kT_M));  
  Ww_i = L_am^3 * (1 + f * w);     % g, wet weight at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC * k_J; kT_M; L_T; TC * v; U_Hb/ TC; U_Hj/ TC; U_Hp/ TC]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, cum no of eggs at L

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % time-weight
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f, [], tW(:,1) * k_M * TC_tW);
  EWw = (L_m * tvel(:,4)).^3 * (1 + f * w);   % g, weight
    
  % pack to output
  prdData.tW = EWw;
 
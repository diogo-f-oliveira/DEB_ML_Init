function [prdData, info] = predict_Bathypolypus_arcticus(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
      
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 
  TC_tWw = tempcorr(temp.tWw, T_ref, T_A); 
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  rT_B = rho_B * kT_M; % 1/d, von Bert growth rate
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (tau_j - tau_b)/ kT_M;         % d, time since birth at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * ome);     % g, weight at puberty

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m - tau_j/ kT_M));  
  Ww_i = L_am^3 * (1 + f * ome);   % g, weight at 3650 d
 
  % reproduction: GSI at death
  pars_R = [kap; kap_R; g; TC*k_J; kT_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, fecundity
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
    
  % uni-variate data
  
  % time-weight
  tvel = get_tj(pars_tj, f, [], tWw(:,1) * k_M * TC_tWw);
  EWw = (L_m * tvel(:,4)).^3 * (1 + f * w);   % g, wet weight
  
  % pack to output
  prdData.tWw = EWw;
  
  
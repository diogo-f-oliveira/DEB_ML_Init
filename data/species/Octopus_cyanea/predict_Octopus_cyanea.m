function [prdData, info] = predict_Octopus_cyanea(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_25 = tempcorr(temp.ab_25, T_ref, T_A);
  TC_13 = tempcorr(temp.ab_13, T_ref, T_A);
  TC_ts = tempcorr(temp.ts, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_Ni = tempcorr(temp.Ni, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);
  
  % zero-variate data

  
  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, mantle length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  a_b = t_b/ k_M; a25_b = a_b/ TC_25; a13_b = a_b/ TC_13; 
 
  % settle
  pars_ts = [g k l_T v_Hb v_Hs v_Hp];
  [t_s, t_ps, t_bs, l_s] = get_tj(pars_ts, f);
  tT_s = (t_s - t_bs)/ k_M/ TC_ts;  % d, time since birth at settlement
  Ww_s = (l_s * L_m)^3 * (1 + f * w); % g, wet weight at settlement

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  kT_M = k_M * TC_tW; tj = (t_j - t_b)/ kT_M; % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_ts;   % d, time since birth at puberty

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % ultimate
  L_i = L_m * l_i; rT_B = rho_B * kT_M;  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m - t_j/ kT_M));  
  Ww_i = L_am^3 * (1 + f * w);     % g, wet weight at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC_Ni*k_J; TC_Ni*k_M; L_T; TC_Ni*v; U_Hb/TC_Ni; U_Hj/TC_Ni; U_Hp/TC_Ni]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, cum no of eggs at L

  % pack to output
  prdData.ab_25 = a25_b;
  prdData.ab_13 = a13_b;
  prdData.ts = tT_s;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Wwb = Ww_b;
  prdData.Wws = Ww_s;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % time-weight
  tvel = get_tj(pars_tj, f, [], tW(:,1) * kT_M);
  EWw = (L_m * tvel(:,4)).^3 * (1 + f * ome);  % cm, dorsal mantle length
    
  % pack to output
  prdData.tW = EWw;
  
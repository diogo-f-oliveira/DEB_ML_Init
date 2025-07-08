function [prdData, info] = predict_Symsagittifera_roscoffensis(par, data, auxData)
  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
%% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);

  % life cycle
  pars_lj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_lj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Lw_b = L_b/ del_Me;               % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth 
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  %Lw_j = L_j/ del_M;               % cm, total length at metam
  %Ww_j = L_j^3 * (1 + f * w);      % g, wet weight at metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  %l_j/ l_b
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max repord rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  %% pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univariate data
  
  % time-length
  rT_B = TC * rho_B * k_M; rT_j = TC * rho_j * k_M; 
  L_bj = L_b * exp(tL(tL(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(tL(:,1) >= tT_j,1) - tT_j)); % cm, expected length at time
  L = [L_bj; L_ji]; w_del = max(0, min(1, (L - L_b)/ (L_p - L_b))); 
  ELw = [L_bj; L_ji] ./ ((1 - w_del) * del_Me + w_del * del_M);
  
  prdData.tL = ELw;


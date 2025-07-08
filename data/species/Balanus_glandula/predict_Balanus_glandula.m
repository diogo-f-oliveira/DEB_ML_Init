function [prdData, info] = predict_Balanus_glandula(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if p_M > 1000; info = 0; prdData = []; return; end
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Wd_j = L_j^3 * (1 + f * ome) * d_V; % g, dry weight at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Wd_p = L_p^3 * (1 + f * ome) * d_V; % g, dry weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Wd_i = L_i^3 * (1 + f * w) * d_V; % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);              % #/d, reproduction rate at 1.56 cm basal diameter  T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight 
  l_0 = (1e-3*Wd_0/d_V/(1+f_tW*ome))^(1/3)/L_m;
  tvel = get_tj(pars_tj, f_tW, [0, f_tW, l_0], tW(:,1)*kT_M);
  EWd = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome) * d_V * 1e3; % mg, dry weight

  % pack to output
  prdData.tW = EWd;

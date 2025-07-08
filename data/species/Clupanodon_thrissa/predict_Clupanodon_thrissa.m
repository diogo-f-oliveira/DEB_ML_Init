function [prdData, info] = predict_Clupanodon_thrissa(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, age at metam at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3*(1+f*ome);           % g, weight at puberty at f
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vecto
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  
  %% uni-variate data
  
  % time-length data
  tf = [500 f_0500; 1000 f_1000; 1500 f_1500]; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tj(pars_tj, tf, [], tLW(:,1)*kT_M);
  L = L_m * tvel(:,4); ELw = L/ del_M; % cm, std length
  EWw = L.^3 .* (1 + tvel(:,3) * ome); % g, weight

  % length-weight
  EWw_f = (LW_f(:,1)*del_M).^3 * (1 + f_1000 * ome);
  EWw_m = (LW_m(:,1)*del_M).^3 * (1 + f_1000 * ome);
  
  % length-fecundity
  EN =  TC * 365 * reprod_rate_j(LN(:,1)*del_M, f_1000, pars_R); % #, fecundity
  
  %% pack to output
  prdData.tLW = [ELw EWw];
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  prdData.LN = EN;

function [prdData, info] = predict_Salamandra_salamandra(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tj, f); % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, physical length at metam at f
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC *  reprod_rate((25.5/(1 + f * w))^(1/3), f, pars_R);% #/d, reprod rate at 25.5 g

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-weight
  rT_B = TC * k_M/ 3/ (1 + f_tW1/ g); L_i = f_tW1 * L_m; 
  EWw_1 = (L_i - (L_i - L_b) * exp( - rT_B * tW1(:,1))).^3 * (1 + f_tW1 * w); % g, wet weight
  %
  rT_B = TC * k_M/ 3/ (1 + f_tW2/ g); L_i = f_tW2 * L_m; 
  EWw_2 = (L_i - (L_i - L_b) * exp( - rT_B * tW2(:,1))).^3 * (1 + f_tW2 * w); % g, wet weight

  prdData.tW1 = EWw_1;
  prdData.tW2 = EWw_2;

  
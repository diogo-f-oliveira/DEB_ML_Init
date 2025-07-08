function [prdData, info] = predict_Neanthes_arenaceodentata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth
  
  % puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty
  L_p = l_p * L_m;                  % cm, structural length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % length-eggs
  par_R = [kap; kap_R; g; TC * k_J; TC * k_M; L_T; TC * v; U_Hb/ TC; U_Hp/ TC];
  N100 = cum_reprod(aT_m, f, par_R); % #, predicted cum reprod at time
  N50 = cum_reprod(aT_m, f_50, par_R); % #, predicted cum reprod at time
  N25 = cum_reprod(aT_m, f_25, par_R); % #, predicted cum reprod at time
  N12 = cum_reprod(aT_m, f_12, par_R); % #, predicted cum reprod at time
  N6 = cum_reprod(aT_m, f_6, par_R);   % #, predicted cum reprod at time

  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.N100 = N100;
  prdData.N50 = N50;
  prdData.N25 = N25;
  prdData.N12 = N12;
  prdData.N6 = N6;
  
  % uni-variate data
  
  % time-length
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;    % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW100(:,1)); % cm, predicted length at time
  EWw_100 = L.^3 * (1 + f * w); % g, wet weight
  %
  par_lb = [g k v_Hb];
  ir_B = 3/ k_M + 3 * f_50 * L_m/ v; rT_B = TC/ ir_B; % d, 1/von Bert growth rate
  L_b = L_m * get_lb(par_lb, f_50); L_i = L_m * f_50;
  L = L_i - (L_i - L_b) * exp( - rT_B * tW50(:,1)); % cm, predicted length at time
  EWw_50 = L.^3 * (1 + f_50 * w); % g, wet weight
  %
  ir_B = 3/ k_M + 3 * f_25 * L_m/ v; rT_B = TC/ ir_B; % d, 1/von Bert growth rate
  L_b = L_m * get_lb(par_lb, f_25); L_i = L_m * f_25;
  L = L_i - (L_i - L_b) * exp( - rT_B * tW25(:,1)); % cm, predicted length at time
  EWw_25 = L.^3 * (1 + f_25 * w); % g, wet weight
  %
  ir_B = 3/ k_M + 3 * f_12 * L_m/ v; rT_B = TC/ ir_B; % d, 1/von Bert growth rate
  L_b = L_m * get_lb(par_lb, f_12); L_i = L_m * f_12;
  L = L_i - (L_i - L_b) * exp( - rT_B * tW12(:,1)); % cm, predicted length at time
  EWw_12 = L.^3 * (1 + f_12 * w); % g, wet weight
  %
  ir_B = 3/ k_M + 3 * f_6 * L_m/ v; rT_B = TC/ ir_B; % d, 1/von Bert growth rate
  L_b = L_m * get_lb(par_lb, f_6); L_i = L_m * f_6;
  L = L_i - (L_i - L_b) * exp( - rT_B * tW6(:,1)); % cm, predicted length at time
  EWw_6 = L.^3 * (1 + f_6 * w); % g, wet weight

  
  % pack to output
  prdData.tW100 = EWw_100;
  prdData.tW50 = EWw_50;
  prdData.tW25 = EWw_25;
  prdData.tW12 = EWw_12;
  prdData.tW6 = EWw_6;
  
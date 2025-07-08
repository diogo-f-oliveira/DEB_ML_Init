function [prdData, info] = predict_Apatosaurus_spec(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  info = 1;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b,] = get_tp(pars_tp, f);
  
  % birth 
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at puberty 

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = f * L_m;                    % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = 365 * TC/ ir_B; % yr, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW(:,1));        % cm, structural length at time
  EWw = L .^ 3 * (1 + f * w)/1e3;                        % kg, wet weight
  %
  L = L_i - (L_i - L_b) * exp( - rT_B * tW1(:,1));        % cm, structural length at time
  EWw_1 = L .^ 3 * (1 + f * w)/1e3;                        % kg, wet weight

  % pack to output
  prdData.tW = EWw;
  prdData.tW1 = EWw_1;
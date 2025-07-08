function [prdData, info] = predict_Maiasaura_peeblesorum(par, data, auxData)
  
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
  Lw_b = L_b/ del_M;                % cm, length at birth at f

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  L_p = l_p * L_m;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = f * L_m;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % time-weight
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = 365 * TC/ ir_B; % yr, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B);                  % cm, structural length at 1 yr
  Ww_1 = L ^ 3 * (1 + f * w);                            % g, wet weight at 1 yr
  L = L_i - (L_i - L_b) * exp( - rT_B * 8);              % cm, structural length at 8 yr
  Ww_8 = L ^ 3 * (1 + f * w);                            % g, wet weight at 1 yr

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Ww1 = Ww_1;
  prdData.Ww8 = Ww_8;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.wR = get_wR(par);
  
  % t-Ww data
  L_b = L_m * get_lb([g k v_Hb], f); L_i = f * L_m;
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = 365 * TC/ ir_B; % yr, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW_T50(:,1));    % cm, structural length at time
  EWw_T50 = L .^ 3 * (1 + f * w)/1e3;                    % kg, wet weight
  %
  L_b = L_m * get_lb([g k v_Hb], f_tW43); L_i = f_tW43 * L_m;
  ir_B = 3/ k_M + 3 * f_tW43 * L_m/ v; rT_B = 365 * TC/ ir_B; % yr, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW_T43(:,1));    % cm, structural length at time
  EWw_T43 = L .^ 3 * (1 + f * w)/1e3;                    % kg, wet weight
  %
  L_b = L_m * get_lb([g k v_Hb], f_tW34); L_i = f_tW34 * L_m;
  ir_B = 3/ k_M + 3 * f_tW34 * L_m/ v; rT_B = 365 * TC/ ir_B; % yr, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW_T34(:,1));    % cm, structural length at time
  EWw_T34 = L .^ 3 * (1 + f * w)/1e3;                    % kg, wet weight
  %
  L_b = L_m * get_lb([g k v_Hb], f_tW33); L_i = f_tW33 * L_m;
  ir_B = 3/ k_M + 3 * f_tW33 * L_m/ v; rT_B = 365 * TC/ ir_B; % yr, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW_T33(:,1));    % cm, structural length at time
  EWw_T33 = L .^ 3 * (1 + f * w)/1e3;                    % kg, wet weight



  prdData.tW_T50 = EWw_T50;
  prdData.tW_T43 = EWw_T43;
  prdData.tW_T34 = EWw_T34;
  prdData.tW_T33 = EWw_T33;

  
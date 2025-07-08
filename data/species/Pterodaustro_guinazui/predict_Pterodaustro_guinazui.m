function [prdData, info] = predict_Pterodaustro_guinazui(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % intial
  E_0 = p_Am * initial_scaled_reserve(f, [V_Hb; g; k_J; k_M; v]);
  Ww_0 = w_E * E_0/ mu_E/ d_E;      % g, intital egg weight

  % birth 
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, skull length at birth
  
  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = f * L_m;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate skull length 
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
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = 365 * TC/ ir_B; % yr, 1/von Bert growth rate
  L = L_i * (1 - (1 - l_b^del_T) * exp( - rT_B * tL(:,1))).^(1/del_T);        % cm, structural length at time
  ELw = L/ del_M;                                        % cm, skull length
  
  % pack to output
  prdData.tL = ELw;

function [prdData, info] = predict_Octolasion_cyaneum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_15 = tempcorr(temp.ab_15, T_ref, T_A);
  TC = tempcorr(temp.ab_20, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Ww_0 = U_E0 * p_Am * w_E/ mu_E/ d_E; % g, egg wet weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  aT_b15 = (t_0 + t_b/ k_M)/ TC_15; % d, age at birth at f and T
  aT_b20 = (t_0 + t_b/ k_M)/ TC;    % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ulitmate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                 % d, mean life span at T
  
  % pack to output
  prdData.ab_15 = aT_b15;
  prdData.ab_20 = aT_b20;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-weight 
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;          % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW(:,1));           % cm, structural length at time
  EWw = L.^3 * (1 + f * w);                                 % g, wet weight
  
  % time - cum offspring
  pars_R = [kap; kap_R; g; TC * k_J; TC * k_M; L_T; TC * v; U_Hb/ TC; U_Hp/ TC];
  Ri = reprod_rate(L_i, f, pars_R); % #/d, ultimate reproduction rate at T
  EN = tN(:,1) * Ri;

  % pack to output
  prdData.tW = EWw;
  prdData.tN = EN;

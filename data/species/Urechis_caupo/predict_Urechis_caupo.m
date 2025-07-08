function [prdData, info] = predict_Urechis_caupo(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_V0V1A = tempcorr(temp.V0V1_A, T_ref, T_A);
  TC_V0V1S = tempcorr(temp.V0V1_S, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth
  
  % metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_j = l_j * L_m;                  % cm, structural length at metam
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam

  % puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty
  L_p = l_p * L_m;                  % cm, structural length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);          % reproduction rate 
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  L_0 = (V0V1_A(:,1)/ (1 + f * w)).^(1/3);
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_V0V1A/ ir_B;    % d, 1/von Bert growth rate
  L = L_i - (L_i - L_0) .* exp( - rT_B * times.V0V1_A); % cm, struct length
  EV1_A = L.^3 * (1 + f * w); % g, wet weight
  %
  L_0 = (V0V1_S(:,1)/ (1 + f * w)).^(1/3);
  rT_B = TC_V0V1S/ ir_B;    % d, 1/von Bert growth rate
  L = L_i - (L_i - L_0) .* exp( - rT_B * times.V0V1_S); % cm, struct length
  EV1_S = L.^3 * (1 + f * w); % g, wet weight

  
  % pack to output
  prdData.V0V1_A = EV1_A;
  prdData.V0V1_S = EV1_S;
  
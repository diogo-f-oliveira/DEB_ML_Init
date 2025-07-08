function [prdData, info] = predict_Homarus_gammarus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_15 = tempcorr(temp.tj_15, T_ref, T_A);
  TC = tempcorr(temp.tp, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = U_E0 * p_Am;                % J, initial energy content

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  aT_b = t_0 +t_b/ k_M/ TC_ab;      % d, age at birth

  % metam
  tT_j15 = (t_j - t_b)/ k_M/ TC_15; % d, time since birth at metam
  tT_j20 = (t_j - t_b)/ k_M;        % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % growth
  rT_B = rho_B * k_M;               % 1/d, von Bert growth rate 
  L_2 = L_i - (L_i - L_b) * exp(- rT_B * 2 * 365); % cm, struct length at 2 yr
  Lw_2 = L_2/ del_M;                % cm, carapace length at 2 yr
  Ww_2 = L_2^3 * (1 + f * w);       % g, wet weight at 2 yr
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj_15 = tT_j15;
  prdData.tj_20 = tT_j20;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.L2 = Lw_2;
  prdData.Wdb = Wd_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ww2 = Ww_2;
  prdData.E0 = E_0;
  prdData.Ri = RT_i;
    
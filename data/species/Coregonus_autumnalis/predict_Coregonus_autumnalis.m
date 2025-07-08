function [prdData, info] = predict_Coregonus_autumnalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_05 = tempcorr(temp.tL05, T_ref, T_A);
  TC_10 = tempcorr(temp.tL10, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T


  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % univariate data

  % time-length/weight post metam
  f = f_tL;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC_tL; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_i - (L_i - L_0 * del_M) * exp( - rT_B * tL(:,1)); % cm, expected length at time
  ELw = L/ del_M;  
  %
  kT_M = k_M * TC_05; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L = L_i - (L_i - L_0 * del_M) * exp( - rT_B * tL05(:,1)); % cm, expected length at time
  ELw_05 = L/ del_M; 
  %
  L = L_i - (L_i - L_0 * del_M) * exp( - rT_B * tW05(:,1)); % cm, expected length at time
  EWw_05 = L.^3 * (1 + f * w); % g, wet weight
  %
  kT_M = k_M * TC_10; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L = L_i - (L_i - L_0 * del_M) * exp( - rT_B * tL10(:,1)); % cm, expected length at time
  ELw_10 = L/ del_M;  
  %
  L = L_i - (L_i - L_0 * del_M) * exp( - rT_B * tW10(:,1)); % cm, expected length at time
  EWw_10 = L.^3 * (1 + f * w); % g, wet weight
  
  prdData.tL = ELw;
  prdData.tL05 = ELw_05;
  prdData.tL10 = ELw_10;
  prdData.tW05 = EWw_05;
  prdData.tW10 = EWw_10;
end
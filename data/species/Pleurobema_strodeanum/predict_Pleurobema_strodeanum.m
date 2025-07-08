function [prdData, info] = predict_Pleurobema_strodeanum(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 
  TC_LL = tempcorr(temp.LL, T_ref, T_A); 

  % zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, shell length at birth
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, shell length at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, shell length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate shell length at f
  Ww_i = (5.1*del_M)^3 * (1 + f * ome); % g, wet body weight at shell length 5.1 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % length-length after 7 yr 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_LL);
  kT_M = k_M * TC_LL; rT_B = rho_B * kT_M; L_i = L_m * l_i; Lw_i = L_i/ del_M;
  ELw = Lw_i - (Lw_i - LL(:,1)) * exp(- rT_B * 7 * 365); % cm, shell length

  % weight-weight after 7 yr 
  L = (WW(:,1)/ (1 + f_LL * ome)).^(1/3); % cm, struc length
  EWw = (L_i - (L_i - L) * exp(- rT_B * 7 * 365)).^3 * (1 + f_LL * ome); % g, wet weight

  % length - fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  EN = 365 * TC * reprod_rate_j(LN(:,1)*del_M, f_LN, pars_R);  % #, fecundity

  % pack to output
  prdData.LL = ELw;
  prdData.WW = EWw;
  prdData.LN = EN;
end

  
function [prdData, info] = predict_Enneapterygius_atriceps(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
 
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  kT_M = k_M * TC;
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, total length at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f


  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  
  % time - length
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  rT_j = kT_M * rho_j; rT_B = kT_M * rho_B; % 1/d, von Bert growth rate
  tT_j = (tau_j - tau_b)/ kT_M; % d, tma since birth at metam
  L_bj = L_b * exp(rT_j * tL(tL(:,1) < tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(- rT_B * (tL(tL(:,1) >= tT_j,1) - tT_j));
  ELw = [L_bj; L_ji]/ del_M;

  % length - fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  EN = TC * 365 * reprod_rate_j(LN(:,1)*del_M, f, pars_R);            % #, yearly fecundity
  
  % length - weight
  EWw = (LWw(:,1) * del_M).^3 * (1 + f_tL * ome); % g, wet weight

  % pack to output
  prdData.tL = ELw;
  prdData.LN = EN;
  prdData.LWw = EWw;
end

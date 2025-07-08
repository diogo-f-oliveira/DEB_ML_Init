function [prdData, info] = predict_Pandalus_borealis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_tL_UK = tempcorr(temp.tL_fUK, T_ref, T_A);
  TC_tL_M = tempcorr(temp.tL_M, T_ref, T_A);
  TC_LN_UK = tempcorr(temp.LN_UK, T_ref, T_A);
  TC_LN_N = tempcorr(temp.LN_N, T_ref, T_A);
  TC_WdJO = tempcorr(temp.WdJO, T_ref, T_A);
  TC_WwJO = tempcorr(temp.WwJO, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam
  tT_j = (t_j-t_b)/ k_M/ TC_tj;     % d, time since birth at metam at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  t_p_ref = (t_p-t_b)/ k_M;         % d, time since birth at puberty at f and T_ref

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  
  % uni-variate data

  % time-length 
  % primary females UK
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_UK);
  kT_M = k_M * TC_tL_UK; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL_fUK(:,1) * rT_j/ 3) .* (tL_fUK(:,1) < tT_j);
  L = L + (tL_fUK(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_fUK(:,1) - tT_j))); % cm, expected length at time
  ELw_fUK = L/ del_M;
  % males UK
  L = L_b * exp(tL_mUK(:,1) * rT_j/ 3) .* (tL_mUK(:,1) < tT_j);
  L = L + (tL_mUK(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_mUK(:,1) - tT_j))); % cm, expected length at time
  ELw_mUK = L/ del_M;
  % mixed Maine
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_M);
  kT_M = k_M * TC_tL_M; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL_M(:,1) * rT_j/ 3) .* (tL_M(:,1) < tT_j);
  L = L + (tL_M(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_M(:,1) - tT_j))); % cm, expected length at time
  ELw_M = L/ del_M;
  
  % length-weight/energy
  EWw = (LWw(:,1) * del_M).^3 * (1 + f * w);           % g, wet weight
  EWd = (LWd(:,1) * del_M).^3 * (1 + f * w) * d_V;     % g, dry weight
  EE =  (LE(:,1) * del_M).^3 * (M_V * mu_V + f * E_m); % J, energy content

  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN_UK = TC_LN_UK * 365 * reprod_rate_j(LN_UK(:,1) * del_M, f_UK, pars_R); % #, yearly fecundity
  EN_N  = TC_LN_N  * 365 * reprod_rate_j(LN_N(:,1) * del_M, f_N, pars_R); % #, yearly fecundity

  % temperature-time since birth at puberty
  EtT_p = t_p_ref ./ tempcorr(C2K(Ttp(:,1)), T_ref, T_A)/ 365; % yr, time since birth at puberty

  % weight-respiration
  p_ref = p_Am * L_m^2;        % max assimilation power at max size
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  L = (1e-3 * WdJO(:,1)/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;         % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJO_d = - 32e6 * TC_WdJO * J_M(3,:)'/ 24;   % µg O/h  
  %
  L = (WwJO(:,1)/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;         % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJO_w = - 32e3 * TC_WwJO * J_M(3,:)'/ 24;   % mg O/h  

  % pack to output
  prdData.tL_fUK = ELw_fUK;
  prdData.tL_mUK = ELw_mUK;
  prdData.tL_M = ELw_M;
  prdData.LWd = EWd;
  prdData.LWw = EWw;
  prdData.LWd = EWd;
  prdData.LE = EE;
  prdData.LN_UK = EN_UK;
  prdData.LN_N = EN_N;
  prdData.Ttp = EtT_p;
  prdData.WdJO = EJO_d;
  prdData.WwJO = EJO_w;
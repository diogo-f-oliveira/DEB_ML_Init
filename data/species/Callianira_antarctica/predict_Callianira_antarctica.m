function [prdData, info] = predict_Callianira_antarctica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_WdJO = tempcorr(temp.WdJO, T_ref, T_A);
  TC_WdJN = tempcorr(temp.WdJN, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * (1 + f * w) * d_V * del_W; % g, ultimate dry weight 
 
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdi = Wd_i;
  
  % uni-variate data
  
  EWd = (LWd(:,1) * del_M).^3 * (1 + f * w) * d_V * del_W;    % mg, dry weight
  EWC = (LWC(:,1) * del_M).^3 * (1 + f * w) * d_V * 12/ w_V;  % mg, carbon weight
  EWN = (LWN(:,1) * del_M).^3 * (1 + f * w) * d_V * n_NV * 14/ w_V;  % mg, nitrogen weight
  
  % flux data 
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  % respiration 
  L = (1e-3 * WdJO(:,1)/ del_W/ d_V/ (1 + f * w)) .^ (1/3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';       % mol/d: J_C, J_H, J_O, J_N in rows
  EJO = - J_M(3,:)' * TC_WdJO * 24.4e6/ 24;                % µl O2/h, O2 consumption 
  % excretion
  L = (1e-3 * WdJN(:,1)/del_W/ d_V/ (1 + f * w)) .^ (1/3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';       % mol/d: J_C, J_H, J_O, J_N in rows
  EJN = J_M(4,:)' * TC_WdJN/ 24e-6;                        % µmol-at NH3/h 

  % pack to output
  prdData.WdJO = EJO;
  prdData.WdJN = EJN;
  prdData.LWd = EWd;
  prdData.LWC = EWC;
  prdData.LWN = EWN;
  
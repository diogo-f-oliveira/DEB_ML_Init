function [prdData, info] = predict_Locusta_migratoria(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if T_L > T_ref
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  pars_T = [T_A; T_L; T_AL];
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_tp = tempcorr(temp.tp, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  TC_30 = tempcorr(temp.tW_30, T_ref, pars_T);
  TC_27 = tempcorr(temp.tW_27, T_ref, pars_T);
  TC_24 = tempcorr(temp.tW_24, T_ref, pars_T);
  TC_21 = tempcorr(temp.tW_21, T_ref, pars_T);
  TC_18 = tempcorr(temp.tW_18, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hp v_Hp+1e-8];
  [t_p, ~, t_b, l_p, ~, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T
  s_M = l_p/ l_b;                   % -, acceleration factor 

  % reproduction (no kappa-rule)
  %RT_i = TC_Ri * kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T
  RT_i = TC_Ri * kap_R * ((1 - kap) * p_Am * s_M * L_p^2 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight 
  EWd_30 = min(L_p, L_b * exp((t_0 + tW_30(:,1)) * TC_30 * k_M * rho_j/ 3)).^3 * d_V * (1 + f * w);
  EWd_27 = min(L_p, L_b * exp((t_0 + tW_27(:,1)) * TC_27 * k_M * rho_j/ 3)).^3 * d_V * (1 + f * w);
  EWd_24 = min(L_p, L_b * exp((t_0 + tW_24(:,1)) * TC_24 * k_M * rho_j/ 3)).^3 * d_V * (1 + f * w);
  EWd_21 = min(L_p, L_b * exp((t_0 + tW_21(:,1)) * TC_21 * k_M * rho_j/ 3)).^3 * d_V * (1 + f * w);
  EWd_18 = min(L_p, L_b * exp((t_0 + tW_18(:,1)) * TC_18 * k_M * rho_j/ 3)).^3 * d_V * (1 + f * w);
  
  % pack to output
  prdData.tW_30 = EWd_30;
  prdData.tW_27 = EWd_27;
  prdData.tW_24 = EWd_24;
  prdData.tW_21 = EWd_21;
  prdData.tW_18 = EWd_18;
  
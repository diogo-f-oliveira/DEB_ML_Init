function [prdData, info] = predict_Heterodontus_portusjacksoni(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, fork length at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, fork length at puberty at f
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate fork length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males 
  pars_tpm = [g; k; l_T; v_Hb; v_Hpm];% compose parameter vector
  [t_pm, t_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f); % -, scaled times & lengths at f
  L_pm = L_m * l_pm;                  % cm, structural length at puberty at f
  Lw_pm = L_pm/ del_M;                % cm, fork length at puberty at f
  aT_pm = t_pm/ k_M/ TC;              % d, age at puberty at f and T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.ap_f = aT_p;
  prdData.ap_m = aT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp_f = Lw_p;
  prdData.Lp_m = Lw_pm;
  prdData.Li_f = Lw_i;
  prdData.Li_m = Lw_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  f = f_tL;
  Lw_b = L_m * get_lb([g; k; v_Hb], f)/ del_M;
  Lw_i = L_m * (f - l_T)/ del_M;
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;              % d, 1/von Bert growth rate
  ELw_f = Lw_i - (Lw_i - Lw_b) * exp( - TC * r_B * tL_f(:,1)); % cm, expected fork length at time
  % males
  ELw_m = Lw_i - (Lw_i - Lw_b) * exp( - TC * r_B * tL_m(:,1));% cm, expected fork length at time
  %
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w); % g, weight weight
  %
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w); % g, weight weight

  %% pack to output
  prdData.tL_m = ELw_m;
  prdData.tL_f = ELw_f;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
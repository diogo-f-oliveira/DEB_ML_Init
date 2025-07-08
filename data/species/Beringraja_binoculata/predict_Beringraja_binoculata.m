function [prdData, info] = predict_Beringraja_binoculata(par, data, auxData)  
  
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
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty 
  Lw_p = l_p * L_m/ del_M;          % cm, total length at puberty  
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  pars_tpm = [g; k; l_T; v_Hb; v_Hpm];               % compose parameter vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);    % -, scaled times & lengths at f
  Lw_pm = l_pm * L_m/ del_M;                         % cm, total length
  tT_pm = (t_pm - t_bm)/ k_M/ TC;                    % d, time since birth a puberty

  %% pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;  
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  % time-length
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - TC * r_B * tL(:,1)); % cm, expected physical length at time

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w);
  
  %% pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
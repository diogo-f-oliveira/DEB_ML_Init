function [prdData, info] = predict_Acipenser_fulvescens(par, data, auxData)  

  % unpack par, data, auxData
  cPar = parscomp_st(par);
  vars_pull(par); vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);  
  
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  aT_b = tau_b/ kT_M;               % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % cm, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
   
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_170 = TC * reprod_rate(170.5 * del_M, f, pars_R);        % #/d, reproduction rate at TL 170.5 cm
  RT_135 = TC * reprod_rate(135 * del_M, f, pars_R);           % #/d, reproduction rate at TL 135 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  pars_tpm = [g; k; l_T; v_Hb; v_Hpm];               % compose parameter vector
  [tau_pm, tau_bm, l_pm, l_bm] = get_tp(pars_tpm, f); % -, scaled times & lengths at f
  tT_pm = (tau_pm - tau_bm)/ kT_M;        % d, time since birth at puberty

  
  %% pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.R170 = RT_170;
  prdData.R135 = RT_135;
  
  % univariate data
  % time-length
  L_b = L_m * get_lb([g; k; v_Hb], f_tL); L_i = L_m * f_tL;
  rT_B = kT_M/ 3/ (1 + f_tL / g);  % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(- rT_B * tL(:,1));  % cm, structural length at time
  ELw = L/ del_M;                       % cm, total length

  % length-weight
  EWw = (LWw(:,1) * del_M).^3 * (1 + f_tL * ome);
  
  % pack to output
  prdData.tL = ELw;
  prdData.LWw = EWw;
  
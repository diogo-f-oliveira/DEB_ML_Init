function [prdData, info] = predict_Petromyzon_marinus(par, data, auxData)  

  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 

  %% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_NR = tempcorr(temp.NR, T_ref, T_A);
  TC    = tempcorr(temp.tL, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at birth at f
  Lw_p = L_p/ del_M;                % cm, physical length at birth at f
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % life span
  pars_tm = [pars_tp; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm(pars_tm, f);             % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % reproduction
  kT_M = k_M * TC_NR; kT_J = k_J * TC_NR; vT= v * TC_NR; 
  UT_Hb = U_Hb/ TC_NR; UT_Hp = U_Hp/ TC_NR; 
  pars_NR = [kap; kap_R; g; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hp];
  N_R = cum_reprod(aT_m, f, pars_NR, L_b); N_R= N_R(end);

  %% pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.NR = N_R;
  
  %% uni-variate data
  f = f_tL; L_i = L_m * f; L_b = L_m * get_lb([g; k; v_Hb],f);
  rT_B = TC * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(-rT_B * tL(:,1)); % cm, struc length 
  ELw = L/ del_M; % cm,total length

  %% pack to output
  prdData.tL = ELw;
  
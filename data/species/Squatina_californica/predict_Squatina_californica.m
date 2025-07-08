function [prdData, info] = predict_Squatina_californica(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  TC_ap_f = tempcorr(temp.ap_f, T_ref, T_A);
  TC_ap_m = tempcorr(temp.ap_m, T_ref, T_A);


  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth 
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  aT_p = t_p/ k_M/ TC_ap_f;              % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                 % d, mean life span at T
  
  % males
  v_Hp = v_Hp * E_Hpm/ E_Hp; 
  L_m =  L_m * z_m/ z; Lw_im = Lw_i * z_m/ z;
  g = g * z/ z_m;
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_pm = L_p/ del_M;               % cm, total length at puberty at f
  aT_pm = t_p/ k_M/ TC_ap_m;             % d, age at puberty at f and T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.ap_f = aT_p;
  prdData.ap_m = aT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp_f = Lw_p;
  prdData.Lp_m = Lw_pm;
  prdData.Li_f = Lw_i;
  prdData.Li_m = Lw_im;
  prdData.Wwi_f = Ww_i;
  prdData.Ri = RT_i;
  
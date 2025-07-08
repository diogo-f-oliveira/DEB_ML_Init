function [prdData, info] = predict_Raja_brachyura(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data

  % life cycle                                     
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ kT_M;                 % d, age at birth at f and T

  % puberty 
  aT_p = t_p/ kT_M;                 % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  f = f_tL;                                                        % -, overwrite scaled functional response
  pars_lb = [g; k; v_Hb];                                          % compose parameter vector
  Lw_b = L_m * get_lb(pars_lb, f)/ del_M;                          % cm, total length at birth
  Lw_i = L_m * (f - l_T)/ del_M;                                   % cm, maximum total length
  rT_B = kT_M/ 3/ (1 + f/ g);                                      % 1/d, von Bert growth rate
  ELw_m = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL_m(:,1)); % cm, expected total length at time
  ELw_f = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL_f(:,1)); % cm, expected total length at time

  %% pack to output
  prdData.tL_m = ELw_m;
  prdData.tL_f = ELw_f;
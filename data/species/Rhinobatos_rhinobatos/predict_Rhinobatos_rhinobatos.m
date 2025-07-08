function [prdData, info] = predict_Rhinobatos_rhinobatos(par, data, auxData)  
 
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
    
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
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
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  % time-length
  f = f_tL;                                                        % -, overwrite scaled functional response
  pars_lb = [g; k; v_Hb];                                          % compose parameter vector
  Lw_b = L_m * get_lb(pars_lb, f)/ del_M;                          % cm, total length at birth
  Lw_i = L_m * (f - l_T)/ del_M;                                   % cm, maximum total length
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;                   % d, 1/von Bert growth rate
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - TC * r_B * tL(:,1));   % cm, expected total length at time
  
  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  
  %% pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
function [prdData, info] = predict_Mola_mola(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_R137 = tempcorr(temp.R137, T_ref, T_A);
  TC_Ww454 = tempcorr(temp.Ww454, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
   % weight at 454 d
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_Ww454/ ir_B; % d, 1/von Bert growth rate
  L0 = (26000/ (1 + f * w))^(1/3); % cm, structural length at t = 0
  L = L_i - (L_i - L0) * exp( - rT_B * 454); % cm, structural length at t = 454 d
  Ww_454 = L^3 * (1 + f * w);                % g, wet weight at t = 454 d

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_137 = TC_R137 * reprod_rate(137 * del_M, f, pars_R); % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ww454 = Ww_454;
  prdData.Wwi = Ww_i;
  prdData.R137 = RT_137;
  
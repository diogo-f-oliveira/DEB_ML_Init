function [prdData, info] = predict_Poromitra_crassiceps(par, data, auxData) 

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  
%% compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tj, f);

  % birth
  L_b = L_m * l_b;                     % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f
    
  % puberty
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);          % g, wet weight at puberty
  
  % ultimate size
  L_i = L_m * f; Lw_i = L_i/ del_M;    % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reproduction at 50 cm
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R); % reproduction rate for fish of 50 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
%% pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
%% uni-variate data
  

  % time-length 
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL;
  kT_M = k_M * TC; rT_B = kT_M/ 3/ (1 + f_tL/ g);
  L = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)); % cm, structural length
  ELw = L/ del_M;
  
  
%% pack to output
  prdData.tL = ELw;


function [prdData, info] = predict_Callorhinchus_capensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
%% compute temperature correction factors
  TC    = tempcorr(temp.ab, T_ref, T_A);

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Lw_b = L_b/ del_M;                % cm, fork length at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, fork length at puberty at f
  aT_p = t_p/ k_M/ TC;              % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate fork length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R);% #/d, max repord rate

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
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  % time-length 
  L_i = L_m * f_tL; L_b = L_m * get_lb([g k v_Hb], f_tL);
  ir_B = 3/ k_M + 3 * L_i/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - TC * r_B * tL_f(:,1)); 
  ELw_f = L/ del_M; % cm, expected length at time
  L = L_i - (L_i - L_b) * exp( - TC * r_B * tW_f(:,1)); 
  EWw_f = L.^3 * (1 + f_tL * w); % g, expected weight at time
  %
  L = L_i - (L_i - L_b) * exp( - TC * r_B * tL_m(:,1)); 
  ELw_m = L/ del_M; % cm, expected length at time
  L = L_i - (L_i - L_b) * exp( - TC * r_B * tW_m(:,1)); 
  EWw_m = L.^3 * (1 + f_tL * w); % g, expected weight at time

  %% pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
     
function [prdData, info] = predict_Eulimnadia_texana(par, data, auxData)
 
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
 
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled structural length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Ww_i = L_i.^3 * (1 + f * ome);    % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  tvel = get_tp(pars_tp, f_tLR, [], tLR(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M; % cm, carapace length
  ER = TC * reprod_rate(L_m * tvel(:,4), f_tLR, pars_R); % #/d, reproduction rate

  % length-reproduction rate
  ER_L = TC * reprod_rate(LR(:,1)*del_M, f_tLR, pars_R); % #/d, reproduction rate
  
  % pack to output
  prdData.tLR = [ELw ER];
  prdData.LR = ER_L;


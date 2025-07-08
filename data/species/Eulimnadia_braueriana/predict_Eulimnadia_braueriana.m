function [prdData, info] = predict_Eulimnadia_braueriana(par, data, auxData)
 
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  
  % compute temperature correction factors
  TC_30 = tempcorr(temp.tL_30, T_ref, T_A);
  TC_25 = tempcorr(temp.tL_25, T_ref, T_A);
  TC_20 = tempcorr(temp.tL_20, T_ref, T_A);
  TC_15 = tempcorr(temp.tL_15, T_ref, T_A);
  TC_ab =  tempcorr(C2K(Tabtpam(:,1)), T_ref, T_A);
 
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  a_b = t_b/ k_M;                   % d, age at birth at T_ref

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty
  t_p = (t_p - t_b)/ k_M;           % d, time since birth at puberty at T_ref

  % ultimate
  l_i = f - l_T;                    % -, scaled structural length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Ww_i = L_i.^3 * (1 + f * ome);    % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  a_m = t_m/ k_M;                       % d, mean life span at T_ref
  
  % pack to output
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-length
  tf = [5 f30_05; 10 f30_10]; tf(:,1) =  tf(:,1)*k_M*TC_30;
  tvel = get_tp(pars_tp, tf, [], tL_30(:,1)*k_M*TC_30);
  ELw_30 = L_m * tvel(:,4)/ del_M; % cm, carapace length
  %
  tf = [5 f25_05; 10 f25_10]; tf(:,1) =  tf(:,1)*k_M*TC_25;
  tvel = get_tp(pars_tp, tf, [], tL_25(:,1)*k_M*TC_25);
  ELw_25 = L_m * tvel(:,4)/ del_M; % cm, carapace length
  %
  tf = [5 f20_05; 10 f20_10]; tf(:,1) =  tf(:,1)*k_M*TC_20;
  tvel = get_tp(pars_tp, tf, [], tL_20(:,1)*k_M*TC_20);
  ELw_20 = L_m * tvel(:,4)/ del_M; % cm, carapace length
  %
  tf = [5 f15_05; 10 f15_10; 20 f15_20]; tf(:,1) =  tf(:,1)*k_M*TC_15;
  tvel = get_tp(pars_tp, tf, [], tL_15(:,1)*k_M*TC_15);
  ELw_15 = L_m * tvel(:,4)/ del_M; % cm, carapace length

  % length-reproduction rate
  EN = TC_25 * reprod_rate(LN(:,1)*del_M, f, pars_R); % #/d, reproduction rate
  
  % temp-age at birth
  EaT_b = a_b ./ TC_ab;
 
  % temp-time since birth at puberty
  EtT_p = t_p ./ TC_ab;

  % temp-life span
  EaT_m = a_m ./ TC_ab;

  % pack to output
  prdData.tL_30 = ELw_30;
  prdData.tL_25 = ELw_25;
  prdData.tL_20 = ELw_20;
  prdData.tL_15 = ELw_15;
  prdData.LN = EN;
  prdData.Tabtpam = [EaT_b EtT_p EaT_m];

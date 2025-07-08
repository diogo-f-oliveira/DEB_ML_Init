function [prdData, info] = predict_Daphnia_similoides(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_10 = tempcorr(temp.tL10, T_ref, T_A); 
  TC_17 = tempcorr(temp.tL17, T_ref, T_A); 
  TC_20 = tempcorr(temp.tL20, T_ref, T_A); 
  TC_23 = tempcorr(temp.tL23, T_ref, T_A); 
  TC_25 = tempcorr(temp.tL25, T_ref, T_A); 
  TC_27 = tempcorr(temp.tL27, T_ref, T_A); 
  TC_29 = tempcorr(temp.tL29, T_ref, T_A); 
  TC_32 = tempcorr(temp.tL32, T_ref, T_A); 
  TC_tp = [TC_10;TC_17;TC_20;TC_23;TC_25;TC_27;TC_29;TC_32];
 
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = t_0 + tau_b/ kT_M;         % d, age at birth at f and T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  
  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = 1e3 * L_i^3 * d_V * (1 + f * ome); % mg, ultimate dry weight
 
  % reprod
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  
  % uni-variate data
  
  % time-length
  tf = [20 f_10_20; 80 f_10_80]; tf(:,1)=tf(:,1)*k_M*TC_10;
  tvel = get_tp(pars_tp, tf,[],tL10(:,1)*k_M*TC_10); 
  ELw_10 = L_m*tvel(:,4)/del_M; 
  %
  tvel = get_tp(pars_tp, f_17,[],tL17(:,1)*k_M*TC_17); 
  ELw_17 = L_m*tvel(:,4)/del_M; 
  %
  tvel = get_tp(pars_tp, f_20,[],tL20(:,1)*k_M*TC_20); 
  ELw_20 = L_m*tvel(:,4)/del_M; 
  %
  tvel = get_tp(pars_tp, f_23,[],tL23(:,1)*k_M*TC_23); 
  ELw_23 = L_m*tvel(:,4)/del_M; 
  %
  tvel = get_tp(pars_tp, f_25,[],tL25(:,1)*k_M*TC_25); 
  ELw_25 = L_m*tvel(:,4)/del_M; 
  %
  tvel = get_tp(pars_tp, f_27,[],tL27(:,1)*k_M*TC_27); 
  ELw_27 = L_m*tvel(:,4)/del_M; 
  %
  tvel = get_tp(pars_tp, f_29,[],tL29(:,1)*k_M*TC_29); 
  ELw_29 = L_m*tvel(:,4)/del_M; 
  %
  tvel = get_tp(pars_tp, f_32,[],tL32(:,1)*k_M*TC_32); 
  ELw_32 = L_m*tvel(:,4)/del_M; 
  
  % time-cum offspring
  pars_R10 = [kap; kap_R; g; TC_10*k_J; TC_10*k_M; L_T; TC_10*v; U_Hb/TC_10; U_Hp/TC_10]; % compose parameter vector at T
  EN_10= TC * cum_reprod(tN10(:,1), f_10_20, pars_R10); % #, cum offspring
  pars_R17 = [kap; kap_R; g; TC_17*k_J; TC_17*k_M; L_T; TC_17*v; U_Hb/TC_17; U_Hp/TC_17]; % compose parameter vector at T
  EN_17= TC * cum_reprod(tN17(:,1), f_17, pars_R17); % #, cum offspring
  pars_R20 = [kap; kap_R; g; TC_20*k_J; TC_20*k_M; L_T; TC_20*v; U_Hb/TC_20; U_Hp/TC_20]; % compose parameter vector at T
  EN_20= TC * cum_reprod(tN20(:,1), f_20, pars_R20); % #, cum offspring
  pars_R23 = [kap; kap_R; g; TC_23*k_J; TC_23*k_M; L_T; TC_23*v; U_Hb/TC_23; U_Hp/TC_23]; % compose parameter vector at T
  EN_23= TC * cum_reprod(tN23(:,1), f_23, pars_R23); % #, cum offspring
  pars_R25 = [kap; kap_R; g; TC_25*k_J; TC_25*k_M; L_T; TC_25*v; U_Hb/TC_25; U_Hp/TC_25]; % compose parameter vector at T
  EN_25= TC * cum_reprod(tN25(:,1), f_25, pars_R25); % #, cum offspring
  pars_R27 = [kap; kap_R; g; TC_27*k_J; TC_27*k_M; L_T; TC_27*v; U_Hb/TC_27; U_Hp/TC_27]; % compose parameter vector at T
  EN_27= TC * cum_reprod(tN27(:,1), f_27, pars_R27); % #, cum offspring
  pars_R29 = [kap; kap_R; g; TC_29*k_J; TC_29*k_M; L_T; TC_29*v; U_Hb/TC_29; U_Hp/TC_29]; % compose parameter vector at T
  EN_29= TC * cum_reprod(tN29(:,1), f_29, pars_R29); % #, cum offspring
  pars_R32 = [kap; kap_R; g; TC_32*k_J; TC_32*k_M; L_T; TC_32*v; U_Hb/TC_32; U_Hp/TC_32]; % compose parameter vector at T
  EN_32= TC * cum_reprod(tN32(:,1), f_32, pars_R32); % #, cum offspring

  % temperature-time since birth at puberty
  t10_p = get_tp(pars_tp, f_10_20)/k_M/TC_10;
  t17_p = get_tp(pars_tp, f_17)/k_M/TC_17;
  t20_p = get_tp(pars_tp, f_20)/k_M/TC_20;
  t23_p = get_tp(pars_tp, f_23)/k_M/TC_23;
  t25_p = get_tp(pars_tp, f_25)/k_M/TC_25;
  t27_p = get_tp(pars_tp, f_27)/k_M/TC_27;
  t29_p = get_tp(pars_tp, f_29)/k_M/TC_29;
  t32_p = get_tp(pars_tp, f_32)/k_M/TC_32;
  EtT_p = [t10_p;t17_p;t20_p;t23_p;t25_p;t27_p;t29_p;t32_p];
  
  % pack to output
  prdData.tL10 = ELw_10;
  prdData.tL17 = ELw_17;
  prdData.tL20 = ELw_20;
  prdData.tL23 = ELw_23;
  prdData.tL25 = ELw_25;
  prdData.tL27 = ELw_27;
  prdData.tL29 = ELw_29;
  prdData.tL32 = ELw_32;
  prdData.tN10 = EN_10;
  prdData.tN17 = EN_17;
  prdData.tN20 = EN_20;
  prdData.tN23 = EN_23;
  prdData.tN25 = EN_25;
  prdData.tN27 = EN_27;
  prdData.tN29 = EN_29;
  prdData.tN32 = EN_32;
  prdData.Ttp  = EtT_p;

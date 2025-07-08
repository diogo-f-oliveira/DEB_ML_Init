function [prdData, info] = predict_Eurycercus_vernalis(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_10 = tempcorr(C2K(10), T_ref, T_A);
  TC_15 = tempcorr(C2K(15), T_ref, T_A);
  TC_20 = tempcorr(C2K(20), T_ref, T_A);
  TC_25 = tempcorr(C2K(25), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = tau_b/ kT_M;               % d, age at birth at f and T_ref
  Wd_b = 1e6 * L_b^3 * d_V * (1 + f * ome); % mug, dry weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = 1e6 * L_p^3 * d_V * (1 + f * ome); % mug, dry weight at puberrty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty
  
  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = 1e6 * L_i^3 * d_V * (1 + f * ome); % g, ultimate dry weight
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  
  % uni-variate data
  
  % time-length
  tf = [0 f_000; 100 f_100]; tf(:,1) = tf(:,1)* k_M;
  tvel = get_tp(pars_tp, tf,[],tL(:,1)*k_M * TC_25);
  ELw_25 = L_m * tvel(:,4)/ del_M;
  %
  tvel = get_tp(pars_tp, tf,[],tL(:,1)*k_M * TC_20);
  ELw_20 = L_m * tvel(:,4)/ del_M;
  %
  tvel = get_tp(pars_tp, tf,[],tL(:,1)*k_M * TC_15);
  ELw_15 = L_m * tvel(:,4)/ del_M;
  %
  tvel = get_tp(pars_tp, tf,[],tL(:,1)*k_M * TC_10);
  ELw_10 = L_m * tvel(:,4)/ del_M;


  % time-cum reproduction
  TC = TC_25;
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hp/TC]; % compose parameter vector at T
  EN_25 = cum_reprod(tN(:,1), f_tN, pars_R);
  %
  TC = TC_20;
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hp/TC]; % compose parameter vector at T
  EN_20 = cum_reprod(tN(:,1), f_tN, pars_R);
  %
  TC = TC_15;  
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hp/TC]; % compose parameter vector at T
  EN_15 = cum_reprod(tN(:,1), f_tN, pars_R);
  TC = TC_10;
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hp/TC]; % compose parameter vector at T
  EN_10 = cum_reprod(tN(:,1), f_tN, pars_R);
  
  % pack to output
  prdData.tL = [ELw_25 ELw_20 ELw_15 ELw_10];
  prdData.tN = [EN_25 EN_20 EN_15 EN_10];
  
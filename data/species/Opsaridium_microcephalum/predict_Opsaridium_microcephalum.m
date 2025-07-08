function [prdData, info] = predict_Opsaridium_microcephalum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC; 
  TC_S = tempcorr(temp.tL_S, T_ref, T_A); 
  TC_W = tempcorr(temp.tL_W, T_ref, T_A); 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
      
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ kT_M;               % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;

  % time-length
  tf = [500 f_0500; 1000 f_1000]; tf(:,1)=tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf, [], tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M; % cm, length
  % 
  tvel = get_tj(pars_tj, f_tL, [], tL_S(:,1)*k_M*TC_S);
  ELw_S = L_m * tvel(:,4)/ del_M; % cm, length
  %
  tvel = get_tj(pars_tj, f_tL, [], tL_W(:,1)*k_M*TC_W);
  ELw_W = L_m * tvel(:,4)/ del_M; % cm, length
  
  % length-fecundity
  EN = 365 * TC * reprod_rate_j(LN(:,1)*del_M, f, pars_R); % $, yearly fecundity
  
%% pack to output
  prdData.tL = ELw;
  prdData.tL_S = ELw_S;
  prdData.tL_W = ELw_W;
  prdData.LN = EN;


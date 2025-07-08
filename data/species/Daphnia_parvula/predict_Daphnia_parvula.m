function [prdData, info] = predict_Daphnia_parvula(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tL, T_ref, T_A); kT_M = TC * k_M;
  TC_am = tempcorr(C2K(Tam(:,1)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = tau_b/ kT_M;               % d, age at birth at f and T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  t_p = (tau_p - tau_b)/ k_M;       % d, time since birth at puberty at T_ref
  
  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = 1e6 * L_i^3 * d_V * (1 + f * ome); % mug, ultimate dry weight
 
  % reprod
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  a_m = tau_m/ k_M;                     % d, mean life span at T_ref
  
  % pack to output
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  
  % uni-variate data
  
  % time-length
  tvel = get_tp(pars_tp, f,[],tL(:,1)*kT_M); 
  ELw = L_m*tvel(:,4)/del_M; 
  %
  tvel = get_tp(pars_tp, f_tL,[],tL_S(:,1)*kT_M); 
  ELw_S = L_m*tvel(:,4)/del_M; 
  
  % temperature-time since birth at puberty
  EtT_p = t_p ./ TC_am;

  % temperature-life span
  EaT_m = a_m ./ TC_am;
  
  % temperature-fecundity
  EN = NaN(4,1);
  pars_R = [kap; kap_R; g; TC_am(1)*k_J; TC_am(1)*k_M; L_T; TC_am(1)*v; U_Hb/TC_am(1); U_Hp/TC_am(1)]; % compose parameter vector at T
  EN(1) = cum_reprod(EaT_m(1), f, pars_R); % #/d, max reprod rate
  %
  pars_R = [kap; kap_R; g; TC_am(2)*k_J; TC_am(2)*k_M; L_T; TC_am(2)*v; U_Hb/TC_am(2); U_Hp/TC_am(2)]; % compose parameter vector at T
  EN(2) = cum_reprod(EaT_m(2), f, pars_R); % #/d, max reprod rate 
  %
  pars_R = [kap; kap_R; g; TC_am(3)*k_J; TC_am(3)*k_M; L_T; TC_am(3)*v; U_Hb/TC_am(3); U_Hp/TC_am(3)]; % compose parameter vector at T
  EN(3) = cum_reprod(EaT_m(3), f, pars_R); % #/d, max reprod rate 
  %
  pars_R = [kap; kap_R; g; TC_am(4)*k_J; TC_am(4)*k_M; L_T; TC_am(4)*v; U_Hb/TC_am(4); U_Hp/TC_am(4)]; % compose parameter vector at T
  EN(4) = cum_reprod(EaT_m(4), f, pars_R); % #/d, max reprod rate 

  % pack to output
  prdData.tL = ELw;
  prdData.tL_S = ELw_S;
  prdData.Ttp = EtT_p;
  prdData.Tam = EaT_m;
  prdData.TN = EN;
  
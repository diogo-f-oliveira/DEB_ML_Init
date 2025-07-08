function [prdData, info] = predict_Bosminopsis_deitersi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_20 = tempcorr(temp.am_20, T_ref, T_A); 
  TC_25 = tempcorr(temp.am_25, T_ref, T_A); 
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, length at birth
  Wd_b = L_b^3 * (1 + f * ome);     % g, dry weight at birth
  a20_b = (t_0 + tau_b/ k_M)/ TC_20;% d, age at birth at 20 C
  a25_b = (t_0 + tau_b/ k_M)/ TC_25;% d, age at birth at 25 C
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  t20_p = (tau_p - tau_b)/ k_M/ TC_20; % d, time since birth at puberty
  t25_p = (tau_p - tau_b)/ k_M/ TC_25; % d, time since birth at puberty
  
  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * ome); % g, ultimate dry weight
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  R20_i = TC_20 * reprod_rate(L_i,f, pars_R); % #/d, max reprod rate
  R25_i = TC_25 * reprod_rate(L_i,f, pars_R); % #/d, max reprod rate
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  a20_m = tau_m/ k_M/ TC_20;            % d, mean life span at T
  a25_m = tau_m/ k_M/ TC_25;            % d, mean life span at T
  
  % pack to output
  prdData.ab_20 = a20_b;
  prdData.ab_25 = a25_b;
  prdData.tp_20 = t20_p;
  prdData.tp_25 = t25_p;
  prdData.am_20 = a20_m;
  prdData.am_25 = a25_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdi = Wd_i;
  prdData.Ri_20 = R20_i;
  prdData.Ri_25 = R25_i;
  
  % uni-variate data
  
  % time-length
  tvel = get_tp(pars_tp, f_tL, [], tL(:,1)*instar.tL(2)*k_M*TC_20);
  ELw_20 = L_m * tvel(:,4)/del_M; % cm, carapace length
  %
  tvel = get_tp(pars_tp, f_tL, [], tL(:,1)*instar.tL(1)*k_M*TC_25);
  ELw_25 = L_m * tvel(:,4)/del_M; % cm, carapace length

  % pack to output
  prdData.tL = [ELw_25 ELw_20];

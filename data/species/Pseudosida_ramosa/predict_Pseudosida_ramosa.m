function [prdData, info] = predict_Pseudosida_ramosa(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  if t_0 < 0; prdData = []; info = 0; return; end
  
  % compute temperature correction factors
  TC_25 = tempcorr(C2K(25), T_ref, T_A); 
  TC_30 = tempcorr(C2K(30), T_ref, T_A); 
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t25_p, t25_b, l25_p, l25_b, info] = get_tp(pars_tp, f_25); % -, scaled length at birth at f
  [t30_p, t30_b, l30_p, l30_b] = get_tp(pars_tp, f_30); % -, scaled length at birth at f
    
  % birth
  L_b = L_m * l25_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  a25_b = (t_0 + t25_b/ k_M)/ TC_25;  % d, age at birth at f and T
  a30_b = (t_0 + t30_b/ k_M)/ TC_30;  % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l25_p;                % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty 
  t25_p = (t25_p - t25_b)/ k_M/ TC_25;  % d, time since birth at puberty at f and T
  t30_p = (t30_p - t30_b)/ k_M/ TC_30;  % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * ome); % g, ultimate dry weight
   
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  R25_i = TC_25 * reprod_rate(L_i, f_25, pars_R);
  R30_i = TC_30 * reprod_rate(L_i, f_30, pars_R);

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f_25, l25_b); % -, scaled mean life span at T_ref
  a25_m = tau_m/ k_M/ TC_25;            % d, mean life span at T
  %
  tau_m = get_tm_s(pars_tm, f_30, l30_b); % -, scaled mean life span at T_ref
  a30_m = tau_m/ k_M/ TC_30;            % d, mean life span at T

  % pack to output
  prdData.ab_25 = a25_b;
  prdData.ab_30 = a30_b;
  prdData.tp_25 = t25_p;
  prdData.tp_30 = t30_p;
  prdData.am_25 = a25_m;
  prdData.am_30 = a30_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  prdData.Ri_25 = R25_i;
  prdData.Ri_30 = R30_i;
  
  % uni-variate data
  
  % time-length
  tvel = get_tp(pars_tp, f_25, [], tL_25(:,1)*k_M*TC_25);
  ELw_25 = L_m * tvel(:,4)/del_M; 
  %
  tvel = get_tp(pars_tp, f_30, [], tL_30(:,1)*k_M*TC_30);
  ELw_30 = L_m * tvel(:,4)/del_M; 

    
  % pack to output
  prdData.tL_25 = ELw_25;
  prdData.tL_30 = ELw_30;
  
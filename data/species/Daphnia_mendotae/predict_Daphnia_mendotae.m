function [prdData, info] = predict_Daphnia_mendotae(par, data, auxData)
   % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
  % compute temperature correction factors
    TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp ];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if ~info; prdData = []; return; end
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Wd_b = 1e6 * L_b^3 * d_V *(1 + f * w) ; % mug, dry weight at birth at f (remove d_V for wet weight)
  aT_b = tau_b / kT_M;              % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Wd_p = 1e6 * L_p^3 * (1 + f * ome) * d_V; % mug, dry weight at puberty
  tT_p = (tau_p - tau_b) / kT_M;    % d, time since birth at puberty
    
  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Wd_i = 1e6 * L_i^3 * d_V * (1 + f * w); % mug, ultimate dry weight 
   
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                     % d, mean life span 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;

  % uni-variate data

  % time-weight
  tf = [30 f_030; 60 f_060; 90 f_090; 120 f_120]; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [], tW(:,1)*kT_M);
  EWd = 1e6 * d_V * (L_m * tvel(:,4)).^3 .* (1 + ome * tvel(:,3)); % mug, dry weight
 
  % pack to output
  prdData.tW = EWd;

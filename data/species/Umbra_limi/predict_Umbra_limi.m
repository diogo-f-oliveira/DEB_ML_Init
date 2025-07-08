function [prdData, info] = predict_Umbra_limi(par, data, auxData)
 
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p tau_b l_p l_b info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ kT_M;               % d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                    % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
    
  % time - length/weight FBL
  L_b = L_m * get_lb([g k v_Hb], f_FBL); L_i = L_m * f_FBL; % cm, structural  length
  rT_B = kT_M/ 3/ (1 + f_FBL/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tL_FBL(:,1)); % cm, structural length
  ELw_FBL = L/ del_M; EWw_FBL = L.^3 * (1 + f_FBL * ome); % cm, g

  % time - length/weight LMO
  L_b = L_m * get_lb([g k v_Hb], f_LMO); L_i = L_m * f_LMO; % cm, structural  length
  rT_B = kT_M/ 3/ (1 + f_LMO/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tL_LMO(:,1)); % cm, structural length
  ELw_LMO = L/ del_M; EWw_LMO = L.^3 * (1 + f_LMO * ome); % cm, g

  % length - weight
  EWw = (LWw(:,1) * del_M).^3 * (1 + f_FBL * ome); % g, wet weight
  
  % pack to output
  prdData.tL_FBL = ELw_FBL;
  prdData.tL_LMO = ELw_LMO;
  prdData.tWw_FBL = EWw_FBL;
  prdData.tWw_LMO = EWw_LMO;
  prdData.LWw = EWw;
     
function [prdData, info] = predict_Hemidactylus_turcicus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_WO_10 = tempcorr(temp.WwJO_10, T_ref, T_A);
  TC_WO_20 = tempcorr(temp.WwJO_20, T_ref, T_A);
  TC_WO_30 = tempcorr(temp.WwJO_30, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f 
  aT_b = tau_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);        % g, wet weight at puberty 
  tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
    
  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight

  % length-respiration
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  p_ref = p_Am * L_m^2;               % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];

  % temp = 10 C
  % L = (o2Ww / (1 + f * ome)).^(1/3); % cm, structural length, using 239 g wet mass
  L = (WwJO_10(:,1) / (1 + f * ome)).^(1/3); % cm, structural length, using measured wet mass
  pACSJGRD = p_ref * scaled_power(L, f, pars_power, l_b, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  pADG(:,1) = 0; % exclude assim contribution
  JM = pADG * eta_O' * O2M;                     % mol/d, mineral fluxes
  X_gas = 24.06;  % gas correction factor, L/mol
  % EO = (- 1 * (JM(:,3) * X_gas) .* tempcorr(C2K(TO(:,1)), T_ref, pars_T))/24/60*1000; % L/day to ml/min
  EO_10 = (- 1 * (JM(:,3) * X_gas) .* TC_WO_10)/24/60*1000; % L/day to ml/min

  % temp = 20 C
  L = (WwJO_20(:,1) / (1 + f * ome)).^(1/3); % cm, structural length, using measured wet mass
  pACSJGRD = p_ref * scaled_power(L, f, pars_power, l_b, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  pADG(:,1) = 0; % exclude assim contribution
  JM = pADG * eta_O' * O2M;                     % mol/d, mineral fluxes
  X_gas = 24.06;  % gas correction factor, L/mol
  EO_20 = (- 1 * (JM(:,3) * X_gas) .* TC_WO_20)/24/60*1000; % L/day to ml/min

  % temp = 30 C
  L = (WwJO_30(:,1) / (1 + f * ome)).^(1/3); % cm, structural length, using measured wet mass
  pACSJGRD = p_ref * scaled_power(L, f, pars_power, l_b, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  pADG(:,1) = 0; % exclude assim contribution
  JM = pADG * eta_O' * O2M;                     % mol/d, mineral fluxes
  X_gas = 24.06;  % gas correction factor, L/mol
  EO_30 = (- 1 * (JM(:,3) * X_gas) .* TC_WO_30)/24/60*1000; % L/day to ml/min

  % pack to output
  prdData.LW = EWw;
  %   prdData.TO = EO;
  prdData.WwJO_10 = EO_10;
  prdData.WwJO_20 = EO_20;
  prdData.WwJO_30 = EO_30;
  
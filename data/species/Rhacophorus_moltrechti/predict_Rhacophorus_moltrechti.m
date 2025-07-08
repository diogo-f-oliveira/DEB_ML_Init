function [prdData, info] = predict_Rhacophorus_moltrechti(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b] = get_tp(pars_tj, f);       % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
  tT_j = (t_j - t_b)/ k_M;           % d, time since birth at metam at T_ref
  
  % puberty 
  tT_p = (t_p - t_j)/ k_M/ TC;      % d, time since metam at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_tW;               % d, mean life span at T
    
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-weight
  rT_B = TC_tW * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(- rT_B * tW(:,1)); % cm, struc length
  EWw = L.^3 * (1 + f * w); % g, wet weight
  
  % temp-larval stage
  Etj = tT_j ./ tempcorr(C2K(Ttj(:,1)), T_ref, T_A);     % d, time since birth at metam

  % pack to output
  prdData.tW = EWw;
  prdData.Ttj = Etj;


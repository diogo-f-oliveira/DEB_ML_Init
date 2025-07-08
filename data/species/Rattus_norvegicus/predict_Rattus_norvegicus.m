function [prdData, info] = predict_Rattus_norvegicus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
 
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = k_M * TC;  
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; info = 1;
  [t_p, t_x, t_b, l_p, l_x, l_b] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + t_b/ k_M/ TC;        % d, gestation time at f and T

  % weaning
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at weaning at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.tg = aT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight 
  L_0 = (Ww0.tW100/ (1 + w * f_tW100))^(1/3); 
  %
  rT_B = kT_M/ 3/ (1 + f_tW100/ g); L_i = L_m * f_tW100;
  L = L_i - (L_i - L_0) * exp(- rT_B * tW100(:,1)); EWw_100 = L.^3 * (1 + f_tW100 * ome);
  %
  rT_B = kT_M/ 3/ (1 + f_tW75/ g); L_i = L_m * f_tW75;
  L = L_i - (L_i - L_0) * exp(- rT_B * tW75(:,1)); EWw_75 = L.^3 * (1 + f_tW75 * ome);
  %
  rT_B = kT_M/ 3/ (1 + f_tW45/ g); L_i = L_m * f_tW45;
  L = L_i - (L_i - L_0) * exp(- rT_B * tW45(:,1)); EWw_45 = L.^3 * (1 + f_tW45 * ome);

  % pack to output
  prdData.tW100 = EWw_100;
  prdData.tW75 = EWw_75;
  prdData.tW45 = EWw_45;
  
end

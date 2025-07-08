function [prdData, info] = predict_Alburnus_alburnus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); 
  TC_WdJO = tempcorr(temp.WdJO, T_ref, T_A); 
  kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M   ;              % d, age at birth 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p^3 * (1 + f * w);       % cm, TL at puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length
  Lw_i = L_i/ del_M;                % cm, ultimate standard length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];    % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                 % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T


  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % univariate data

  % time-dry weight
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tW);
  rT_j = rho_j * k_M; rT_B = rho_B * k_M; 
  tT_j = (t_j - t_b)/ kT_M; L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tWd(tWd(:,1)<tT_j,1)*rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tWd(tWd(:,1)>=tT_j,1) - tT_j)); 
  EWd = [L_bj; L_ji].^3 * d_V * (1 + f_tW * ome)*1e3; % mg, dry weight

  % dry weight - food consumption
  EpT_X = (WdpX(:,1)/(1 + f_tW * ome)/ d_V/ 1e3).^(2/3) * p_Am * f_tW/ kap_X; % J/d, food intake
 
  % dry weight - O2 consumption
  L = (WdJO(:,1)/(1 + f_tW * ome)/ d_V/ 1e3).^(1/3); % cm, struc length
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  pT_ref = TC_WdJO * p_Am * L_m^2; % J/d, max assimilation power at max size
  pACSJGRD = pT_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);  % J/d, powers
  pADG = pACSJGRD(:, [1 7 5]);
  J_M = - (n_M\n_O) * eta_O * pADG';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O = - 1e6/24*J_M(3,:)'; % mumol/h, J_O

  prdData.tWd = EWd;
  prdData.WdpX = EpT_X;
  prdData.WdJO = EJT_O;
end
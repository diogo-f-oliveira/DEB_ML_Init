function [prdData, info] = predict_Oreochromis_niloticus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A);
  TC_tW = tempcorr(temp.tW3, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, standard length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-weight
  % feeding level 3
  L_0 = (Ww_0/(1 + f * w))^(1/3); kT_M = k_M * TC_tW;
  f = f_3;  rT_B = kT_M/ 3/ (1 + f/ g); L_i = L_m * f;
  L = L_i - (L_i - L_0) * exp( - rT_B * tW3(:,1)); % cm, structural length at time
  EWw_3 = L.^3 * (1 + f * w); % g, wet weight
  % feeding level 2
  f = f_2;  rT_B = kT_M/ 3/ (1 + f/ g); L_i = L_m * f;
  L = L_i - (L_i - L_0) * exp( - rT_B * tW2(:,1)); % cm, structural length at time
  EWw_2 = L.^3 * (1 + f * w); % g, wet weight
  % feeding level 1
  f = f_1;  rT_B = kT_M/ 3/ (1 + f/ g); L_i = L_m * f;
  L = L_i - (L_i - L_0) * exp( - rT_B * tW1(:,1)); % cm, structural length at time
  EWw_1 = L.^3 * (1 + f * w); % g, wet weight
  
  % length-fecundity
  EN = TC * 365 * reprod_rate(LN(:,1)*del_M, f, pars_R);               % reproduction rate 

%% pack to output
  prdData.tW3 = EWw_3;
  prdData.tW2 = EWw_2;
  prdData.tW1 = EWw_1;
  prdData.LN = EN;


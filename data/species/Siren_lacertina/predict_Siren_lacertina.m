function [prdData, info] = predict_Siren_lacertina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Lw_b = L_b/del_MTL;               % cm, total length at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth 

  % puberty
  L_p = L_m * l_p;                  % cm, structural length at 1st brood 
  Lw_p = L_p/ del_MTL;              % cm, total length at 1st brood 
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at 1st brood 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at 1st brood

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_MTL;              % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);               % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % time-length
  L_b = L_m * get_lb([g; k; v_Hb], f_tL); L_i = f_tL * L_m; rT_B = TC * k_M/ 3/ (1 + f_tL/g);
  ELw = (L_i - (L_i - L_b) * exp(- rT_B * tL(:,1)))/ del_MSVL;
  
  % length-change in length/weight
  rT_B = TC * k_M/ 3/ (1 + f_LdL/ g); L_i = f_LdL * L_m;
  EdLw = rT_B * (L_i - LdL(:,1) * del_MSVL)/ del_MSVL;
  % W = L^3 (1 + f w); dW = 3 L^2 (1 + f w) dL
  L = LdL(:,1) * del_MSVL;
  EdWw = rT_B * (L_i - L) .* L.^2 * (1 + f_LdL * w) * 3;
  
  % length-weight
  EWw_SVL = (LW_SVL(:,1) * del_MSVL).^3 * (1 + f * w);
  EWw_TL = (LW_TL(:,1) * del_MTL).^3 * (1 + f * w);
  
  
  % pack to output
  prdData.tL = ELw;
  prdData.LdL = EdLw;
  prdData.LdW = EdWw;
  prdData.LW_TL = EWw_TL;
  prdData.LW_SVL = EWw_SVL;


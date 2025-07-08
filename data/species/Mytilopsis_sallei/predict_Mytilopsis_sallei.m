function [prdData, info] = predict_Mytilopsis_sallei(par, data, auxData)
    
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
          
            
  pars_T=[T_A,T_L,T_H,T_AL,T_AH];
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_aj = tempcorr(temp.aj, T_ref, pars_T);
  TC_ap = tempcorr(temp.ap, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  TC_XJX = tempcorr(temp.XJX, T_ref, pars_T);
  TC_tL = tempcorr(temp.tL, T_ref, pars_T);

  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Me;               % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis
  aT_j = t_j/ k_M/ TC_aj;           % d, age at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % g, wet weight at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R); % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
    
  % pack to output
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
 
  
  % uni-variate data
  
  % time - length of larva
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  rT_B = TC_tL * rho_B * k_M;     % 1/d, von Bert growth rate   
  rT_j = TC_tL * rho_j * k_M;     % 1/d, exponential growth rate
  tT_j = (t_j - t_b)/ k_M/ TC_tL; % time since birth at metamorphosis at T
  L_bj = L_b * exp(tL(tL(:,1) < tT_j,1) * rT_j/3); % cm, struct length exponential growth as V1-morph
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(tL(:,1) >= tT_j,1) - tT_j)); % cm, struc length as isomorph
  L = [L_bj; L_ji]; w_del = min(1, (L - L_b)/ L_j); % weights for shape changes
  ELw = L ./ ((1 - w_del) * del_Me + w_del * del_M); % cm, shell length
  
  % length - weight
   EWw = (LW(:,1) * del_M).^3 * (1 + f * w);      % g, wet weight

  % food concentration - ingestion rate
  X = 1e-3 * d_X * XJX(:,1)/ w_X;                  % C-mol/l, food concentration
  f = X ./ (K + X);                                % -, scaled func response    
  L =  length.XJX * del_M;                         % cm, structural length               
  EJX =  1e6 * TC_XJX * J_X_Am * w_X * f .* L.^2/ d_X; % mug/d, ingestion rate

  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
  prdData.XJX = EJX;
  
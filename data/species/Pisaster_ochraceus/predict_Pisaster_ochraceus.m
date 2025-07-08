function [prdData, info] = predict_Pisaster_ochraceus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_R400 = tempcorr(temp.R400, T_ref, T_A);
  TC_tW = tempcorr(temp.tW_1, T_ref, T_A);
  TC_WJO = tempcorr(temp.WJO, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Me;               % cm, physical length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  L_j = del_j^(1/3) * L_m * l_j;    % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_400 = TC_R400 * reprod_rate_j((400/(1 + f * w))^(1/3), f, pars_R); % #/d, reproduction rate at 400 g

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.R400 = RT_400;
  
  % uni-variate data

  % L-W data (wet weights including calcareaous structures such as spines and oscicles) at Arm Length
  EWw = (LW(:,1) * del_M).^3 * (1 + f_tW * w);

  % WJO-data
  l = ((WJO(:,1)./(1 + f * w)).^(1/3))/ L_m; % -, scaled structural length
  e = f_tW;                                  % -, scaled reserve density at constant f
  pA = f * l.^2;                             % -, scaled assimilation power 
  pD = kap * l.^3  + (1 - kap) * e .* l .^2 .* (g + l) ./ (g + e); % -, scaled dissapating power (page 78 DEB book)
  pG = kap * l.^2 .* (e-l)./(1 + e/g);       % -, scaled growth power (page 78 DEB book)
  pD = pD - (pG<0).* pG;                     % assume that reserves and structure have the same composition in shrinking
  pG = (pG>0).* pG;
  EJO = (n_M\n_O)' * [-1/kap_X/mu_X 0 0; 0 0 M_V/ E_G; 1/mu_E -1/mu_E -1/mu_E; kap_P/kap_X/mu_P 0 0] * [pA'; pD'; pG']; 
  EJO = TC_WJO * L_m^2 * p_Am * EJO(3,:)';   % mol/d, O2 consumption
  EJO = 1e6 * EJO ./ WJO(:,1)/ 24;           % mumol/h.g, specific O2 consumption
  
  % time-weight 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tW);
  kT_M = k_M * TC_tW; rT_B = rho_B * kT_M;        
  L_j = L_m * l_j * del_j^(1/3); L_i = L_m * l_i; 
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_1(:,1)); 
  ELw_1 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_1(:,1)); 
  EWw_1 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_2(:,1)); 
  ELw_2 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B *tW_2(:,1)); 
  EWw_2 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_3(:,1)); 
  ELw_3 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_3(:,1)); 
  EWw_3 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_4(:,1)); 
  ELw_4 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_4(:,1)); 
  EWw_4 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_5(:,1)); 
  ELw_5 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_5(:,1)); 
  EWw_5 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_6(:,1)); 
  ELw_6 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_6(:,1)); 
  EWw_6 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_7(:,1)); 
  ELw_7 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_7(:,1)); 
  EWw_7 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_8(:,1)); 
  ELw_8 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_8(:,1)); 
  EWw_8 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_9(:,1)); 
  ELw_9 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_9(:,1)); 
  EWw_9 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_10(:,1)); 
  ELw_10 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_10(:,1)); 
  EWw_10 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_11(:,1)); 
  ELw_11 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_11(:,1)); 
  EWw_11 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_12(:,1)); 
  ELw_12 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_12(:,1)); 
  EWw_12 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_13(:,1)); 
  ELw_13 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_13(:,1)); 
  EWw_13 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_14(:,1)); 
  ELw_14 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_14(:,1)); 
  EWw_14 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_15(:,1)); 
  ELw_15 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_15(:,1)); 
  EWw_15 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_16(:,1)); 
  ELw_16 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_16(:,1)); 
  EWw_16 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_17(:,1)); 
  ELw_17 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_17(:,1)); 
  EWw_17 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_18(:,1)); 
  ELw_18 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_18(:,1)); 
  EWw_18 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_19(:,1)); 
  ELw_19 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_19(:,1)); 
  EWw_19 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_20(:,1)); 
  ELw_20 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_20(:,1)); 
  EWw_20 = L.^3 * (1 + f * w);                                
  %
  L = L_i - (L_i - L_j) * exp( - rT_B * tL_21(:,1)); 
  ELw_21 = L/ del_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * tW_21(:,1)); 
  EWw_21 = L.^3 * (1 + f * w);                                
  
  % pack to output
  prdData.LW = EWw; prdData.WJO = EJO;
  prdData.tL_1 = ELw_1; prdData.tW_1 = EWw_1;
  prdData.tL_2 = ELw_2; prdData.tW_2 = EWw_2;
  prdData.tL_3 = ELw_3; prdData.tW_3 = EWw_3;
  prdData.tL_4 = ELw_4; prdData.tW_4 = EWw_4;
  prdData.tL_5 = ELw_5; prdData.tW_5 = EWw_5;
  prdData.tL_6 = ELw_6; prdData.tW_6 = EWw_6;
  prdData.tL_7 = ELw_7; prdData.tW_7 = EWw_7;
  prdData.tL_8 = ELw_8; prdData.tW_8 = EWw_8;
  prdData.tL_9 = ELw_9; prdData.tW_9 = EWw_9;
  prdData.tL_10 = ELw_10; prdData.tW_10 = EWw_10;
  prdData.tL_11 = ELw_11; prdData.tW_11 = EWw_11;
  prdData.tL_12 = ELw_12; prdData.tW_12 = EWw_12;
  prdData.tL_13 = ELw_13; prdData.tW_13 = EWw_13;
  prdData.tL_14 = ELw_14; prdData.tW_14 = EWw_14;
  prdData.tL_15 = ELw_15; prdData.tW_15 = EWw_15;
  prdData.tL_16 = ELw_16; prdData.tW_16 = EWw_16;
  prdData.tL_17 = ELw_17; prdData.tW_17 = EWw_17;
  prdData.tL_18 = ELw_18; prdData.tW_18 = EWw_18;
  prdData.tL_19 = ELw_19; prdData.tW_19 = EWw_19;
  prdData.tL_20 = ELw_20; prdData.tW_20 = EWw_20;
  prdData.tL_21 = ELw_21; prdData.tW_21 = EWw_21;
  
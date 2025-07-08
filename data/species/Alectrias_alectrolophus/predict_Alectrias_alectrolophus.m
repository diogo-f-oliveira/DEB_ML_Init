function [prdData, info] = predict_Alectrias_alectrolophus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);
  if info == 0
     prdData = []; return
  end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);      % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(11*del_M, f, pars_R);             % #/d, reproduction rate at TL 11 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;

  % time-length/weight
  % OB
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_OB);
  rT_B = TC * rho_B * k_M; rT_j = TC * rho_j * k_M; tT_j = (t_j - t_b)/ k_M/ TC;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_OB(tL_OB(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_OB(tL_OB(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_OB = [L_bj; L_ji]/ del_M; % cm, total length
  % 
  L_bj = L_b * exp(tW_OB(tW_OB(:,1) <= tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tW_OB(tW_OB(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  EWw_OB = [L_bj; L_ji].^3 * (1 + f_OB * w); % g, wet weight
  % SO
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_SO);
  rT_B = TC * rho_B * k_M; rT_j = TC * rho_j * k_M; tT_j = (t_j - t_b)/ k_M/ TC;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L_bj = L_b * exp(tL_SO(tL_SO(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_SO(tL_SO(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  ELw_SO = [L_bj; L_ji]/ del_M; % cm, total length
  % 
  L_bj = L_b * exp(tW_SO(tW_SO(:,1) < tT_j,1) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tW_SO(tW_SO(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  EWw_SO = [L_bj; L_ji].^3 * (1 + f_SO * w); % g, wet weight


  % length-weight
  EWw_OBL = (LW_OB(:,1) * del_M).^3 * (1 + f_OB * w);
  EWw_SOL = (LW_SO(:,1) * del_M).^3 * (1 + f_SO * w);
  
%% pack to output
  prdData.tL_OB = ELw_OB;
  prdData.tL_SO = ELw_SO;
  prdData.tW_OB = EWw_OB;
  prdData.tW_SO = EWw_SO;
  prdData.LW_OB = EWw_OBL;
  prdData.LW_SO = EWw_SOL;


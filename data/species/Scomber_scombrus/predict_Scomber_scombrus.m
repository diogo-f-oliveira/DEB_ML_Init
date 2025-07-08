function [prdData, info] = predict_Scomber_scombrus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hh >= E_Hb
      info = 0; prdData = []; return
  end

  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_tb = tempcorr(temp.tb, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_Tah = tempcorr(C2K(Tah(:,1)), T_ref, T_A);
  TC_18 = tempcorr(temp.tL_18, T_ref, T_A);
  TC_15 = tempcorr(temp.tL_15, T_ref, T_A);
  TC_13 = tempcorr(temp.tL_13, T_ref, T_A);
  TC_10 = tempcorr(temp.tL_10, T_ref, T_A);
  TC_18 = tempcorr(temp.tL_18, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
  L_h = aUL(2,3); Lw_h = L_h/ del_M; % cm, total length at birth

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_b = (t_b/ k_M - a_h)/ TC_tb;   % d, time since hatch at birth 

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.tb = tT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % Tah 
  Ea_h = a_h ./ TC_Tah;
  
  % time-length
  % larvae at f
  kT_M = k_M * TC_18; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_18((tL_18(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_18((tL_18(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_18 = [L_bj; L_jm]/ del_M;                                         % cm, total length     
  %
  kT_M = k_M * TC_15; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_15((tL_15(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_15((tL_15(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_15 = [L_bj; L_jm]/ del_M;                                         % cm, total length     
  %
  kT_M = k_M * TC_13; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_13((tL_13(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_13((tL_13(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_13 = [L_bj; L_jm]/ del_M;                                         % cm, total length     
  %
  kT_M = k_M * TC_10; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_10((tL_10(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_10((tL_10(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_10 = [L_bj; L_jm]/ del_M;                                         % cm, total length     
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_jm]/ del_M;                                         % cm, total length     
  %
  L_bj = L_b * exp(tW((tW(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tW((tW(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  EWw = [L_bj; L_jm].^3 * (1 + f * w);                               % g, wet weight    
  %
 
  % length-weight
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f * w);                        % g, expected wet weight at time
  EWd_lrv = 1e3 * (LW_lrv(:,1) * del_M).^3 * d_V * (1 + f * w);      % mg, expected dry weight at time

  % weight-fecundity
  L = (WN(:,1)/ (1 + f * w)).^(1/3);           % cm, structual length
  EN = TC * 365 * reprod_rate_j(L, f, pars_R); % #, fecundity in 1e6 eggs

  % pack to output
  prdData.Tah = Ea_h;
  prdData.tL_18 = ELw_18;
  prdData.tL_15 = ELw_15;
  prdData.tL_13 = ELw_13;
  prdData.tL_10 = ELw_10;
  prdData.tL = ELw;
  prdData.tW = EWw;
  prdData.LW_lrv = EWd_lrv;
  prdData.LW = EWw_L;
  prdData.WN = EN;
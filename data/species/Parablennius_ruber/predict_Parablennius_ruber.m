function [prdData, info] = predict_Parablennius_ruber(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  

  % birth
  aT_b = t_b/ kT_M;                 % d, age at birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, standard length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  % metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, standard length at metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - ...
     k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length 
  % 1994 cohort
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M;
  L = L_b * exp(tL_1994(:,1) * rT_j/ 3) .* (tL_1994(:,1) < tT_j);
  L = L + (tL_1994(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_1994(:,1) - tT_j))); % cm, expected length at time
  tLw_1994 = L/ del_M;
  % 1993 cohort
  L = L_b * exp(tL_1993(:,1) * rT_j/ 3) .* (tL_1993(:,1) < tT_j);
  L = L + (tL_1993(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_1993(:,1) - tT_j))); % cm, expected length at time
  tLw_1993 = L/ del_M;
    
%% pack to output
  prdData.tL_1994 = tLw_1994;
  prdData.tL_1993 = tLw_1993;


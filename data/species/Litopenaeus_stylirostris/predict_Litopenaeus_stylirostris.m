function [prdData, info] = predict_Litopenaeus_stylirostris(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - ...
     k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  a_m = t_m/ k_M; aT_m = a_m/ TC;       % d, mean life span at T
   
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length, post metam
  kT_M = k_M * TC; rT_B = rho_B * kT_M;        
  L = L_i - (L_i - L_0 * del_M) * exp( - rT_B * tL(:,1)); % cm, struct length
  ELw = L/ del_M; % cm, abdomial length
 
  % time-weight, post metam
  L = L_i - (L_i - (Ww_0/ (1 + f * w))^(1/3)) * exp( - rT_B * tW(:,1)); % cm, struct length
  EWw = L.^3 * (1 + f * w); % g, wet weight
  %
  L = L_i - (L_i - (Ww_01/ (1 + f * w))^(1/3)) * exp( - rT_B * tW1(:,1)); % cm, struct length
  EWw_1 = L.^3 * (1 + f * w); % g, wet weight

  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;
  prdData.tW1 = EWw_1;
  
function [prdData, info] = predict_Homarus_americanus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_L1 = tempcorr(temp.L1, T_ref, T_A);
  TC_Ww6 = tempcorr(temp.Ww6, T_ref, T_A);
  TC_R = tempcorr(temp.R18, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = U_E0 * p_Am;                % J, initial energy content

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Lw_pC = L_p/ del_MC;              % cm, total carapace at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % growth
  r_B = rho_B * k_M; rT_B = TC_L1 * r_B;         % 1/d, von Bert growth rate 
  L = L_i - (L_i - L_b) * exp(- rT_B * 365);     % cm, struct length at 1 yr
  Lw_1 = L/ del_M;                               % cm, carapace length at 1 yr
  rT_B = TC_Ww6 * r_B;                           % 1/d, von Bert growth rate 
  L = L_i - (L_i - L_b) * exp(- rT_B * 6 * 365); % cm, struct length at 6 yr
  Ww_6 = L^3 * (1 + f * w);                      % g, wet weight at 6 yr
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_18 = TC_R * reprod_rate_j(18 * del_M, f, pars_R);                    % #/d, reproduction rate at TL 18 cm
  RT_45 = TC_R * reprod_rate_j(45 * del_M, f, pars_R);                    % #/d, reproduction rate at TL 45 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  pars_tjm = [g k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  tT_pm = (t_jm - t_bm)/ k_M/ TC_tp;   % d, time since birth at puberty
  L_pm = l_pm * L_m; Lw_pmC = L_pm/ del_MC; % cm, carapace length
  Ww_pm = L_pm * (1 + f * w);          % g, wet weight at puberty
  
  % pack to output
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.LpC = Lw_pC;
  prdData.LpmC = Lw_pmC;
  prdData.Li = Lw_i;
  prdData.L1 = Lw_1;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.Wwi = Ww_i;
  prdData.Ww6 = Ww_6;
  prdData.E0 = E_0;
  prdData.R18 = RT_18;
  prdData.R45 = RT_45;
    
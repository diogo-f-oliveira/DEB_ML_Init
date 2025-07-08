function [prdData, info] = predict_Acyrthosiphon_pisum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  % all data at T_ref = C2K(20)
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hp v_Hp+1e-8];
  [t_p, ~, t_b, l_p, ~, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, body length at birth at f
  Wd_b = 1e3 * L_b^3 * d_V * (1 + f * w); % mg, dry weight at birth
  a_b = t_b/ k_M;                   % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = 1e3 * L_p^3 * d_V * (1 + f * w); % mg, dry weight at puberty 
  t_p = (t_p - t_b)/ k_M;           % d, time since birth at puberty at f and T
  s_M = l_p/ l_b;                   % -, acceleration factor 

  % reproduction (no kappa-rule)
  R_i = kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  a_m = t_m/ k_M;                       % d, mean life span at T
  
  % pack to output
  prdData.ab = a_b;
  prdData.tp = t_p;
  prdData.am = a_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Ri = R_i;
  
  % uni-variate data
  
  % time-weight 
  EWd = 1e3 * min(L_p, L_b * exp(tW(:,1) * k_M * rho_j/ 3)).^3 * d_V * (1 + f * w); % mg, dry weight
  
  % pack to output
  prdData.tW = EWd;

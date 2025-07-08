function [prdData, info] = predict_Hynobius_nebulosus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(C2K(Ttj(:,1)), T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tj, f); % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, physical length at metam at f

  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 


  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  pars_lpm = [g; k; l_T; v_Hb; v_Hpm];      % compose parameter vector
  Lw_pm = L_m * get_lp(pars_lpm, f)/ del_M; % cm, total length at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  
  % univariate data
  % length-change in length
  rT_B = TC * k_M/ 3/ (1 + f_LdL/ g); L_i = f_LdL * L_m; 
  EdLw_f = rT_B * (L_i - LdL_f(:,1) * del_M)/ del_M;
  %
  rT_B = TC * k_M/ 3/ (1 + f_LdL/ g); L_i = f_LdL * L_m; 
  EdLw_m = rT_B * (L_i - LdL_m(:,1) * del_M)/ del_M;

  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN = TC * 365 * reprod_rate(LN(:,1) * del_M, f, pars_R);% #, fecundity at L
  
  % temp-time since birth at metam
  EtT_j = (t_j - t_b)/ k_M./ TC_tj;
  
  prdData.LdL_f = EdLw_f;
  prdData.LdL_m = EdLw_m;
  prdData.LN    = EN;
  prdData.Ttj   = EtT_j;

  
function [prdData, info] = predict_Perforatella_bidentata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Lw_b = L_b/ del_M;                % cm, shell height at birth
  aT_b = t_0 + tau_b/ kT_M;               % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, shell height at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight 
  Lw_i = L_i/ del_M;                % cm, ultimate shell height
  
  % reproduction
  pars_R = [kap; kap_R; g; TC * k_J; TC * k_M; L_T; TC * v; U_Hb/ TC;U_Hj;  U_Hp/ TC]; % compose parameter vector at T
  NT_i = TC * cum_reprod_j(730, f, pars_R); % #, cumulative reproduction
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span
  aT_m = t_m/ kT_M;                  % d, mean life span
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  
  % uni-variate data
  % time-weight
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_jm]/ del_M;               % cm, shell breath

  % pack to output
  prdData.tL = ELw;
 
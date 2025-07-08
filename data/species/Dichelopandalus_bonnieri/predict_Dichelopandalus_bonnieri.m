function [prdData, info] = predict_Dichelopandalus_bonnieri(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.tj, T_ref, T_A);
  kT_M = k_M * TC;                  % 1/d, som maint rate coeff
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_0 + t_b/ kT_M;           % d, age at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam
  tT_j = (t_j-t_b)/ kT_M;           % d, time since birth at metam at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  tT_p = (t_p-t_j)/ kT_M;           % d, time since metam at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  pars_tjm = [g k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, r_jm, r_Bm] = get_tj(pars_tjm, f);
  tT_pm = (t_pm - t_jm)/ kT_M;          % d, time since metam at puberty
  L_pm = l_pm * L_m; Lw_pm = L_pm/ del_M;

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  
  % uni-variate data

  % time-length 
  % females 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
  ELw_f = (L_i - (L_i - L_j) * exp( - rT_B * tL_f(:,1)))/ del_M; % cm, carapace length
  % males 
  ELw_m = (L_i - (L_i - L_j) * exp( - rT_B * tL_m(:,1)))/ del_M; % cm, carapace length
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN = TC * 365 * reprod_rate_j(LN(:,1) * del_M, f, pars_R); % #, yearly fecundity
  
  % length-weight
  EWw = (LW(:,1) * del_MT).^3 * (1 + f * w);   % g, wet weight
  
  % length-length
  ELw = LL(:,1) * del_MT/ del_M; % cm, carapace length

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LN = EN;
  prdData.LW = EWw;
  prdData.LL = ELw;

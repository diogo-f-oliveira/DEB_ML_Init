function [prdData, info] = predict_Ornithoteuthis_antillarum(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  rT_B = rho_B * kT_M; % 1/d, von Bert growth rate
  rT_j = rho_j * kT_M; % 1/d, exponential growth rate
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, mantle length at puberty

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m - t_j/ kT_M));  
  Lw_i = L_am/ del_M;                % cm, mantle length at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  Ni = cum_reprod_j(aT_m, f, pars_R); % #, fecundity
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ni = Ni;
  
  % uni-variate data
  
  % time-length
  tvel = get_tj(pars_tj, f, [], tL_f(:,1) * kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, dorsal mantle length at time
  %
  tvel = get_tj(pars_tj, f, [], tL_m(:,1) * kT_M);
  ELw_m = L_m * tvel(:,4)/ del_M;   % cm, dorsal mantle length at time

  % time-weight
  tvel = get_tj(pars_tj, f, [], tWw_f(:,1) * kT_M);
  EWw_f = (L_m * tvel(:,4)).^3 * (1 + f * ome);   % g, wet weight
  %
  tvel = get_tj(pars_tj, f, [], tWw_m(:,1) * kT_M);
  EWw_m = (L_m * tvel(:,4)).^3 * (1 + f * ome);   % g, wet weight
  
  % length-weight
  EWw_fL = (LWw_f(:,1)*del_M).^3 * (1 + f * w); % g, wet weight
  EWw_mL = (LWw_m(:,1)*del_M).^3 * (1 + f * w); % g, wet weight

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tWw_f = EWw_f;
  prdData.tWw_m = EWw_m;
  prdData.LWw_f = EWw_fL;
  prdData.LWw_m = EWw_mL;
  
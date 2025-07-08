function [prdData, info] = predict_Noturus_stigmosus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
    
  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A);
    
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
    
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
       
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  
  %% uni-variate data

  % time-length
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  % 1/d, von Bert growth rate 
  tT_j = (tau_j - tau_b)/ kT_M; % d, time since birth at metam
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i; % cm, total length at birth, ultimate
  L_bj = L_b * exp(rT_j * tL(tL(:,1)<tT_j,1)/ 3); % cm, struc length 
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(tL(:,1)>=tT_j,1) - tT_j)); % cm, struc length 
  ELw = [L_bj; L_ji]/ del_M; % total length
  
  % length - weight
  EWw_f = (LWw_f(:,1) * del_M).^3 * (1 + f_tL * ome); 
  EWw_m = (LWw_m(:,1) * del_M).^3 * (1 + f_tL * ome);
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  EN = 365 * TC * reprod_rate_j(LN(:,1)*del_M, f_tL, pars_R);  % #/d, max reprod rate

  %% pack to output
  prdData.tL = ELw;
  prdData.LWw_f = EWw_f;
  prdData.LWw_m = EWw_m;
  prdData.LN = EN;
  

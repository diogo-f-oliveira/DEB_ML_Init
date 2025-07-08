function [prdData, info] = predict_Liocranchia_reinhardtii(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; % 1/d, von Bert growth rate
  rT_j = rho_j * kT_M; % 1/d, exponential growth rate
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, mantle length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, mantle length at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  L_1095 = L_i - (L_i - L_j) * exp(- rT_B * (1095 - tT_j));  
  Lw_i = L_1095/ del_M;              % cm, mantle length at death
  Ww_i = L_1095^3 * (1 + f * w);     % g, wet weight at death
 
  % reproduction: GSI at death
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  GSI = (Ww_b/ Ww_i) * cum_reprod_j(1095, f, pars_R); % -, GSI
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, dorsal mantle length at time
  % male
  tvel = get_tj(pars_tj, f, [t_b, f, l_b], tL_m(:,1)*kT_M);
  ELw_m = L_m * tvel(:,4)/ del_M;   % cm, dorsal mantle length at time

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  
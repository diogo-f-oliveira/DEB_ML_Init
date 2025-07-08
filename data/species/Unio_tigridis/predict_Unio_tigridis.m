function [prdData, info] = predict_Unio_tigridis(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_LdL1 = tempcorr(temp.LdL1, T_ref, T_A); 
  TC_LdL2 = tempcorr(temp.LdL2, T_ref, T_A); 

  % zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, shell length at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, shell length at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, shell length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate shell length at f
  Ww_i = L_i^3 * (1 + f * ome);     % g, wet body weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(4*del_M, f, pars_R);  % #/d, reprod rate at SL 4 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % length-change in length post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL1);
  kT_M = k_M * TC_LdL1; rT_B = rho_B * kT_M; Lw_i = L_m * l_i/ del_M;
  EdLw_1 = Lw_i - (Lw_i - LdL1(:,1)) * exp(- rT_B * 365); 
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL2);
  kT_M = k_M * TC_LdL2; rT_B = rho_B * kT_M; Lw_i = L_m * l_i/ del_M;
  EdLw_2 = Lw_i - (Lw_i - LdL2(:,1)) * exp(- rT_B * 365); 
  
  % length-weight 
  EWw = (LWw(:,1)* del_M).^3 * (1 + f * ome); % g, wet weight
   
  % pack to output
  prdData.LdL1 = EdLw_1;
  prdData.LdL2 = EdLw_2;
  prdData.LWw = EWw;
end

  
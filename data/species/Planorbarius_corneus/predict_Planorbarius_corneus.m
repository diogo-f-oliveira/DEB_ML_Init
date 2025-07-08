function [prdData, info] = predict_Planorbarius_corneus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_10 = tempcorr(C2K(10), T_ref, T_A);
  TC_15 = tempcorr(C2K(15), T_ref, T_A);
  TC_25 = tempcorr(C2K(25), T_ref, T_A);
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  a_b = t_0 + tau_b/ k_M;           % d, age at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at 20 C
  
  % pack to output
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;  tT_j = (tau_j - tau_b)/ kT_M; 
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  % time-weight
  L_bj = L_b * exp(tWw((tWw(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWw((tWw(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  EWw = [L_bj; L_jm].^3 * (1 + f_tL * ome);               % g, wet weight
  %
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLT);
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; s_M = l_j/ l_b;
  kT_M = k_M * TC_10; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;        
  L_bj = L_b * exp(tL10((tL10(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL10((tL10(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_10 = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  %
  kT_M = k_M * TC_15; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;        
  L_bj = L_b * exp(tL15((tL15(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL15((tL15(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_15 = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  %
  kT_M = k_M ; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;        
  L_bj = L_b * exp(tL20((tL20(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL20((tL20(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_20 = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  %
  kT_M = k_M * TC_25; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;        
  L_bj = L_b * exp(tL25((tL25(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL25((tL25(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_25 = [L_bj; L_jm]/ del_M;                               % cm, shell diam
  
  % time - survival: Eq (6.5) of Kooy2010 for short growth periods, L = L_i
  h3_W = h_a * f_tLT * s_M * v/ 6/ L_i; h_G = s_G * f_tLT * s_M * v/ L_i; h3_G = h_G^3; 
  th_G = h_G * tS10(:,1) * TC_10; ES_10 = 0.85 * exp(6 * h3_W/ h3_G * (1 - exp(th_G) + th_G + th_G.^2/ 2));
  th_G = h_G * tS15(:,1) * TC_15; ES_15 = 0.85 * exp(6 * h3_W/ h3_G * (1 - exp(th_G) + th_G + th_G.^2/ 2));
  th_G = h_G * tS20(:,1); ES_20 = 0.85 * exp(6 * h3_W/ h3_G * (1 - exp(th_G) + th_G + th_G.^2/ 2));
  th_G = h_G * tS25(:,1) * TC_25; ES_25 = 0.85 * exp(6 * h3_W/ h3_G * (1 - exp(th_G) + th_G + th_G.^2/ 2));
  
  % temperature - age at birth
  Ea_b = a_b ./ TC_ab; % d, age at birth

  % pack to output
  prdData.tL = ELw;
  prdData.tWw = EWw;
  prdData.tL10 = ELw_10;
  prdData.tL15 = ELw_15;
  prdData.tL20 = ELw_20;
  prdData.tL25 = ELw_25;
  prdData.tS10 = ES_10;
  prdData.tS15 = ES_15;
  prdData.tS20 = ES_20;
  prdData.tS25 = ES_25;
  prdData.Tab = Ea_b;
 
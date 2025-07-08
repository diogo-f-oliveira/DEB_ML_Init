function [prdData, info] = predict_Venus_verrucosa(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b,  l_i, r_j, r_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1  + f * ome);    % g, wet weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, shell length at metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  % max gonado-somatic index of fully grown individual 
  %   that spawns once per year see (4.89) of DEB3 
  GSI = 365 * TC * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^2); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLS);
  L_j = L_m * l_j; L_i = L_m * l_i; rT_B = kT_M * rho_B;
  ELw_S = (L_i - (L_i - L_j) * exp(- rT_B * tLS(:,1)))/ del_M; % cm, shell length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLN);
  L_j = L_m * l_j; L_i = L_m * l_i; rT_B = kT_M * rho_B;
  ELw_N = (L_i - (L_i - L_j) * exp(- rT_B * tLN(:,1)))/ del_M; % cm, shell length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLP);
  L_j = L_m * l_j; L_i = L_m * l_i; rT_B = kT_M * rho_B;
  ELw_P = (L_i - (L_i - L_j) * exp(- rT_B * tLP(:,1)))/ del_M; % cm, shell length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLK);
  L_j = L_m * l_j; L_i = L_m * l_i; rT_B = kT_M * rho_B;
  ELw_K = (L_i - (L_i - L_j) * exp(- rT_B * tLK(:,1)))/ del_M; % cm, shell length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLI);
  L_j = L_m * l_j; L_i = L_m * l_i; rT_B = kT_M * rho_B;
  ELw_I = (L_i - (L_i - L_j) * exp(- rT_B * tLI(:,1)))/ del_M; % cm, shell length

  % pack to output
  prdData.tLS = ELw_S;
  prdData.tLN = ELw_N;
  prdData.tLP = ELw_P;
  prdData.tLK = ELw_K;
  prdData.tLI = ELw_I;
end

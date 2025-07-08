function [prdData, info] = predict_Chaoborus_americanus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_20 = tempcorr(temp.am, T_ref, T_A);

  % zero-variate data

  % life cycle
  v_Rj = kap/ (1 - kap) * E_Rj/ E_G; 
  pars_tj_hax = [g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V];  
  [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj_hax, f);
  
  % initial
  u_E0 = get_ue0([g k v_Hb], f, l_b); % -, scaled initial reserve
  E_0 = g * E_m * L_m^3 * u_E0;       % J, initial energy content
  Wd_0 = 1e6 * w_E * E_0/ mu_E;       % mug, initial dry weight
  
  % birth
  a_b = t_b/ k_M; aT_b = a_b/ TC_ab;% d, age at birth at f and T
  L_b = l_b * L_m;                    % cm, structural length at birth
  Lw_b = L_b/ del_M;                  % cm, body length at birth
  Wd_b = 1e3 * L_b^3 * d_V * (1 + f * w); % mg, dry weight at birth
  
  % pupation
  L_j = l_j * L_m;                      % cm, structural length at pupation
  Lw_j = L_j/ del_M;                    % cm, body length nymph at pupation  
  Wd_j = 1e3 * L_j^3 * d_V * (1 + f * w); % mg, dry weight larva at pupation
  tT_j = (t_j - t_b)/ k_M/ TC_20;       % d, time since birth at pupation

  % reproduction
  N_i = kap_R * (1 - kap) * v_Rj * l_j^3/ u_E0; % # of eggs at j

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_20;               % d, mean life span as imago at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Wd0 = Wd_0;
  prdData.Wdb = Wd_b;
  prdData.Wdj = Wd_j;
  prdData.Ni = N_i;
  
  % uni-variate data
  
  % time-weight 
  pars_R = [kap; kap_R; g; TC_20 * k_J; TC_20 * k_M; 0; TC_20 * v; U_Hb/ TC_20; U_Hp/ TC_20; U_Hp/ TC_20 + 1e-8];
  [N, L] = cum_reprod_j(tW(:,1), f, pars_R);
  EWd  = 1e3 * L.^3 * d_V * (1 + f * w) + 1e-3 * Wd_0 * N;  % mg, dry weight
  
  % pack to output
  prdData.tW = EWd;
  
function [prdData, info] = predict_Oligoneuriella_rhenana(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Stura = tempcorr(temp.tL_Stura, T_ref, T_A);
  TC_Bormida = tempcorr(temp.tL_Bormida, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  v_Rj = kap/ (1 - kap) * E_Rj/ E_G; pars_tj = [g k v_Hb v_Hp v_Rj];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f);
  
  % initial
  u_E0 = get_ue0([g k v_Hb], f, l_b); % -, scaled initial reserve
  E_0 = g * E_m * L_m^3 * u_E0;       % J, initial energy content
  Wd_0 = 1e3 * w_E * E_0/ mu_E;       % mg, initial dry weight
  
  % birth
  a_b = t_b/ k_M; aT_b = a_b/ TC_ab;% d, age at birth at f and T
  
  % emergence
  L_j = l_j * L_m;                      % cm, structural length at emergence
  Lw_j = L_j/ del_Mi;                   % cm, ultimate total length imago at f
  Wd_j = 1e3 * L_j^3 * d_V * (1 + f * w); % mg, ultimate dry weight  nymph
  tT_j = (t_j - t_b)/ k_M/ TC_tj;       % d, time since birth at emergence

  % reproduction
  N_i = kap_R * (1 - kap) * v_Rj * l_j^3/ u_E0; % # of eggs at j

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = (t_m - t_j)/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Wd0 = Wd_0;
  prdData.Wdj = Wd_j;
  prdData.Ni = N_i;
  
  % uni-variate data
  
  % time-weight 
  pars_R = [kap; kap_R; g; TC_Stura * k_J; TC_Stura * k_M; 0; TC_Stura * v; U_Hb/ TC_Stura; U_Hp/ TC_Stura; U_Hp/ TC_Stura + 1e-8];
  [N, L] = cum_reprod_j(tL_Stura(:,1), f_Stura, pars_R);
  ELw_Stura = 10 * L/ del_M;  % mm, body length 
  % 
  pars_R = [kap; kap_R; g; TC_Bormida * k_J; TC_Bormida * k_M; 0; TC_Bormida * v; U_Hb/ TC_Bormida; U_Hp/ TC_Bormida; U_Hp/ TC_Bormida + 1e-8];
  [N, L] = cum_reprod_j(tL_Bormida(:,1), f_Bormida, pars_R);
  ELw_Bormida = 10 * L/ del_M;  % mm, body length 
  
  % pack to output
  prdData.tL_Stura = ELw_Stura;
  prdData.tL_Bormida = ELw_Bormida;

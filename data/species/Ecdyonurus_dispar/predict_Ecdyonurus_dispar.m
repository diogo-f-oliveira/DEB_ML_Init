function [prdData, info] = predict_Ecdyonurus_dispar(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if T_L > T_ref
      info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  pars_T = [T_A; T_L; T_AL];
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_20 = tempcorr(temp.tL_20, T_ref, pars_T);
  TC_14 = tempcorr(temp.tL_14, T_ref, pars_T);
  TC_9 = tempcorr(temp.tL_9, T_ref, pars_T);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, pars_T);
  
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
  Lw_j = L_j/ del_M;                    % cm, body length nymph at emergence
  tT_j = (t_j - t_b)/ k_M/ TC_20;       % d, time since birth at emergence
  
  % ultimate
  Lw_i = L_j/ del_Mi;                   % cm, ultimate total length imago at f
  Wd_j = 1e3 * L_j^3 * d_V * (1 + f * w); % mg, ultimate dry weight  nymph

  % reproduction
  N_i = kap_R * (1 - kap) * v_Rj * l_j^3/ u_E0; % # of eggs at j

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;       % d, mean life span as imago
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Li = Lw_i;
  prdData.Wd0 = Wd_0;
  prdData.Wdj = Wd_j;
  prdData.Ni = N_i;
  
  % uni-variate data
  
  % time-weight 
  pars_R = [kap; kap_R; g; TC_20 * k_J; TC_20 * k_M; 0; TC_20 * v; U_Hb/ TC_20; U_Hp/ TC_20; U_Hp/ TC_20 + 1e-8];
  [N, L] = cum_reprod_j(tL_20(:,1), f, pars_R);
  ELw_20 = 10 * L/ del_M; EWd_20  = 1e3 * L.^3 * d_V * (1 + f * w) + Wd_0 * N;  % mm, mg, body length dry weight
  % 
  pars_R = [kap; kap_R; g; TC_14 * k_J; TC_14 * k_M; 0; TC_14 * v; U_Hb/ TC_14; U_Hp/ TC_14; U_Hp/ TC_14 + 1e-8];
  [N, L] = cum_reprod_j(tL_14(:,1), f, pars_R);
  ELw_14 = 10 * L/ del_M; EWd_14  = 1e3 * L.^3 * d_V * (1 + f * w) + Wd_0 * N;  % mm, mg, body length dry weight
  %
  pars_R = [kap; kap_R; g; TC_9 * k_J; TC_9 * k_M; 0; TC_9 * v; U_Hb/ TC_9; U_Hp/ TC_9; U_Hp/ TC_9 + 1e-8];
  [N, L] = cum_reprod_j(tL_9(:,1), f, pars_R);
  ELw_9 = 10 * L/ del_M; EWd_9  = 1e3 * L.^3 * d_V * (1 + f * w) + Wd_0 * N;    % mm, mg, body length dry weight
  
  % length-# of eggs
  %EN = get_Nf_hep(LN(:,1) * del_Mi, pars_tj);
  
  % temperature-age at birth
  Eab = a_b ./ TC_Tab;
  
  % pack to output
  prdData.tL_20 = ELw_20;
  prdData.tL_14 = ELw_14;
  prdData.tL_9 = ELw_9;
  prdData.tW_20 = EWd_20;
  prdData.tW_14 = EWd_14;
  prdData.tW_9 = EWd_9;
  %prdData.LN = EN;
  prdData.Tab = Eab;
  
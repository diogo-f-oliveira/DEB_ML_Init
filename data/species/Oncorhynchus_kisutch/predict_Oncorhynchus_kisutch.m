function [prdData, info] = predict_Oncorhynchus_kisutch(par, data, auxData)
  % control prdData avec mydata
 
  cPar = parscomp_st(par);%cpar : compound param scaled param
  vars_pull(par);  % unpack par, data, auxData
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if p_M > 600
      info = 0; prdData = []; return
  end

%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;


  %% zero-variate data
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if info == 0
    prdData = []; return;
  end
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = tau_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (tau_p - tau_b)/kT_M;      % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
 
  % reproduction
  kT_J = k_J * TC; vT= v * TC; UT_Hb = U_Hb/ TC; UT_Hj = U_Hj/ TC; UT_Hp = U_Hp/ TC; 
  pars_NR = [kap; kap_R; g; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hj; UT_Hp];
  N_R = cum_reprod_j(aT_m, f, pars_NR, L_b); N_R= N_R(end);

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.NR = N_R;
  
  % uni-variate data
  % time-length
  tvel = get_tj(pars_tj,f_tL,[],tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M; % cm, std length

  % pack to output
  prdData.tL = ELw;
    
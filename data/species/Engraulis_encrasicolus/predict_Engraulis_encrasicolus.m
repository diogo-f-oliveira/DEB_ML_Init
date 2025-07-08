function [prdData, info] = predict_Engraulis_encrasicolus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  del_M_TL = .9 * del_M; % overwrite del_M_TL!!!!!
  
  if (E_Hh >= E_Hb) || (E_Hh <= 0)
    info = 0; prdData = []; return;
  end
  
%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_Tah = tempcorr(C2K(Tah(:,1)), T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Lw_b = L_b/ del_M;             % cm, standard length at birth
  Wd_b = L_b^3 * (1 + f * w);       % g, dry weight at birth
  aT_b = (t_0 + t_b/ k_M)/ TC_ab;           % d, age at birth of foetus at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, standard length at metam
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
  aT_j = t_j/ k_M/ TC_aj;           % d, age at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M_TL;             % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  % 1st data set for late juveniles and adults
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B] = get_tj(pars_tj, f_tL);
  rT_B = TC_tL * rho_B * k_M; rT_j = TC_tL * rho_j * k_M;              % 1/d, von Bert, exponential growth rate
  aT_b = t_b/ k_M/ TC_tL; aT_j = t_j/ k_M/ TC_tL;
  t_j = aT_j - aT_b; % time since birth at metamorphosis
  t = tL(:,1); % time since birth
  t_bj = t(t < t_j);  % select times between birth & metamorphosis
  Lw_b = l_b * L_m/ del_M_TL; Lw_j = l_j * L_m/ del_M_TL; Lw_i = l_i * L_m/ del_M_TL;
  EL_bj = Lw_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
  t_ji = t(t >= t_j); % selects times after metamorphosis
  EL_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (t_ji - t_j)); % cm, expected length at time
  ELw = [EL_bj; EL_ji]; % catenate lengths

  pars_lh = [g k l_T v_Hh v_Hj v_Hp];
  [t_j t_p t_h] = get_tj(pars_lh, f);
  Eah = (t_0 + t_h/ k_M) ./ TC_Tah; % d, tima at hatch

  % pack to output
  prdData.tL = ELw;
  prdData.Tah = Eah;
     
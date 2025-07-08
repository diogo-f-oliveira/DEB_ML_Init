function [prdData, info] = predict_Schizothorax_waltoni(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];   % compose parameter vector

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % males
  pars_tjm = [g k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_bm = L_m * l_bm; L_im = l_im * L_m; % cm, structural lengths
  Lw_im = L_im/del_M;                  % cm, total length
  tT_pm = (t_pm - t_bm)/ kT_M;         % d, time since birth at puberty
  L_pm = l_pm * L_m; Lw_pm = L_pm/ del_M; % length at puberty
  Ww_im = L_im^3*(1+f*ome);          % g, ultimate weight

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;

  % univariate data

  % time-length
  tf = [5000 f_5000; 6000 f_6000]; tf(:,1) = tf(:,1) * kT_M;
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, tf, [], tLW(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M; % cm, length
  EWw = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome); % g, weight
  
  % length-fecundity
  EN = TC * 365 * reprod_rate_j(LN(:,1)*del_M, f, pars_R); % #, yearly fecundity
  
  %% pack to output
  prdData.tLW = [ELw EWw];
  prdData.LN = EN;


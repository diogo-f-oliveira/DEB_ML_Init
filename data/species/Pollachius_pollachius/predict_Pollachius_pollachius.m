function [prdData, info] = predict_Pollachius_pollachius(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                     % cm, structural, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f
  aT_b = tau_b/ k_M/ TC_ab;              % d, age at birth at f, temp corrected
  
  % metam
  s_M = l_j/ l_b;                      % -, acceleration factor

  % puberty
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);          % g, wet weight at puberty
  aT_p = tau_p/ kT_M;                  % d, age at puberty
  
  % ultimate size
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
%% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
%% uni-variate data

  % time-length 
  tvel = get_tj(pars_tj,f_tL,[],tL(:,1)*TC_tL*k_M);
  ELw = L_m * tvel(:,4)/ del_M;
  
  % time-weight
  l_0 = (Ww_0/(1+f_tW*ome)).^(1/3)/L_m; % -, initial scale length
  tvel = get_tj(pars_tj,f_tW,[0 f_tW l_0],tW(:,1)*TC_tW*k_M);
  EWw = (L_m * tvel(:,4)).^3 * (1 + f_tW * ome);  
  
%% pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;

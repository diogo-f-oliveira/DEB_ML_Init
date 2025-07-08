function [prdData, info] = predict_Doederleinia_berycoides(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);
  if info == 0
     prdData = []; return
  end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struc length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;

  % uni-variate data 

  % time-length
  tf = [500 f_0500; 1500 f_1500]; tf(:,1) = tf(:,1) * kT_M;
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, tf, [], tL_fm(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, tf, [t_b, z/z_m, l_b*z/z_m], tL_fm(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length
  %
  tf = [500 f1_0500; 1500 f1_1500]; tf(:,1) = tf(:,1) * kT_M;
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, tf, [], tL1_fm(:,1)*kT_M);
  ELw_1f = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, tf, [t_b, z/z_m, l_b*z/z_m], tL1_fm(:,1)*kT_M);
  ELw_1m = L_mm * tvel(:,4)/ del_M;   % cm, length

  % length-fecundity
  EN_L = TC * 365 * reprod_rate_j(LN(:,1)*del_M, f, pars_R); % #, fecundity
  EN_W = TC * 365 * reprod_rate_j((WN(:,1)/(1+f*ome)).^(1/3), f, pars_R); % #, fecundity
     
%% pack to output
  prdData.tL_fm = [ELw_f ELw_m];
  prdData.tL1_fm = [ELw_1f ELw_1m];
  prdData.LN = EN_L;
  prdData.WN = EN_W;
  


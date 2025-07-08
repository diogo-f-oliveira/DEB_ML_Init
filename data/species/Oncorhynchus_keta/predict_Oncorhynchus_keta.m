function [prdData, info] = predict_Oncorhynchus_keta(par, data, auxData)
  % control prdData avec mydata
 
  cPar = parscomp_st(par);%cpar : compound param scaled param
  vars_pull(par);  % unpack par, data, auxData
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  

%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);


  %% zero-variate data
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); 
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  if Lw_i < 64.4; % avoid small Lw_i to allow length-fecundity predictions 
     prdData = []; info = 0; return
  end
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f);
  L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M; % cm, total fork at puberty
  L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate fork length

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  % time-change in length
  % females
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = TC * k_M; rT_B = rho_B * kT_M;  tT_j = (t_j - t_b)/ kT_M;
  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_i - (L_i - L_j) * exp( - rT_B * (tdL_f(:,1) - tT_j)); % cm, expected length at time
  EdLw_f = (L_i - L) * rT_B/ del_M;
  % males
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f_tL);
  rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_j = L_mm * l_j; L_i = L_mm * l_i;
  L = L_i - (L_i - L_j) * exp( - rT_B * (tdL_m(:,1) - tT_j)); % cm, expected length at time
  EdLw_m = (L_i - L) * rT_B/ del_M;

  % length-fecundity
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f_LN);
  rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_j = L_mm * l_j; L_i = L_mm * l_i;
  pars_R = [kap, kap_R, g, TC * k_J, TC * k_M, L_T, TC * v, U_Hb/ TC, U_Hj/ TC, U_Hp/ TC];
  t = tT_j - log((L_i - LN(:,1) * del_M)/ (L_i - L_j))/ rT_B;
  %EN =  ones(size(LN,1),1)*cum_reprod_j(7*365, f, pars_R);
  EN =  cum_reprod_j(t, f_LN, pars_R)/ 2;

  % pack to output
  prdData.tdL_f = EdLw_f;
  prdData.tdL_m = EdLw_m;
  prdData.LN = EN;
  
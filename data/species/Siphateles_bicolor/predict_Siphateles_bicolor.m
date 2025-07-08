function [prdData, info] = predict_Siphateles_bicolor(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hh < 0 || E_Hh > E_Hb
    info = 0; prdData = []; return
  end

%% compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A); 
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 
  TC_tp = tempcorr(temp.tp, T_ref, T_A); 
  TC_tpm = tempcorr(temp.tpm, T_ref, T_A); 
  TC_am = tempcorr(temp.am, T_ref, T_A); 
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A); 
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A); 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if info == 0
      prdData = []; return
  end  

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
   
  % hatch 
  [~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC_ah; 

  % birth
  L_b = L_m * l_b;                  % cm, structural length 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length 
  Lw_p = L_p/ del_M;                % cm, total length
  tT_p = (tau_p - tau_b)/ k_M/ TC_tp; % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];  % compose parameter vector
  R_i = TC_Ri * reprod_rate_j(37.8 * del_M, f, pars_R);          % #/d, reprod rate at length

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  tT_pm = (tau_pm - tau_bm)/ k_M/ TC_tpm; % d, time since birth at puberty

  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = R_i;

  % univariate data
  % time-length
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f(:,1)*k_M*TC_tL);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m(:,1)*k_M*TC_tL);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length
  
  % length - fecundity
  EN_L = TC_tL * 365 * reprod_rate_j(LN(:,1)*del_M, f, pars_R);       % #, fecundity

  % weight - fecundity
  EN_W = TC_tL * 365 * reprod_rate_j((WN(:,1)/(1 + f * w)).^(1/3), f, pars_R);       % #, fecundity

%% pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LN = EN_L;
  prdData.WN = EN_W;
    

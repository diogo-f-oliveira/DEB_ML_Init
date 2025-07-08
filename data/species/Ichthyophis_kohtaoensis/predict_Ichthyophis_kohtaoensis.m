function [prdData, info] = predict_Ichthyophis_kohtaoensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  %% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_aL_e = tempcorr(temp.aL_e, T_ref, T_A);
  TC_tL_A = tempcorr(temp.tL_A, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
  TC_LN = tempcorr(temp.LN_1999, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj];
  [t_j t_b, l_j, l_b] = get_tp(pars_tj, f);
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b; Lw_b = L_b/ del_M;  % cm, structural, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC_ab;              % d, age at birth at f, temp corrected

  % metamorphosis
  L_j = l_j * L_m; Lw_j= L_j/ del_M;   % cm, structural, total length at metam
  Ww_j = L_j^3 * (1 + f * w);          % g, wet weight at metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;      % d, time since birth at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * f;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap * E_m_m);            % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp]; % compose par vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  Lw_im = L_mm * f/ del_M;           % cm, ultimate total length

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li_f = Lw_i;
  prdData.Li_m = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % time-length 
  % embryo
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  vT = v * TC_aL_e; kT_J = TC_aL_e * k_J; a = [-1e-10; aL_e(:,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = [];
  ELw_e = LUH(:,1)/ del_M;
  % female A
  tvel = get_tp(pars_tp, f_tLA, [], tL_A(:,1)*k_M*TC_tL_A);
  ELw_A = L_m * tvel(:,4)/ del_M;   % cm, length 
  % female B
  tvel = get_tp(pars_tp, f_tLA, [], tL_B(:,1)*k_M*TC_tL_A);
  ELw_B = L_m * tvel(:,4)/ del_M;   % cm, length 
  % female C
  tvel = get_tp(pars_tp, f_tLA, [], tL_C(:,1)*k_M*TC_tL_A);
  ELw_C = L_m * tvel(:,4)/ del_M;   % cm, length 
  % female 
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tL, [], tL_f(:,1)*k_M*TC_tL);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tpm(pars_tpm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m(:,1)*k_M*TC_tL);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % length-fecundity
  EN_1999 = TC_LN * 365 * reprod_rate(LN_1999(:,1) * del_M, f_tL, pars_R); % yearly reproductive output at length    
  EN_2000 = TC_LN * 365 * reprod_rate(LN_2000(:,1) * del_M, f_tL, pars_R); % yearly reproductive output at length    
  EN_2001 = TC_LN * 365 * reprod_rate(LN_2001(:,1) * del_M, f_tL, pars_R); % yearly reproductive output at length    

  % pack to output
  prdData.aL_e = ELw_e;
  prdData.tL_A = ELw_A;
  prdData.tL_B = ELw_B;
  prdData.tL_C = ELw_C;
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LN_1999 = EN_1999;
  prdData.LN_2000 = EN_2000;
  prdData.LN_2001 = EN_2001;

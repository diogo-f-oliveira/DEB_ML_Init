function [prdData, info] = predict_Squalius_cephalus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


  % customized filters for allowable parameters of the standard DEB model (std)
  % for other models consult the appropriate filter function.
  filterChecks =  f_tL < 0 || f_tLS < 0 || E_Hh < 0 || E_Hh > E_Hb;  % Note: Consumption in wild can be twice that in captivity (which is assumed to be as high as 1, here);

  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end 
%% compute temperature correction factors
  
  TC_19 = tempcorr(temp.ah_19, T_ref, T_A);
  TC_27 = tempcorr(temp.ah_27, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A); 
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
  TC_tLS = tempcorr(temp.tL3, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Ww_0 = U_E0 * p_Am/ mu_E * w_E/ d_E; % g, initial wet weight

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  M_Eh = J_E_Am * aUL(end,2);      % mol, reserve at hatch at f
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_Mb;              % cm, total length at hatch at f
  Ww_h = L_h^3 + M_Eh * w_E/ d_E;  % g, wet weight at hatch at f
  a19_h = aUL(2,1)/ TC_19;         % d, age at hatch at f and T
  a27_h = aUL(2,1)/ TC_27;         % d, age at hatch at f and T

  
  % birth
  a19_b = t_b/ k_M/ TC_19;          % d, age at birth at T_Ref
  a27_b = t_b/ k_M/ TC_27;          % d, age at birth at T_Ref
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_Mb;               % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
     
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, fork length at puberty at f
  tT_p  = (t_p - t_b)/ k_M/ TC_tp;  % d, time since hatch at puberty at f and T
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate fork length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M /TC_am;               % d, mean life span at T_ref
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  tT_pm = (t_pm - t_bm)/ k_M/ TC_tp;       % d, time since birth at puberty
  L_pm = L_m * l_pm; Lw_pm = L_pm/ del_M; % cm, fork length at puberty
  
  % pack to output
  prdData.ah_19 = a19_h;
  prdData.ah_27 = a27_h;
  prdData.ab_19 = a19_b;
  prdData.ab_27 = a27_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwh = Ww_h;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% univariate data
 
  % time-length   
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f(:,1)*k_M*TC_tL);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m(:,1)*k_M*TC_tL);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length
  %
  tvel = get_tj(pars_tj, f_tLS, [], tL_f(:,1)*k_M*TC_tLS);
  ELw_3 = L_m * tvel(:,4)/ del_M;   % cm, length

  % time-weight
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tWw_f(:,1)*k_M*TC_tL);
  EWw_f = (L_m * tvel(:,4)).^3 * (1 + f_tL * w);   % g, weight
  % male
  tvel = get_tj(pars_tjm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tWw_m(:,1)*k_M*TC_tL);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  % female
  tvel = get_tj(pars_tj, f_tLS, [], tWw2(:,1)*k_M*TC_tLS);
  EWw_2 = (L_m * tvel(:,4)).^3 * (1 + f_tLS * w);   % g, weight
   
  % length - wet weight  
  EWw_Lf = (LWw_f(:,1) * del_M).^3 * (1 + f_tL * w); % g, wet weight
  EWw_L = (LWw1(:,1) * del_M).^3 * (1 + f_tLS * w); % g, wet weight

  % Wet weight - fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];    % compose parameter vector
  EN_W = TC_tLS * 365 * reprod_rate_j((WN(:,1)/ (1 + f_tLS * w)).^(1/3), f_tLS, pars_R); % #, fecundity
  
  % Length - fecundity
  EN_L = TC_tLS * 365 * reprod_rate_j(LN(:,1) * del_M, f_tLS, pars_R); % #, fecundity
  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tL3 = ELw_3;
  prdData.tWw_f = EWw_f;
  prdData.tWw_m = EWw_m;
  prdData.tWw2 = EWw_2;
  prdData.LWw_f = EWw_Lf;
  prdData.LWw1 = EWw_L;
  prdData.LN = EN_L;
  prdData.WN = EN_W;
  

function [prdData, info] = predict_Cobitis_taenia(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hh >= E_Hb
    info = 0; prdData = []; return
  end
  
%% compute temperature correction factors
  TC = tempcorr(temp.tp, T_ref, T_A); kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  if l_j/ l_b > 1.2
    info = 0; prdData = []; return
  end
      
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC;              % d, age at hatch at f and T

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth of foetus at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];    % compose parameter vector
  Ri = TC * reprod_rate_j(L_i, f, pars_R);                 % #/d, reprod rate at max length

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  tT_pm = (t_pm - t_bm)/ k_M/ TC;      % d, age at puberty
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, total length at puberty
  Ww_pm = L_pm.^3 * (1 + f * w_m);     % g, wet weight at puberty

  % pack to output
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.Wwi = Ww_i;
  prdData.Ri = Ri;

  % time-length/weight
  % female 1970
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tW, [], tL_f1970(:,1)*kT_M);
  ELw_f1970 = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male 1970
  tvel = get_tj(pars_tjm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], tL_m1970(:,1)*kT_M);
  ELw_m1970 = L_mm * tvel(:,4)/ del_M;   % cm, length 
  %
  % female 1971
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tW, [], tL_f1971(:,1)*kT_M);
  ELw_f1971 = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male 1971
  tvel = get_tj(pars_tjm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], tL_m1971(:,1)*kT_M);
  ELw_m1971 = L_mm * tvel(:,4)/ del_M;   % cm, length 
  %
  % female 1972
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tW, [], tL_f1972(:,1)*kT_M);
  ELw_f1972 = L_m * tvel(:,4)/ del_M;   % cm, length 
  EWw_f1972 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  % male 1972
  tvel = get_tj(pars_tjm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], tL_m1972(:,1)*kT_M);
  ELw_m1972 = L_mm * tvel(:,4)/ del_M;   % cm, length 
  EWw_m1972 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  %
  % female 1973
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tW, [], tL_f1973(:,1)*kT_M);
  ELw_f1973 = L_m * tvel(:,4)/ del_M;   % cm, length 
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tW, [], tW_f1973(:,1)*kT_M);
  EWw_f1973 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  % male 1973
  tvel = get_tj(pars_tjm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], tL_m1973(:,1)*kT_M);
  ELw_m1973 = L_mm * tvel(:,4)/ del_M;   % cm, length 
  EWw_m1973 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  
  
%% pack to output
  prdData.tL_f1970 = ELw_f1970;
  prdData.tL_f1971 = ELw_f1971;
  prdData.tL_f1972 = ELw_f1972;
  prdData.tL_f1973 = ELw_f1973;
  prdData.tL_m1970 = ELw_m1970;
  prdData.tL_m1971 = ELw_m1971;
  prdData.tL_m1972 = ELw_m1972;
  prdData.tL_m1973 = ELw_m1973;
  prdData.tW_f1972 = EWw_f1972;
  prdData.tW_f1973 = EWw_f1973;
  prdData.tW_m1972 = EWw_m1972;
  prdData.tW_m1973 = EWw_m1973;


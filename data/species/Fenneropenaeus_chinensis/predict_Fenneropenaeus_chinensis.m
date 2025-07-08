function [prdData, info] = predict_Fenneropenaeus_chinensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  pars_TC = [T_A T_L T_H T_AL T_AH];
  TC_ab = tempcorr(temp.ab, T_ref, pars_TC);
  TC_tp = tempcorr(temp.tp, T_ref, pars_TC);
  TC_am = tempcorr(temp.am, T_ref, pars_TC);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_TC);
  TC_tL_f3 = tempcorr(temp.tL_f3, T_ref, pars_TC);
  TC_tL_f1 = tempcorr(temp.tL_f1, T_ref, pars_TC);
  TC_tL_f2 = tempcorr(temp.tL_f2, T_ref, pars_TC);
  TC_WN = tempcorr(temp.WN, T_ref, pars_TC);
  TC_TJO = tempcorr(C2K(TJO(:,1)), T_ref, pars_TC);
  TC_TJN = tempcorr(C2K(TJN(:,1)), T_ref, pars_TC);
  TC_LJC20= tempcorr(temp.LJC20, T_ref, pars_TC);
  TC_LJC25= tempcorr(temp.LJC25, T_ref, pars_TC);
  TC_LJC30= tempcorr(temp.LJC30, T_ref, pars_TC);
  TC_WwJX_T23= tempcorr(temp.WwJX_T23, T_ref, pars_TC);
  TC_WwJX_T26= tempcorr(temp.WwJX_T26, T_ref, pars_TC);
  TC_WwJX_T30= tempcorr(temp.WwJX_T30, T_ref, pars_TC);
  TC_WwJX_T= tempcorr(temp.WwJX_T, T_ref, pars_TC);

% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth at f and T
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
   
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);   % #/d, ultimate reproduction rate at T
  
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
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp]; % parameter vector like pars_tj, but for males

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;  
  prdData.Ri = RT_i;
  
  % univariate data
 
  % time-length (Bohai Sea)
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL1, [], tL_f1(:,1)*k_M*TC_tL_f1);
  ELw_f1 = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f_tL1, [t_b, f_tL1*z/z_m, l_b*z/z_m], tL_m1(:,1)*k_M*TC_tL_f1);
  ELw_m1 = L_mm * tvel(:,4)/ del_M;  % cm, length

  % time-weight (Bohai Sea)
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL1, [], tW_f1(:,1)*k_M*TC_tL_f1);
  EWw_f1 = (L_m * tvel(:,4)).^3 * (1 + f_tL1 * w);   % g, weight
  % male
  tvel = get_tj(pars_tjm, f_tL1, [t_b, f_tL1*z/z_m, l_b*z/z_m], tW_m1(:,1)*k_M*TC_tL_f1);
  EWw_m1 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  
  % time-length (Yellow Sea)
  % females 
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL2, [], tL_f2(:,1)*k_M*TC_tL_f2);
  ELw_f2 = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f_tL2, [t_b, f_tL2*z/z_m, l_b*z/z_m], tL_m2(:,1)*k_M*TC_tL_f2);
  ELw_m2 = L_mm * tvel(:,4)/ del_M;  % cm, length

  % time-weight (Yellow Sea)
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL2, [], tW_f2(:,1)*k_M*TC_tL_f2);
  EWw_f2 = (L_m * tvel(:,4)).^3 * (1 + f_tL2 * w);   % g, weight
  % male
  tvel = get_tj(pars_tjm, f_tL2, [t_b, f_tL2*z/z_m, l_b*z/z_m], tW_m2(:,1)*k_M*TC_tL_f2);
  EWw_m2 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  % time-length (East China Sea)
  % females 
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL3, [], tL_f3(:,1)*k_M*TC_tL_f3);
  ELw_f3 = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f_tL3, [t_b, f_tL3*z/z_m, l_b*z/z_m], tL_m3(:,1)*k_M*TC_tL_f3);
  ELw_m3 = L_mm * tvel(:,4)/ del_M;  % cm, length

  % time-weight (East China Sea)
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL3, [], tW_f3(:,1)*k_M*TC_tL_f3);
  EWw_f3 = (L_m * tvel(:,4)).^3 * (1 + f_tL3 * w);   % g, weight
  % male
  tvel = get_tj(pars_tjm, f_tL3, [t_b, f_tL3*z/z_m, l_b*z/z_m], tW_m3(:,1)*k_M*TC_tL_f3);
  EWw_m3 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  
  % length-weight
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

  % weight-annual fecundity
  L = (WN(:,1)./ (1 + f_WN * w)).^(1/3);   % cm, structural length
  EN = TC_WN * 365 * reprod_rate_j(L, f_WN, pars_R);  % annual fecundity
  
  % spec respiration & excretion  at different temperatures
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  Ww = 12; % g, assumed mean wet weight in range of 0.2 to 17.3 g
  L = (Ww/ (1 + f * w)).^(1/ 3); % cm, structural length 
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows
  EJO = -1e3*16*2*J_M(3,:)' .* TC_TJO/ Ww;     % mg O2/d.g wet mass
  EJN = 1e3*14* J_M(4,:)' .* TC_TJN/ Ww;       % mg NH4/d.g wet mass (N molar weight =14)

  % respiration at L at 20oC
  L = del_M * LJC20(:,1); Ww = L.^3 * (1 + f * w); % g, wet weight  % Ww = L.^3 * d_V * (1 + f * w); % g, dry weight
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  pACSJGRD = L_m^2 * p_Am * scaled_power_j(L, f, pars_R, l_b, l_j, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:,[1 7 5])')'; % mol/d, mineral fluxes
  EJT_C20 = TC_LJC20 * J_M(:,1) * 12 ./ Ww;        %  gC/d.g Ww, CO2 flux (C molar weight = 12)
  % respiration at L at 25oC
  L = del_M * LJC25(:,1); Ww = L.^3 * (1 + f * w); % g, wet weight 
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  pACSJGRD = L_m^2 * p_Am * scaled_power_j(L, f, pars_R, l_b, l_j, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:,[1 7 5])')'; % mol/d, mineral fluxes
  EJT_C25 = TC_LJC25 * J_M(:,1) * 12 ./ Ww;        %  gC/d.g Ww, CO2 flux
  % respiration at L at 30oC
  L = del_M * LJC30(:,1); Ww = L.^3 * (1 + f * w); % g, wet weight 
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  pACSJGRD = L_m^2 * p_Am * scaled_power_j(L, f, pars_R, l_b, l_j, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:, [1 7 5])')'; % mol/d, mineral fluxes
  EJT_C30 = TC_LJC30 * J_M(:,1) * 12 ./ Ww;        %  gC/d.g Ww, CO2 flux

  % weight - feeding at 23 C
  Ww = WwJX_T23(:,1); % g, wet weight
  L = (Ww/ (1 + f * w)) .^ (1/3); % structural length
  EWwJX_T23 = s_M * p_Am * L.^2/ kap_X/ mu_X * w_X/ d_X * TC_WwJX_T23 ./ Ww;  % g/d.g, ingested food
  
  % weight - feeding at 26 C
  Ww = WwJX_T26(:,1); % g, wet weight
  L = (Ww/ (1 + f * w)) .^ (1/3); % structural length
  EWwJX_T26 = s_M * p_Am * L.^2/ kap_X/ mu_X * w_X/ d_X * TC_WwJX_T26 ./ Ww;  % g/d.g, ingested food
  
  % weight - feeding at 30 C
  Ww = WwJX_T30(:,1);% g, wet weight
  L = (Ww/ (1 + f * w)) .^ (1/3); % structural length
  EWwJX_T30 = s_M * p_Am * L.^2/ kap_X/ mu_X * w_X/ d_X * TC_WwJX_T30 ./ Ww;  % g/d.g, ingested food
  
  % weight - feeding at 26 C
  Ww = WwJX_T(:,1); % g, wet weight
  L = (Ww/ (1 + f * w)) .^ (1/3); % structural length
  EWwJX_T = s_M * p_Am * L.^2/ kap_X/ mu_X * w_X/ d_X * TC_WwJX_T;  % g/d, ingested food

  %% pack to output
 
  prdData.tL_f1 = ELw_f1;   % time (day) vs length (cm) for female in Bohai Sea
  prdData.tL_m1 = ELw_m1;   % time (day) vs length (cm) for male in Bohai Sea
  prdData.tW_f1 = EWw_f1;   % time (day) vs length (cm) for female in Bohai Sea
  prdData.tW_m1 = EWw_m1;   % time (day) vs length (cm) for male in Bohai Sea
  
  prdData.tL_f2 = ELw_f2;   % time (day) vs length (cm) for female in Yellow Sea
  prdData.tL_m2 = ELw_m2;   % time (day) vs length (cm) for male in Yellow Sea
  prdData.tW_f2 = EWw_f2;   % time (day) vs length (cm) for female in Yellow Sea
  prdData.tW_m2 = EWw_m2;   % time (day) vs length (cm) for male in Yellow Sea
  
  prdData.tL_f3 = ELw_f3;   % time (day) vs length (cm) for female in East China Sea
  prdData.tL_m3 = ELw_m3;   % time (day) vs length (cm) for male in East China Sea
  prdData.tW_f3 = EWw_f3;   % time (day) vs wet weight (g) for female in East China Sea
  prdData.tW_m3 = EWw_m3;   % time (day) vs wet weight (g) for male in East China Sea
  
  prdData.LW = EWw_L;     % length (cm) vs wet weight (g)
  prdData.WN = EN;        % wet weight vs annual fecundity
  prdData.TJO = EJO;      % temperature vs size-dependent respiration
  prdData.TJN = EJN;      % temperature vs size-dependent excretion
  prdData.LJC20 = EJT_C20;      % length vs respiration at 20oC
  prdData.LJC25 = EJT_C25;      % length vs respiration at 25oC
  prdData.LJC30 = EJT_C30;      % length vs respiration at 30oC
  prdData.WwJX_T23 = EWwJX_T23; % weight vs feeding rate at 23oC
  prdData.WwJX_T26 = EWwJX_T26; % weight vs feeding rate at 26oC
  prdData.WwJX_T30 = EWwJX_T30; % weight vs feeding rate at 30oC
  prdData.WwJX_T = EWwJX_T; % weight vs feeding rate at 25C
  
 

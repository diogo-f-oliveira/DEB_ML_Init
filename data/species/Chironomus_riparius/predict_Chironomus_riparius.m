function [prdData, info] = predict_Chironomus_riparius(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
 filterChecks = z_m >= z || E_Hp < E_Hb || ...
     f_B1 > 1 || f_B1 < f_B2 || f_B2 < f_B3 || f_B3 < f_B4 || T_AH < 0 || f3 > f4 || f2 > f3 || f1 > f2  ...
     || k > 1 ||f4 > f5 || f5 > f_fm || tau_1 <0;

  if filterChecks
    prdData = []; info = 0; return
  end
  
  % compute temperature correction factors
  pars_T = [T_A; T_H; T_AH];

  TC_ab = tempcorr(temp.ab, T_ref, pars_T); 
  TC_tp = tempcorr(temp.tp, T_ref, pars_T); 
  TC_te = tempcorr(temp.te, T_ref, pars_T);  
  TC   = tempcorr(temp.LW, T_ref, pars_T); % all experiments in PeryMons2002 and Baye2021 were at 21 deg C
  TC_15  = tempcorr(temp.tL15, T_ref, pars_T);
  TC_196 = tempcorr(temp.tL196, T_ref, pars_T);
  TC_244 = tempcorr(temp.tL244, T_ref, pars_T);
  TC_267 = tempcorr(temp.tL267, T_ref, pars_T);
  TC_20 = tempcorr(temp.tS, T_ref, pars_T);  
  TC_10 = tempcorr(temp.WdJO_10, T_ref, pars_T);  

  % zero-variate data

  % life cycle
  v_Rj = kap/ (1 - kap) * E_Rj/ E_G; 
  pars_tj_hax = [g, k, 0, v_Hb, v_Hp, v_Hp+1e-10, v_Rj, v_He, kap, kap_V, tau_1];
  [t_pj, t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax_biphasicL4(pars_tj_hax, f);
    
  if ~info
    prdData = []; return
  end
          
  % initial
  u_E0 = get_ue0([g, k, v_Hb], f);    % -, scaled initial reserve
  E_0 = u_E0 * g * E_m * L_m^3;       % J, initial energy content
  Wd_0 = E_0/ mu_E * w_E;             % g, initial dry weight
   
  % birth
  aT_b = t_b/ k_M/ TC_ab;  % d, age at birth at f and T
  L_b = L_m * l_b;         % cm, structural length at birth
  Lw_b = L_b/ del_M_1;       % cm, length at birth

  % puberty
  tT_p = (t_p - t_b)/ k_M/ TC_tp;     % d, time since birth at pubery
  L_p = L_m * l_p;                    % cm, structural length at puberty

  % pupation 
  tT_j = (t_j - t_b)/ k_M/ TC;     % d, time since birth at puberty
  tT_j_15 = (t_j - t_b)/ k_M/ TC_15;     % d, time since birth at puberty at 15C
  L_j = L_m * l_j;                   % cm, structural length at pupation
  Lw_j = L_j/ del_M_2;                 % cm, physical length
  Ww_j = L_j^3 * (1 + f * w);        % g, wet weight at pupation, excluding reprod buffer at pupation
  Ww_Rj = E_Rj * L_j^3 * w_E/ mu_E;  % g, dry weight repod buffer at pupation
  Ww_j = Ww_j + Ww_Rj;               % g, wet weight including reprod buffer
   
  % emergence
  L_e = L_m * l_e;                    % cm, structural length at emergence
  Wd_e = d_V * L_e^3 + Ww_Rj + u_Ee * g * E_m * L_m^3 * w_E/ mu_E; % g, dry weight including reprod buffer
  tT_e = (t_e - t_b)/ k_M/ TC_te;     % d, time since pupation at emergence
   
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_m_m = kap * p_Am_m/ p_M;           % cm, max stuct length for males  
    
  % Durations of instars L1, L2, L3 (juvenile stage) at f
  opts = odeset('Events',@instars);
  p = [p_M; k_J; E_G; E_Hp; E_Rj; v; p_Am; kap; kap_G; J_X_Am; s_1; s_2];
  ELHE_0 = [f * E_m * L_b^3; L_b; E_Hb; 0]; % initial state vector
  [t ELHE te ye] = ode45(@dget_ELHE, [0; 100], ELHE_0, opts, p, f, TC , L_b, L_p, L_j);
  if length(te) < 3
    prdData = []; info = 0; return
  end
  tT_1 = te(1); % duration of instar 1 at T
  tT_2 = te(2) - te(1); % duration of instar 2 at T
  tT_3 = te(3) - te(2); % duration of instar 3 at T

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p; 
  prdData.t1 = tT_1;
  prdData.t2 = tT_2;
  prdData.t3 = tT_3;
  prdData.tj = tT_j;
  prdData.tj_15 = tT_j_15;
  prdData.te = tT_e;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Wd0 = Wd_0;
  prdData.Wwj = Ww_j;
  prdData.Wde = Wd_e;

  %% uni-variate data

  % Length-dry weight L-Wd 
  % it includes the dry weight of the eggs
  pars_R = [kap; kap_R; g; k_J * TC; k_M * TC; 0; v * TC; U_Hb/ TC; U_Hp/ TC; U_Hp/TC + 1e-8];
  L_p = l_p * L_m; L_i = l_i * L_m; % cm, structural lengths at puberty and ultimate at f 
  r_B = rho_B * k_M * TC; % 1/d, von Bert growth rate at f and T
  a_b = t_b/ k_M/ TC;     % d, age at birth at T and f
  a_p = t_p/ k_M/ TC;     % d, age at puberty at f and T
  L = LW(:,1) * del_M_2;    % cm, structural length 
  t = 1/ r_B * log((L_i - L_p)./ (L_i - L)); % d, time since puberty
  [N, Lpred, U_E0] = cum_reprod_j(t + (a_p - a_b), f, pars_R); % cum reproductive output at T
  E_0  = U_E0 * p_Am * TC; % J, energy in the egg
  Wd_0 = w_E/ mu_E * E_0;  % g, dry mass of the egg
  EWd = L.^3 * d_V * (1 + f * w); % g, dry weight  excluding the reproduction buffer
  EWd = (EWd +  N.* Wd_0) * 1e3;  % mg, dry weight including the reproduction buffer

  % time-length data for larvae at f
  % females-males
  p = [p_M; k_J; E_G; E_Hp; E_Rj; v; p_Am; kap; kap_G; J_X_Am; s_1; s_2];
  p_m = [p_M; k_J; E_G; E_Hp; E_Rj; v; p_Am_m; kap; kap_G; J_X_Am; s_1; s_2];
 
  [t ELHE] = ode45(@dget_ELHE, [0; tL(:,1)], ELHE_0, [], p, f_fm, TC , L_b, L_p, L_j);
  ELHE(1,:) = []; t(1) = []; 
  EL = ELHE(:,2)./ del_M_2;  % cm, female physical length 
  [t ELHE] = ode45(@dget_ELHE, [0; tL_m(:,1)], ELHE_0, [], p_m, f_fm, TC , L_b, L_p, L_j);
  ELHE(1,:) = []; t(1) = []; 
  EL_m = ELHE(:,2)./ del_M_2;  % cm, male physical length 

  % PeryMons2002: 21 deg C, time-length and total number of eggs at different food levels
  [t ELHE] = ode45(@dget_ELHE, [0; 2], ELHE_0, [], p, f, TC , L_b, L_p, L_j);
  ELHE_acl = ELHE(end,:); t0 = t(end); % state vector after 2 day acclimation at f=1 and T=21 C

  [t_pj_1, t_j_1, t_e_1, t_p_1, t_b_1, l_j_1, l_e_1, l_p_1, l_b_1, l_i_1, rho_j_1, rho_B_1, u_Ee_1, info] = get_tj_hax_biphasicL4(pars_tj_hax, f1);
  L_p1 = l_p_1 * L_m; L_j1 = l_j_1 * L_m; 
  tj_f1 = (t_j_1-t_b)/k_M/TC;
  [t ELHE] = ode45(@dget_ELHE, [t0; tL1(:,1)], ELHE_acl, [], p, f1, TC , L_b, L_p1, L_j1);
  ELHE(1,:) = []; t(1) = []; 
  EL1 = ELHE(:,2)./ del_M_2;  % cm, physical length 

  [t_pj_2, t_j_2, t_e_2, t_p_2, t_b_2, l_j_2, l_e_2, l_p_2, l_b_2, l_i_2, rho_j_2, rho_B_2, u_Ee_2, info] = get_tj_hax_biphasicL4(pars_tj_hax, f2);
  L_p2 = l_p_2 * L_m; L_j2 = l_j_2 * L_m; 
  tj_f2 = (t_j_2-t_b)/k_M/TC;
  [t ELHE] = ode45(@dget_ELHE, [t0; tL2(:,1);100], ELHE_acl, [], p, f2, TC , L_b, L_p2, L_j2);
  ELHE(1,:) = []; t(1) = []; 
  EL2 = interp1(t, ELHE(:,2), tL2(:,1), 'spline')./ del_M_2;     % cm, returns the values of length at tL2(:,1)
  EN2   = kap_R * ELHE(end,4)/ E_0;               % #, total number of eggs 

  [t_pj_3, t_j_3, t_e_3, t_p_3, t_b_3, l_j_3, l_e_3, l_p_3, l_b_3, l_i_3, rho_j_3, rho_B_3, u_Ee_3, info] = get_tj_hax_biphasicL4(pars_tj_hax, f3);
  L_p3 = l_p_3 * L_m; L_j3 = l_j_3 * L_m;
  tj_f3 = (t_j_3-t_b)/k_M/TC;
  [t ELHE] = ode45(@dget_ELHE, [t0; tL3(:,1);30], ELHE_acl, [], p, f3, TC , L_b, L_p3, L_j3);
  ELHE(1,:) = []; t(1) = []; 
  EL3 = interp1(t, ELHE(:,2), tL3(:,1), 'spline')./ del_M_2;     % cm, returns the values of length at tL3(:,1)
  EN3   = kap_R * ELHE(end,4)/ E_0;               % #, total number of eggs

  [t_pj_4, t_j_4, t_e_4, t_p_4, t_b_4, l_j_4, l_e_4, l_p_4, l_b_4, l_i_4, rho_j_4, rho_B_4, u_Ee_4, info] = get_tj_hax_biphasicL4(pars_tj_hax, f4);
  L_p4 = l_p_4 * L_m; L_j4 = l_j_4 * L_m;
  [t ELHE] = ode45(@dget_ELHE, [t0; tL4(:,1);100], ELHE_acl, [], p, f4, TC , L_b, L_p4, L_j4);
  ELHE(1,:) = []; t(1) = []; 
  EL4 = interp1(t, ELHE(:,2), tL4(:,1), 'spline')./ del_M_2;     % cm, returns the values of length at tL4(:,1)
  EN4   = kap_R * ELHE(end,4)/ E_0;               % #, total number of eggs

  % PeryGarr2006: different temperature, two different food levels
  % experiments used 2d old larvae; run the system for 2 days and use the
  % end points as initial values
  % ad libitum, different temperatures  
 
  [t ELHE] = ode45(@dget_ELHE, [t0; tL15(:,1)], ELHE_acl, [], p, f5, TC_15 , L_b, L_p, L_j);
  ELHE(1,:) = []; t(1) = []; 
  EL15 = ELHE(:,2)./ del_M_2;  % cm, physical length 

  [t ELHE] = ode45(@dget_ELHE, [t0; tL196(:,1)], ELHE_acl, [], p, f5, TC_196 , L_b, L_p, L_j);
  ELHE(1,:) = []; t(1) = []; 
  EL196 = ELHE(:,2)./ del_M_2;  % cm, physical length 

  [t ELHE] = ode45(@dget_ELHE, [t0; tL21(:,1)], ELHE_acl, [], p, f5, TC , L_b, L_p, L_j);
  ELHE(1,:) = []; t(1) = []; 
  EL21 = ELHE(:,2)./ del_M_2;  % cm, physical length 

  [t ELHE] = ode45(@dget_ELHE, [t0; tL244(:,1)], ELHE_acl, [], p, f5, TC_244 , L_b, L_p, L_j);
  ELHE(1,:) = []; t(1) = []; 
  EL244 = ELHE(:,2)./ del_M_2;  % cm, physical length

  [t ELHE] = ode45(@dget_ELHE, [t0; tL267(:,1)], ELHE_acl, [], p, f5, TC_267 , L_b, L_p, L_j);
  ELHE(1,:) = []; t(1) = []; 
  EL267 = ELHE(:,2)./ del_M_2;  % cm, physical length 

  % limiting food, different temperatures  
  [t_pj_22, t_j_22, t_e_22, t_p_22, t_b_22, l_j_22, l_e_22, l_p_22, l_b_22, l_i_22, rho_j_22, rho_B_22, u_Ee_22, info] = get_tj_hax_biphasicL4(pars_tj_hax, f22);
  L_p22 = l_p_22 * L_m; L_j22 = l_j_22 * L_m;
  [t ELHE] = ode45(@dget_ELHE, [t0; tL15f(:,1)], ELHE_acl, [], p, f22, TC_15 , L_b, L_p22, L_j22);
  ELHE(1,:) = []; t(1) = []; 
  EL15f = ELHE(:,2)./ del_M_2;  % cm, physical length 

  [t ELHE] = ode45(@dget_ELHE, [t0; tL196f(:,1)], ELHE_acl, [], p, f22, TC_196 , L_b, L_p22, L_j22);
  ELHE(1,:) = []; t(1) = []; 
  EL196f = ELHE(:,2)./ del_M_2;  % cm, physical length 

  [t ELHE] = ode45(@dget_ELHE, [t0; tL21f(:,1)], ELHE_acl, [], p, f22, TC , L_b, L_p22, L_j22);
  ELHE(1,:) = []; t(1) = []; 
  EL21f = ELHE(:,2)./ del_M_2;  % cm, physical length 

  [t ELHE] = ode45(@dget_ELHE, [t0; tL267f(:,1)], ELHE_acl, [], p, f22, TC_267 , L_b, L_p22, L_j22);
  ELHE(1,:) = []; t(1) = []; 
  EL267f = ELHE(:,2)./ del_M_2;  % cm, physical length

  % t-S data for larvae
  [t ELHE] = ode45(@dget_ELHE, [0; 2], ELHE_0, [], p, f, TC_20 , L_b, L_p, L_j);
  ELHE_acl = ELHE(end,:); t0 = t(end); % state vector after 2 day acclimation at f=1 and T=20 C

   % starvation data; starvation experiment initiated after 2-3 days after birth:
  [tt, LES1] =  ode45(@dget_LES, tS(:,1), [ELHE_acl(2); ELHE_acl(1); 1] ,[],...
  p_Am*TC_20 , v*TC_20, p_M*TC_20, E_G, kap, kap_G, k_starv*TC_20, 0, hb*TC_20, L_b, L_p, L_j);
  ES = LES1(:,3);
  
  % background mortality for starvation data
  [tt, LES2] =  ode45(@dget_LES, tS(:,1), [ELHE_acl(2); ELHE_acl(1); 1] ,[],... 
  p_Am*TC_20 , v*TC_20, p_M*TC_20, E_G, kap, kap_G, k_starv*TC_20, f, hb*TC_20, L_b, L_p, L_j);   
   ES2 = LES2(:,3);
  
  % weight - respiration 
  [t_pj_resp, t_j_resp, t_e_resp, t_p_resp, t_b_resp, l_j_resp, l_e_resp, l_p_resp, l_b_resp, l_i_resp, rho_j_resp, rho_B_resp, u_Ee_resp, info] = get_tj_hax_biphasicL4(pars_tj_hax, f_resp);
  L_p_resp = l_p_resp * L_m; L_j_resp = l_j_resp * L_m; Wd_p_resp = L_p_resp^3*(1+f_resp*w)*d_V*1e3; % mg, dry weight at puberty
  L = (WdJO_20(:,1)./1000/ d_V./ (1 + f_resp * w + E_Rj * w_E/mu_E * (WdJO_20(:,1)>=Wd_p_resp))) .^ (1/3);
  Wd = (L.^3 .* (1 + f_resp * w + E_Rj * w_E/mu_E .* (L>=L_p_resp))) * d_V * 1e3; % mg dry weight
  for i=1:length(L)
      if L(i) > L_j_resp
          L(i) = L_j_resp;
      end
  end
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size   
  l = L/L_m; sM = min(l_p_resp, l)/l_b_resp; 
  % scaled powers: powers per max assimilation {p_Am} L_m^2
  pA = f_resp .* sM .* l.^2;              % assim
  pC = (l.^2 .* (g .* sM + l )/ (1 + g/ f_resp)).*(l<l_j_resp) + (kap * l.^3+k * U_Hp .* ones(length(pA),1)).*(l>=l_j_resp);   % mobilisation
  pS = kap * l.^3;                           % somatic  maint
  pJ = k * U_Hp .* ones(length(pA),1);  % maturity maint
  pG = (kap * pC - pS).*(l<l_j_resp);        % growth
  pR = ((1 - kap) * pC - pJ).*(l<l_j_resp);  % maturation/reproduction
  kap_R1 = 0 * (l <l_p_resp) + kap_R * (l >=l_p_resp);
  pD = pS + pJ + (1 - kap_R1) .* pR ;    % dissipation
  pACSJGRD = p_ref*[pA, pC, pS, pJ, pG , pR, pD];
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O20 = -J_M(3,:)' * TC_20 * 32e6/ 24 ./ Wd; % mug O2/h.mg, O2 consumption

  L = (WdJO_10(:,1)./1000/ d_V./ (1 + f_resp * w + E_Rj * w_E/mu_E * (WdJO_10(:,1)>=Wd_p_resp))) .^ (1/3);
  Wd = (L.^3 .* (1 + f_resp * w + E_Rj* w_E/mu_E .* (L>=L_p_resp))) * d_V * 1e3; % mg dry weight
  for i=1:length(L)
      if L(i) > L_j_resp
          L(i) = L_j_resp;
      end
  end
  l = L/L_m; sM = min(l_p_resp, l)/l_b_resp; 
  % scaled powers: powers per max assimilation {p_Am} L_m^2
  pA = f_resp .* sM .* l.^2;              % assim
  pC = (l.^2 .* (g .* sM + l )/ (1 + g/ f_resp)).*(l<l_j_resp) + (kap * l.^3+k * U_Hp .* ones(length(pA),1)).*(l>=l_j_resp);   % mobilisation
  pS = kap * l.^3;                           % somatic  maint
  pJ = k * U_Hp .* ones(length(pA),1);         % maturity maint
  pG = (kap * pC - pS).*(l<l_j_resp);                        % growth
  kap_R1 = 0 * (l <l_p_resp) + kap_R * (l >=l_p_resp);
  pR = ((1 - kap) * pC - pJ).*(l<l_j_resp);                  % maturation/reproduction
  pD = pS + pJ + (1 - kap_R1) .* pR ;          % dissipation
  pACSJGRD = p_ref*[pA, pC, pS, pJ, pG , pR, pD];
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O10 = -J_M(3,:)' * TC_10 * 32e6/ 24 ./Wd;  % mug O2/h.mg, O2 consumption

   %% 
   % time - length, time-weigth and total number of eggs at different food level
   % We assume that time and length at birth are equal for all treatments.
   % Food was assumed to be abundant (f = 1) during the early larval stages (L1-L3), followed by a linear decrease 
   % to a minimum value (estimated for each dataset f_Bi) at a specific time (tau_1/k_M/TC days after puberty),
   % and remained constant after that point till pupation
   
   p = [p_M; k_J; E_G; E_Hp; E_Rj; v; p_Am; kap; kap_G; J_X_Am; s_1; s_2];
   opts = odeset('RelTol', 1e-4, 'AbsTol', 1e-8);
   [t_pj_fB1, t_j_fB1, t_e_fB1, t_p_fB1, t_b0_fB1, l_j_fB1, l_e_fB1, l_p_fB1, l_b0_fB1, l_i_fB1, rho_j_fB1, rho_B_fB1, u_Ee_fB1, info] = get_tj_hax_biphasicL4(pars_tj_hax, f, f_B1);
   L_p_fB1 = l_p_fB1 * L_m;  L_j_fB1 = l_j_fB1 * L_m;  
   [t1 ELHE1] = ode45(@dget_ELHE, [0;  50], ELHE_0, opts, p, f_B1, TC, L_b, L_p_fB1, L_j_fB1);
   ELHE1(1,:) = []; t1(1) = [];
   ELw_B1 = interp1(t1, ELHE1(:,2), tL_fB(:,1), 'spline')/ del_M_1;     % cm, returns the values of length at tL_B1(:,1)
   E_B1 = ELHE1(:,2).^3 + ELHE1(:,1)*(w_E/mu_E/d_E) + ELHE1(:,4)* (w_E/mu_E);  % g, wet weight including reproduction buffer
   EWw_B1 =  interp1(t1, E_B1, tWw_fB(:,1), 'spline');   % returns the values of weight at tWw_B1(:,1)
   EN_fB1   = kap_R * ELHE1(end,4)/ E_0;               % #, total number of eggs 
   tj_fB1 = (t_j_fB1 - t_b)/ k_M/ TC;      % d, time since birth at pupation

   [t_pj_fB2, t_j_fB2, t_e_fB2, t_p_fB2, t_b0_fB2, l_j_fB2, l_e_fB2, l_p_fB2, l_b0_fB2, l_i_fB2, rho_j_fB2, rho_B_fB2, u_Ee_fB2, info] = get_tj_hax_biphasicL4(pars_tj_hax, f, f_B2);
   tf = [0 1; (t_p_fB2 - t_b)/k_M/TC 1; (t_p_fB2- t_b + tau_1)/k_M/TC f_B2; (t_j_fB2 - t_b)/k_M/TC f_B2];
   L_p_fB2 = l_p_fB2 * L_m;  L_j_fB2 = l_j_fB2 * L_m;     
   [t2 ELHE2] = ode45(@dget_ELHE, [0; 50], ELHE_0, opts, p, tf, TC, L_b, L_p_fB2, L_j_fB2);
   ELHE2(1,:) = []; t2(1) =[];
   ELw_B2 = interp1(t2, ELHE2(:,2), tL_fB(:,1), 'spline')./ del_M_1;     % cm, returns the values of length at tL_B2(:,1)
   E_B2 = ELHE2(:,2).^3 + ELHE2(:,1)*(w_E/mu_E/d_E) + ELHE2(:,4)* (w_E/mu_E); % g, wet weight including reproduction buffer
   EWw_B2 = interp1(t2, E_B2, tWw_fB(:,1), 'spline'); % returns the values of weight at tWw_B2(:,1)
   EN_fB2   = kap_R * ELHE2(end,4)/ E_0;               % #, total number of eggs 
   tj_fB2 = (t_j_fB2 - t_b)/ k_M/ TC;                      % d, time since birth at pupation

   [t_pj_fB3, t_j_fB3, t_e_fB3, t_p_fB3, t_b0_fB3, l_j_fB3, l_e_fB3, l_p_fB3, l_b0_fB3, l_i_fB2, rho_j_fB3, rho_B_fB3, u_Ee_fB3, info] = get_tj_hax_biphasicL4(pars_tj_hax, f, f_B3);
   tf = [0 1; (t_p_fB3 - t_b)/k_M/TC 1; (t_p_fB3- t_b + tau_1)/k_M/TC f_B3; (t_j_fB3 - t_b)/k_M/TC f_B3];
   L_p_fB3 = l_p_fB3 * L_m;  L_j_fB3 = l_j_fB3 * L_m;   
   [t3 ELHE3] = ode45(@dget_ELHE, [0; 50], ELHE_0, opts, p, tf, TC, L_b, L_p_fB3, L_j_fB3);
   ELHE3(1,:) = []; t3(1) = [];
   ELw_B3 = interp1(t3, ELHE3(:,2), tL_fB(:,1), 'spline')./ del_M_1;     % cm, returns the values of length at tL_B3(:,1)
   E_B3 = ELHE3(:,2).^3 + ELHE3(:,1)*(w_E/mu_E/d_E) + ELHE3(:,4)* (w_E/mu_E); % g, wet weight including reproduction buffer
   EWw_B3 = interp1(t3, E_B3, tWw_fB(:,1), 'spline'); % returns the values of weight at tWw_B3(:,1)
   EN_fB3   = kap_R * ELHE3(end,4)/ E_0;               % #, total number of eggs 
   tj_fB3 = (t_j_fB3 - t_b)/ k_M/ TC;      % d, time since birth at pupation

   [t_pj_fB4, t_j_fB4, t_e_fB4, t_p_fB4, t_b0_fB4, l_j_fB4, l_e_fB4, l_p_fB4, l_b0_fB4, l_i_fB4, rho_j_fB4, rho_B_fB4, u_Ee_fB4, info] = get_tj_hax_biphasicL4(pars_tj_hax, f, f_B4);
   tf = [0 1; (t_p_fB4 - t_b)/k_M/TC 1; (t_p_fB4- t_b + tau_1)/k_M/TC f_B4; (t_j_fB4 - t_b)/k_M/TC f_B4];
   L_p_fB4 = l_p_fB4 * L_m;  L_j_fB4 = l_j_fB4 * L_m;  
   [t4 ELHE4] = ode45(@dget_ELHE, [0;  50], ELHE_0, opts, p, tf, TC, L_b, L_p_fB4, L_j_fB4);
   ELHE4(1,:) = []; t4(1) = [];
   ELw_B4 =  interp1(t4, ELHE4(:,2), tL_fB(:,1), 'spline')./ del_M_1;     % cm, returns the values of length at tL_B4(:,1)
   E_B4 = ELHE4(:,2).^3 + ELHE4(:,1)*(w_E/mu_E/d_E) + ELHE4(:,4)* (w_E/mu_E); % g, wet weight including reproduction buffer
   EWw_B4 = interp1(t4, E_B4, tWw_fB(:,1), 'spline'); % returns the values of weight at tWw_B4(:,1)
   EN_fB4   = kap_R * ELHE4(end,4)/ E_0;               % #, total number of eggs 
   tj_fB4 = (t_j_fB4 - t_b)/ k_M/ TC;      % d, time since birth at pupation

  % pack to output
  prdData.tL   = EL; 
  prdData.tL_m = EL_m;
  prdData.LW   = EWd;
  prdData.tL1  = EL1;
  prdData.tL2  = EL2;
  prdData.tL3  = EL3;
  prdData.tL4  = EL4;
  prdData.tL15  = EL15;
  prdData.tL196 = EL196;
  prdData.tL21  = EL21;
  prdData.tL244 = EL244;
  prdData.tL267 = EL267;

  prdData.tL15f  = EL15f;
  prdData.tL196f = EL196f;
  prdData.tL21f  = EL21f;
  prdData.tL267f = EL267f;
  
  prdData.tS  = ES; 
  prdData.tS2 = ES2;
  
  prdData.WdJO_20 = EJT_O20;    
  prdData.WdJO_10 = EJT_O10;
   
  prdData.tL_fB = [ELw_B1 ELw_B2 ELw_B3 ELw_B4];  
  prdData.tWw_fB = [EWw_B1 EWw_B2 EWw_B3 EWw_B4];
  prdData.JXNi1 = [EN_fB1; EN_fB2; EN_fB3; EN_fB4];
  prdData.JXNi = [EN2; EN3; EN4];

  prdData.tj_fB1 = tj_fB1; 
  prdData.tj_fB2 = tj_fB2; 
  prdData.tj_fB3 = tj_fB3; 
  prdData.tj_fB4 = tj_fB4;

  prdData.tj_f1 = tj_f1;
  prdData.tj_f2 = tj_f2;
  prdData.tj_f3 = tj_f3;
end

function dELHE = dget_ELHE(t, ELHE, p, tf, TC, Lb, Lp, Lj)
  % larval development
  % t: time since birth
  % p_Am: [p_Am] = {p_Am}/ L_b
      
  % unpack variables    
  E  = ELHE(1); % J, reserve
  L  = ELHE(2); % cm, structural length
  EH = ELHE(3); % J, maturity
  ER = ELHE(4); % J, reproduction buffer
      
  % unpack parameters 
  p_M = p(1); k_J = p(2); E_G = p(3); E_Hp = p(4); E_Rj = p(5); v = p(6); p_Am = p(7); kap = p(8); kap_G = p(9);
     
  pT_M = TC * p_M;  pT_Am = TC * p_Am;   kT_J = TC * k_J;   vT = TC * v;

  if length(tf) == 1
      f = tf;
  else
      f = spline1(t, tf);
  end

  s = min(L, Lp)/Lb;

  if  kap * E * vT * s >= pT_M * L^4 % section 4.1.5 comments to Kooy2010
     r  = (E * vT * s/ L -  pT_M * L^3/  kap)/ (E +  E_G  * L^3/  kap); % d^-1, specific growth rate  
  else 
     r  = (E * vT * s/ L -  pT_M * L^3/  kap)/ (E +  kap_G *  E_G  * L^3/  kap); % d^-1, specific growth rate     
  end  

  pC  = E * (vT * s/ L - r*(ER/L^3 < E_Rj)); % J/d, mobilized energy flux
  p_maint = kT_J * EH + pT_M*L^3;
        
  % generate derivatives
  dE = f * pT_Am * s * L^2 - (pC-p_maint)*(ER/L^3 < E_Rj) - p_maint;  % J/d, change in reserve
  dL = r * L/ 3 *(ER/L^3 < E_Rj);                     % cm/d, change in length
  dEH  = ((1 - kap) * pC - kT_J * EH) * (EH<E_Hp);     % J/d, change in cumulated energy invested in maturation
  dER  = ((1 - kap) * pC - kT_J * E_Hp)*(EH >= E_Hp)*(ER/L^3 < E_Rj); % J/d, change in reproduction buffer

  dELHE = [dE; dL; dEH; dER];
end

function dLES = dget_LES(t,LES, p_Am, v, p_M, E_G, kap, kap_G,  k_starv, f, hb, L_b, L_p, L_j)
  % the function will not handle re-growth
  % unpack
  L   =  LES(1); % cm, volumetric structural length
  E   =  LES(2); % J, E reserve 
  S   =  min(1,LES(3)); % survival probability

  k_M = p_M/ E_G;  % 1/d, maturity maintenance rate coefficient
  E_m = p_Am/ v;   % J/cm^3, max reserve density
  sM = min(L, L_p)/L_b;

  E_critical = E_m*L_b^3;

  % pp.42 comments DEB3 equ. 4.2
  if kap * E  * v * sM >= p_M * L^4 
      r = (E * v *sM/ L - p_M * L^3/ kap)/ (E + E_G * L^3/ kap);
  else
      r = (E * v * sM/ L - p_M * L^3/ kap)/ (E + kap_G * E_G * L^3/ kap);
  end
  p_C = E * (v*sM/L - r);
  dL  = (L * r/ 3) * (L < L_j);
  dE = f * p_Am * sM * L^2 - p_C;      % J/d, change in reserve
  h_sh = k_starv * max(0, E_critical - E)/E_critical;
  dS = - S * (h_sh + hb); % 1/d, survival fraction

  % pack state variables
  dLES = [dL; dE; dS];
end

function [value,isterminal,direction] = instars(t, ELHE, p, tf, TC, Lb, Lp, Lj)
  E_Hp = p(4); s1 = p(11); s2 = p(12);
  value = [ELHE(2)-sqrt(s1)*Lb; ELHE(2)-sqrt(s1*s2)*Lb; ELHE(3)-E_Hp];
  isterminal = [0; 0; 1];
  direction = 0;
end

function [tpj, tj, te, taup, tb, lj, le, lp, lb, li, rj, rB, uEe, info] = get_tj_hax_biphasicL4(p, f, f_min)
  % modified version get_tj_hax to include biphasic growth during the
  % fourth larval instar and time-variable functional response
 
  %% Description
  % Obtains scaled ages at pupation, emergence, puberty, birth and the scaled lengths at these ages for hax model of e.g. Chaoborus;
  % The hax model is the same as the hep model, but has a pupa stage like the hex model.
  % Food density is assumed to be constant.
  % Multiply the result with the somatic maintenance rate coefficient to arrive at unscaled ages. 
  % Metabolic acceleration occurs between b and p; isomorphy between p and j ( = pupation, e.g. transition from larva to pupa). 
  % Notice j-e-p-b sequence in output, due to the name of the routine
  %
  % Input
  %
  % * p: 8 with parameters: g, k, l_T, v_H^b, v_H^p, v_R^j, v_H^e, kap, kapV, tau_1   
  % * f: optional scalar with functional response (default f = 1)
  % * f_min: optional scalar with functional response (default f = 1)
  %   time-variable functional response when f_min /= f:  f=1 during puberty, followed by a linear decrease to a f_min at scaled time tau_p + tau_1';

  % Output
  %
  % * tpj: scaled age at transition from phase I to phase II in fourth larval stage  \tau_j = a_j k_M
  % * tj: scaled age at pupation \tau_j = a_j k_M
  % * te: scaled age at emergence \tau_e = a_e k_M
  % * tp: scaled age at puberty \tau_p = a_p k_M
  % * tb: scaled age at birth \tau_b = a_b k_M
  % * lj: scaled length at pupation lj = Lj/ Lm, Lm = v/ (k_M * g)
  % * le: scaled length at emergence le = Le/ Lm
  % * lp: scaled length at puberty = end of acceleration
  % * lb: scaled length at birth = start of acceleration
  % * li: ultimate scaled length li = Li/ Lm
  % * rhoj: scaled exponential growth rate between b and p: \rho_j = r_j/ k_M
  % * rhoB: scaled von Bertalanffy growth rate between p  between j: \rho_B = r_B/ k_M
  % * uEe: scaled reserve at emergence: u_E^e = U_E^e g^2 kM^3/ v^2; U^e = E^e/ {p_Am}
  % * info: indicator equals 1 if successful, 0 otherwise  

  % unpack pars
  g   = p(1); % energy investment ratio
  k   = p(2); % k_J/ k_M, ratio of maturity and somatic maintenance rate coeff
  l_T = p(3); % scaled heating length {p_T}/[p_M]Lm
  vHb = p(4); % v_H^b = U_H^b g^2 kM^3/ (1 - kap) v^2; U_H^b = E_H^b/ {p_Am} start acceleration
  vHj = p(5); % v_H^p = U_H^p g^2 kM^3/ (1 - kap) v^2; U_H^p = E_H^p/ {p_Am} end acceleration
  vHp = p(6); % v_H^p = U_H^p g^2 kM^3/ (1 - kap) v^2; U_H^p = E_H^p/ {p_Am} end acceleration
  vRj = p(7); % (kap/(1 - kap)) [E_R^j]/ [E_G] scaled reprod buffer density at pupation
  vHe = p(8); % v_H^e = U_H^e g^2 kM^3/ (1 - kap) v^2; U_H^e = E_H^e/ {p_Am} at emergence
  kap = p(9); % -, allocation fraction to soma of pupa
  kapV = p(10);% -, conversion efficiency from larval reserve to larval structure, back to imago reserve
  tau_1 = p(11); % -, scaled time since puberty when f_min is reached

  if ~exist('f', 'var')
    f = 1;
  elseif isempty(f)
    f = 1;
  end

   if ~exist('f_min', 'var')
    f_min = f;
  elseif isempty(f_min)
    f_min = f;
  end

  % from zero till puberty
  pars_tj = [g k 0 vHb vHp vHp + 1e-10]; % vHp functions as vHj in get_tj
  [taup, tpp, tb, lp, lpp, lb, li, rj, rB, info] = get_tj(pars_tj, f);
  sM = lp/ lb; % -, acceleration factor

 % from puberty till pupation
  tf = [taup f; taup+tau_1 f_min];
  options = odeset('Events', @density, 'RelTol', 1e-08, 'AbsTol', 1e-08);
  [t, lvRe] = ode45(@dget_tj_hax, [taup; 100], [lp; 0; f], options, tf, sM, rB, li, g, k, vHp, vRj);
  lj = lvRe(end,1);  % -, scaled length at pupation
  ej = lvRe(end,3);  % -, scaled reserve at pupation
  tpj = t(end);      % -, scaled age at transition from Phase I to Phase II
  tj = t(end);       % -, scaled age at pupation

  if ej < 1 % additional time to reach critical weight
    [e, te] = ode45(@dget_tj_hax2, [ej; 1], [0; lj], [], f_min, sM, g, k, vHp, kap);
    tj = tpj + te(end,1); % -, scaled age at pupation
  end
        
  % from pupation to emergence; 
  % instantaneous conversion from larval structure to pupal reserve
  uEj = lj^3 * (kap * kapV + f/ g);       % -, scaled reserve at pupation

  options = odeset('Events', @emergence);
  [t, luEvH, te, luEvH_e] = ode45(@dget_tj_hex, [0; 300], [0; uEj; 0], options, sM, g, k, vHe);
  
  if isempty(te)
    te = []; le = []; uEe = []; info = 0;
  else
    te = tj + te;     % -, scaled age at emergence 
    le = luEvH_e(1);  % -, scaled length at emergence
    uEe = luEvH_e(2); % -, scaled reserve at emergence
  end

end

%% subfunctions
function dlvRe = dget_tj_hax(t, lvRe, tf, sM, rB, li, g, k, vHp, vRj)
  l = lvRe(1); % -, scaled length
  vR = lvRe(2);
  e = lvRe(3); % -, scaled reserve

  f = spline1(t, tf);
  r = g * (e*sM/l-1)/(e+g);       % 1/d, specific growth rate 

  dl = r*l/3;

  dvR = (e * g * sM/ l + e)/ (g + e) - k * vHp/ l^3 - r * vR;
  de = (f-e)*g*sM/l;

  dlvRe = [dl; dvR; de]; % pack output
end

function dte = dget_tj_hax2(e, tl, f, sM, g, k, vHp, kap)
  l = tl(2); % -, scaled length

  dl = 0;
  de = f*sM*g/l - (1-kap)*k*vHp*g/l^3 - kap*g;

  dte = [1; dl]/ de; % pack output
end

function dluEvH = dget_tj_hex(t, luEvH, sM, g, k, vHe)
  l = luEvH(1); l2 = l * l; l3 = l * l2; l4 = l * l3; uE = max(1e-6, luEvH(2)); vH = luEvH(3);

  dl = (sM * g * uE - l4)/ (uE + l3)/ 3;
  duE = - uE * l2 * (sM * g + l)/ (uE + l3);
  dvH = - duE - k * vH;

  dluEvH = [dl; duE; dvH]; % pack output
end

function [value,isterminal,direction] = emergence(t, luEvH, sM, g, k, vHe)
 value = vHe - luEvH(3); 
 isterminal = 1;
 direction = 0;
end

function [value,isterminal,direction] = density(t, lvRe, tf, sM, rB, li, g, k, vHp, vRj)
 value = vRj - lvRe(2); 
 isterminal = 1;
 direction = 0;
end

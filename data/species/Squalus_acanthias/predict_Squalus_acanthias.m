function [prdData, info] = predict_Squalus_acanthias(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
   
  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  
  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % start
   % embryo-data
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  E_0 = U_E0 * p_Am;
  Ww_0 = w_E/ mu_E * E_0/ d_E; % g, wet weight of egg
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_0 = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty (females)
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  
  % ultimate female
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
%   Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 


  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
%   RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  L_i_m = L_mm * l_i;               % cm, ultimate structural length at f
  Lw_i_m = L_i_m/ del_M;            % cm, ultimate physical length at f
  pars_tpm = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector

  %% pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_0;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Li_m = Lw_i_m;
  prdData.Ww0 = Ww_0;
  prdData.Wwp = Ww_p;
%   prdData.Wwi = Ww_i;
%   prdData.Ri = RT_i;
  
  %% uni-variate data
  kT_J = k_J * TC;   kT_M = k_M * TC; vT = v * TC; 
  pT_Am = p_Am * TC; pT_M = p_M * TC;   UT_Hb = U_Hb/ TC; UT_Hp = U_Hp/ TC; 
  JT_E_Am = J_E_Am * TC;
  
  % 1973-1974 Straight of Georgia, British Columbia
  
 
  UT_E0 = U_E0/ TC;
  
  % aL-data
  a = [0; tLe(:,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 UT_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); % cm, structural length
  EL_e = L/ del_M; % cm, physical length
  % aY-data 
  a = [0; tYe(:,1)]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0/TC 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; 
  L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * JT_E_Am;
  EY_e = max(0, M_E * w_E/ d_E - L3 * f * w); % cm^3, yolk volume
  
  % --------------- SE black sea ----------------------------------------
  
  % length-weight males
  L = LW_m(:,1) * del_M; % cm, structural length
  EWw_m = L.^3 * (1 + w_m * f); % g, wet weight
  
  % length-weight female
  L = LW_f(:,1) * del_M; % cm, structural length
  EWw_f = L.^3 * (1 + w * f); % g, wet weight
  
  % number of embryos - length (assuming 2 year gestation time)
  EN = 2 * 365 * TC * reprod_rate(LN(:,1) * del_M, f, pars_R); % #/d, reproduction rate at T and f
  
  % --------------- Aegean sea ------------------------------------------
  
  % length-weight embryo
  L = LW_e(:,1) * del_M; % cm, structural length
  EWw_e = L.^3 * (1 + w * f); % g, wet weight
  
  % length-weight male
  L = LW_m2(:,1) * del_M; % cm, structural length
  EWw_m2 = L.^3 * (1 + w_m * f); % g, wet weight
  
  % length-weight female
  L = LW_f2(:,1) * del_M; % cm, structural length
  EWw_f2 = L.^3 * (1 + w * f); % g, wet weight
 
  %% pack to output
  prdData.tLe = EL_e;
  prdData.tYe = EY_e;
  prdData.LW_m = EWw_m;
  prdData.LW_f = EWw_f;
  prdData.LN = EN;
  prdData.LW_e = EWw_e;
  prdData.LW_m2 = EWw_m2;
  prdData.LW_f2 = EWw_f2;
  
end


% the t-L data were not used because after a lot of testing and trying the
% authors of the entry came to the conclusion that the ageing is not
% trustworthly 
%
% % time - length Black sea 
% 
%   E_0 = U_E0 * p_Am; % J, initial energy in egg
%   % females    
%   pars_maturity = [kap; kap_R; g; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hp];
%   [UT_H0, aT_0, info] = maturity(L_0, f, pars_maturity); % d, time since start
%   t = tL_f(:,1); % d, time since t_0
%   t = t + aT_0; % d, time since fertilization
%   time = [0;t]; % append time at start of development to use as initial conditions in the ODE solver
%   LEH = [1e-4, E_0, 0]; % initial conditions
%   [tt, LEH] = ode45(@dget_LEH, time, LEH, [], f, pT_Am, kap, vT, kT_J, pT_M, E_G, E_Hb);
%   LEH(1,:) = [];
%   ELw_f = LEH(:,1)/ del_M;
%   
%   % males
%   pT_Am_m = p_Am_m * TC; % J/d/cm^2, max spec. surf area assim rate for males
%   pars_UE0_m = [V_Hb; g_m; k_J; k_M; v]; % compose parameter vector
%   [U_E0_m, L_bm, info] = initial_scaled_reserve(f, pars_UE0_m);
%   E_0m = U_E0_m * p_Am_m; % J, initial energy in egg (males)
%   pars_maturity = [kap; kap_R; g_m; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hp];
%   [UT_H0, aT_0, info] = maturity(L_0, f, pars_maturity); % d, time since start
%   t = tL_m(:,1); % d, time since t_0
%   t = t + aT_0; % d, time since fertilization
%   time = [0;t]; % append time at start of development to use as initial conditions in the ODE solver
%   LEH = [1e-4, E_0m, 0]; % initial conditions
%   [tt, LEH] = ode45(@dget_LEH, time, LEH, [], f, pT_Am_m, kap, vT, kT_J, pT_M, E_G, E_Hb);
%   LEH(1,:) = [];
%   ELw_m = LEH(:,1)/ del_M;
% 
% 
% function dLEH = dget_LEH(t, LEH, f, p_Am, kap, v, k_J, p_M, E_G, E_Hb)
%   % t: scalar with time 
%   % LEH: 5-vector with (L, E, E_H) of embryo and juvenile
%   % dLEH: 5-vector with (dL/dt, dE/dt, dH/dt)
%   
%   % unpack
%   L = LEH(1);     % cm, structural length
%   E = LEH(2);     % J, reserve E
%   E_H = LEH(3);   % J, maturity E_H
%   
%   pA = f * p_Am * L^2 * (E_H>=E_Hb);    % J/d, assimilation rate at time t
% 
%   L2  = L * L; L3 = L2 * L; L4 = L3 * L;
%   r   = (E * v/ L4 - p_M/ kap)/ (E/ L3 + E_G/ kap);
%   pC = E * (v/ L - r);
%   
%   % generate derivatives
%   dE_H  = (1 - kap) * pC - k_J * E_H;
%   dE     = pA - pC;
%   dL     = L * r/ 3;
%   
%   dLEH = [dL; dE; dE_H]; % pack output 
% 
% end
% 
% 
% 

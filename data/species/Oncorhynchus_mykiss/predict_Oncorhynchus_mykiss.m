function [prdData, info] = predict_Oncorhynchus_mykiss(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  
  % customized filters to contrain additional parameter 
  filterChecks = f_tW3>1 || f_tW3 <0 || ...         % f contrained to not be larger than 1
                 f_tW1>1 || f_tW1 <0 || ...
                 f_tW2>1 || f_tW2 <0  || ...
                 E_Hh > E_Hb || E_Hh <= 0; % 
  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  
% temperature correction factors
  TC_ah5  = tempcorr(temp.ah_5, T_ref, T_A);
  TC_ah   = tempcorr(temp.ah, T_ref, T_A);  
  TC_ap   = tempcorr(temp.ap, T_ref, T_A);
  TC_am   = tempcorr(temp.am, T_ref, T_A);
  TC_Ri   = tempcorr(temp.Ri, T_ref, T_A);
  TC_tW  = tempcorr(temp.tW1, T_ref, T_A); % DaviKlemm2014
  TC_tW3   = tempcorr(temp.tW3, T_ref, T_A); % YaniHisa2002
  TC_Tah  = tempcorr(Tah(:,1), T_ref, T_A);
  TC_tWde = tempcorr(temp.tWde, T_ref, T_A);
  TC_WJO = tempcorr(temp.WJO, T_ref, T_A);
  TC_Wie1985 = tempcorr(temp.Wie1985, T_ref, T_A);
  TC_u12 = tempcorr(temp.u12_tL1, T_ref, T_A);

  TC_u13 = tempcorr(temp.u13_tW_B, T_ref, T_A);
 
%   TC_u10_tW1_ = tempcorr(temp.u10_tW1_B , T_ref, T_A);
    
 TC_u6 =  tempcorr(temp.u6_tJO , T_ref, T_A);

  
% parameter vector for DEBtool:
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  pars_JO = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size

%% zero -variate data  

  % life cycle
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve  
  E_0 = U_E0 * p_Am;     % J, initial reserve
  Wd0 = E_0 * w_E/ mu_E ; % g, egg dry weight 
    
  % hatch
  [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h5 = aUL(2,1)/ TC_ah5;              % d, age at hatch at f and T
  aT_h = aUL(2,1)/ TC_ah;              % d, age at hatch at f and T
  L_h = aUL(2,3); % cm, strucural length at hatch
  E_h = aUL(2,2) * p_Am; % J, energy in reserves at hatch
  Wdh = (d_V * L_h^3 + w_E/ mu_E * E_h); % g, dry weight at hatch
  
  % birth
  L_b   = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  aT_b5 = t_b/ k_M/ TC_ah5;           % d, age at birth of foetus at f and T
  aT_b  = t_b/ k_M/ TC_ah;            % d, age at birth of foetus at f and T
  Wdb   = d_V * L_b^3 * (1 + f * w);  % g, dry weight at birth at f 
     
  % puberty: this is moved to after uni-variate data, since is works with f_tLW

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.Wd0 = Wd0;
  prdData.ah = aT_h;
  prdData.ah_5 = aT_h5;
  prdData.Wdh = Wdh;
  prdData.ab = aT_b;  
  prdData.ab_5 = aT_b5;
  prdData.Wdb = Wdb;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data with f = 1
 
  
  % T-ah - Vels1987 - at f and T
  EaT_h =  aUL(2,1) ./ TC_Tah;   % d, age at hatch at f and T
  
  % tWde and tWde_E - NinnStev2006 - at f and T
  vT = v * TC_tWde; kT_J = TC_tWde * k_J; kT_M = k_M * TC_tWde; pT_Am = p_Am * TC_tWde;
  UT_E0 = U_E0/ TC_tWde; aT_b = t_b/ kT_M; aT_j = t_j/ kT_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  L_j = l_j * L_m;
  if tWde_E(1,1) > 0
     time = [0; tWde_E(:,1)];
  else
     time = tWde_E(:,1);
  end
  % embryo yolk
  [a, LUH] = ode45(@dget_LUH, time, [1e-10 UT_E0 0], [], kap, vT, kT_J, g, L_m);
  EWde_E = 1e3 * max(0, LUH(:,2) * pT_Am * w_E/ mu_E - f * m_Em * d_V * LUH(:,1) .^ 3 );
  % embryo body mass
  t_bj = time(time >= aT_b & time < aT_j); t_ji = time(time >=  aT_j); 
  L_0b = LUH(time < aT_b,1);
  L_bj = L_b * exp((t_bj - aT_b) * rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - aT_j)); % cm, expected length at time
  Wd_0b = (1 + f * m_Em) * d_V * L_0b.^3;
  Wd_bi = [L_bj;L_ji].^3 * d_V * (1 + f * w); % predicted dry structure in mg
  EWde  = 1e3 * [Wd_0b; Wd_bi];  % mg, yolk-free embryo dry mass
  % remove the first values in case we had appended a zero in front
  if tWde_E(1,1) >0
  EWde_E =  EWde_E(2:end);
  EWde = EWde(2:end);     
  end
  
  % Oxygen consumption   
  
  % KieAls1998
  L = forkLength.WJO * del_M ; % structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_JO, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJO = - J_M(3,:)' .* TC_WJO * 1e3;         % mmol O2/d, O2 consumption 

  % Wie1985   
  L = (Wie1985(:,1) /(1 + f * w) ) .^ (1/3) ;  % estimated structural length from weights
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_JO, l_b, l_j, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJO_Wie1985 = - J_M(3,:)' .* TC_Wie1985 * 1e3;      % mmol O2/d, O2 consumption 

%   % L-Ww,  
%   EL3 = (LW(:,1) * del_M2).^3 * (1 + f * w); % g, wet mass
%   
  
  % t-L and t-Ww, a-p, L_p Ww_p DaviKenn2014
  TC = TC_tW;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tW1);
  % puberty 
  L_p  = L_m * l_p;                 % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T
  Ww_p = L_p^3 * (1 + f_tW1 * w);   % g, wet weight at puberty at f

  [EWw, EL1]  = predict_WL(f_tW1, TC, tL1(:,1), par, cPar);
  EL1 = EL1/ del_M; % cm, structural length
  EW1 = predict_WL (f_tW1, TC, tW1(:,1), par, cPar); % g, wet weight
  
  [EWw, EL2]  = predict_WL(f_tW2, TC, tL2(:,1), par, cPar);
  EL2 = EL2/ del_M; % cm, structural length
  EW2 = predict_WL (f_tW2, TC, tW2(:,1), par, cPar); % g, wet weight

  % t-Ww , YaniHisa2002
  TC = TC_tW3; % -, temp correction factor
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tW3);
  rT_B = TC * rho_B * k_M; rT_j = TC * rho_j * k_M; % 1/d, von Bert, exponential growth rate
  L_j  = l_j * L_m; L_i = l_i * L_m;
  L_0  = (W0.tW3/ (1 + f_tW3 * w))^(1/3); % cm, structural length at t = 0 
  if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j; % d, time since beginning of experiment that metamorphosis occurs
    t_bj = tW3(tW3(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = tW3(tW3(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
  else 
    L = L_i - (L_i - L_0) * exp( - rT_B * tW3(:,1)); % cm, expected length at time
  end
  EW3 = L.^3 * (1 + f_tW3 * w);
  
  % STARVATION data added in mod_5
  % we assume that fish are all post metamorphosis
   s_M = l_j/ l_b; % -, acceleration at f 
   
% univar 6 - LaufWood1996
%     pars_JO = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars

    % initial conditions:
    L01 = L0.u6_tJO  * del_M; % cm, initial structural length
    E0 = (W0.u6_tJO  - L01^3) * mu_E * d_E / w_E; % J, initial energy reserve
    ee = E0 / L01^3 / E_m;  % ee = 0.9187
    U_H0 = maturity_j(L01, ee, pars_JO);  % scaled maturities E_H/ {p_Am}
    E_H0 =  U_H0 * p_Am; % J, initial maturity level
    Initial_Conditions = [L01, E0, E_H0, 0]; % 

    [t1 LEHR] = ode45(@dget_LEHR, u6_tJO(:,1), Initial_Conditions, [], 0, TC, s_M, par, cPar);  
    L  = LEHR(:,1); % structural length
    E = LEHR(:,2);  % reserve
    E_H = LEHR(:,3);  % reserve
    
  p_A = 0 .* p_Am * s_M * L.^2;              % assim
  p_S = p_M * L.^3;                           % somatic  maint
  p_C = E .* ((E_G * v * s_M * L.^2 + p_S)./ (kap * E + E_G * L.^3));   % mobilisation
  p_J = k_J * E_H;                            % maturity maint
  p_G = kap * p_C - p_S;                      % growth
  p_R = (1 - kap) * p_C - p_J;                % maturation/reproduction
  p_D = p_S + p_J + p_R ;         % dissipation

    J_M = - (n_M\n_O) * eta_O * [p_A p_D p_G]';  % mol/d: J_C, J_H, J_O, J_N in rows 
    EJO1 = - J_M(3,:)' .* TC_u6 * 1e3;         % mmol O2/d, O2 consumption 

    prdData.u6_tJO = EJO1;

     [t1 LEHR] = ode45(@dget_LEHR, [u6_tW(:,1); u6_tW(end,1) + 1e-4], Initial_Conditions, [], 0, TC, s_M, par, cPar);  
    LEHR(end,:) = []; L1 = LEHR(:,1); E1 = LEHR(:,2); Ww1 =  L1.^3 + w_E/ mu_E/ d_E * E1; % g, wet weight
    prdData.u6_tW = Ww1; % pack output
 
% UNIVAR 12 -  SumpBail1991

    % calculate initial conditions:     
    L01 = L0.u12_tW1  * del_M; % cm, initial structural length
    E0  = (W0.u12_tW1 - L01^3) * mu_E * d_E / w_E; % J, initial energy reserve
    ee  = E0 / L01^3 / E_m;     % ee = 0.8526
    H0  = E_Hj *1.1; % J initial maturity is higher than metamorphosis
    Initial_Conditions = [L01, E0, H0, 0]; % 
    TC  = TC_u12; % -, temperature correction
 
    % control 5 % fed
    [t1, LEHR] = ode45(@dget_LEHR, u12_tL1(:,1), Initial_Conditions, [], f_u12, TC, s_M, par, cPar); 
    L1      = LEHR(:,1);   Lw1   = L1/ del_M; % cm, fork length
    E1      = LEHR(:,2);   Ww1   =  L1.^3 + w_E/ mu_E/ d_E * E1; % g, wet weight
    % pack predictions:
    prdData.u12_tW1    = Ww1; 
    prdData.u12_tL1   = Lw1;

    % starved after one week :
    % first week with feeding:
    t = u12_tW2((u12_tW2(:,1)<7.1),1); 
    [t1, LEHR] = ode45(@dget_LEHR,[t; t(end) + 1e-4], Initial_Conditions, [], f_u12, TC, s_M, par, cPar); 
    L1      = LEHR(:,1); Lw1 = L1/ del_M; Lw1(end) = [];% cm, fork length
    E1      = LEHR(:,2); Ww1   =  L1.^3 + w_E/ mu_E/ d_E * E1; Ww1(end) = [];
    % afterwards no food:
     t2 = u12_tW2((u12_tW2(:,1)>=7.1),1); 
    [t1, LEHR] = ode45(@dget_LEHR,[t(end)+ 1e-4;t2; t2(end) + 1e-4], LEHR(end,:), [], 0, TC, s_M, par, cPar);
    LEHR([1,end],:) = []; % remove the dummy time used to have smooth trajectory
    L2 = LEHR(:,1); Lw2 = L2 / del_M;  % cm, fork length
    E2 = LEHR(:,2); Ww2 =  L2.^3 + w_E/ mu_E/ d_E * E2; % g, wet weight
   % pack predictions:
    prdData.u12_tW2  = [Ww1; Ww2];  
    prdData.u12_tL2  = [Lw1; Lw2]; 
   
% UNIVAR 13 : WeatGill1980
        
    % initial conditions:
    L01 = L0.u13_tW_B * del_M;                     % cm, initial structural length
    E0  = (W0.u13_tW_B - L01^3) *mu_E * d_E / w_E; % J, initial energy reserve
    H0  = E_Hj *1.1;                               % J initial maturity is higher than metamorphosis
    Initial_Conditions = [L01, E0, H0, 0]; % 
        
    % control: B
    % weight:
    [t1, LEHR] = ode45(@dget_LEHR, u13_tW_B(:,1), Initial_Conditions, [], f_u13, TC_u13, s_M, par, cPar); 
    L1 = LEHR(:,1); E1 = LEHR(:,2); Ww1   =  L1.^3 + w_E/ mu_E/ d_E * E1; % g, wet weight
    prdData.u13_tW_B  = Ww1; % pack output
    % length:
    [t1, LEHR] = ode45(@dget_LEHR, [u13_tL_B(:,1); u13_tL_B(end,1) + 1e-4], Initial_Conditions, [], f_u13, TC_u13, s_M, par, cPar);
    LEHR(end,:) = []; L1 = LEHR(:,1); Lw1 = L1/ del_M; % cm, fork length
    prdData.u13_tL_B  = Lw1; % pack output
    
   % C: first 3%, then ad libitum from week 16 (day 112)
   t_change = 112;
   % weight during the first 16 weeks fed at 3%:
   t = u13_tW_E((u13_tW_C(:,1) <= t_change),1); % d, time vector with first 16 weeks at 3 %
    [t1, LEHR] = ode45(@dget_LEHR,[t; t(end) + 1e-4], Initial_Conditions, [], f_u13_3, TC_u13, s_M, par, cPar);
    L1 = LEHR(:,1); E1 = LEHR(:,2); Ww1 = L1.^3 + w_E/ mu_E/ d_E * E1; Ww1(end) = []; % g, wet weight
   % weight after 16 weeks when fed ad libitum
     t2 = u13_tW_E((u13_tW_C(:,1) > t_change),1); % d, time vector after 16 weeks fed ad libitum
    [t1 LEHR] = ode45(@dget_LEHR,[t(end) + 1e-4;t2], LEHR(end,:), [], f_u13, TC_u13, s_M, par, cPar);
    L2    = LEHR(:,1);  E2 = LEHR(:,2); Ww2 = L2.^3 + w_E/ mu_E/ d_E * E2; Ww2(1) = []; % g, wet weight
    prdData.u13_tW_C  = [Ww1; Ww2]; % pack output
   % length during the first 16 weeks fed at 3%:
   t = u13_tL_C((u13_tL_C(:,1) < t_change),1); % d, time vector with first 16 weeks at 3 %
    [t1, LEHR] = ode45(@dget_LEHR,[t; t(end) + 1e-4], Initial_Conditions, [], f_u13_3, TC_u13, s_M, par, cPar);
    L1 = LEHR(:,1); Lw1 = L1/ del_M; Lw1(end) = []; % cm, forked length
   % length fter 16 weeks when fed ad libitum:    
   t2 = u13_tL_C((u13_tL_C(:,1)>=t_change),1); % d, time vector after 16 weeks fed ad libitum
   [t1 LEHR] = ode45(@dget_LEHR,[t(end) + 1e-4;t2], LEHR(end,:), [], f_u13, TC_u13, s_M, par, cPar);
   L2 = LEHR(:,1); Lw2 = L2/ del_M; Lw2(1) = []; % cm, fork length
   prdData.u13_tL_C  = [Lw1; Lw2]; % cm, fork length
    
   % D: starved for 3 weeks, then ad libitum from day 22
   t_change = 21;
   % weight 
  t = u13_tW_D((u13_tW_D(:,1) <= t_change),1); % f is zero until day 22
    [t1, LEHR] = ode45(@dget_LEHR,[t; t(end) + 1e-4], Initial_Conditions, [], 0, TC_u13, s_M, par, cPar);
    if length(t) == 2
    LEHR = [LEHR(1,:); LEHR(end,:)];
    end
    L1 = LEHR(:,1); E1 = LEHR(:,2); Ww1 =  L1.^3 + w_E/ mu_E/ d_E * E1; Ww1(end) = []; % g, wet weight
    % from day 22 it is ad libitum
    t2 = u13_tW_D((u13_tW_D(:,1) > t_change),1); % f is bigger from day 112 
    [t1, LEHR] = ode45(@dget_LEHR,[t(end) + 1e-4;t2], LEHR(end,:), [], f_u13, TC_u13, s_M, par, cPar);
    L2 = LEHR(:,1);  E2 = LEHR(:,2); Ww2 = L2.^3 + w_E/ mu_E/ d_E * E2; Ww2(1) = []; % g, wet weight
    prdData.u13_tW_D  = [Ww1; Ww2]; % pack output
   % length
   t = u13_tL_D((u13_tL_D(:,1) < t_change),1); % f is small until day 112
    [t1, LEHR] = ode45(@dget_LEHR,[t; t(end) + 1e-4] ,Initial_Conditions, [], 0, TC_u13, s_M, par, cPar);
    L1 = LEHR(:,1); Lw1 = L1/ del_M; Lw1(end) = []; % cm, fork length
    % from day 112 it is again bigger
     t2 = u13_tL_D((u13_tL_D(:,1) >= t_change),1); % f is bigger from day 112
    [t1, LEHR] = ode45(@dget_LEHR,[t(end) + 1e-4;t2], LEHR(end,:), [], f_u13, TC_u13, s_M, par, cPar);
    L2    = LEHR(:,1);  Lw2 = L2/ del_M; Lw2(1) = [];
    prdData.u13_tL_D  = [Lw1; Lw2]; 
    
   % E: starved for 12 weeks, then ad libitum from week 13 
   t_change = 91;
   % weight
   t = u13_tW_E((u13_tW_E(:,1)<=t_change),1); % f is zero until day 22
    [t1 LEHR] = ode45(@dget_LEHR,[t; t(end) + 1e-4], Initial_Conditions, [], 0, TC_u13, s_M, par, cPar); 
    L1  = LEHR(:,1); E1 = LEHR(:,2); Ww1 = L1.^3 + w_E/ mu_E/ d_E * E1; Ww1(end)=[]; % g, wet weight
    % from day 22 it is ad libitum
     t2 = u13_tW_E((u13_tW_E(:,1)>t_change),1); % f is bigger from day 112
    [t1 LEHR] = ode45(@dget_LEHR,[t(end) + 1e-4;t2], LEHR(end,:), [], f_u13, TC_u13, s_M, par, cPar); 
    L2 = LEHR(:,1); E2 = LEHR(:,2); Ww2 = L2.^3 + w_E/ mu_E/ d_E * E2; Ww2(1) = []; % g, wet wight
    prdData.u13_tW_E  = [Ww1; Ww2]; 
     % length
    t = u13_tL_E((u13_tL_E(:,1)<t_change),1); % f is small until day 112
    [t1, LEHR] = ode45(@dget_LEHR,[t; t(end) + 1e-4] ,Initial_Conditions, [], 0, TC_u13, s_M, par, cPar);  
    L1 = LEHR(:,1); Lw1 = L1/ del_M; Lw1(end) = [];
    % from day 91 it is again bigger
     t2 = u13_tL_E((u13_tL_E(:,1)>=t_change),1); % f is bigger from day 112
    [t1, LEHR] = ode45(@dget_LEHR,[t(end) + 1e-4;t2], LEHR(end,:), [], f_u13, TC_u13, s_M, par, cPar);  
    L2    = LEHR(:,1);  Lw2 = L2/ del_M; Lw2(1) = [];
    prdData.u13_tL_E  = [Lw1; Lw2]; 
  
  %% pack to output
  prdData.Tah      = EaT_h;
  prdData.tWde_E   = EWde_E;
  prdData.tWde     = EWde; 
  prdData.WJO      = EJO;
  prdData.Wie1985  = EJO_Wie1985; 

  prdData.tL1       = EL1; % DaviKlemm2014
  prdData.tL2       = EL2; % DaviKlemm2014
  prdData.tW1       = EW1; % DaviKlemm2014
  prdData.tW2       = EW2; % DaviKlemm2014
  prdData.tW3       = EW3; % YaniHisa2002
   
  prdData.ap       = aT_p; % DaviKlemm2014
  prdData.Lp       = Lw_p; % DaviKlemm2014
  prdData.Wwp       = Ww_p; % DaviKlemm2014
end


%% Subfunctions :


function dLEH = dget_LEHR(t, LEH, f, TC, s_M, p, c) 
  
  L = LEH(1);     % cm, structural length
  E = LEH(2);     % J, reserve E
  E_H = LEH(3);   % J, maturity E_H
  
  % Temperature correct:
  vT = p.v * TC; pT_Am = c.p_Am * TC; kT_J = p.k_J * TC;  pT_M = p.p_M * TC; 
  %  Shape correction function applies to surface-area specific
  %  assimilation and energy conductance:
  pA      = f *  pT_Am * s_M * L^2; % J/cm^2/d, maximum surface area-specific assimilation rate
  vT    = vT * s_M;               % cm/d, conductance
  % Growth rate and mobilization rate:
  L2    = L * L; L3 = L2 * L; L4 = L3 * L;
  pC = E/L3 * (p.E_G * vT/ L  + pT_M)/ (p.kap * E/ L3 + p.E_G );   % [p_C], J/cm^3 (2.12, Kooijman 2010)
  % degrade stucture to cover somatic maintenance:
    if p.kap * pC < pT_M  
    r = (E * vT/ L4  - pT_M/ p.kap)/ (E/ L3 + p.E_G * c.kap_G/ p.kap); % 1/d, specific growth rate
    else
    r = (E * vT/ L4 - pT_M/ p.kap)/ (E/ L3 + p.E_G/ p.kap); % 1/d, specific growth rate
    end
  % generate dH/da, dE/da, dL/da:  
  dE_H  = ((1 - p.kap) * pC * L3 - kT_J * E_H)   * (E_H < p.E_Hp);
  dE_R =  ((1 - p.kap) * pC * L3 - kT_J * p.E_Hp) * (E_H >= p.E_Hp);
  dE     = pA - pC * L3;
  dL     = L * r/ 3;
  % Pack output 
  dLEH = [dL; dE; dE_H; dE_R]; 
  
end

function [EW, EL] = predict_WL(f, TC, timeSinceHatch, p, c)                    
% [EW, EL] = predict_WL(f, TC, timeSinceHatch, p, c)
% Inputs:
% f, scalar, scaled func response
% TC, scalar, temperature correction
% timeSinceHatch, n-vector, time since hatch
% p, structure with parameters
% c, structure with compound parameters
  
pars_tj = [c.g c.k c.l_T c.v_Hb c.v_Hj c.v_Hp];   
pars_UE0 = [c.V_Hb; c.g; p.k_J; c.k_M; p.v]; % compose parameter vector
      
% Calculate Parameters
U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
UT_E0 = U_E0/ TC; % cm * d , scaled initial reserve at T
[U_H, aUL] = ode45(@dget_aul, [0; c.U_Hh; c.U_Hb], [0 U_E0 1e-10], [], p.kap, p.v, p.k_J, c.g, c.L_m);
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);

a_h   = aUL(2,1);                 % d, age at hatch at f and T_ref
aT_h  = a_h/ TC;                % d, age at hatch at f and T  
kT_M  = c.k_M * TC; 
rT_j = rho_j * kT_M; % 1/d, von Bert, exponential growth rate between first feeding and end of V1-morph period
rT_B = rho_B * kT_M; % 1/d, von Bert, exponential growth rate after V1-morph period
L_b = l_b * c.L_m; L_j = l_j * c.L_m; L_i = l_i * c.L_m;     % cm, length at birth, metamorphosis, ultimate
aT_b  = t_b/ kT_M; aT_j = t_j/ kT_M;    % d, age at birth, metamorphosis at T

t = timeSinceHatch + aT_h; % d, age since fertilization
t_0b = t(t < aT_b,1);    % ages during the embryo period
t_bj = t(t >= aT_b & t < aT_j,1);    % selects times during V1-morph period
t_ji = t(t >= aT_j,1);                % selects times after metamorphosis

if isempty(t_0b) == 0     % if t_emb is not empty    
t_0b = [0;t_0b];   
[a, LUH] = ode45(@dget_LUH, t_0b, [1e-4 UT_E0 0], [], p.kap, vT* TC, kT_J * TC, c.g, c.L_m);
    if length(t_0b) == 2
    LUH = LUH(end,:);
    else
    LUH = LUH(2:end,:);    
    end
    L_emb = LUH(:,1);   % cm, embryo structural length
    E_emb = LUH(:,2) * pT_Am * TC;   % J, embryo energy in reserve
    Ww_emb = p.d_V * L_emb.^3 + c.w_E/ p.mu_E * E_emb; % g, embryo wet weight
else
L_emb = []; Ww_emb = [];
end

% time-length 
L_bj = L_b * exp((t_bj - aT_b) * rT_j/ 3); % cm length and weight during V1-morph period
Ww_bj = L_bj.^3 * (1 + c.w * f);   % g weight during V1-morph period
L_jm = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - aT_j));   % cm, length after V1-morph period
Ww_jm = L_jm.^3 * (1 + c.w * f); % g, weight after V1-morph period

EL = [L_emb; L_bj; L_jm]; % cm, structural length
EW = [Ww_emb; Ww_bj; Ww_jm]; % g, wet weight

end


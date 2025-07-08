function [prdData, info] = predict_Ruditapes_decussatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % filters
  if f >1 ||f_UrrSpr >1 ||f_UrrSum >1 || f_Erdal >1 || f_Erdal_f3 >1 || f_Cam >1 || f_Ojea >1 || f_Alb >1 || f_Alb1 >1 || kap_X1 > 1 || kap_X2  >1 ||  kap_X3 >1
    info = 0; prdData = {}; return;
  end 

  % compute temperature correction factors
  TC        = tempcorr(temp.ab, T_ref, T_A); % all temps at 20 C
  TC28      = tempcorr(temp.aj28, T_ref, T_A); 
  TC_tL     = tempcorr(temp.tL_Juric, T_ref,T_A);
  TC_Ri     = tempcorr(temp.Ri, T_ref,T_A);
  TC_Beir28 = tempcorr(temp.tL_Beir28, T_ref,T_A);
  TC_Beir22 = tempcorr(temp.tL_Beir22, T_ref,T_A);
  TC_Beir16 = tempcorr(temp.tL_Beir16, T_ref,T_A);
  TC_Beir10 = tempcorr(temp.tL_Beir10, T_ref,T_A);
  TC_Alb    = tempcorr(temp.tWd_Alb,T_ref,T_A);
  TC_Matias = tempcorr(temp.tL_Matias1,T_ref,T_A);
    
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J ;k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0); %d.cm2, initial scaled reserve. 
  Ww_0 = U_E0 * p_Am * w_E / mu_E /d_V;       % g, initial dry weight
  E0 = U_E0 * p_Am;                           % J, initial energy in egg
  V_egg = E0 * w_E/ (mu_E * d_E)/ del_Y^3;    % cm^3, volume of egg, Augustine, Litvak & Kooijman 2011 !
  Lw_0= V_egg^(1/3);                          % cm, diameter of egg
     
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/del_M1;
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/del_M1;
  aT_j = t_j / k_M/ TC;             % d, age at metam 20 degrees
  aT_j28 = t_j / k_M/ TC28;         % d, age at metam 28 degrees
  s_M = L_j/ L_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M2;               % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M2;               % cm, ultimate total length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, daily egg rate at T

  % growth rate
  rT_B = TC * rho_B * k_M;           % /d, adult growth rate 
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.aj28 = aT_j28;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.L0 = Lw_0;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  %prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % length - weight
  EWw       =  (LWw(:,1)       * del_M2).^3 * (1 + f_Cam   * w);  % g, wet weight
  EWw_Ojea  =  (LWw_Ojea(:,1)  * del_M2).^3 * (1 + f_Ojea  * w);  % g, wet weight
  EWw_Erdal =  (LWw_Erdal(:,1) * del_M2).^3 * (1 + f_Erdal * w);  % g, wet weight
  EWw_Sousa =  (LWw_Sousa(:,1) * del_M2).^3 * (1 + f_Sousa * w);  % g, wet weight
  
  %% larval development

   % tL data from Matias 
   % under three food conditions:
   % unfed, T-iso and C.cal starting at 48h

% Starvation
    f0 = 0; finit = f; % initial and experimental functional response
    t = tL_Matias(:,1); % d, time
    % initial conditions at birth:
    [~, ~, ~, l_j, ~, l_b, ~, ~, ~, ~] = get_tj(pars_tj, finit); 
    L_b = L_m * l_b;  L_j = L_m * l_j;
    E_init = finit * E_m * L_0Matias^3; % J, inital energy in reserve
    InitCond = [L_0Matias; E_init; E_Hp; 0]; % concatenate initial conditions
    % calculates the length
    [~, LEHR] = ode45(@ode_LEHR, t , InitCond, [], par, cPar, f0, L_j, L_b, TC_Matias);
    %LEHR(1,:) = []; 
    L2   = LEHR(:,1); % cm,structural length
    EtL_Matias = L2/del_M1;

% food type 1
    f1 = f_Matias1; finit = f;
    t = tL_Matias1(:,1); % d, time
    % initial conditions at birth:
    [~, ~, ~, l_j, ~, l_b, ~, ~, ~, ~] = get_tj(pars_tj, finit); 
    L_b = L_m * l_b;  L_j = L_m * l_j; 
    E_init = finit * E_m * L_0Matias^3; % J, inital energy in reserve
    InitCond = [L_0Matias; E_init; E_Hp; 0]; % concatenate initial conditions
    [~, LEHR] = ode45(@ode_LEHR, t , InitCond, [], par, cPar, f1, L_j, L_b, TC_Matias); 
    L2   = LEHR(:,1); % cm,structural length
    EtL_Matias1 = L2/del_M1;

%food type 2
    f2 = f_Matias2; finit = f;
    t = tL_Matias2(:,1); % d, time
    % initial conditions at birth:
    [~, ~, ~, l_j, ~, l_b, ~, ~, ~, ~] = get_tj(pars_tj, finit); 
    L_b = L_m * l_b;  L_j = L_m * l_j; 
    E_init = finit * E_m * L_0Matias^3; % J, inital energy in reserve
    InitCond = [L_0Matias; E_init; E_Hp; 0]; % concatenate initial conditions
    [~, LEHR] = ode45(@ode_LEHR, t , InitCond, [], par, cPar, f2, L_j, L_b, TC_Matias);
    L2   = LEHR(:,1); % cm,structural length
    EtL_Matias2 = L2/del_M1;

   % LARVAL GROWTH 
   % tL and tWd from Beiras
   % Beiras1994: larval growth at different temperatures
     [t_j, ~, t_b, l_j, ~, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_Beir); 
     %28C
         kT_M = k_M * TC_Beir28; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;
         L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
         t = tL_Beir28(:,1) - 2;  %tT_j = tT_j-2; %to ensure that the initial value are constant
         L_bj = L_b * exp(t((t <= tT_j),1) * rT_j/ 3);
         L_jm = L_i - (L_i - L_j) * exp( - rT_B * (t((t > tT_j),1) - tT_j)); % cm, expected length at time
         ELw_Beir28 = 1e4 * [L_bj; L_jm]/del_M1; % µm, physical length
         EtWd_Beir28 = [L_bj; L_jm].^3 * (1 + f_Beir * ome) * d_V * 1e6; % ug, tissue dry weight
    
     % 22C
         kT_M = k_M * TC_Beir22; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
         L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
         t = tL_Beir22(:,1) - 2; %tT_j = tT_j-2;
         L_bj = L_b * exp(t((t <= tT_j),1) * rT_j/ 3);
         L_jm = L_i - (L_i - L_j) * exp( - rT_B * (t((t > tT_j),1) - tT_j)); % cm, expected length at time
         ELw_Beir22 = 1e4 * [L_bj; L_jm]/ del_M1; % µm, physical length
         EtWd_Beir22 = [L_bj; L_jm].^3 * (1 + f_Beir * ome) * d_V* 1e6; % ug, tissue dry weight
    
     % 16C
         kT_M = k_M * TC_Beir16; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
         L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
         t = tL_Beir16(:,1) - 2; %tT_j = tT_j-2;
         L_bj = L_b * exp(t((t <= tT_j),1) * rT_j/ 3);
         L_jm = L_i - (L_i - L_j) * exp( - rT_B * (t((t > tT_j),1) - tT_j)); % cm, expected length at time
         ELw_Beir16 = 1e4 * [L_bj; L_jm]/ del_M1; % µm, physical length
         EtWd_Beir16 = [L_bj; L_jm].^3 * (1 + f_Beir * ome) * d_V* 1e6; % ug, tissue dry weight
    
     % 10C
         kT_M = k_M * TC_Beir10; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
         L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
         t = tL_Beir10(:,1) - 2; %tT_j = tT_j-2;
         L_bj = L_b * exp(t((t <= tT_j),1) * rT_j/ 3);
         L_jm = L_i - (L_i - L_j) * exp( - rT_B * (t((t > tT_j),1) - tT_j)); % cm, expected length at time
         ELw_Beir10 = 1e4 * [L_bj; L_jm]/ del_M1; % µm, physical length
         L_bj = L_b * exp(tWd_Beir10((tWd_Beir10(:,1) <= tT_j),1) * rT_j/ 3);
         L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWd_Beir10((tWd_Beir10(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
         EtWd_Beir10 = [L_bj; L_jm].^3 * (1 + f_Beir * ome) * d_V* 1e6; % ug, tissue dry weight


  % Larvae ingestion

  % food concentration - ingestion rate Larvae Perez
  % X-JX 108 um
        Kp = Kperez; %half-saturation coefficient
        pT_Am = TC * p_Am;
        J_X_Am0 = dget_J_X_Am(kap_X1, mu_X, mu_E,pT_Am,1); % species specific surface feeding flux
        L = 108 * del_M1 * 1e-4;           % cm, structual length
        s_c = L/L_b; % shape correction function between birth and metamorphosis
        EJX108 =   12  * s_c * J_X_Am0 * L^2 * XJX108(:,1) ./ (Kp  + XJX108(:,1) )/ 24; % g /h, ingestion rate

  % X-JX 172 um
      L = 172 * del_M1 * 1e-4;           % cm, structual length
      s_c = L/L_b; % shape correction function between birth and metamorphosis
      EJX172 =  12 * s_c * J_X_Am0 * L^2 * XJX172(:,1) ./ (Kp  + XJX172(:,1) )/ 24; % g /h, ingestion rate

  % X-JX 196 um
      L = 196 * del_M1 * 1e-4;           % cm, structual length
      s_c = L/L_b; % shape correction function between birth and metamorphosis
      EJX196 =  12 * s_c* J_X_Am0 * L^2 * XJX196(:,1) ./ (Kp  + XJX196(:,1) )/ 24; % g /h, ingestion rate

  % X-JX 228 um
      L = 228 * del_M1 * 1e-4;           % cm, structual length
      s_c = L/L_b; % shape correction function between birth and metamorphosis
      EJX228 =  12 * s_c * J_X_Am0 * L^2 * XJX228(:,1) ./ (Kp  + XJX228(:,1) )/ 24; % g C/h

  % albentosa Wet weight - ingestion rate
  fx = 100/(100 + Kp); % functional response based on an approximate concentration of 100 cell/ul
  % f1: I. galbana 
      pT_Am = TC * p_Am; %species specific assimilation rate
      J_X_Am1 = dget_J_X_Am(kap_X1, mu_X, mu_E,pT_Am,1); % species specific surface feeding flux
      L = ( WwJX_f1(:,1) ./ (1 + w * fx)).^(1/3);    % cm, structural length
      s_c = L/L_b; % shape correction function between birth and metamorphosis
      s_c(s_c>s_M)=s_M; % after metamorphosis the shape correction is constant: L/L_b = L_j/L_b
      EWwJX_f1 =  1e6 * s_c * J_X_Am1 .* L.^2 * w_X * fx * TC ;% ug DW ind-1 d-1
    % f2: T. suesica
      J_X_Am2 = dget_J_X_Am(kap_X2, mu_X, mu_E,pT_Am,1);
      L = (WwJX_f2(:,1) ./ (1 + w * fx)).^(1/3);    % cm, structural length
      s_c = L/L_b; % shape correction function between birth and metamorphosis
      s_c(s_c>s_M)=s_M;
      EWwJX_f2 =  1e6 * s_c * J_X_Am2 .* L.^2 * w_X * fx * TC ;% ug DW ind-1 d-1

    % f3: P. tricornutum
      J_X_Am3 = dget_J_X_Am(kap_X3, mu_X, mu_E,pT_Am,1);
      L = (WwJX_f3(:,1) ./ (1 + w * fx)).^(1/3);    % cm, structural length
      s_c = L/L_b; % shape correction function between birth and metamorphosis
      s_c(s_c>s_M)=s_M;
      EWwJX_f3 =  1e6 * s_c * J_X_Am3 .* L.^2 * w_X * fx * TC ;% ug DW ind-1 d-1

  % time - wet weight albentosa 
  % diet 1
      [~, ~, ~, ~, ~, l_b, ~, rho_j, ~] = get_tj(pars_tj, f_Alb1);
      kT_M = k_M * TC; rT_j = rho_j * kT_M; L_b = L_m * l_b;   
      L  = L_0Alb1 + L_b * exp(tWw_f1(:,1) * rT_j/ 3); % cm, struc length 
      EtWw_f1 = L.^3 .* (1 + f_Alb1 * ome) * 1e3; %mg ind-1
  % diet 2  
      [~, ~, ~, ~, ~, l_b, ~, rho_j, ~] = get_tj(pars_tj, f_Alb2);
      kT_M = k_M * TC; rT_j = rho_j * kT_M; L_b = L_m * l_b;   
      L  = L_0Alb1 + L_b * exp(tWw_f2(:,1) * rT_j/ 3); % cm, struc length 
      EtWw_f2 = L.^3 .* (1 + f_Alb2 * ome) * 1e3; %mg ind-1
  % diet 3  
      [~, ~, ~, ~, ~, l_b, ~, rho_j, ~] = get_tj(pars_tj, f_Alb3);
      kT_M = k_M * TC; rT_j = rho_j * kT_M; L_b = L_m * l_b;   
      L  = L_0Alb1 + L_b * exp(tWw_f3(:,1) * rT_j/ 3); % cm, struc length 
      EtWw_f3 = L.^3 .* (1 + f_Alb3 * ome) * 1e3; %mg ind-1


  % adult growth

   % tL data from Juric et al 2012
      [~, ~, ~, ~, ~, ~, l_i, ~, rho_B] = get_tj(pars_tj, f_Juric);
      kT_M = k_M * TC_tL; rT_B = rho_B * kT_M; L_i = L_m * l_i;   
      L  = L_i - (L_i - L_0Juric * del_M2) * exp( - rT_B * tL_Juric(:,1)); % cm, struc length 
      EtL_Juric = L/ del_M2;   % cm, shell length 

   % length - change in length post metam
      [~, ~, ~, ~, ~, ~, l_i, ~, rho_B] = get_tj(pars_tj, f_Juric);
      rT_B = TC_tL * rho_B * k_M; Lw_i = L_m * l_i/ del_M2;
      EdLw_Juric = rT_B * (Lw_i - LdL_Juric(:,1));

  % time-weight
  % extract relevant parameters for each season
  [ ~, ~, ~, ~, ~, ~, l_i, ~, rho_B] = get_tj(pars_tj, f_UrrSpr); l_ix(1)=l_i;  rho_Bx(1)=rho_B;
  [ ~, ~, ~, ~, ~, ~, l_i, ~, rho_B] = get_tj(pars_tj, f_UrrSum); l_ix(2)=l_i;  rho_Bx(2)=rho_B;
  [ ~, ~, ~, ~, ~, ~, l_i, ~, rho_B] = get_tj(pars_tj, f_UrrAut); l_ix(3)=l_i;  rho_Bx(3)=rho_B;
  [ ~, ~, ~, ~, ~, ~, l_i, ~, rho_B] = get_tj(pars_tj, f_UrrWin); l_ix(4)=l_i;  rho_Bx(4)=rho_B;
  % create vector for each parameter to avoid calling the get_tj function
  % every iteration
  ftx=[200,265,356,446,538,630,721,811,901; f_UrrSum f_UrrAut f_UrrWin f_UrrSpr f_UrrSum f_UrrAut f_UrrWin f_UrrSpr f_UrrSum]';
  l_ix=[200,265,356,446,538,630,721,811,901; l_ix(2) l_ix(3) l_ix(4) l_ix(1) l_ix(2) l_ix(3) l_ix(4) l_ix(1) l_ix(2)]';
  rho_Bx=[200,265,356,446,538,630,721,811,901; rho_Bx(2) rho_Bx(3) rho_Bx(4) rho_Bx(1) rho_Bx(2) rho_Bx(3) rho_Bx(4) rho_Bx(1) rho_Bx(2)]';
  tT = temp.tWd_Urr0;
  spawnFlag = false; % Initial spawning flag to ensure the spawning 
  % threshold only has to be exceeded once to trigger a spawning event
  % age class 0 
      L_0T = L0Urr0;
      options = odeset('AbsTol',1e-7, 'RelTol',1e-7);
      t = tWd_Urr0(:,1); 
      LR_0 = [L_0T; 0];  % state variables at 0
      [t,  dLE_Ri] = ode15s(@dget_E_R, t, LR_0, options,tT, T_ref, T_A, ftx, L_m, k_M, k_J, v*s_M, E_m, kap, E_Hp, l_ix, rho_Bx,E_Spawn, T_Spawn, spawnFlag); 
      E_R = [dLE_Ri(:,2)];
      L_1 = [dLE_Ri(:,1)];
      EtWd_Urr0 = L_1.^3 .* (1 + spline1(t,ftx) * ome) * d_V + E_R/ mu_E * w_E; % g, dry weight

    % age class 1
      L_0T = L0Urr01;
      options = odeset('AbsTol',1e-7, 'RelTol',1e-7, 'MaxStep', 1);
      t = tWd_Urr01(:,1); 
      LR_0 = [L_0T; E_R0_1];  % state variables at 0
      [t, dLE_R0] = ode15s(@dget_E_R, t, LR_0, options,tT, T_ref, T_A, ftx, L_m, k_M, k_J, v*s_M, E_m, kap, E_Hp, l_ix, rho_Bx,E_Spawn, T_Spawn, spawnFlag);  
      E_R = [dLE_R0(:,2)]; L_1 = [dLE_R0(:,1)];
      EtWd_Urr01 = L_1.^3 .* (1 + spline1(t,ftx) * ome) * d_V + E_R/ mu_E * w_E; % g, dry weight

  % age class 2 
      L_0T = L0Urr02;
      options = odeset('AbsTol',1e-7, 'RelTol',1e-7, 'MaxStep', 1);
      t = tWd_Urr02(:,1); 
      LR_0 = [L_0T; E_R0_2];  % state variables at 0
      [t, dLE_R0] = ode45(@dget_E_R, t, LR_0, options,tT, T_ref, T_A, ftx, L_m, k_M, k_J, v*s_M, E_m, kap, E_Hp, l_ix, rho_Bx,E_Spawn, T_Spawn, spawnFlag);  
      E_R = [dLE_R0(:,2)]; L_1 = [dLE_R0(:,1)];
      EtWd_Urr02 = L_1.^3 .* (1 + spline1(t,ftx) * ome) * d_V + E_R/ mu_E * w_E; % g, dry weight

  % age class 3
      L_0T = L0Urr03;
      options = odeset('AbsTol',1e-7, 'RelTol',1e-7, 'MaxStep', 1);
      t = tWd_Urr03(:,1); 
      LR_0 = [L_0T; E_R0_3];  % state variables at 0
      [t, dLE_R0] = ode45(@dget_E_R, t, LR_0, options,tT, T_ref, T_A, ftx, L_m, k_M, k_J, v*s_M, E_m, kap, E_Hp, l_ix, rho_Bx,E_Spawn, T_Spawn, spawnFlag);  
      E_R = [dLE_R0(:,2)]; L_1 = [dLE_R0(:,1)];
      EtWd_Urr03 = L_1.^3 .* (1 + spline1(t,ftx) * ome) * d_V + E_R/ mu_E * w_E; % g, dry weight

    % age class 4
      L_0T = L0Urr04; 
      options = odeset('AbsTol',1e-7, 'RelTol',1e-7, 'MaxStep', 1);
      t = tWd_Urr04(:,1); 
      LR_0 = [L_0T; E_R0_4];  % state variables at 0
      [t, dLE_R0] = ode15s(@dget_E_R, t, LR_0, options,tT, T_ref, T_A, ftx, L_m, k_M, k_J, v*s_M, E_m, kap, E_Hp, l_ix, rho_Bx,E_Spawn, T_Spawn, spawnFlag);  
      E_R = [dLE_R0(:,2)]; L_1 = [dLE_R0(:,1)];
      EtWd_Urr04 = L_1.^3 .* (1 + spline1(t,ftx) * ome) * d_V + E_R/ mu_E * w_E; % g, dry weight

  % age class 5
      L_0T = L0Urr05;
      options = odeset('AbsTol',1e-7, 'RelTol',1e-7, 'MaxStep', 1);
      t = tWd_Urr05(:,1); 
      LR_0 = [L_0T; E_R0_5];  % state variables at 0
      [t, dLE_R0] = ode15s(@dget_E_R, t, LR_0, options,tT, T_ref, T_A, ftx, L_m, k_M, k_J, v*s_M, E_m, kap, E_Hp, l_ix, rho_Bx,E_Spawn, T_Spawn, spawnFlag);  
      E_R = [dLE_R0(:,2)]; L_1 = [dLE_R0(:,1)];
      EtWd_Urr05 = L_1.^3 .* (1 + spline1(t,ftx) * ome) * d_V + E_R/ mu_E * w_E; % g, dry weight

  % age class 6
      L_0T = L0Urr06;
      t = tWd_Urr06(:,1); 
      options = odeset('AbsTol',1e-7, 'RelTol',1e-7, 'MaxStep', 1);
      LR_0 = [L_0T; E_R0_6];  % state variables at 0
      [t, dLE_R0] = ode15s(@dget_E_R, t, LR_0, options,tT, T_ref, T_A, ftx, L_m, k_M, k_J, v*s_M, E_m, kap, E_Hp, l_ix, rho_Bx,E_Spawn, T_Spawn, spawnFlag);  
      E_R = [dLE_R0(:,2)]; L_1 = [dLE_R0(:,1)];
      EtWd_Urr06 = L_1.^3 .* (1 + spline1(t,ftx) * ome) * d_V + E_R/ mu_E * w_E; % g, dry weight 

     % tL and tWd data from Erdal 2020
     tT = temp.tL_Erdal_f1; %temperature over time
     % Station SA: f1
          [~,~,~, l_j, ~,~, l_i, ~, rho_B] = get_tj(pars_tj, f_Erdal_f1);
          L_i = L_m * l_i; s_M = l_j/ l_b; r_B = rho_B * k_M;    
          LHR_0 = [L_0Erdal*del_M2; 0; 0];  % state variables at 0
          options = odeset( 'AbsTol',1e-8, 'RelTol',1e-8);    
          [~, LHR] = ode45(@dget_LHR, tL_Erdal_f1(:,1), LHR_0, options, E_Hp, tT, T_ref, T_A, f_Erdal_f1, r_B, L_i, k_J, E_m, v * s_M, kap); % find state variables at start experiment
          L = LHR(:,1); E_R = LHR(:,3);
          EtL_Erdal_f1 = L/ del_M2;
          EtWd_Erdal_f1 = L.^3 .* (1 + f_Erdal_f1 * ome); % g
        
     % Station SB: f2 
          [~,~,~, l_j, ~,~, l_i, ~, rho_B]  = get_tj(pars_tj, f_Erdal_f2);
          L_i = L_m * l_i; s_M = l_j/ l_b; r_B = rho_B * k_M;    
          LHR_0 = [L_0Erdal*del_M2; 0; 0];  % state variables at 0
          options = odeset( 'AbsTol',1e-8, 'RelTol',1e-8);    
          [~, LHR] = ode45(@dget_LHR, tL_Erdal_f2(:,1), LHR_0, options, E_Hp, tT, T_ref, T_A, f_Erdal_f2, r_B, L_i, k_J, E_m, v*s_M, kap); % find state variables at start experiment
          L = LHR(:,1); E_R = LHR(:,3);
          EtL_Erdal_f2 = L/ del_M2;
          EtWd_Erdal_f2 = L.^3 .* (1 + f_Erdal_f2 * ome); % g  

     % Station SC: f3    
          [~,~,~, l_j, ~,~, l_i, ~, rho_B]  = get_tj(pars_tj, f_Erdal_f3);
          L_i = L_m * l_i; s_M = l_j/ l_b; r_B = rho_B * k_M;    
          LHR_0 = [L_0Erdal*del_M2; 0; 0];  % state variables at 0
          options = odeset( 'AbsTol',1e-8, 'RelTol',1e-8);    
          [~, LHR] = ode45(@dget_LHR, tL_Erdal_f3(:,1), LHR_0, options, E_Hp, tT, T_ref, T_A, f_Erdal_f3, r_B, L_i, k_J, E_m, v * s_M, kap); % find state variables at start experiment
          L = LHR(:,1); E_R = LHR(:,3);
          EtL_Erdal_f3 = L/ del_M2;
          EtWd_Erdal_f3 = L.^3 .* (1 + f_Erdal_f3 * ome); % g

  %tWd starvation data albentosa 2007
  % Starvation
      finit=f;
      % initial conditions for the ODE simulations
      L_init  = L_0Alb * del_M2; % cm, structural length at start
      E_init = finit * E_m * L_init^3; % J, inital energy in reserve
      InitCond = [L_init; E_init; E_Hp; 0]; % concatenate initial conditions
      % growth 
      t = tWd_Alb(:,1); % d, time
      [t, LEHR] = ode45(@ode_LEHR, [0;t], InitCond, [], par, cPar, 0, L_j, L_b, TC_Alb);
      LEHR(1,:)=[];
      EtWd_Alb = LEHR(:,1).^3 * (1 + f_Alb * ome) * d_V * 1e6; % ug, tissue dry weight

  % pack to output
  prdData.LWw = EWw;
  prdData.LWw_Ojea=EWw_Ojea;
  prdData.LWw_Erdal = EWw_Erdal;
  prdData.LWw_Sousa = EWw_Sousa;
  prdData.tL_Beir28 = ELw_Beir28;
  prdData.tL_Beir22 = ELw_Beir22;
  prdData.tL_Beir16 = ELw_Beir16;
  prdData.tL_Beir10= ELw_Beir10;
  prdData.tWd_Beir28 = EtWd_Beir28;
  prdData.tWd_Beir22 = EtWd_Beir22;
  prdData.tWd_Beir16 = EtWd_Beir16;
  prdData.tWd_Beir10= EtWd_Beir10;
  prdData.tL_Juric = EtL_Juric;
  prdData.tL_Matias = EtL_Matias;
  prdData.tL_Matias1 = EtL_Matias1;
  prdData.tL_Matias2 = EtL_Matias2;
  prdData.LdL_Juric=EdLw_Juric;
  prdData.tWd_Urr0=EtWd_Urr0;
  prdData.tWd_Urr01=EtWd_Urr01;
  prdData.tWd_Urr02=EtWd_Urr02;
  prdData.tWd_Urr03=EtWd_Urr03;
  prdData.tWd_Urr04=EtWd_Urr04;
  prdData.tWd_Urr05=EtWd_Urr05;
  prdData.tWd_Urr06=EtWd_Urr06;
  prdData.tL_Erdal_f1=EtL_Erdal_f1;
  prdData.tL_Erdal_f2=EtL_Erdal_f2;
  prdData.tL_Erdal_f3=EtL_Erdal_f3;
  prdData.tWd_Erdal_f1=EtWd_Erdal_f1;
  prdData.tWd_Erdal_f2=EtWd_Erdal_f2;
  prdData.tWd_Erdal_f3=EtWd_Erdal_f3;
  prdData.tWd_Alb = EtWd_Alb;
  prdData.LWw_Ojea=EWw_Ojea;
  prdData.XJX108 = EJX108;
  prdData.XJX172 = EJX172;
  prdData.XJX196 = EJX196;
  prdData.XJX228 = EJX228;
  prdData.WwJX_f1 = EWwJX_f1;
  prdData.WwJX_f2 = EWwJX_f2;
  prdData.WwJX_f3 = EWwJX_f3;
  prdData.tWw_f1 = EtWw_f1;
  prdData.tWw_f2 = EtWw_f2;
  prdData.tWw_f3 = EtWw_f3;
end


  %From Danio rerio (Augustine et al., 2011)
function dLEHR = ode_LEHR(t, LEHR, p, c, f, L_j, L_b, TC)
%
% Input: 
% p: structure 'par' 
% c: structure 'Cpar' obtained by cPar = parscomp_st(par)
% f: scaled, scaled functional response, 
% s_M: scalar, -, acceleration factor post metamorphosis
% TC, scalar, -, temperature correction factor

% --------------- unpack LEHR ------------------------------------------
L   =  max(0,LEHR(1)); % cm, volumetric structural length
E   =  max(0,LEHR(2)); % J,   energy in reserve 
EH  =  min(p.E_Hp,LEHR(3)); % J, E_H maturity
ER  =  max(0,LEHR(4)); % J, E_R reproduction buffer

% determine acceleration
if L < L_j
    s_M = L/L_b;
else
    s_M=L_j/L_b;
end
% Temperature correct the relevant paramters
vT = p.v * TC * s_M; pT_M = p.p_M * TC; kT_J = p.k_J * TC; pT_Am = c.p_Am * TC * s_M;
%
pA   = f * pT_Am * L^2 * (EH >= p.E_Hb);           % J/d, assimilation
%
if EH < p.E_Hp % juveniles cannot cover somatic maintenance with the buffer   
    r  = (E * vT/ L - pT_M * L^3/ p.kap)/ (E + p.E_G * L^3/ p.kap) * ...
        (E >= pT_M * L^4/ (p.kap * vT * s_M)) + ...
         (E * vT/ L - pT_M * L^3/ p.kap)/ (E + c.kap_G * p.E_G * L^3/ p.kap) ...
         * (E < pT_M * L^4/ (p.kap * vT * s_M));
pC   = E * (vT/ L - r); % J/d, mobilisation
dE   = pA - pC;                                          % J/d, change in energy in reserve
dL   = r/ 3 * L;                                         % cm/d, change in structural length
dEH  = max(0, (1 - p.kap) * pC - kT_J * EH) * (EH < p.E_Hp);    % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
dER  = 0; 
else % EH = EHp: adults     
 pC = E * (p.E_G * vT * L^2 + pT_M * L^3)/ (p.kap * E + p.E_G * L^3);    
    if p.kap * pC >= pT_M * L^3   % enough energy in reserve to cover somatic maintenance and enough to make a batch   
        r    = (E * vT/ L^4 - pT_M/ p.kap)/ (E/ L^3 + p.E_G/ p.kap); % d^-1, specific growth rate  
        dE   = pA - pC;                                          % J/d, change in energy in reserve
        dL   = r/ 3 * L;                                         % cm/d, change in structural length
        dEH  = 0;    % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
        dER  = ((1 - p.kap) * pC - kT_J * p.E_Hp) ;       % J, change in cumulated energy invested in the unripe reproduction buffer  
    else  % not enough energy in reserve to cover somatic maintenance
        if ER > 0
            r = 0;
        else
             r    =  (E * vT/ L - pT_M * L^3/ p.kap)/ ...
            (E + c.kap_G * p.E_G  * L^3/ p.kap); % d^-1, specific growth rate
        end      
        dE   = pA - pC;                                         % J/d, change in energy in reserve
        dL   = r/ 3 * L;                                        % cm/d, change in structural length
        dEH  = 0;                                               % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
        dER  = (1 - p.kap) * pC - kT_J * p.E_Hp;
        dER  = (dER  - (pT_M * L^3 - p.kap * pC)) * (ER > 0) ;
    end    
end
% pack dLEHR
dLEHR = [dL; dE; dEH; dER];    
end

 function dLE_R = dget_E_R(t, LR_0, tT, T_ref, T_A, ftx, L_m, k_M, k_J, v, E_m, kap, E_Hp , l_ix, rho_Bx, E_Spawn, T_Spawn, spawnFlag)
    % get length and reproduction buffer under changing temperatures and
    % function responses
 % Interpolate parameters
    l_i = spline1(t, l_ix);
    rho_B = spline1(t, rho_Bx);
    f = spline1(t, ftx);

    % Calculate initial structural length and growth rate
    L_i = L_m * l_i; 
    r_B = rho_B * k_M;

    % State variables
    L_0 = LR_0(1);
    E_R = LR_0(2);

    % Update structural length
    L = L_i - (L_i - L_0) * exp(-r_B * t);

    % Interpolate temperature and calculate temperature correction
    T = spline1(t, tT); 
    TC = tempcorr(T, T_ref, T_A); 
    rT_B = r_B * TC;
    kT_J = k_J * TC;
    vT = TC * v;

    % Calculate specific growth rate
    r = 3 * rT_B * (L_i / L - 1);

    % Calculate reserve mobilisation rate
    p_C = f * E_m * L^3 * (v / L - r);

    % Calculate allocation to reproductive buffer
    dE_R = (1 - kap) * p_C - E_Hp * kT_J;
     
     % Spawnflag is used to ensure reproductive buffer is emptied once and
     % to avoid errors
     % Check for spawning conditions
    persistent spawnFlagSet;
    if isempty(spawnFlagSet)
        spawnFlagSet = spawnFlag;
    end
    
    if ~spawnFlagSet && E_R + dE_R >= E_Spawn
        spawnFlagSet = true;
    end

    if spawnFlagSet && T > T_Spawn
        dE_R = -E_R; % empty reproduction buffer
    end
    dL = L * r / 3;
    % Return 
    dLE_R = [dL; dE_R];
    assignin('base', 'spawnFlagSet', spawnFlag);
end

function dLHR = dget_LHR(t, LHR, E_Hp, tT, T_ref, T_A, f, r_B, L_i, k_J, E_m, v, kap)
% get length and reproductive buffer under changing temperatures
   L = LHR(1);  E_H = LHR(3); E_R = LHR(2); % unpack variables
 
   T = spline1(t,tT);
   TC = tempcorr(T, T_ref, T_A); 

   rT_B = r_B * TC; kT_J = k_J * TC; vT = TC * v;
   rT = 3 * rT_B * (L_i/ L - 1); % 1/d, spec growth rate
   pT_C = f * E_m * L^3 * (vT/ L - rT); % J/d, reserve mobilisation rate
   dL = L * rT/ 3; % cm/d, change in structural length L
   
  if E_H < E_Hp
      dE_H = (1 - kap) * pT_C - E_H * kT_J;  % J/d, change in maturity
      dE_R = 0;
  else
      dE_H = 0;
      dE_R = (1 - kap) * p_C - E_Hp * kT_J; % J/d, change in reproduction buffer
  end
   dLHR = [dL; dE_H ;dE_R]; % pack output
end   

function dJ_X_Am = dget_J_X_Am(kap_X, mu_X, mu_E,pT_Am,s_M)
% get assimilation rates for different kappa X
    y_E_X = kap_X * mu_X/ mu_E; % mol/mol, yield of reserve on food
    y_X_E = 1/ y_E_X;           % mol/mol, yield of food on reserve
    JT_E_Am = pT_Am/ mu_E * s_M;% mol/d.cm^2, {J_EAm}, max surface-spec assimilation flux</span>
    dJ_X_Am = y_X_E * JT_E_Am; % mol/d.cm^2, {J_XAm}, max surface-spec feeding flux
end
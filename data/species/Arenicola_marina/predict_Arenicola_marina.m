
function [prdData, info] = predict_Arenicola_marina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % customized filters 
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [~, ~, ~, l_j, ~, l_b,~, ~, ~, info] = get_tj(pars_tj, f);
  if info ~= 1 % numerical procedure failed
    fprintf('warning: invalid parameter value combination for get_tj \n')
  end
  
  s_M = l_j / l_b;
  if k * v_Hp >= f ^3 * s_M^3 % constraint required for reaching puberty
    info = 0;
    prdData = {};
    return
  end
  
  if E_Htr >= E_Hb || E_Htr < 0
      info = 0; prdData = []; return
  end
  
  
  % compute temperature correction factors
  TC_5   = tempcorr(C2K(5), T_ref, T_A);
  TC_10  = tempcorr(C2K(10), T_ref, T_A);
  TC_11  = tempcorr(C2K(11), T_ref, T_A);
  TC_13  = tempcorr(C2K(13), T_ref, T_A);
  TC_12  = tempcorr(C2K(12), T_ref, T_A);
  TC_15  = tempcorr(C2K(15), T_ref, T_A);
  TC_195 = tempcorr(C2K(19.5), T_ref, T_A);
  TC_20  = tempcorr(temp.tTL_20, T_ref, T_A);
  TC_205 = tempcorr(C2K(20.5), T_ref, T_A);

%------------------
% zero-variate data
%------------------

  % life cycle
   pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
   [t_j , t_p, t_b, l_j , l_p, l_b, l_i, ~ , ~ , ~] = get_tj(pars_tj, f);
 
  % initial scales reserve
   pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
   U_E0 = initial_scaled_reserve(f_field, pars_UE0); % d.cm^2, initial scaled reserve
   Wd_0 =U_E0 * p_Am * w_E/ mu_E; EWw_0 = Wd_0/ d_E;
   
  % egg diameter
   V0 = Wd_0/ d_E;             % cm^3, egg volume 
   ELw_0 = (6 * V0/ pi)^(1/3);  % cm, egg diameter
  
  % Trchophore larva   
   [~, aUL] = ode45(@dget_aul, [0; U_Htr; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
   a_tr = aUL(2,1); 
   EaT_tr_10 = a_tr/ TC_10; 
   ELw_tr = aUL(2,3)/ del_Me; % physical length at trochophore larva stage

  % birth
   L_b = L_m * l_b;                  % cm, structural length at birth at f
   ELw_b = L_b/ del_Me;                % cm, physical length at birth at f
   EaT_b_10 = t_b/ k_M/ TC_10;           % d, age at birth at f and T

  % puberty 
   TL_p = L_m * l_p;                  % cm, structural length at puberty at f
   ETLw_p = TL_p/ del_MTL;                % cm, physical length at puberty at f
   EaT_p_13 = t_p/ k_M/ TC_13;           % d, age at puberty at f and T
  
  % metamorphosis
   L_j = L_m * l_j;      % cm, structural length at metam
   ELw_j = L_j/ del_MTL;    % cm, physical length at metam at f
   EaT_j = t_j / k_M/ TC_12;   % d, time since birth at metam

  % ultimate
   L_i = L_m * l_i;                  % cm, ultimate structural length at f
   ETLw_i = L_i/ del_MTL;                % cm, ultimate physical length at f

  % life span
   pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
   t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
   EaT_m = t_m/ k_M/ TC_11;               % d, mean life span at T
  
  % pack to output
  prdData.atr_10 = EaT_tr_10; 
  prdData.ab_10  = EaT_b_10;
  prdData.aj     = EaT_j;
  prdData.ap_13  = EaT_p_13;
  prdData.am     = EaT_m;
  prdData.L0     = ELw_0;
  prdData.Ltr    = ELw_tr;
  prdData.Lj     = ELw_j;
  prdData.Lb     = ELw_b;
  prdData.TLp    = ETLw_p;
  prdData.TLi    = ETLw_i;
  prdData.Ww0    = EWw_0;
  
%-----------------
% Univariate date
%-----------------

%Shapes
% trunk length
  EWw_vs_TLw  = (TLw_vs_Ww(:,1) * del_MTL).^3 * (1 + f_field * w); % g, wet weight

% trunk length de wilde
  EWd_vs_TLw_dewilde  = (TLw_vs_Wd_dewilde(:,1) * del_MTL_dewilde).^3 * (1 + f_field * w) * d_V; % g, dry weight

%% Growth from DeWiBerg1979

% fed
[~, ~, ~, ~, ~, ~, l_idewilde, ~, rho_bdewilde, info] = get_tj(pars_tj, f_field);

% dewilde.tTL_10
rT_Bdewilde_10 = TC_10 * rho_bdewilde * k_M; % 1/d, von Bert growth rate at T and f_field
Lw_i2 = l_idewilde * L_m/ del_MTL_dewilde;  % cm, physical lenth
t10 = tTL_10(:,1);  % d, time since start of experiment
L0_10 = t0.tTL_10;  % cm, physical length at start of experiment
ETLw_dewilde10 = Lw_i2 - (Lw_i2 - L0_10) .* exp( - rT_Bdewilde_10 .* t10); % cm, expected phycial length at time since start of experiment

% dewilde.tTL_5
rT_Bdewilde_5 = TC_5 * rho_bdewilde * k_M; % 1/d, von Bert growth rate at T and f_field
t5 = tTL_5(:,1); % d, time since start of experiment
L0_5 = t0.tTL_5; % cm, physical length at start of experiment
ETLw_dewilde5 = Lw_i2 - (Lw_i2 - L0_5) .* exp( - rT_Bdewilde_5 .* t5); % cm, expected phycial length at time since start of experiment

%dewilde.tTL_15
rT_Bdewilde_15 = TC_15 * rho_bdewilde * k_M;% 1/d, von Bert growth rate
t15 = tTL_15(:,1); % d, time since start of experiment
L0_15 = t0.tTL_15; % cm, physical length at start of experiment
ETLw_dewilde15 = Lw_i2 - (Lw_i2 - L0_15) .* exp( - rT_Bdewilde_15 .* t15);

%dewilde.tTL_20
rT_Bdewilde_20 = TC_20 * rho_bdewilde * k_M;% 1/d, von Bert growth rate
t20 = tTL_20(:,1);  % d, time since start of experiment
L0_20 = t0.tTL_20; % cm, physical length at start of experiment
ETLw_dewilde20 = Lw_i2 - (Lw_i2 - L0_20) .* exp( - rT_Bdewilde_20 .* t20);

% % %unfed 
[~, ~, ~, ~, ~, ~, l_idewilde2, ~, rho_bdewilde2, ~] = get_tj(pars_tj,f_dewilde2);

%dewilde.tTL2_10
rT_Bdewilde_10 = TC_10 * rho_bdewilde2 * k_M;% 1/d, von Bert growth rate
Lw_i2 = l_idewilde2 * L_m/ del_MTL_dewilde;
t10 = tTL2_10(:,1); % d, time since start of experiment
L0_10 = t0.tTL2_10; % cm, physical length at start of experiment
ETLw2_dewilde10 = Lw_i2 - (Lw_i2 - L0_10) .* exp( - rT_Bdewilde_10 .* t10);

% dewilde.tTL2_5
rT_Bdewilde_5 = TC_5 * rho_bdewilde2 * k_M;% 1/d, von Bert growth rate
t5 = tTL2_5(:,1);
L0_5 = t0.tTL2_5;
ETLw2_dewilde5 = Lw_i2 - (Lw_i2 - L0_5) .* exp( - rT_Bdewilde_5 .* t5);

%dewilde.tTL2_15
rT_Bdewilde_15 = TC_15 * rho_bdewilde2 * k_M;% 1/d, von Bert growth rate
t15 = tTL2_15(:,1);
L0_15 = t0.tTL2_15;
ETLw2_dewilde15 = Lw_i2 - (Lw_i2 - L0_15) .* exp( - rT_Bdewilde_15 .* t15);

%dewilde.tTL2_20
rT_Bdewilde_20 = TC_20 * rho_bdewilde2 * k_M;% 1/d, von Bert growth rate
t20 = tTL2_20(:,1);
L0_20 = t0.tTL2_20;
ETLw2_dewilde20 = Lw_i2 - (Lw_i2 - L0_20) .* exp( - rT_Bdewilde_20 .* t20);

%% growth OlivCrai2006
% The level of reserve is not known nor the time after fertilization
% f is supposed constant before and after the start of the experiment
% L0 is fixed and taken from the data
% For these growth experiments, the end of metamorphosis is reached (Von
% Bertalanffy growth)

%fed
Ww0_1 = t0.tWw1 ;
L0 = (Ww0_1/(1 + f_pat1 * w)).^(1/3);
[~, ~, ~, ~, ~, ~, l_i, ~, rho_b, ~] = get_tj(pars_tj,f_pat1);
rT_B = TC_195 * rho_b * k_M;% 1/d, von Bert growth rate
L_i = l_i * L_m;
t1 = tWw1(:,1);
L = L_i - (L_i - L0) .*  exp( - rT_B .* t1 );
EWw_patent_1 = L.^3 .* (1 + f_pat1 * w); % g, wet weight

%  %unfed
Ww0_2 = t0.tWw2 ;
L0 = (Ww0_2/(1 + f_pat2 * w)).^(1/3);
[~, ~, ~, ~, ~, ~, l_i, ~, rho_b, info] = get_tj(pars_tj,f_pat2);
rT_B = TC_195 * rho_b * k_M;% 1/d, von Bert growth rate
L_i = l_i * L_m;
t2 = tWw2(:,1);
L = L_i - (L_i - L0) .*  exp( - rT_B .* t2 );
EWw_patent_2 = L.^3 .* (1 + f_pat2 * w); % g, wet weight 

%% Oxygen consumption De Cubber 2019
% Lugworms collected at Wimereux (France) in May, June and July (Rise of
% the water temperatures)
% f is supposed constant between samplings

 %12°C

 pars_tj = [g k l_T v_Hb v_Hj v_Hp];
 pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
 p_ref = p_Am * L_m^2; % max assimilation power at max size
 O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
 [~, ~, ~, l_j, l_p, l_b, ~, ~, ~, info] = get_tj(pars_tj, f_field);
 
 L_OT = (data.Ww_JO_12(:,1) ./(1 + f_field * w)).^(1/3); % structural length from physical length
 pACSJGRD = p_ref .* scaled_power_j(L_OT, f_field, pars_pow, l_b, l_j, l_p);
 pADG = pACSJGRD(:, [1 7 5]); 
 JO = pADG * eta_O';        % organic fluxes
 JM = JO * O2M;             % mineral fluxes
 EJOWdT_12 = -JM(:,3) .* TC_12 * 1e6 / 24; % conversion to µmol 02 ? 
   
 %15°C

 L_OT = (data.Ww_JO_15(:,1) ./(1 + f_field * w)).^(1/3); % structural length from physical length
 pACSJGRD = p_ref .* scaled_power_j(L_OT, f_field, pars_pow, l_b, l_j, l_p);
 pADG = pACSJGRD(:, [1 7 5]); 
 JO = pADG * eta_O';        % organic fluxes
 JM = JO * O2M;             % mineral fluxes
 EJOWdT_15 = -JM(:,3) .* TC_15*1e6/ 24; 
 
 %20.5°C

 L_OT = (data.Ww_JO_205(:,1) ./(1 + f_field * w)).^(1/3); % structural length from physical length
 pACSJGRD = p_ref .* scaled_power_j(L_OT, f_field, pars_pow, l_b, l_j, l_p);
 pADG = pACSJGRD(:, [1 7 5]); 
 JO = pADG * eta_O';        % organic fluxes
 JM = JO * O2M;             % mineral fluxes
 EJOWdT_205 = -JM(:,3) .* TC_205*1e6/ 24; 
  
%% Reproduction

pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
ELR  = reprod_rate_j(TL_R(:,1) * del_MTL, f_field, pars_R) .* TC_13; 
   
  %% pack to output
%  % the names of the fields in the structure must be the same as the data names in the mydata file
 
prdData.tTL_5 = ETLw_dewilde5;
prdData.tTL_10 = ETLw_dewilde10;
prdData.tTL_15 = ETLw_dewilde15;
prdData.tTL_20 = ETLw_dewilde20;

prdData.tTL2_5 = ETLw2_dewilde5;
prdData.tTL2_10 = ETLw2_dewilde10;
prdData.tTL2_15= ETLw2_dewilde15;
prdData.tTL2_20 = ETLw2_dewilde20;

prdData.tWw1= EWw_patent_1;
prdData.tWw2= EWw_patent_2;

prdData.TL_R = ELR;

prdData.Ww_JO_12= EJOWdT_12;
prdData.Ww_JO_15= EJOWdT_15;
prdData.Ww_JO_205= EJOWdT_205;

prdData.TLw_vs_Ww = EWw_vs_TLw;
prdData.TLw_vs_Wd_dewilde=EWd_vs_TLw_dewilde ;
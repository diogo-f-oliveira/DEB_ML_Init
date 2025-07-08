function [prdData, info] = predict_Solea_senegalensis(par, data, auxData)
  %modified the 10 of February by A. Sardi
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

 pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); 
  if info ~= 1 % numerical procedure failed
      fprintf('warning: invalid parameter value combination for get_tj \n')
  end
  s_M = l_j / l_b;
  
  filterChecks = k * v_Hp >= f^3 * s_M^3 || ...         % constraint required for reaching puberty with f_tL1
                 ~reach_birth(g, k, v_Hb, f) || ...  % constraint required for reaching birth with f_tL1
          E_Hh > E_Hb || E_Hh <= 0 || f > 1 || f_tL > 1 || f_RibeEngr > 1 || ... % maturity at hatching has to be between 0 and Ehb
     f_tL < 0.1 || f_RibeEngr < 0.1 || f_exp < 0.5 ||f_exp > 1.5 || f_Man < 0.3 ||...
     ~reach_birth(g, k, v_Hb, f_tL) || ... % constraint required for reaching birth with that f
     ~reach_birth(g, k, v_Hb, f_RibeEngr) ; %filter for constraining shape coeficients under 1       
  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
 
% 0-var data 'ah';'ab';'tj';'aj';'tp';'am';'Lh';'Lb';'Lp';'Li';'Wwh';'Wwb';'Wdh';'Wdb';'Ri'
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A); 
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  
  % univariate data temp corrections
  TC_Tah = tempcorr(C2K(data.Tah(:,1)), T_ref, T_A);
  %TC_Tab = tempcorr(C2K(data.Tab(:,1)), T_ref, T_A);
  TC_Taj = tempcorr(C2K(data.Taj(:,1)), T_ref, T_A);
  TC_Taj_Man = tempcorr(C2K(temp.Taj(:,2)), T_ref, T_A); % temp correction vector for Manchado metamorphosis data!
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL2 = tempcorr(temp.tL2, T_ref, T_A);
  TC_tL_f = tempcorr(temp.tL_f, T_ref, T_A);
  TC_tL_m = tempcorr(temp.tL_m, T_ref, T_A);
  TC_tWd_Man16 = tempcorr(temp.tWd_Man16(:,2), T_ref, T_A); % temp correction vector for Manchado dry weight data!
  TC_tWd_Man20 = tempcorr(temp.tWd_Man20, T_ref, T_A);
  TC_tWd = tempcorr(temp.tWd(1), T_ref, T_A);
  TC_tWd2 = tempcorr(temp.tWd2(1), T_ref, T_A);
  TC_tWd_f1 = tempcorr(temp.tWd_f1(1), T_ref, T_A);
  TC_tWd_f2 = tempcorr(temp.tWd_f2(1), T_ref, T_A);
  TC_tWd_f3 = tempcorr(temp.tWd_f3(1), T_ref, T_A);
  TC_tWd_f4 = tempcorr(temp.tWd_f4(1), T_ref, T_A);
  
   %MARE2019
   % temperatures during the experiments:
   TC_LA = tempcorr(temp.tLA, T_ref, T_A);
   TC_WA = tempcorr(temp.tWwA, T_ref, T_A);
   TC_LB = tempcorr(temp.tLB, T_ref, T_A);
   TC_WB = tempcorr(temp.tWwB, T_ref, T_A);


%    keyboard
%   
  %% % zero-variate data

  % life cycle - field data
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  if info ~= 1 % numerical procedure failed
     fprintf('warning: invalid parameter value combination for get_tj \n')
  end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  % this gives an E_0 of U_E0 * p_Am  = 1.2646 J

  %EGG   
  E_0 = U_E0 * p_Am ;          % J, energy in egg
  Wd_0 = E_0 * w_E/ mu_E;      % g, egg dry weight 
  V0 = Wd_0/ d_E;             % cm^3, egg volume 
  Lw_0 = (6 * V0/ pi)^(1/3);  % cm, egg diameter
  
 % HATCH  
 [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC_ah;                   % d, age at hatch at f and T
  L_h = aUL(2,3);                           % cm, strucural length at hatch
  Lw_h = L_h/del_Me; 
  E_h = aUL(2,2) * p_Am *TC_ah;             % J, energy in reserves at hatch
  Wd_h = (d_V * L_h^3 + w_E/ mu_E * E_h) *1e6; % ug, dry weight at hatch; 

  % BIRTH
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Me;                % cm, physical length at birth at f
  aT_b = tau_b/ k_M/ TC_ab;           % d, age at birth at f and T
  
  Wd_b = d_V *L_b^3 * (1 + f * ome) *1e6; % ug, dry weight at birth at f 
  

  % metamorphosis -- in the lab! Calculated below
  
   % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  aT_p = tau_p / k_M/ TC_ap;        %d, age at puberty at f and T
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);        % g, wet weight at puberty 
 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  [R_i, UE0, Lb, Lj, Lp, info]  =  reprod_rate_j(L_i, f, pars_R);
  
  RT_i = TC_Ri * reprod_rate_j(Lw_i * del_M, f, pars_R); %--> prediction is 0

% life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  
% males  
  p_Amm = z_m * p_M/ kap;
  E_mm     = p_Amm/v;             % J/cm^3, [E_m], reserve capacity 
  m_Emm    = y_E_V * E_mm / E_G;   % mol/mol, reserve capacity
  omem     = m_Emm * w_E * d_V/ d_E/ w_V; % -, \omega, contribution of ash free dry mass of reserve to total ash free dry biomass
  gm       = E_G/ kap/ E_mm ;      % -, energy investment ratio
  L_mm     = v/ k_M/ gm;           % cm, maximum length
pars_tjm = [gm; k; l_T; v_Hb; v_Hj; v_Hp]; % assume maturity threshold for puberty is the same
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
%   tT_p_m = (tau_pm - tau_bm)/ k_M/ TC_ap; % d, time since birth at puberty
  Lw_p_m = (L_mm * l_pm)/ del_M;                % cm, total length at puberty at f
   Ww_p_m = (L_mm * l_pm)^3 *(1 + f * omem);        % g, wet weight at puberty 
  
   
 % metamorphosis -- in the lab! Calculated below
  [tau_j_YP, tau_p, tau_b, l_j_YP, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_YufeParr);

   L_j_YP = L_m * l_j_YP;                  % cm, structural length at metam
  Lw_j = L_j_YP/ del_M;                % cm, physical length at END of metam at f 
  aT_j = tau_j_YP/TC_aj/k_M;           % d, age at metamorphosis 
  
  %Ww_j = L_j^3 * (1 + f_YufeParr * ome) * 1e6;     % ug, wet weight at metam 
  Wd_j = L_j_YP^3 * d_V * (1 + f_YufeParr * ome) * 1e6; % ug, dry weight at metam 
  
  
% pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.aj = aT_j;  % age at END of metam. 
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.L0 = Lw_0;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp_f = Lw_p; %lenght at puberty for females 
  prdData.Lp_m = Lw_p_m; %lenght at puberty for males
  prdData.Li = Lw_i;
  prdData.Wd0 = Wd_0;
  prdData.Wwp_f = Ww_p;%wet weight at puberty for females
  prdData.Wwp_m = Ww_p_m; %wet weight at puberty for males
  prdData.Wwi = Ww_i;
  prdData.Wdh = Wd_h;
  prdData.Wdb = Wd_b;
  prdData.Wdj = Wd_j; % dry weight at END of metam. 
  prdData.Ri = RT_i;
  prdData.E0 = E_0;
%   

%% ------------- uni-variate data----------------
% ----------------------------------------------------
% PARAMETERS for egg -- check/decide if eggs come from field or lab data! (f will differ)
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  [U_E0, L_b, info] = initial_scaled_reserve(f, pars_UE0); % this is f for the field because eggs come from the field individuals (?)
  [U_H , aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
%   
  % Tah 
  a_h = aUL(2,1);                             % d, age at hatch
  Eah = a_h*ones(length(Tah(:,1)),1) ./ TC_Tah; % d, age at hatch temp corrected   
  
% Taj  -- in the lab, YufeParr1999 data
  a_j = tau_j_YP/k_M;                             % d, age at metam
  
    %%% new!! for Manchado 16C data!
  Eaj(1) = a_j/ TC_Taj(1) - tau_b/ k_M/ TC_Taj(1);% if the whole rearing was at 16C; this will get overwritten
    [U_E0, L_b, info] = initial_scaled_reserve(f_Man, pars_UE0); % f from Manchado aquaculture
  [U_H , aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  E_h = aUL(2,2) * p_Am ; L_h = aUL(2,3); % assume field eggs! 
  EL_h = [E_h/L_h^3 , L_h]; % initial conditions (at hatching), using reserve density!!
  tT = temp.Taj; % special time-temp vector for Manchado data
      tTC = [tT(:,1), TC_Taj_Man]; %make vector of temp corrections
      
options = odeset('AbsTol',1e-8, 'RelTol',1e-6, 'Events',@event_bj); % increase integration sensitivity; capture events - birth and metamorphosis
pars_lj =  [g, k, l_T, v_Hb, v_Hj ];
[lj, ~,  lb, info ] = get_lj(pars_lj, f_Man);  % get Lb and Lj for the specified f
[t, EL, te, ye, ie] = ode45(@get_EL_j, [tT(:,1); 30], EL_h, options, f_Man, v, g, E_m, L_m, p_Am, kap, k_J, lb*L_m, lj*L_m, tTC); % ELH: {J/cm^3, cm}, with {[E], L, H}
 %   EL = ELH(:,2); Lj = ye(2,2); % struct length  and struct length at metam; 
% %   ELw = [EL(EL<Lj) * del_Me; EL(EL>=Lj) *del_M]; 
  tT_j = te(2) - te(1); % te(2)+ a_h/TC_Man(1) - aTb;  % d, age at metam at f and T
  Eaj(1) = tT_j;
  Eaj(2:4,1) = a_j*ones(length(Taj(2:end,1)),1) ./ TC_Taj(2:end) - tau_b/ k_M./ TC_Taj(2:end); % d, age at birth temp corrected   
  
  %%
% % time-length tL
%   
 [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);

  %t-L RibeSara1999
  %time-length since hatching concatenated to juveniles (from day 12)
  kT_M = k_M * TC_tL;
  rT_B = rho_B * kT_M;  % 1/d, von Bert growth rate   
  rT_j = rho_j * kT_M;  % 1/d, exponential growth rate
  tT_j = (tau_j - tau_b)/ kT_M; % time since *birth* at metamorphosis
  L_j = l_j * L_m; 
  L_i = l_i * L_m;
  
  EL_bj = L_b * exp(tL((tL(:,1)<= tT_j),1) * rT_j/3); % exponential growth as V1-morph
%   EL_hj = L_h * exp (tL((tL(:,1)<= aT_j),1) * rT_j/3);
  EL_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) >= tT_j),1) - tT_j)); % cm, expected length at time
  ELw = [EL_bj/del_Me; EL_ji/del_M]; % catenate lengths
  
  % tL2 RibeEngr2017 - post metamorphosis
  pars_lj =  [g, k, l_T, v_Hb, v_Hj ];
 [lj, ~,  lb, info ] = get_lj(pars_lj, f_RibeEngr);  % get Lb and Lj for the specified f
  EL_b = [f_RibeEngr*E_m , lb*L_m]; % initial conditions (at birth), using reserve density via maternal effect
   options = odeset('AbsTol',1e-8, 'RelTol',1e-6, 'Events',@event_bj); % increase integration sensitivity; capture events - birth and metamorphosis
 [t, EL, te, ye, ie] = ode45(@get_EL_j, [0 ; tL2(:,1)], EL_b, options, f_RibeEngr, v, g, E_m, L_m, p_Am, kap, k_J, lb*L_m, lj*L_m, TC_tL2); % ELH: {J/cm^3, cm}, with {[E], L, H}
  EL(1,:) = [];
  ELw2 = EL(:,2) / del_M;
  
% ---------------------------------
  
  
   %tL_f (t-L3) TeixCabr2010 females
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_TeixCabr);
  kT_M2 = TC_tL_f * k_M;
  rT_B =  rho_B * kT_M2;  % 1/d, von Bert growth rate   
  rT_j =  rho_j * kT_M2;  % 1/d, exponential growth rate
  tT_j = (tau_j - tau_b)/ kT_M2; % time since birth at metamorphosis
  Lw_b = L_m * l_b /del_Me;                  % cm, structural length at metamorphosis at f
  Lw_j = L_m * l_j /del_M;                  % cm, structural length at metamorphosis at f
  Lw_i = L_m * l_i / del_M;                  % cm, ultimate structural length at f
  ELw_bj_f = Lw_b * exp(tL_f((tL_f(:,1)<= tT_j),1)  * rT_j/3); % exponential growth as V1-morph
  ELw_ji_f = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL_f((tL_f(:,1) > tT_j),1)- tT_j)); % cm, expected length at time
  ELw_f = [ELw_bj_f; ELw_ji_f]; 
  
   %tL_m (t-L4) TeixCabr2010 males
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tjm, f_TeixCabr);
  kT_M2 = TC_tL_m * k_M;
  rT_B =  rho_B * kT_M2;  % 1/d, von Bert growth rate   
  rT_j =  rho_j * kT_M2;  % 1/d, exponential growth rate
  tT_j = (tau_j - tau_b)/ kT_M2; % time since birth at metamorphosis
  Lw_j = l_j * L_mm/del_M; 
  Lw_i = l_i * L_mm/del_M;
  ELw_bj_m = Lw_b * exp(tL_m((tL_m(:,1)<= tT_j),1)  * rT_j/3); % exponential growth as V1-morph
  ELw_ji_m = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL_m((tL_m(:,1) > tT_j),1)- tT_j)); % cm, expected length at time
  ELw_m = [ELw_bj_m; ELw_ji_m]; %
  
 % %t-L MARE2019 A
   [t_j, ~, t_b, l_j, ~, l_b, l_i, ~, rho_B] = get_tj(pars_tj, f_exp);  
   L_i = l_i * L_m;
  % finding initial length 
%   EL_b = [f_exp * E_m , l_b*L_m]; % initial conditions (at hatching), using reserve density via maternal effect
%   tTC = TC_bLA; %temp from birth to start of exp
%   options = odeset('AbsTol',1e-8, 'RelTol',1e-6, 'Events',@event_bj); % increase integration sensitivity; capture events - birth and metamorphosis
%   [t, EL, te, ye, ie] = ode45(@get_EL_j, linspace(0,tLA(1,1),100) , EL_b, options, f_exp, v, g, E_m, L_m, p_Am, kap, k_J, lb*L_m, lj*L_m, tTC); % ELH: {J/cm^3, cm}, with {[E], L, H}
%   L_start = EL(end,2); Ww_start = L_start.^3 * d_V .* (1 + EL(end,1) * w_E/ mu_E) *1e6; 
%   EL_start = EL(end,:);
  
% MARE2019 A  
L_start = Linit.tLA * del_M; 
    ir_B = 3/ k_M + 3 * f_exp * L_m/ v; rT_B =TC_LA/ ir_B;    % d, 1/von Bert growth rate
    L_exp = L_i - (L_i - L_start) * exp( - rT_B * (tLA(:,1) - tLA(1,1))); % cm, struc length larval stages
   ELwA = L_exp/ del_M;  % cm, total length
     
%t-L MARE2019 B
L_start = Linit.tLB * del_M; 
 rT_B =TC_LB/ ir_B;    % d, 1/von Bert growth rate  
 L_exp = L_i - (L_i - L_start) * exp( - rT_B * (tLB(:,1) - tLB(1,1))); % cm, expected length at time
  ELwB = L_exp/ del_M;  % cm, total length
  
  
  %% % time-wet weight t-Ww
  %t-Ww MARE2019 A
  L_start = (Wwinit.tWwA / (1+f_exp *ome))^(1/3); 
  rT_B =TC_WA/ ir_B;    % d, 1/von Bert growth rate  
  L_exp = L_i - (L_i - L_start) * exp( - rT_B * (tWwA(:,1) - tWwA(1,1))); % cm, expected length at time
  EWwA = L_exp.^3 * (1 + f_exp * ome); % g, wet weight
  
  %t-Ww MARE2019 B
   L_start = (Wwinit.tWwB / (1+f_exp *ome))^(1/3); 
  rT_B =TC_WB/ ir_B;    % d, 1/von Bert growth rate  
  L_exp = L_i - (L_i - L_start) * exp( - rT_B * (tWwB(:,1) - tWwB(1,1))); % cm, expected length at time
  EWwB = L_exp.^3 * (1 + f_exp * ome); % g, wet weight   
 
 
%% % time-dry weight
  % tWd Manchado
   U_E0 = initial_scaled_reserve(f_Man, pars_UE0); % d.cm^2, initial scaled reserve
    [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
    E_h = aUL(2,2) * p_Am; L_h = aUL(2,3);     
    EL_h = [E_h/L_h^3 , L_h ]; % initial conditions (at hatching), using reserve density!!
    [lj, ~,  lb, info ] = get_lj(pars_lj, f_Man);  % get Lb and Lj for the specified f
    % solve equations for growth and mat from hatching onwards
    options = odeset('AbsTol',1e-8, 'RelTol',1e-6, 'Events',@event_bj); % increase integration sensitivity; capture events - birth and metamorphosis
    % for varying temp
    tTC = [temp.tWd_Man16(:,1), TC_tWd_Man16];
    [t, EL, te, ye, ie] = ode45(@get_EL_j, [0; tWd_Man16(:,1)], EL_h, options, f_Man, v, g, E_m, L_m, p_Am, kap, k_J, lb*L_m, lj*L_m, tTC); % ELH: {J/cm^3, cm}, with {[E], L, H}
    EL(1,:) =[];
    EWd_Man16 = EL(:,2).^3 * d_V .* (1 + EL(:,1) * w_E/ mu_E) *1e6; % ug, dry weight (CHECK!)
    % for constant 20C
    tTC = TC_tWd_Man20;
    [t, EL, te, ye, ie] = ode45(@get_EL_j, [0 ; tWd_Man20(:,1)], EL_h, options, f_Man, v, g, E_m, L_m, p_Am, kap, k_J, lb*L_m, lj*L_m, tTC); % ELH: {J/cm^3, cm}, with {[E], L, H}
    EL(1,:) =[];
     EWd_Man20 = EL(:,2).^3 * d_V .* (1 + EL(:,1) * w_E/ mu_E) *1e6; % ug, dry weight (CHECK!)
 
% tWd (YufeParr1999)-->laboratory conditions YufeParr
U_E0 = initial_scaled_reserve(f_YufeParr, pars_UE0); % d.cm^2, initial scaled reserve
    [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
    E_h = aUL(2,2) * p_Am ; L_h = aUL(2,3);     
    EL_h = [E_h/L_h^3 , L_h ]; % initial conditions (at hatching), using reserve density!!
   pars_lj =  [g, k, l_T, v_Hb, v_Hj ];
 [lj, ~,  lb, info ] = get_lj(pars_lj, f_YufeParr);  % get Lb and Lj for the specified f
   options = odeset('AbsTol',1e-8, 'RelTol',1e-6, 'Events',@event_bj); % increase integration sensitivity; capture events - birth and metamorphosis
 [t, EL, te, ye, ie] = ode45(@get_EL_j,  tWd(:,1), EL_h, options, f_YufeParr, v, g, E_m, L_m, p_Am, kap, k_J, lb*L_m, lj*L_m, TC_tWd); % ELH: {J/cm^3, cm}, with {[E], L, H}
   EWd = EL(:,2).^3 * d_V * (1 + f_YufeParr * ome) * 1e6 ;
  
 % tWd2 (ParrYufe2001) --> laboratory conditions ,
 U_E0 = initial_scaled_reserve(f_ParrYufe, pars_UE0); % d.cm^2, initial scaled reserve
    [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
    E_h = aUL(2,2) * p_Am ; L_h = aUL(2,3);     
    EL_h = [E_h/L_h^3 , L_h ]; % initial conditions (at hatching), using reserve density!!
   pars_lj =  [g, k, l_T, v_Hb, v_Hj ];
 [lj, ~,  lb, info ] = get_lj(pars_lj, f_ParrYufe);  % get Lb and Lj for the specified f
 
 [t, EL, te, ye, ie] = ode45(@get_EL_j, [0; tWd2(:,1)], EL_h, options, f_ParrYufe, v, g, E_m, L_m, p_Am, kap, k_J, lb*L_m, lj*L_m, TC_tWd2); % ELH: {J/cm^3, cm}, with {[E], L, H}
  EL(1,:) = [];
   EWd2 = EL(:,2).^3 * d_V * (1 + f_ParrYufe * ome) * 1e6 ;
 

% %tWd_Feeding regimes (CanaFern1999); eggs from the wild -- important for initial conditions!
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
    [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
    E_h = aUL(2,2) * p_Am ; L_h = aUL(2,3);     
    EL_h = [E_h/L_h^3 , L_h ]; % initial conditions (at hatching), using reserve density!!
   pars_lj =  [g, k, l_T, v_Hb, v_Hj ];

 %1 L100
  [lj, ~,  lb, info ] = get_lj(pars_lj, f_CanaFern1);  % get Lb and Lj for the specified f
  [t, EL, te, ye, ie] = ode45(@get_EL_j, [0; tWd_f1(:,1)], EL_h, options, f_CanaFern1, v, g, E_m, L_m, p_Am, kap, k_J, lb*L_m, lj*L_m, TC_tWd_f1); % ELH: {J/cm^3, cm}, with {[E], L, H}
  EL(1,:) = [];
   EWd_1 = EL(:,2).^3 * d_V * (1 + f_CanaFern1 * ome) * 1e6 ;% ug, dry weight
% %2 L50
  [lj, ~,  lb, info ] = get_lj(pars_lj, f_CanaFern2);  % get Lb and Lj for the specified f
  [t, EL, te, ye, ie] = ode45(@get_EL_j, [0; tWd_f2(:,1)], EL_h, options, f_CanaFern2, v, g, E_m, L_m, p_Am, kap, k_J, lb*L_m, lj*L_m, TC_tWd_f2); % ELH: {J/cm^3, cm}, with {[E], L, H}
  EL(1,:) = [];
   EWd_2 = EL(:,2).^3 * d_V * (1 + f_CanaFern2 * ome) * 1e6 ;% ug, dry weight
% %3 L100I50
  [lj, ~,  lb, info ] = get_lj(pars_lj, f_CanaFern3);  % get Lb and Lj for the specified f
  [t, EL, te, ye, ie] = ode45(@get_EL_j, [0; tWd_f3(:,1)], EL_h, options, f_CanaFern3, v, g, E_m, L_m, p_Am, kap, k_J, lb*L_m, lj*L_m, TC_tWd_f3); % ELH: {J/cm^3, cm}, with {[E], L, H}
  EL(1,:) = [];
   EWd_3 = EL(:,2).^3 * d_V * (1 + f_CanaFern3 * ome) * 1e6 ;% ug, dry weight
%4 L50I50
  [lj, ~,  lb, info ] = get_lj(pars_lj, f_CanaFern4);  % get Lb and Lj for the specified f
  [t, EL, te, ye, ie] = ode45(@get_EL_j, [0; tWd_f4(:,1)], EL_h, options, f_CanaFern4, v, g, E_m, L_m, p_Am, kap, k_J, lb*L_m, lj*L_m, TC_tWd_f4); % ELH: {J/cm^3, cm}, with {[E], L, H}
  EL(1,:) = [];
   EWd_4 = EL(:,2).^3 * d_V * (1 + f_CanaFern4 * ome) * 1e6 ;% ug, dry weight

%% % length-weight
 %lenght wet weight fish at 190, 398 and 790 days of age (manchado data)
ELWw = (LWw(:,1) * del_M).^3 * (1 + f_Man * ome); 

ELWw_f = (LWw_f(:,1) * del_M).^3 * (1 + f_Man * ome); %for females
ELWw_m = (LWw_m(:,1) * del_M).^3 * (1 + f_Man * omem); %for males
 
 
%Length dry weight --> laboratory conditions assume ab libitum use f=1
%LWd (OrtiFune2019)
L1 = LWd(LWd(:,1)<L_j/ del_M,1) * del_Me; % for data before metamorphosis
L2 = LWd(LWd(:,1)>=L_j/ del_M,1) * del_M; % for data after metamorphosis
ELWd1 = [L1; L2].^3 * d_V*(1 + f_YufeParr * ome)*1e6; % ug, wet weight 

% here we assume that omega is the same before and after metamorphosis 

%LWd2 (YufeParr1999)
L3 = LWd2(LWd2(:,1)<L_j/ del_M,1) * del_Me; %before metamorphosis
L4 = LWd2(LWd2(:,1)>L_j/ del_M,1) * del_M; %after metamorphosis
ELWd2 = [L3; L4].^3 * d_V * (1 + f_YufeParr * ome)*1e6; % ug, dry weight 


%LWd3 (RibeEngr2017) --> they are all metamorphosed 
ELWd3 = (LWd3(:,1) * del_M).^3 * d_V* (1 + f_RibeEngr * ome)*1e6; % ug, dry weight

%%

  % pack to output
  prdData.Tah = Eah;
  prdData.Taj = Eaj;
  prdData.tL = ELw;
  prdData.tL2 =ELw2;
  prdData.tL_f =ELw_f;
  prdData.tL_m =ELw_m; 
  prdData.tLA = ELwA;
  prdData.tLB = ELwB;
  prdData.tWwA = EWwA;
  prdData.tWwB = EWwB;
  prdData.LWw = ELWw;
  prdData.LWw_f = ELWw_f;
  prdData.LWw_m = ELWw_m;
  prdData.tWd_Man16 = EWd_Man16;
  prdData.tWd_Man20 = EWd_Man20;
  prdData.tWd = EWd;
  prdData.tWd2 = EWd2;
  prdData.tWd_f1 = EWd_1;
  prdData.tWd_f2 = EWd_2;
  prdData.tWd_f3 = EWd_3;
  prdData.tWd_f4 = EWd_4;
  prdData.LWd = ELWd1;
  prdData.LWd2 = ELWd2;
  prdData.LWd3 = ELWd3;

end  

%% subfunctions for solving ODE, important for larva data
function dEL  = get_EL_j(t, EL, f, v, g, E_m, L_m, p_Am, kap, k_J, L_b, L_j, tTC)
  % if food constant (we can work with L_b and L_j from get_tj )

  E = EL(1); % J/cm^3, reserve density [E]
  L = EL(2); % cm, structural length
  
  
  
  if length(tTC)>1 
    TC  = spline1(t, tTC);     % find the correct temperature correction at t
  else
    TC = tTC;
  end
    
  % V1 morph : apply correction to  v, {pAm} (and {F_m} and {p_T}); sM = lj/lb (acceleration factor)
  
  if L < L_b
     sM = 1;
     f = 0; 
  elseif L < L_j   
      sM = L/L_b;
  else 
      sM = L_j/L_b;
  end
  
  vT = sM * v * TC; pT_Am = sM * p_Am * TC; 
  
  dE = (f *  pT_Am - E * vT)/ L;            % J/d.cm^3, change in reserve density d/dt [E]
  e  = E/ E_m;                            % -, scaled reserve density
  rT  = vT * (e/ L - 1/ (L_m*sM))/ (e + g);      % 1/d, specific growth rate
  dL = L * rT/ 3;                         % cm/d, change in structural length d/dt L

  dEL = [dE; dL]; % catenate for output
end

function [value,isterminal,direction] = event_bj(t, EL, f, v, g, ~, L_m, p_Am, kap, k_J, L_b, L_j, tT)
  % ELH: 3-vector with state variables [E], L, E_H
  % function to find events at hatching and metamorphosis
  
  value = [L_b; L_j] - EL(2);
  isterminal = [0; 0]; % NO stop at life events
  direction = [0; 0];  
end
%


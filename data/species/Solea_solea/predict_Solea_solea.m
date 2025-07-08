%% predict_Solea_solea
% Obtains predictions, using parameters and data

%%
function [prdData, info] = predict_Solea_solea(par, data, auxData)
  
% compute male parameter for puberty from the one for female
  par.E_Hpm = par.E_Hp * (par.z_m/par.z)^3;
  
% unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % customized filters for allowable parameters of the standard DEB model (std)
  % for other models consult the appropriate filter function.
   filterChecks = E_Hh >= E_Hb || f_Deniel > 2 || f_Lund > 2 || f_Day > 2 || f_Fonds > 2  ||...
                  k * v_Hp >= f_Deniel^3 || ...         % constraint required for reaching puberty with f_Deniel
                  k * v_Hpm >= f_Deniel^3 || ...         % constraint required for reaching puberty with f_Deniel
              ~reach_birth(g, k, v_Hb, f_Deniel)|| ...   % constraint required for reaching birth with f_Deniel
                  k * v_Hp >= f_Fonds^3 || ...         % constraint required for reaching puberty with f 
                  k * v_Hpm >= f_Fonds^3 || ...         % constraint required for reaching puberty with f
              ~reach_birth(g, k, v_Hb, f_Fonds)|| ...   % constraint required for reaching birth with f
              ~reach_birth(g, k, v_Hb, f_Fonds1979)|| ...   % constraint required for reaching birth with f
                  k * v_Hp >= f_Witt^3 || ...         % constraint required for reaching puberty with f 
                  k * v_Hpm >= f_Witt^3 || ...         % constraint required for reaching puberty with f
              ~reach_birth(g, k, v_Hb, f_Day)|| ...   % constraint required for reaching birth with f
                  k * v_Hp >= f_Teal^3 || ...         % constraint required for reaching puberty with f_Deniel
                  k * v_Hpm >= f_Teal^3 || ...         % constraint required for reaching puberty with f_Deniel
              ~reach_birth(g, k, v_Hb, f_Lund) || ...;   % constraint required for reaching birth with f_Deniel
              T_H < T_ref;
%                  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  
  %% compute temperature correction factors 
  
  % T_A 6800 estimated on the ingestion data --> does not fit well the
  % larvae data, therefore, commented for the moment. I only kept the
  % "optimum" temperature for the ingestion data = 18degC
  % High T_A observed for small individuals (12000?) - low T_A (3500?) for
  % large individuals
  
  Tpars=[T_A, T_L, T_H, T_AL, T_AH];
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_ap10 = tempcorr(temp.ap10, T_ref, T_A);
  TC_ap_m = tempcorr(temp.ap_m, T_ref,T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_am_m = tempcorr(temp.am_m, T_ref, T_A);
  TC_R45 = tempcorr(temp.R45, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_Tah = tempcorr( C2K(Tah(:,1)), T_ref, Tpars);
  TC_Tab = tempcorr( C2K(Tab(:,1)), T_ref, Tpars);
  TC_Ttbj = tempcorr( C2K(Ttbj(:,1)), T_ref, Tpars);
  TC_tLlarvae = tempcorr(temp.tLlarvae, T_ref, Tpars);
  TC_tL_Fond10 = tempcorr(temp.tL_Fond10, T_ref, Tpars);
  TC_tL_Fond13 = tempcorr(temp.tL_Fond13, T_ref, Tpars);
  TC_tL_Fond16 = tempcorr(temp.tL_Fond16, T_ref, Tpars);
  TC_tL_Fond19 = tempcorr(temp.tL_Fond19, T_ref, Tpars);
  TC_tL_Fond22 = tempcorr(temp.tL_Fond22, T_ref, Tpars);
  TC_tWdlarvae = tempcorr(temp.tWdlarvae, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL_m = tempcorr(temp.tL_m, T_ref, T_A);
  TC_tL_Teal = tempcorr(temp.tL_Teal, T_ref, T_A);
  TC_LJX_T10 = tempcorr(temp.LJX_T10, T_ref, Tpars);
  TC_LJX_T14 = tempcorr(temp.LJX_T14, T_ref, Tpars);
  TC_LJX_T18 = tempcorr(temp.LJX_T18, T_ref, Tpars);
  TC_LJX_T22 = tempcorr(temp.LJX_T22, T_ref, Tpars);
  TC_LJX_T26 = tempcorr(temp.LJX_T26, T_ref, Tpars);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  TC_LN_Witt = tempcorr(temp.LN_Witt, T_ref, T_A);
  


%% zero-variate data
  
%------------------------------------------------------------------------
% EGG STAGE

  % PARAMETERS for egg (Devauchelle1987 in situ genitors -> use of Deniel's f for in situ population for in situ genitors)
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  [U_E0, L_b, info] = initial_scaled_reserve(f_Deniel, pars_UE0);
  
  EE_0 = p_Am * U_E0;         % J, initial reserve
  EWd_0 = w_E * EE_0/ mu_E;   % g, initial dry weight
  
  % hatching
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1);
  EaT_h = a_h/ TC_ah;                       % d, age at hatch at f and T
  L_h = aUL(2,3);                           % cm, structural length at f
  ELw_h = L_h/ del_M_larvae;                       % cm, total length at hatch at f
  EWd_h = L_h^3 * (1 + f_Day * w)*d_V * 10^6;   % micro g, dry weight at hatching at f ?
  
  
%------------------------------------------------------------------------
% LARVAE + JUVENILE STAGE UNTIL METAMORPHOSIS

  % PARAMETERS for length and age at birth and metamorphosis
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];     % compose parameter vector for get_tj function
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_Fonds1979); % ab, Lb, aj, Lj from Fonds1979
  
  % birth
  EaT_b = tau_b/ k_M/ TC_ab;                  % d, age at birth at f and T
  L_b = L_m * l_b;                          % cm, structural length at birth at f
  ELw_b = L_b/ del_M_larvae;                       % cm, physical length at birth at f
  EWd_b = L_b^3 * (1 + f_Day * ome) * d_V *10^6;  % micro g, dry weight at birth at f
 
  % metamorphosis (juvenile shape)
  aT_j = tau_j/ k_M/ TC_tj;                   % d, age at metamorphosis at f and T
  EtT_j = aT_j - EaT_b;                     % d, time between birth and metamorphosis at f and T
  L_j = L_m * l_j;                          % cm, structural length at metamorphosis at f
  ELw_j = L_j/ del_M;                       % cm, physical length at metamorphosis at f
  EWd_j = L_j^3 * (1 + f_Galois * ome)* d_V *10^3;    % mg, dry weight at metamorphosis at f
   
  
%------------------------------------------------------------------------
% JUVENILE + ADULT STAGES

%_________
% FEMALE

  % PARAMETERS for puberty and ultimate (female)
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_Deniel);   % -, scaled time & length at f

  % puberty
  L_p = L_m * l_p;             % cm, structural length at puberty at f
  EaT_p = tau_p/ k_M/ TC_ap;     % d, age at puberty at f and T
  EaT_p10 = tau_p/ k_M/ TC_ap10;     % d, age at puberty at f and T
  ELw_p = L_p/ del_M;          % cm, physical length at puberty at f
  
  % wet weight calculation from Fonds water content formula
  Wd_p = L_p^3 * (1 + f_Deniel * ome)* d_V;   % g, dry weight at puberty
  Kd_p = 100*Wd_p/ELw_p^3;     % -, Fulton's dry index condition at puberty
  dry_content_p = 40.68 * Kd_p^0.364 / 100; % -, dry content at puberty (from Fonds et al. 1989)
  EWw_p = Wd_p / dry_content_p;  % g, wet weight at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  ELw_i = L_i/ del_M;               % cm, ultimate physical length at f
  Wd_i = L_i^3 * (1 + f_Deniel * ome)* d_V;   % g, ultimate dry weight
  Kd_i = 100*Wd_i/ELw_i^3;     % -, ultimate Fulton's dry index condition
  dry_content_i = 40.68 * Kd_i^0.364 / 100; % -, ultimate dry content (from Fonds et al. 1989)
  EWw_i = Wd_i / dry_content_i;   % g, ultimate wet weight at f

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f_Deniel, l_b);      % -, scaled mean life span at T_ref
  EaT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % ultimate reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  ERT_45 = TC_R45 * reprod_rate_j(45 * del_M, f_Witt, pars_R);  % #/d, reproduction rate for 45 cm, f_LN for North Sea (WittGree1995 data)
  ERT_i = TC_Ri * reprod_rate_j(L_i, f_Deniel, pars_R);  % #/d, ultimate daily reproduction at T
    
%_________
% MALE

  % PARAMETERS for puberty and ultimate (male)
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm, info] = get_tj(pars_tjm, f_Deniel);
  
  % puberty
  L_pm= L_mm * l_pm; % cm, structural length at puberty for male at f_Deniel
  EaT_p_m = tau_pm/ k_M/ TC_ap_m;     % d, age at puberty at f_Deniel and T
  ELw_p_m = L_pm/ del_M;          % cm, physical length at puberty at f_Deniel
  
  % wet weight calculation from Fonds water content formula
  Wd_p_m = L_pm^3 * (1 + f_Deniel * w * z_m/z)* d_V;   % g, dry weight at puberty at f_Deniel
  Kd_p_m = 100*Wd_p_m/ELw_p_m^3;     % -, Fulton's dry index condition at puberty
  dry_content_p_m = 40.68 * Kd_p_m^0.364 / 100; % -, dry content at puberty (from Fonds et al. 1989)
  EWw_p_m = Wd_p_m / dry_content_p_m;  % g, wet weight at puberty at f

  % ultimate
  L_im = L_mm * l_im;                  % cm, ultimate structural length at f
  ELw_i_m = L_im/ del_M;               % cm, ultimate physical length at f
  Wd_i_m = L_im^3 * (1 + f_Deniel * w * z_m/z)* d_V;   % g, ultimate dry weight
  Kd_i_m = 100*Wd_i_m/ELw_i_m^3;     % -, ultimate Fulton's dry index condition
  dry_content_i_m = 40.68 * Kd_i_m^0.364 / 100; % -, ultimate dry content (from Fonds et al. 1989)
  EWw_i_m = Wd_i_m / dry_content_i_m;   % g, ultimate wet weight at f

  % life span
  pars_tmm = [g_m; l_T; h_am / k_M^2; s_G];  % compose parameter vector at T_ref
  t_mm = get_tm_s(pars_tmm, f_Deniel, l_bm);        % -, scaled mean life span at T_ref
  EaT_m_m = t_mm/ k_M/ TC_am_m;               % d, mean life span at T

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 f_pseudo = f_Fonds;
 pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];     % compose parameter vector for get_tj function
 [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_pseudo);   % -, scaled time & length at f
  pAm_i = p_Am * l_j/l_b;
 
  prdData.pAmi = pAm_i;
  
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  %% pack to output
  
  prdData.ah = EaT_h;
  prdData.ab = EaT_b;
  prdData.tj = EtT_j;
  prdData.ap = EaT_p;
  prdData.ap10 = EaT_p10;
  prdData.ap_m = EaT_p_m;
  prdData.am = EaT_m;
  prdData.am_m = EaT_m_m;
  
  prdData.Lh = ELw_h;
  prdData.Lb = ELw_b;
  prdData.Lj = ELw_j;
  prdData.Lp = ELw_p;
  prdData.Lp_m = ELw_p_m;
  prdData.Li = ELw_i;
  prdData.Li_m = ELw_i_m;
  
  prdData.Wd0 = EWd_0;
  prdData.Wdh = EWd_h;
  prdData.Wdb = EWd_b;
  prdData.Wdj = EWd_j;
  prdData.Wwp = EWw_p;
  prdData.Wwp_m = EWw_p_m;
  prdData.Wwi = EWw_i;
  prdData.Wwi_m = EWw_i_m;
  
  prdData.R45 = ERT_45;
  prdData.Ri = ERT_i;
  prdData.E0 = EE_0;
  
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %% uni-variate data
  
%------------------------------------------------------------------------
% EGG STAGE

  % PARAMETERS for egg
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  [U_E0, L_b, info] = initial_scaled_reserve(f_Deniel, pars_UE0);
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  
  % Tah 
  a_h = aUL(2,1);                             % d, age at birth
  Eah = a_h*ones(length(Tah(:,1)),1) ./ TC_Tah; % d, age at birth temp corrected   
  

%------------------------------------------------------------------------
% LARVAE + JUVENILE STAGE UNTIL METAMORPHOSIS


  % PARAMETERS for length and age at birth and metamorphosis
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];     % compose parameter vector for get_tj function
  
  % Tab (Fonds1979)
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_Fonds1979);
  a_b = tau_b/ k_M;                                 % d, age at birth
  Eab = a_b*ones(length(Tab(:,1)),1) ./ TC_Tab; % d, age at birth temp corrected   
  
  % Ttbj (Fonds1979)
  a_j = tau_j/ k_M;  % d, age at puberty
  Etbj = (a_j - a_b)*ones(length(Ttbj(:,1)),1) ./ TC_Ttbj; % d, time since birth at metamorphosis temp corrected
  
  % tLlarvae : fecundation to hatching at 11.2degC, hatching to birth at 16.1degC then 19.1degC (Lund2008)
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_Lund);
  E_0 = J_E_Am * U_E0 * mu_E;        % J, initial reserve at f=f_Deniel
  ELH_0 = [E_0, 1e-6, 0];            % J/cm/J, initial reserve/structure/maturity levels at f=f_Deniel
  L_b = L_m * l_b;                   % cm, structural length at birth at f_larvae
  L_j = L_m * l_j;                   % cm, structural length at metamorphosis at f_larvae
  aT_h = a_h / TC_tLlarvae(1);       % d, age at hatching temp corrected for incubation temperature (different from rearing temp)
  [a ELH] = ode45(@dget_ELH_pj, [0; tLlarvae(:,1)+aT_h], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f_Lund, E_Hh, E_Hb, E_Hj, TC_tLlarvae); 
  ELH(1,:) = []; 
  
  shape_vector =  del_M_larvae + (ELH(:,3) - E_Hh)./ (E_Hj -E_Hh) .* ( del_M - del_M_larvae );
  ELlarvae = ELH(:,2) ./ shape_vector * 10;    % mm, physical length (convertion from cm into mm)
  
  % tWdlarvae: 12degC before hatching, 15degC after (Day)
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_Day);
  aT_h = a_h / TC_tWdlarvae(1);        % d, age at hatching temp corrected for incubation temperature (different from rearing temp)
  [a ELH] = ode45(@dget_ELH_wd, [0; tWdlarvae(:,1)+aT_h], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f_Day, E_Hh, E_Hb, E_Hj, TC_tWdlarvae); 
  ELH(1,:) = []; 
  EWdlarvae = ELH(:,2).^3 * (1 + f_Day * w) * d_V  * 10^6;
  
 % tL Fonds1979 larvae at different constant temps
  [tau_j, tp, tau_b, l_j, lp, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_Fonds1979); 
  Lw_b = L_m * l_b /del_M_larvae;                  % cm, structural length at metamorphosis at f
  Lw_j = L_m * l_j /del_M;                  % cm, structural length at metamorphosis at f
  Lw_i = L_m * l_i / del_M;                  % cm, ultimate structural length at f

  rT_j = rho_j * k_M * TC_tL_Fond10;
  rT_B = rho_B * k_M * TC_tL_Fond10; tT_j = (tau_j-tau_b)/ k_M/ TC_tL_Fond10; % 1/d, von Bert growth rate
  ELw_bj = Lw_b * exp(tL_Fond10((tL_Fond10(:,1)<= tT_j),1)  * rT_j/3); % exponential growth as V1-morph
  ELw_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL_Fond10((tL_Fond10(:,1)> tT_j),1) - tT_j)); % cm, total length at time
  ELw_Fond10 = [ELw_bj; ELw_ji];
  
    rT_j = rho_j * k_M * TC_tL_Fond13;
  rT_B = rho_B * k_M * TC_tL_Fond13; tT_j = (tau_j-tau_b)/ k_M/ TC_tL_Fond13; % 1/d, von Bert growth rate
  ELw_bj = Lw_b * exp(tL_Fond13((tL_Fond13(:,1)<= tT_j),1)  * rT_j/3); % exponential growth as V1-morph
  ELw_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL_Fond13((tL_Fond13(:,1)> tT_j),1) - tT_j)); % cm, total length at time
  ELw_Fond13 = [ELw_bj; ELw_ji];
  
    rT_j = rho_j * k_M * TC_tL_Fond16;
  rT_B = rho_B * k_M * TC_tL_Fond16; tT_j = (tau_j-tau_b)/ k_M/ TC_tL_Fond16; % 1/d, von Bert growth rate
  ELw_bj = Lw_b * exp(tL_Fond16((tL_Fond16(:,1)<= tT_j),1)  * rT_j/3); % exponential growth as V1-morph
  ELw_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL_Fond16((tL_Fond16(:,1)> tT_j),1) - tT_j)); % cm, total length at time
  ELw_Fond16 = [ELw_bj; ELw_ji];
  
    rT_j = rho_j * k_M * TC_tL_Fond19;
  rT_B = rho_B * k_M * TC_tL_Fond19; tT_j = (tau_j-tau_b)/ k_M/ TC_tL_Fond19; % 1/d, von Bert growth rate
  ELw_bj = Lw_b * exp(tL_Fond19((tL_Fond19(:,1)<= tT_j),1)  * rT_j/3); % exponential growth as V1-morph
  ELw_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL_Fond19((tL_Fond19(:,1)> tT_j),1) - tT_j)); % cm, total length at time
  ELw_Fond19 = [ELw_bj; ELw_ji];
  
    rT_j = rho_j * k_M * TC_tL_Fond22;
  rT_B = rho_B * k_M * TC_tL_Fond22; tT_j = (tau_j-tau_b)/ k_M/ TC_tL_Fond22; % 1/d, von Bert growth rate
  ELw_bj = Lw_b * exp(tL_Fond22((tL_Fond22(:,1)<= tT_j),1)  * rT_j/3); % exponential growth as V1-morph
  ELw_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL_Fond22((tL_Fond22(:,1)> tT_j),1) - tT_j)); % cm, total length at time
  ELw_Fond22 = [ELw_bj; ELw_ji];
  
  
%------------------------------------------------------------------------
% JUVENILE AND ADULT STAGES
%_________
% FEMALE 

  % PARAMETERS for Deniel's in situ data with f_Deniel
  [tau_j, tp, tau_b, l_j, lp, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_Deniel); 
    
  % tL
  rT_B = rho_B * k_M * TC_tL;          % 1/d, von Bertalanffy growth rate
  rT_j = rho_j * k_M * TC_tL;          % 1/d, exponential growth rate
  aT_b = tau_b/ k_M / TC_tL;          % d, age at birth temp corrected
  aT_j = tau_j/ k_M / TC_tL;          % d, age at metamorphosis temp corrected
  tT_j = aT_j - aT_b;               % time since birth at metamorphosis
  L_j = L_m * l_j;                  % cm, structural length at metamorphosis at f
  Lw_j = L_j/ del_M;                % cm, physical length at metamorphosis at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  
  ELw = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL(:,1)*365 - tT_j)); % cm, expected physical length at time t in days
  
 % time-length for late juveniles and adults at f_Teal 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_Teal);
  Lw_i = l_i * L_m/ del_M; Lw_j = l_j * L_m/ del_M; % cm, total lengths
  rT_B = rho_B * k_M * TC_tL_Teal; tT_j = (tau_j-tau_b)/ k_M/ TC_tL_Teal; % 1/d, von Bert growth rate
  ELw_Teal = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL_Teal(:,1) - tT_j)); % cm, total length at time

  
    % LWw - wet weight calculation from Fonds water content formula
  Wd = (LWw(:,1)*del_M).^3 * (1 + f_Deniel * w)* d_V;   % g, expected dry weight at time
  Kd = 100*Wd./LWw(:,1).^3;      % -, Fulton's dry index condition
  dry_content = 40.68 * Kd .^0.364 ./ 100; % -, dry content (from Fonds et al. 1989)
  EWw = Wd ./ dry_content;   % g, wet weight at f
  
  % LN (annual egg production)
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  EN = 365 * reprod_rate_j(LN(:,1) * del_M, f_Deniel, pars_R)*TC_LN ; % yearly reproductive output at length
  EN_Witt = 365 * reprod_rate_j(LN_Witt(:,1) * del_M, f_Witt, pars_R)*TC_LN_Witt ; % yearly reproductive output at length

%_________
% MALE

  % PARAMETERS for Deniel's in situ data with f_Deniel
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rjm, rho_Bm, info] = get_tj(pars_tjm, f_Deniel);
  
  % tL
  rT_Bm = rho_Bm * k_M * TC_tL_m;          % 1/d, von Bertalanffy growth rate
  rT_jm = rjm * k_M * TC_tL_m;          % 1/d, exponential growth rate
  aT_bm = tau_bm/ k_M / TC_tL_m;          % d, age at birth temp corrected
  aT_jm = tau_jm/ k_M / TC_tL_m;          % d, age at metamorphosis temp corrected
  tT_jm = aT_jm - aT_bm;               % time since birth at metamorphosis
  L_jm = L_mm * l_jm;                  % cm, structural length at metamorphosis at f
  Lw_jm = L_jm/ del_M;                % cm, physical length at metamorphosis at f
  L_im = L_mm * l_im;                  % cm, ultimate structural length at f
  Lw_im = L_im/ del_M;                % cm, ultimate physical length at f
  
  ELw_m = Lw_im - (Lw_im - Lw_jm) * exp( - rT_Bm * (tL_m(:,1)*365 - tT_jm)); % cm, expected physical length at time t in days
  
  % LWw - wet weight calculation from Fonds water content formula
  Wd_m = (LWw_m(:,1)*del_M).^3 * (1 + f_Deniel * w)* d_V;   % g, expected dry weight at time
  Kd_m = 100*Wd_m./LWw_m(:,1).^3;      % -, Fulton's dry index condition
  dry_content_m = 40.68 * Kd_m .^0.364 ./ 100; % -, dry content (from Fonds et al. 1989)
  EWw_m = Wd_m ./ dry_content_m;   % g, wet weight at f


%------------------------------------------------------------------------
% INGESTION DATA

   % pAmpostj
%   [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_Fonds);   % -, scaled time & length at f
%   pAm_i = p_Am * l_j/l_b;
  p_Xm = pAm_i/ kap_X;                           % J/d.cm^2, max spec feeding power

  % LJX_T10: Length - ingestion rate at 10degC
  p_XmT = p_Xm .*TC_LJX_T10;                    % J/d.cm^2, max spec feeding power temp corrected
  pX = (p_XmT .* f_Fonds .* (LJX_T10(:,1) .* del_M).^2) ;  % J/d.ind, flux of ingestion (pX)
  EJX_T10 = pX / (18750*0.2);                     % gWw of mussels/d.ind  (mussels : 18750 J/gd and 80% of water)

  % LJX_T14: Length - ingestion rate at 14degC
  p_XmT = p_Xm .*TC_LJX_T14;                    % J/d.cm^2, max spec feeding power temp corrected
  pX = (p_XmT .* f_Fonds .* (LJX_T14(:,1) .* del_M).^2) ;  % J/d.ind, flux of ingestion (pX)
  EJX_T14 = pX / (18750*0.2);                     % gWw of mussels/d.ind  (mussels : 18750 J/gd and 80% of water)

  % LJX_T18: Length - ingestion rate at 18degC
  p_XmT = p_Xm .*TC_LJX_T18;                    % J/d.cm^2, max spec feeding power temp corrected
  pX = (p_XmT .* f_Fonds .* (LJX_T18(:,1) .* del_M).^2) ;  % J/d.ind, flux of ingestion (pX)
  EJX_T18 = pX / (18750*0.2);     
  
  % LJX_T22: Length - ingestion rate at 22degC
  p_XmT = p_Xm .*TC_LJX_T22;                    % J/d.cm^2, max spec feeding power temp corrected
  pX = (p_XmT .* f_Fonds .* (LJX_T22(:,1) .* del_M).^2) ;  % J/d.ind, flux of ingestion (pX)
  EJX_T22 = pX / (18750*0.2);                     % gWw of mussels/d.ind  (mussels : 18750 J/gd and 80% of water)
  
  % LJX_T26: Length - ingestion rate at 26degC
  p_XmT = p_Xm .*TC_LJX_T26;                    % J/d.cm^2, max spec feeding power temp corrected
  pX = (p_XmT .* f_Fonds .* (LJX_T26(:,1) .* del_M).^2) ;  % J/d.ind, flux of ingestion (pX)
  EJX_T26 = pX / (18750*0.2);                     % gWw of mussels/d.ind  (mussels : 18750 J/gd and 80% of water)
  
  
  
  %------------------------------------------------------------------------
  %% pack to output

  prdData.Tab = Eab;
  prdData.Tah = Eah;
  prdData.Ttbj = Etbj;
  prdData.tLlarvae = ELlarvae;
  prdData.tWdlarvae = EWdlarvae;
  prdData.tL_Fond10 = ELw_Fond10;
  prdData.tL_Fond13 = ELw_Fond13;
  prdData.tL_Fond16 = ELw_Fond16;
  prdData.tL_Fond19 = ELw_Fond19;
  prdData.tL_Fond22 = ELw_Fond22;
  prdData.tL = ELw;
  prdData.tL_Teal = ELw_Teal;
  prdData.tL_m = ELw_m;
  prdData.LWw = EWw;
  prdData.LWw_m = EWw_m;
  prdData.LN = EN;
  prdData.LN_Witt = EN_Witt;
  prdData.LJX_T10 = EJX_T10;
  prdData.LJX_T14 = EJX_T14;
  prdData.LJX_T18 = EJX_T18;
  prdData.LJX_T22 = EJX_T22;
  prdData.LJX_T26 = EJX_T26;
  
  %------------------------------------------------------------------------
  %% sub subfuctions

%_________
% Derivatives for tLlarvae

function dELH = dget_ELH_pj(t, ELH, Lb, Lj, Lm, p_Am, v, g, kJ, kap, f_Lund, Hh, Hb, Hj, TC_tLlarvae)
  %  change in state variables
  %  dELH = dget_ELH_p_pj(t, ELH)
  %  ELH: 3-vector
  %   E: reserve E
  %   L: structural length
  %   H: maturity E_H
  %  dELH: change in reserve, length,  maturity
  
    %  unpack variables
  E = ELH(1); L = ELH(2); H = ELH(3);

  % Temperature correction
  if H < Hh
      TC = TC_tLlarvae(1);
  elseif Hh <= H < Hb
      TC = TC_tLlarvae(2);
  else 
      TC = TC_tLlarvae(3);
  end
  
  %  unpack variables
  E = ELH(1); L = ELH(2); H = ELH(3);
  
  vT = v * TC; kT_J = kJ * TC; pT_Am = p_Am * TC;
 
  if H < Hb 
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
  e = vT * E/ L^3/ pT_Am; % -, scaled reserve density; 
  rT = s * vT * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  pT_C = E * (s * vT/ L - rT); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dH = (1 - kap) * pT_C - kT_J * H;
  dE = (L > Lb) * s * pT_Am * f_Lund * L^2 - pT_C;
  dL = rT * L/3;

  % pack derivatives
  dELH = [dE; dL; dH];
  
%_________
  % Derivatives for tWdlarvae

function dELH = dget_ELH_wd(t, ELH, Lb, Lj, Lm, p_Am, v, g, kJ, kap, f_Day, Hh, Hb, Hj, TC_tWdlarvae)
  %  change in state variables
  %  dELH = dget_ELH_p_pj(t, ELH)
  %  ELH: 3-vector
  %   E: reserve E
  %   L: structural length
  %   H: maturity E_H
  %  dELH: change in reserve, length,  maturity
  
    %  unpack variables
  E = ELH(1); L = ELH(2); H = ELH(3);

  % Temperature correction
  if H < Hh
      TC = TC_tWdlarvae(1);
  else 
      TC = TC_tWdlarvae(2);
  end
  
  %  unpack variables
  E = ELH(1); L = ELH(2); H = ELH(3);
  
  vT = v * TC; kT_J = kJ * TC; pT_Am = p_Am * TC;
 
  if H < Hb 
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
  e = vT * E/ L^3/ pT_Am; % -, scaled reserve density; 
  rT = s * vT * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  pT_C = E * (s * vT/ L - rT); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dH = (1 - kap) * pT_C - kT_J * H;
  dE = (L > Lb) * s * pT_Am * f_Day * L^2 - pT_C;
  dL = rT * L/3;

  % pack derivatives
  dELH = [dE; dL; dH];
  

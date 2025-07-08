
function [prdData, info] = predict_Ostrea_edulis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if f_Robe >1 || f_Laba >1 || f_Holl >1 || f_Saur >1 ||  f_Wils >1 || f_Haur >1 || E_Hr > E_Hs || E_Hr < E_Hb
    info = 0; prdData = {}; return;
  end 
    
  % compute temperature correction factors
  pars_T = [T_A T_L T_H T_AL T_AH];  
  %
  TC_am = tempcorr(temp.am,T_ref, pars_T);
  TC_Robe_15 = tempcorr(temp.tL_Robe_15,T_ref,pars_T);
  TC_Robe_20 = tempcorr(temp.tL_Robe_20,T_ref,pars_T);
  TC_Robe_25 = tempcorr(temp.tL_Robe_25,T_ref,pars_T);
  TC_Robe_30 = tempcorr(temp.tL_Robe_30,T_ref,pars_T);
  TC_Laba = tempcorr(temp.tWd_Laba,T_ref,pars_T);
  TC_spat1 = tempcorr(temp.tL_spat,T_ref,pars_T);
  TC_spat2 = tempcorr(temp.tWd_spat,T_ref,pars_T);
  TC_Saur = tempcorr(temp.tL_Saur,T_ref,pars_T);
  TC_Mann = tempcorr(temp.tWd_Mann,T_ref,pars_T);
  TC_LN = tempcorr(temp.LN, T_ref,pars_T);
  TC_10 = tempcorr(temp.WdJO_10, T_ref, pars_T);
  TC_15 = tempcorr(temp.WdJO_15, T_ref, pars_T);
  TC_20 = tempcorr(temp.WdJO_20, T_ref, pars_T);
  TC_25 = tempcorr(temp.WdJO_25, T_ref, pars_T);
  TC_30 = tempcorr(temp.WdJO_30, T_ref, pars_T);
  
  %% zero-variate data

  % life cycle
  pars_ts = [g k l_T v_Hb v_Hs v_Hj v_Hp];
  [tau_s, tau_j, tau_p, tau_b, l_s, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_ts(pars_ts, f);  
  if info ~= 1 % numerical procedure failed
    info = 0; prdData = []; return
  end
  pars_tr = [g k l_T v_Hb v_Hr]; % v_Hr replaces v_Hp in call to get_tp
  [tau_r, ~, l_r] = get_tp(pars_tr, f); % scaled age, length at release
 
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial energy in egg
  Ww_0 = E_0 * w_E/ mu_E/ d_E;        % g, initial wet weight
  
  % birth
  L_b = L_m * l_b;                   % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                 % cm, shell length at birth
  
  % release
  L_r = L_m * l_r;                   % cm, structural length at release at f
  Lw_r = L_r/ del_M;                 % cm, shell length at settlement at f
  Wd_r = L_r^3 * (1 + f * ome) * d_V; % g, dry weight at settlement
  
  % start acceleration
  L_s = L_m * l_s;                  % cm, structural length at start acceleration
  Lw_s = L_s/ del_M;               % cm, shell length at start acceleration
  
  % metamorphosis(= end acceleration)
  s_M = l_j/ l_s;                     % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * ome);     % g, wet weight at puberty 
  
  % ultimate
  L_i  = L_m * l_i;                 % cm, ultimate structural length at f
  Lw_i = L_i / del_M;               % cm, physical length at end
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hs; U_Hj; U_Hp]; % compose parameter vector at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
   
  
  % pack to output 
  prdData.am    = aT_m;
  
  prdData.Lb    = Lw_b;
  prdData.Lr    = Lw_r;
  prdData.Ls    = Lw_s;
  prdData.Li    = Lw_i;
  
  prdData.Ww0   = Ww_0;
  prdData.Wdr   = Wd_r;
  prdData.Wwp   = Ww_p;
  
  %% uni-variate data  
  
% LARVAL GROWTH 
  % tL from Robe2017
  [tau_s, tau_j, tau_p, tau_b, l_s, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_ts(pars_ts, f_Robe);
  [tau_r, ~, l_r] = get_tp(pars_tr, f_Robe); % scaled age, length at release
  %15°C  
  kT_M = k_M * TC_Robe_15; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_s = (tau_s - tau_r)/ kT_M; L_r = L_m * l_r; L_s = L_m * l_s;  L_ib = f_Robe * L_m;
  L_bs = L_ib - (L_ib - L_r) * exp( - rT_B * tL_Robe_15(tL_Robe_15(:,1) < tT_s,1));  
  L_sj = L_s * exp((tL_Robe_15(tL_Robe_15(:,1) >= tT_s) - tT_s) * rT_j/ 3);
  EtL_Robe_15 = [L_bs; L_sj]/ del_M;   % cm, shell length
  %20°C
  kT_M = k_M * TC_Robe_20; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_s = (tau_s - tau_r)/ kT_M; L_r = L_m * l_r; L_s = L_m * l_s;  L_ib = f_Robe * L_m;
  L_bs = L_ib - (L_ib - L_r) * exp( - rT_B * tL_Robe_20(tL_Robe_20(:,1) < tT_s,1));  
  L_sj = L_s * exp((tL_Robe_20(tL_Robe_20(:,1) >= tT_s,1) - tT_s) * rT_j/ 3);
  EtL_Robe_20 = [L_bs; L_sj]/ del_M;   % cm, shell length
  %25°C
  kT_M = k_M * TC_Robe_25; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_s = (tau_s - tau_r)/ kT_M; L_r = L_m * l_r; L_s = L_m * l_s;  L_ib = f_Robe * L_m;
  L_bs = L_ib - (L_ib - L_r) * exp( - rT_B * tL_Robe_25(tL_Robe_25(:,1) < tT_s,1));  % cm, struc length
  L_sj = L_s * exp((tL_Robe_25(tL_Robe_25(:,1) >= tT_s,1) - tT_s) * rT_j/ 3);
  EtL_Robe_25 = [L_bs; L_sj]/ del_M;   % cm, shell length
  %30 °C  
  kT_M = k_M * TC_Robe_30; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_s = (tau_s - tau_r)/ kT_M; L_r = L_m * l_r; L_s = L_m * l_s;  L_ib = f_Robe * L_m;
  L_bs = L_ib - (L_ib - L_r) * exp( - rT_B * tL_Robe_30((tL_Robe_30(:,1) < tT_s),1));  % cm, struc length
  L_sj = L_s * exp((tL_Robe_30(tL_Robe_30(:,1) >= tT_s,1) - tT_s) * rT_j/ 3);
  EtL_Robe_30 = [L_bs; L_sj]/ del_M;   % cm, shell length
  
  % tWd from Laba1999
  [tau_s, tau_j, tau_p, tau_b, l_s, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_ts(pars_ts, f_Laba);
  [tau_r, ~, l_r] = get_tp(pars_tr, f_Laba); % scaled age, length at release
  kT_M = k_M * TC_Laba; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_r = (tau_r - tau_b)/ kT_M; tT_s = (tau_s - tau_b)/ kT_M; tT_j = (tau_j - tau_b)/ kT_M;  
  L_r = L_m * l_r; L_s = L_m * l_s; L_j = L_m * l_j; L_i = L_m * l_i;  L_ib = f * L_m;
  tT_s = tT_s - tT_r; tT_j = tT_j - tT_r;  % correct for t=0 is at release, not birth.
  L_bs = L_ib - (L_ib - L_r) * exp( - rT_B * tWd_Laba((tWd_Laba(:,1) < tT_s),1));  % cm, struc length
  L_sj = L_s * exp((tWd_Laba(tWd_Laba(:,1) >= tT_s,1) - tT_s) * rT_j/ 3); % cm, struc length
  EtWd_Laba = [L_bs; L_sj].^3 * (1 + f_Laba * ome) * d_V; % g, tissue dry weight

% POST-LARVAL GROWTH
  %tL data from Holl1973
  [tau_s, tau_j, tau_p, tau_b, l_s, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_ts(pars_ts, f_Holl);
  kT_M = k_M * TC_spat1; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M; 
  L_s = L_m * l_s; L_j = L_m * l_j; L_i = L_m * l_i;   
  L_sj = L_s * exp((tL_spat((tL_spat(:,1) < tT_j),1)) * rT_j/ 3); % cm, struc length
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_spat((tL_spat(:,1) >= tT_j),1) - tT_j)); % cm, struc length
  EtL_spat = [L_sj; L_jm]/ del_M;   % cm, body length  
  
  %tWd data from Laba1999
  [tau_s, tau_j, tau_p, tau_b, l_s, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_ts(pars_ts, f_Laba);
  kT_M = k_M * TC_spat2; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M; 
  L_s = L_m * l_s; L_j = L_m * l_j; L_i = L_m * l_i;  
  L_sj = L_s * exp((tWd_spat((tWd_spat(:,1) < tT_j),1)) * rT_j/ 3); % cm, struc length
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWd_spat((tWd_spat(:,1) >= tT_j),1) - tT_j)); % cm, struc length 
  EWd_spat = [L_sj; L_jm].^3 * (1 + f_Laba * ome) * d_V; % g, tissue dry weight
  
  
% ADULT GROWTH
  % tL data from Saurel 2003
  [tau_s, tau_j, tau_p, tau_b, l_s, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_ts(pars_ts, f_Saur);
  kT_M = k_M * TC_Saur; rT_B = rho_B * kT_M; L_i = L_m * l_i;   
  L  = L_i - (L_i - L_0Saur * del_M) * exp( - rT_B * tL_Saur(:,1)); % cm, struc length 
  EtL_Saur = L/ del_M;   % cm, shell length   
  
  % Mann1975     
  [tau_s, tau_j, tau_p, tau_b, l_s, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_ts(pars_ts, f_Mann);
  L_i = L_m * l_i; LE_0 = [L_0Mann, E_R0]; % initial struct length and reprod buffer
  vT = v * s_M * TC_Mann; pT_J = E_Hp * k_J * TC_Mann; kT_M = k_M * TC_Mann; rT_B = rho_B * kT_M;
  L = L_i - (L_i - L_0Mann) * exp(- rT_B * tWd_Mann(:,1));
  t_R = spawn.tWd_Mann;   % d, day at spawning
  options = odeset('AbsTol',1e-7, 'RelTol',1e-7);
  t = [0; tWd_Mann(tWd_Mann(:,1) < t_R,1); t_R]; 
  [t_0R, E_R0R] = ode45(@dget_E_R, t, E_R0, options, f, L_0Mann, L_i, rT_B, vT, E_m, kap, pT_J);  E_R0R(1) = []; E_R0R(end) = [];
  t = [t_R; tWd_Mann(tWd_Mann(:,1) >= t_R,1)];
  [t_Ri, E_RRi] = ode45(@dget_E_R, t, 0, options, f, L_0Mann, L_i, rT_B, vT, E_m, kap, pT_J); E_RRi(1) = [];
  E_R = [E_R0R; E_RRi];
  EtWd_Mann = L.^3 * (1 + f_Mann * ome) * d_V + E_R/ mu_E * w_E; % g, dry weight
  
  % Wils1987      
  tT = temp.tL_Wils;
  [tau_s, tau_j, tau_p, tau_b, l_s, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_ts(pars_ts, f_Wils);
  L_i = L_m * l_i; s_M = l_j/ l_s; r_B = rho_B * k_M;    
  LHR_0 = [L_0Wils; E_H0; 0];  % state variables at 0
  options = odeset('Events', @puberty, 'AbsTol',1e-8, 'RelTol',1e-8);    
  [t, LHR] = ode45(@dget_LHR, tL_Wils(:,1), LHR_0, options, E_Hp, tT, T_ref, pars_T, f_Wils, r_B, L_i, k_J, E_m, v * s_M, kap); % find state variables at start experiment
  L = LHR(:,1); E_R = LHR(:,3);
  EtL_Wils = L/ del_M;
  EtWd_Wils = L.^3 .* (1 + f_Wils * ome) * d_V + E_R * w_E/ mu_E;   % g, tissue dry weight
        
% OTHER DATA
% L-N data
  ELN = 365 .* TC_LN.* reprod_rate_s(LN(:,1) .* del_M, f_LN, pars_R);

% Wd-JO data
  % at T = 10 C
  p_ref    = p_Am * L_m^2;                                   % J/d,   max assimilation power at max size and T_ref
  pars_p   = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hs; U_Hj; U_Hp];
  O2M      = (- n_M \ n_O)';                             % -,     matrix that converts organic to mineral fluxes. O2M is prepared for post-multiplication (eq. 4.35)
  %
  L      = (WdJO_10(:,1) / d_V / (1 + f_Haur * ome) ).^(1/3);  % cm,    structural length
  pACSJGRD = p_ref * scaled_power_s(L, f_Haur, pars_p, l_b, l_s, l_j, l_p);
  pADG     = pACSJGRD(:,[1 7 5]);  %pADG(:,1) = 0;       %        starved animals (for 3 days), no assimilation
  J_M      = pADG * eta_O' * O2M;                        % mol/d  mineral fluxes
  EJO_10   = - TC_10 * J_M(:,3) * 32e3 / 24;             % mg02/h,  oxygen consumption rate
  % at T = 15 C
  L        = (WdJO_15(:,1) / d_V / (1 + f_Haur * w) ).^(1/3);           % cm,    structural length
  pACSJGRD = p_ref * scaled_power_s(L, f_Haur, pars_p, l_b, l_s, l_j, l_p);
  pADG     = pACSJGRD(:,[1 7 5]);  %pADG(:,1) = 0;       %        starved animals (for 3 days), no assimilation
  J_M      = pADG * eta_O' * O2M;                        % mol/d  mineral fluxes
  EJO_15   = - TC_15 * J_M(:,3) * 32e3 / 24;             % mg02/h,  oxygen consumption rate
  % at T = 20 C
  L        = (WdJO_20(:,1) / d_V / (1 + f_Haur * w) ).^(1/3);           % cm,    structural length
  pACSJGRD = p_ref * scaled_power_s(L, f_Haur, pars_p, l_b, l_s, l_j, l_p);
  pADG     = pACSJGRD(:,[1 7 5]);  %pADG(:,1) = 0;       %        starved animals (for 3 days), no assimilation
  J_M      = pADG * eta_O' * O2M;                        % mol/d  mineral fluxes
  EJO_20   = - TC_20 * J_M(:,3) * 32e3 / 24;             % mg02/h,  oxygen consumption rate
  % at T = 25 C
  L        = (WdJO_25(:,1) / d_V / (1 + f_Haur * w) ).^(1/3);           % cm,    structural length
  pACSJGRD = p_ref * scaled_power_s(L, f_Haur, pars_p, l_b, l_s, l_j, l_p);
  pADG     = pACSJGRD(:,[1 7 5]);  %pADG(:,1) = 0;       %        starved animals (for 3 days), no assimilation
  J_M      = pADG * eta_O' * O2M;                        % mol/d  mineral fluxes
  EJO_25   = - TC_25 * J_M(:,3) * 32e3 / 24;            % mg02/h,  oxygen consumption rate
  % at T = 30 C
  L        = (WdJO_30(:,1) / d_V / (1 + f_Haur * w) ).^(1/3);           % cm,    structural length
  pars_p   = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hs; U_Hj; U_Hp];
  pACSJGRD = p_ref * scaled_power_s(L, f_Haur, pars_p, l_b, l_s, l_j, l_p);
  pADG     = pACSJGRD(:,[1 7 5]);  %pADG(:,1) = 0;       %        starved animals (for 3 days), no assimilation
  J_M      = pADG * eta_O' * O2M;                        % mol/d  mineral fluxes
  EJO_30   = - TC_30 * J_M(:,3) * 32e3 / 24;            % mg02/h,  oxygen consumption rate

 % Wd - clearance rate
 ECR_10   = (WdCR_10(:,1) / d_V / (1 + f_Haur * ome)).^(2/3) * F_m * f_Haur * TC_10 * s_M/ 24; % l/h, clearance rate
 ECR_15   = (WdCR_15(:,1) / d_V / (1 + f_Haur * ome)).^(2/3) * F_m * f_Haur * TC_15 * s_M/ 24; % l/h, clearance rate
 ECR_20   = (WdCR_20(:,1) / d_V / (1 + f_Haur * ome)).^(2/3) * F_m * f_Haur * TC_20 * s_M/ 24; % l/h, clearance rate
 ECR_25   = (WdCR_25(:,1) / d_V / (1 + f_Haur * ome)).^(2/3) * F_m * f_Haur * TC_25 * s_M/ 24; % l/h, clearance rate
 ECR_30   = (WdCR_30(:,1) / d_V / (1 + f_Haur * ome)).^(2/3) * F_m * f_Haur * TC_30 * s_M/ 24; % l/h, clearance rate
 
 % POM - based on Kooy2006
 EPOMCR = 1./ (1 + POMCR(:,1) * 1e-3/ w_X/ K) ;


 %% pack to output
% Larval growth
  prdData.tL_Robe_15 = EtL_Robe_15;
  prdData.tL_Robe_20 = EtL_Robe_20;
  prdData.tL_Robe_25 = EtL_Robe_25;
  prdData.tL_Robe_30 = EtL_Robe_30;
  prdData.tWd_Laba   =  EtWd_Laba;
  
%post-larval growth
  prdData.tL_spat =  EtL_spat;
  prdData.tWd_spat = EWd_spat;

%adult growth
  prdData.tL_Saur = EtL_Saur;
  prdData.tWd_Mann = EtWd_Mann;
  prdData.tL_Wils  = EtL_Wils;
  prdData.tWd_Wils = EtWd_Wils;
  
%Other data
  prdData.LN = ELN;
  prdData.WdCR_10 = ECR_10;
  prdData.WdCR_15 = ECR_15;
  prdData.WdCR_20 = ECR_20;
  prdData.WdCR_25 = ECR_25;
  prdData.WdCR_30 = ECR_30;
  prdData.POMCR   = EPOMCR;
  prdData.WdJO_10 = EJO_10;
  prdData.WdJO_15 = EJO_15;
  prdData.WdJO_20 = EJO_20;
  prdData.WdJO_25 = EJO_25;
  prdData.WdJO_30 = EJO_30;

end

function dE_R = dget_E_R(t, E_R, f, L_0, L_i, r_B, v, E_m, kap, p_J)
  L = L_i - (L_i - L_0) * exp(- r_B * t); % struc length at t
  r = 3 * r_B * (L_i/ L - 1); % 1/d, spec growth rate
  p_C = f * E_m * L^3 * (v/ L - r); % J/d, reserve mobilisation rate
  dE_R = kap * p_C - p_J; % allocation to reprod buffer
end

function dLHR = dget_LHR(t, LHR, E_Hp, tT, T_ref, pars_T, f, r_B, L_i, k_J, E_m, v, kap)
   L = LHR(1);  E_H = LHR(3); E_R = LHR(2); % unpack variables
 
   T = spline1(t,tT);
   TC = tempcorr(T, T_ref, pars_T); 

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

% event puberty
function [value,isterminal,direction] = puberty(t, LHR, E_Hp, varargin)
  value = LHR(2) - E_Hp;  % trigger 
  isterminal = 0;  % proceed at event
  direction  = [];         % get all the zeros
end


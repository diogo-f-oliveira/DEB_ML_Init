function [prdData, info] = predict_Argyrosomus_regius(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hh >= E_Hb | E_Hh < 0 | f_tL22 > 1.2 | f_tL21 > 1.2 | f_tW15 > 1.2 | f_tW15 < 0.7  | f_tW13 < 0.7  | f_WwR > 1.2 | f_JOT > 1.2 | f_tWVG > 1.2 | f_tWVG < 0.7 
    info = 0; prdData = []; return
  end
    
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_tL_f22 = tempcorr(temp.tL_f22, T_ref, T_A);
  TC_tL_f21 = tempcorr(temp.tL_f21, T_ref, T_A);
  TC_tLe = tempcorr(temp.tLe , T_ref, T_A);  
  TC_tW15 = tempcorr(temp.tWw_15_1, T_ref, T_A);
  TC_tW13 = tempcorr(temp.tWw_13_1, T_ref, T_A);
  TC_tWVT = tempcorr(temp.tWw_VGT, T_ref, T_A);
  TC_WwR = tempcorr(temp.WwR, T_ref, T_A);
  TC_WwJO_T = tempcorr(C2K(WwJO_T(:,1)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = U_E0 * p_Am; % initial energy in the egg
  Ww_0 = w_E/mu_E * E_0/d_E; %g, wet weight of egg
  Lw_0 = (U_E0 * p_Am * w_E/ mu_E/ d_E)^(1/3)/ del_Y;  % cm, egg diameter

  % hatch   
  [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
  Lw_h = aUL(2,3)/ del_Me;           % cm, total length at hatch
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Me;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  aT_j = t_j/ k_M/ TC_aj;           % d, age at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  s_M = L_j/ L_b;                   % -, acceleration
  Lw_j = l_j * L_m/ del_M;          % cm, total length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  GSI = TC_GSI * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.L0 = Lw_0;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;

  % uni-variate data
  
  % time-length 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL22);
  kT_M = k_M * TC_tL_f22; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_f22((tL_f22(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_f22((tL_f22(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  L = [L_bj; L_jm];  
  w_1 = min(1, max(0, (L - L_b)/ (L_j - L_b))); 
  ELw_f22 = L ./ (del_Me * (1 - w_1) + del_M * w_1);  % cm, total length
  %
  % time-length: Papadakis
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL21);
  kT_M = k_M * TC_tL_f21; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL_f21((tL_f21(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_f21((tL_f21(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  L = [L_bj; L_jm];  
  w_2 = min(1, max(0, (L - L_b)/ (L_j - L_b))); 
  ELw_f21 = L ./ (del_Me * (1 - w_2) + del_M * w_2);  % cm, total length
  %    
  % time-weight: HCMR cages, varying temperature
  [t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tW15); 
  ULH_j = [L_j^3/v/TC_aj; L_j; U_Hj/ TC_aj]; % state vector at j
  t =[t_j ; tWw_15_1(:,1)]; tT = [[t_j; tWw_15_1(:,1)], [temp.aj; temp.tWw_15_1]];    
  [a, ULH_T] = ode45(@dget_ulh_pj_T, t, ULH_j, [], l_j/ l_b, l_b * L_m, L_m, v, g, k_J, kap, f_tW15, T_ref, T_A, tT);  
  ULH_T(1,:) = []; L = ULH_T(:,2); % cm, structural length
  EWw_tW15_1 = (1 + f_tW15 * w) * L .^ 3; %g, wet weight
  EWw_tW15_2 = (1 + f_tW15 * w) * L .^ 3; %g, wet weight
  EWw_tW15_3 = (1 + f_tW15 * w) * L .^ 3; %g, wet weight
  EWw_tW15_4 = (1 + f_tW15 * w) * L .^ 3; %g, wet weight
  %
  [t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tW13);  
  t =[t_j ; tWw_13_1(:,1)]; tT = [[t_j; tWw_13_1(:,1)], [temp.aj; temp.tWw_13_1]];    
  [a, ULH_T] = ode45(@dget_ulh_pj_T, t, ULH_j, [], l_j/ l_b, l_b * L_m, L_m, v, g, k_J, kap, f_tW13, T_ref, T_A, tT);  
  ULH_T(1,:) = []; L = ULH_T(:,2); % cm, structural length
  EWw_tW13_1 = (1 + f_tW13 * w) * L .^ 3; %g, wet weight
  EWw_tW13_2 = (1 + f_tW13 * w) * L .^ 3; %g, wet weight

  % time-weight: Vargas ponds, varying temperature, wW-t, tL-t, L-Ww
  [t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tWVG);
  t =[t_j ; tWw_VGT(:,1)]; tT = [[t_j; tWw_VGT(:,1)], [temp.aj; temp.tWw_VGT]];    
  [a, ULH_T] = ode45(@dget_ulh_pj_T, t, ULH_j, [], l_j/ l_b, l_b * L_m, L_m, v, g, k_J, kap, f_tWVG, T_ref, T_A, tT);  
  ULH_T(1,:) = []; L = ULH_T(:,2); % cm, structural length
  EWw_tWVG = (1 + f_tWVG * w) * L .^ 3; %g, wet weight  
  
  % length-weight
  EWw_L_VGT = (LWw_VGT(:,1) * del_M).^3 * (1 + f_tWVG * w);

  % time-length between hatch and birth at T_tLE and f
  ULH_h = [aUL(2,2)/ TC_tLe; aUL(2,3); U_Hh/ TC_tLe]; % state vector at h
  vT = v * TC_tLe; kT_J = k_J * TC_tLe; UT_Hb = U_Hb/ TC_tLe; UT_Hj = U_Hj/ TC_tLe;  
  t = [0; tLe(:,1)]; % d, time since hatch   
  [a ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_m, vT, g, kT_J, kap, f, UT_Hj); 
  ULH(1,:) = []; L = ULH(:,2); % cm, structural length
  w_3 = min(1, max(0, (L - L_b)/ (L_j - L_b))); 
  ELw_YS = L ./ (del_Me * (1 - w_3) + del_M * w_3); % cm, total length     

  % weight-reproduction at f_WwR and T_WwR
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN_WwR = TC_WwR * reprod_rate_j((WwR(:,1)/(1 + f_WwR * w)) .^ (1/3), f_WwR, pars_R); % #/d, ultimate reproduction rate at T

  % T-JO data at f
  [t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_JOT);
  p_ref = p_Am * L_m^2;        % max assimilation power at max size
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];

  % respiration rate Kir 
  Ww_JOT = weight.WwJO_T; % g, wet weight passed through the auxData structure
  L_O = (Ww_JOT / (1 + f_JOT * w)) .^ (1/3); % structural length
  pACSJGRD = p_ref * scaled_power_j(L_O, f_JOT, pars_pow, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
    JO = pADG * eta_O';        % organic fluxes
    JM = JO * O2M;             % mineral fluxes
  EJO = -2*16 * JM(:,3) .* TC_WwJO_T;  % g/d, oxygen consumption rate at temp T
  
  % pack to output
  prdData.tL_f22 = ELw_f22;
  prdData.tL_f21 = ELw_f21;
  prdData.tLe = ELw_YS;
  prdData.LWw_VGT = EWw_L_VGT; 
  prdData.tWw_15_1 = EWw_tW15_1;
  prdData.tWw_15_2 = EWw_tW15_2;
  prdData.tWw_15_3 = EWw_tW15_3;
  prdData.tWw_15_4 = EWw_tW15_4;
  prdData.tWw_13_1 = EWw_tW13_1;
  prdData.tWw_13_2 = EWw_tW13_2;
  prdData.tWw_VGT = EWw_tWVG;
  prdData.WwR = EN_WwR;
  prdData.WwJO_T = EJO;
  
end

%% subfunctions

function dULH = dget_ulh_pj(t, ULH, Lb, Lm, v, g, kJ, kap, f, Hj)
  % change in state variables during juvenile stage
  % dULH = dget_ulh_p_pj(t, ULH)
  % ULH: 3-vector
  %  U: scaled reserve M_E/ {J_{EAm}}; reference is at embryo value at T
  %  L: structural length
  %  H: scaled maturity M_H/ {J_{EAm}}; reference is at embryo value at T
  % dULH: change in scaled reserve, length, scaled maturity
  
  % unpack variables
  U = ULH(1); L = ULH(2); H = ULH(3); 

  s_M = max(1, L/ Lb); % -, acceleration factor 
  e = v * U/ L^3; % -, scaled reserve density
  r = v * (s_M * e/ L - 1/ Lm)/ (e + g); % 1/d, spec growth rate
  SC = U * (s_M * v/ L - r); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dH = (H < Hj) * ((1 - kap) * SC - kJ * H);
  dU = (L > Lb) * s_M * f * L^2 - SC;
  dL = r * L/ 3;

  % pack derivatives
  dULH = [dU; dL; dH];
end

function dULH_T = dget_ulh_pj_T(t, ULH, s_M, Lb, Lm, v, g, kJ, kap, f, T_ref, T_A, tT)
  % change in state variables after metamorphosis, variable temperature
  % dULH = dget_ulh_p_pj_T(t, ULH)
  % ULH: 3-vector
  %  U: scaled reserve M_E/ {J_{EAm}}; reference is at embryo value at T
  %  L: structural length
  %  H: scaled maturity M_H/ {J_{EAm}}; reference is at embryo value at T
  % dULH: change in scaled reserve, length, scaled maturity
 
  % unpack variables
  U = ULH(1); L = ULH(2); H = ULH(3); 
    
  TC = tempcorr(spline1(t, tT), T_ref, T_A);    % -, Temperature Correction factor
  vT = v * TC; kT_J = kJ * TC; 
  
  e = vT * U/ L^3; % -, scaled reserve density
  r = vT * (s_M * e/ L - 1/ Lm)/ (e + g); % 1/d, spec growth rate
  SC = U * (s_M * vT/ L - r); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dH = (1 - kap) * SC - kT_J * H;
  dU = (L > Lb) * s_M * f * L^2 - SC;
  dL = r * L/3;

  % pack derivatives
  dULH_T = [dU; dL; dH];
end
  
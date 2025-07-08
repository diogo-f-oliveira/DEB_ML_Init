function [prdData, info] = predict_Sterechinus_neumayeri(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  if T_H < T_ref || T_L > T_ref
    info = 0; prdData = []; return;
  end
  
  %   pars_Tj = [T_A, T_L, T_H, T_AL, T_AH]; % can include different values for larvae if known
  pars_T = [T_A, T_L, T_H, T_AL, T_AH];  % compute temperature correction factors

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_ab_T = tempcorr(temp.ab_T, T_ref, pars_T);
  TC_tj = tempcorr(temp.tj, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_GSI = tempcorr(temp.GSI, T_ref, pars_T);
  TC_tLe_T1 = tempcorr(temp.tLe_T1, T_ref, pars_T);
  TC_tLe_T2 = tempcorr(temp.tLe_T2, T_ref, pars_T);
  TC_tJOe = tempcorr(temp.tJOe, T_ref, pars_T);
  TC_tLf = tempcorr(temp.tL_f0, T_ref, pars_T);
  TC_tJOf = tempcorr(temp.tJO_f1, T_ref, pars_T);  
  TC_tL = tempcorr(temp.tL, T_ref, pars_T);
  TC_TJO = tempcorr(TJO(:,1), T_ref, T_A);
  
  
  %% zero-variate data

  pars_tj = [g k l_T v_Hb v_Hj v_Hp];       % compose parameter vector
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); 
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];    % compose parameter vector 
  U_E0 = initial_scaled_reserve(f, pars_UE0);  % d.cm^2, initial scaled reserve
  Wd_0 = (12 + n_NE * 14) * U_E0 * p_Am/ mu_E; % g, CN mass of fertilised egg
  Ww_0 = w_E * U_E0 * p_Am/ mu_E/ d_E;  % g, wet weight of fertilised egg

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M_lrv;            % cm, physical length of plutei at birth at f  
  Wd_b = (12 + n_NV * 14) * M_V * L_b^3 * (1 + f * w); % g, CN mass at birth  
  a_b = t_b/ k_M; aT_b = a_b/ TC_ab;% d, age at birth at f and T_ab
  aT_b_T = a_b/ TC_ab_T;            % d, age at birth at f and T_ab_T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length of plutei after metam at f
  t_j = (t_j - t_b)/ k_M/ TC_tj;    % d, time since birth at metam at T_tj
  s_M = l_j/ l_b;                   % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f

  % GSI
  t1 = 0.83 * 365; % d, period of accumulaton of spawned reprod buffer;
  GSI = TC_GSI * (t1 * k_M * g/ f^3)/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^3);

  % ultimate
  L_i = L_m * l_i;                      % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                    % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);           % g, ultimate wet weight at f
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = t_j;
  prdData.ab_T = aT_b_T;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wd0 = Wd_0;
  prdData.Wdb = Wd_b;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  %% uni-variate data for embryos; shape correction factor del_M_emb; no acceleration 

  % time-embryo length at temp 1
  [a LUH] = ode45(@dget_LUH, [0; tLe_T1(:,1)], [0 U_E0/ TC_tLe_T1 0], [], kap, v * TC_tLe_T1, k_J * TC_tLe_T1, g, L_m);
  LUH(1,:) = [];
  ELe_T1 = LUH(:,1)/ del_M_emb * 10; % mm, length
  % time-embryo length at temp 2
  [a LUH] = ode45(@dget_LUH, [0; tLe_T2(:,1)], [0 U_E0/ TC_tLe_T2 0], [], kap, v * TC_tLe_T2, k_J * TC_tLe_T2, g, L_m);
  LUH(1,:) = []; 
  ELe_T2 = LUH(:,1)/ del_M_emb * 10; % mm, length

  % time-dioxygen consumption for non-feeding larva per ind 
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  %
  [a LUH] = ode45(@dget_LUH, [0; tJOe(:,1)], [0 U_E0/ TC_tJOe 0], [], kap, v * TC_tJOe, k_J * TC_tJOe, g, L_m);
  LUH(1,:) = []; L = LUH(:,1);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers, the f used here for a non feeding larva is only refering to the scaled energy density, which is changing as the animal is starved. so don't expect a good fit here!
  pACSJGRD(:,1) = 0 ; % non feeding larvae, there is no assimilation.
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: CO2, H2O, O2, NH3 in rows
  EJT_Oe = - J_M(3,:)' * TC_tJOe * 1e12/ 24;         % pmol O2/h
 
  %% univariate data for pre-metamorphic juveniles; shape correction factor del_M_lrv; acceleration

  % time-length data of larva 
  % no food
  ULH_0 = [U_E0/ TC_tLf; 1e-3;  0];
  UT_Hb = U_Hb / TC_tLf; UT_Hj = U_Hj / TC_tLf; vT = v * TC_tLf; kT_J = k_J * TC_tLf; aT_b = a_b/ TC_tLf;
  [a ULH] = ode45(@dget_ulh_pj, [0; tL_f0(:,1) + aT_b], ULH_0, [], L_b, L_j, L_m, vT, g, kT_J, kap, f_tLf0, UT_Hb, UT_Hj); 
  ULH(1,:) =[]; % avoid 0
  ELw_0 = 10 * ULH(:,2)/ del_M_lrv; % mm, larval length
  % ambient food
  [t_j, t_p, t_b, l_j, l_p, l_ba, l_i, rho_ja] = get_tj(pars_tj, f_tLfa);
  rT_ja = rho_ja * k_M * TC_tLf; 
  ELw_a = 10 * L_m * l_ba * exp(tL_fa(:,1) * rT_ja/ 3)/ del_M_lrv; % mm, larval length 
  % abundant food
  [t_j, t_p, t_b, l_j, l_p, l_b1, l_i, rho_j1] = get_tj(pars_tj, 1); 
  rT_j1 = rho_j1 * k_M * TC_tLf; 
  ELw_1 = 10 * L_m * l_b * exp(tL_f1(:,1) * rT_j1/ 3)/ del_M_lrv; % mm, larval length 

  % time-CN weight data of larva 
  % no food
  [a ULH] = ode45(@dget_ulh_pj, [0; tWd_f0(:,1) + aT_b], ULH_0, [], L_b, L_j, L_m, vT, g, kT_J, kap, f_tLf0, UT_Hb, UT_Hj); 
  ULH(1,:) =[]; % avoid 0
  EWd_0 = ((12 + n_NV * 14) * M_V * ULH(:,2).^3 + (12 + n_NE * 14) * ULH(:,1) * p_Am/ mu_E) * 1e9; % ng, larval CN weight
  % ambient food
  EWd_a = (12 + n_NV * 14) * M_V * (L_m * l_b * exp(tWd_fa(:,1) * rT_ja/ 3)).^3 * (1 + f_tLfa * w) * 1e9; % ng, larval CN weight
  % abundant food
  EWd_1 = (12 + n_NV * 14) * M_V * (L_m * l_b * exp(tWd_f1(:,1) * rT_j1/ 3)).^3 * (1 + w) * 1e9; % ng, larval CN weight

  % time-dioxygen consumption of for feeding larva 
  % no food
  [a ULH] = ode45(@dget_ulh_pj, [0; tJO_f0(:,1) + aT_b], ULH_0, [], L_b, L_j, L_m, vT, g, kT_J, kap, f_tLf0, UT_Hb, UT_Hj); 
  ULH(1,:) =[]; L = ULH(:,2);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: 
  EJT_O0 = - J_M(3,:)' .* TC_tJOf * 1e12/ 24;       % pmol O2/h
  % abundant food
  [a ULH] = ode45(@dget_ulh_pj, [0; tJO_f1(:,1) + aT_b], ULH_0, [], L_b, L_j, L_m, vT, g, kT_J, kap, 1, UT_Hb, UT_Hj); 
  ULH(1,:) =[]; L = ULH(:,2);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: 
  EJT_O1 = - J_M(3,:)' * TC_tJOf * 1e12/ 24;        % pmol O2/h
      
  %% univariate data for post-metam stage; shape correction factor del_M; no acceleration

  % time-length data for settled ind collected from the field
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_tL; rT_B = rho_B * kT_M; % -/d von Bertalanffy growth rate
  Lw_i = l_i * L_m / del_M;  % cm, ultimate test diameter
  Lw_j = l_j * L_m / del_M ; % cm, test diameter just after metamorphosis
  aT_j = t_j/ kT_M;          % d, age at metamorphosis (days since fertilisation)
  ELw = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL(:,1)- aT_j)); % cm, test diameter length since metamorphosis.
  
  % length - wet weight data for settled ind collected from the field
  EWw = (LWw(:,1) * del_M).^3 * (1 + f_tL * w);
  
  % dioxygen consumption data for starved urchins per g wet weight at different temperatures; f = 0 during experiments
  L = (Ww_JO/ (1 + f * w)).^(1/ 3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  pACSJGRD(:,1) = 0; % exclude contributions from assimilation
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d 
  EjT_O = - J_M(3,:)' .* TC_TJO * 24.4e6/ 24/ Ww_JO; % muL/h.g
      
  % pack to output
  % pre-birth
  prdData.tLe_T1 = ELe_T1;
  prdData.tLe_T2 = ELe_T2;
  prdData.tJOe   = EJT_Oe;
  % post-birth, pre-metam
  prdData.tL_f0  = ELw_0;
  prdData.tL_f1  = ELw_1;
  prdData.tL_fa  = ELw_a;
  prdData.tWd_f0 = EWd_0;
  prdData.tWd_fa = EWd_a;
  prdData.tWd_f1 = EWd_1;
  prdData.tJO_f0 = EJT_O0;
  prdData.tJO_f1 = EJT_O1; 
  % post-metam
  prdData.tL     = ELw;  
  prdData.LWw    = EWw; 
  prdData.TJO    = EjT_O;
  
end

%% sub subfuction

  function dULH = dget_ulh_pj(t, ULH, Lb, Lj, Lm, v, g, kJ, kap, f, Hb, Hj)
  % change in state variables during juvenile stage
  % dULH = dget_ulh_p_pj(t, ULH)
  % ULH: 3-vector
  %  U: scaled reserve M_E/ {J_{EAm}}; reference is at embryo value at T
  %  L: structural length
  %  H: scaled maturity M_H/ {J_{EAm}}; reference is at embryo value at T
  % dULH: change in scaled reserve, length, scaled maturity
  
  % unpack variables
  U = ULH(1); L = ULH(2); H = ULH(3);
 
  if H < Hb 
    s_M = 1; % -, acceleration factor
  elseif H < Hj
    s_M = L/ Lb;
  else
    s_M = Lj/ Lb;
  end
  e = v * U/ L^3; % -, scaled reserve density
  r = v * (s_M * e/ L - 1/ Lm)/ (e + g); % 1/d, spec growth rate
  SC = U * (s_M * v/ L - r); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dU = (L > Lb) * s_M * f * L^2 - SC;
  dL = r * L/ 3;
  dH = (1 - kap) * SC - kJ * H;

  % pack derivatives
  dULH = [dU; dL; dH];
  end

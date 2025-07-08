function [prdData, info] = predict_Gadus_morhua(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  if E_Hb < E_Hh %|| f_BjorStei2007 > 2 || f_McCoGeub2006 > 2
    prdData = []; info = 0; return
  end
   
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_14 = tempcorr(temp.tL_OtteNyha1999_14, T_ref, T_A);
  TC_12 = tempcorr(temp.tL_OtteNyha1999_12, T_ref, T_A);
  TC_10 = tempcorr(temp.tL_OtteNyha1999_10, T_ref, T_A);
  TC_8 = tempcorr(temp.tL_OtteNyha1999_8, T_ref, T_A);
  TC_6 = tempcorr(temp.tL_OtteNyha1999_6, T_ref, T_A);
  TC_4 = tempcorr(temp.tL_OtteNyha1999_4, T_ref, T_A);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = p_Am * U_E0;                 % J, initial reserve 

  % hatch   
  [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC_ah;          % d, age at hatch at f and T
  U_Eh = aUL(2,2);                 % d.cm^2 scaled reserve at hatch
  M_Eh = J_E_Am * U_Eh;            % mol, reserve at hatch at hatch
  L_h = aUL(2,3);                  % cm, structural length at hatch
  Lw_h = L_h/ del_ME;              % cm, total length at hatch
  Ww_h = L_h^3  + M_Eh * w_E/ d_E; % g, wet weight at hatch

  % birth
  L_b = L_m * l_b;                 % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * w);      % g, wet weight at birth 
  a_b = t_b/ k_M; aT_b = a_b/ TC_ab; % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                 % cm, structural length at metam
  Lw_j = L_j/ del_M;               % cm, total length at metam
  Ww_j = L_j^3 * (1 + f * w);      % g, wet weight at metam
  aT_j = t_j/ k_M/ TC_aj;          % d, age at metam

  % puberty 
  L_p = L_m * l_p;                 % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;               % cm, total length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;          % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                 % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;               % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);      % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  R_i = reprod_rate_j(L_i, f, pars_R)/ (1 - s_R); RT_i = TC_Ri * R_i; % #/d,ultimate reproduction rate 

  % max gonado-somatic index of fully grown individual 
  GSI = 365 * TC_GSI * R_i * Ww_b/ Ww_i; % - 

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
  prdData.Lh = Lw_h;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwh = Ww_h;
  prdData.Wwj = Ww_j;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.GSI = GSI;
  prdData.E0 = E_0;
  
  % uni-variate data
  
  % time - length/weight
  % all times in OtteNyha1999 are the same
  f = f_OtteNyha1999;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_b = l_b * L_m; L_j = l_j * L_m;  % cm, structurallength at birth, metamorphosis
  %U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  ULH_h = [aUL(2,[2 3]),U_Hh]; % state vector at h
  t = [0; tL_OtteNyha1999_4(:,1)]; % d, time since hatch
  % T = 4 C
  vT = v * TC_4; kT_J = k_J * TC_4;
  [a, ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f, U_Hb, U_Hj); 
  ULH(1,:) = []; L = ULH(:,2);
  w_del = min(1, max(0, (L_j - L) ./ (L_j - L_h))); del = w_del * del_ME + (1 - w_del) * del_M;
  ELw_OtteNyha1999_4 = L ./ del; % cm, total length
  EWd_OtteNyha1999_4 = L.^3 * d_V + w_E * J_E_Am * ULH(:,1); % g, dry weight
  % T = 6 C
  vT = v * TC_6; kT_J = k_J * TC_6; 
  t = [0; tL_OtteNyha1999_6(:,1)]; % d, time since hatch
  [a, ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f, U_Hb, U_Hj); 
  ULH(1,:) = []; L = ULH(:,2);
  w_del = min(1, max(0, (L_j - L) ./ (L_j - L_h))); del = w_del * del_ME + (1 - w_del) * del_M;
  ELw_OtteNyha1999_6 = L ./ del; % cm, total length
  EWd_OtteNyha1999_6 = L.^3 * d_V + w_E * J_E_Am * ULH(:,1); % g, dry weight
  % T = 8 C
  vT = v * TC_8; kT_J = k_J * TC_8; 
  [a, ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f, U_Hb, U_Hj); 
  ULH(1,:) = []; L = ULH(:,2);
  w_del = min(1, max(0, (L_j - L) ./ (L_j - L_h))); del = w_del * del_ME + (1 - w_del) * del_M;  
  ELw_OtteNyha1999_8 = L ./ del; % cm, total length
  EWd_OtteNyha1999_8 = L.^3 * d_V + w_E * J_E_Am * ULH(:,1); % g, dry weight
  % T = 10 C
  vT = v * TC_10; kT_J = k_J * TC_10; 
  [a, ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f, U_Hb, U_Hj); 
  ULH(1,:) = []; L = ULH(:,2);
  w_del = min(1, max(0, (L_j - L) ./ (L_j - L_h))); del = w_del * del_ME + (1 - w_del) * del_M;
  ELw_OtteNyha1999_10 = L ./ del; % cm, total length
  EWd_OtteNyha1999_10 = L.^3 * d_V + w_E * J_E_Am * ULH(:,1); % g, dry weight
  % T = 12 C
  vT = v * TC_12; kT_J = k_J * TC_12; 
  [a, ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f, U_Hb, U_Hj); 
  ULH(1,:) = []; L = ULH(:,2);
  w_del = min(1, max(0, (L_j - L) ./ (L_j - L_h))); del = w_del * del_ME + (1 - w_del) * del_M;
  ELw_OtteNyha1999_12 = L ./ del; % cm, total length
  EWd_OtteNyha1999_12 = L.^3 * d_V + w_E * J_E_Am * ULH(:,1); % g, dry weight
  % T = 14 C
  vT = v * TC_14; kT_J = k_J * TC_14; 
  [a, ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f, U_Hb, U_Hj); 
  ULH(1,:) = []; L = ULH(:,2);
  w_del = min(1, max(0, (L_j - L) ./ (L_j - L_h))); del = w_del * del_ME + (1 - w_del) * del_M;
  ELw_OtteNyha1999_14 = L ./ del; % cm, total length
  EWd_OtteNyha1999_14 = L.^3 * d_V + w_E * J_E_Am * ULH(:,1); % g, dry weight
  
  % wet weight adults
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_BjorStei2007);
  kT_M = k_M * TC_8; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; t = tWw_BjorStei2007(:,1);
  tj = (t_j - t_b)/ kT_M; L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_bj = L_b * exp(t(t<tj) * rT_j/ 3); % cm, structural length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t(t>tj) - tj)); % cm, structural length
  EWw_BjorStei2007 = [L_bj; L_ji].^3 * (1 + w * f_BjorStei2007);
  % wet weight adults2
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_McCoGeub2006);
  kT_M = k_M * TC_4; rT_B = rho_B * kT_M;
  tj = (t_j - t_b)/ kT_M; L_j = l_j * L_m; L_i = l_i * L_m;
  L = L_i - (L_i - L_j) * exp( - rT_B * (tWw_McCoGeub2006(:,1) - tj)); % cm, structural length
  EWw_McCoGeub2006 = L.^3 * (1 + f_McCoGeub2006 * w); % g, wet weight
  
  % LW-data
  EWw = (LWw(:,1) * del_M) .^3 * (1 + w * f); % g, wet weight
  
  % length-offspring per yr  (LN data)
  EN = 365 * TC_10 * reprod_rate_j(LN(:,1) * del_M, f, pars_R)/(1 - s_R); % #, number of offspring per year

  % McCoGeub2006 data at T = 10 C; all these data have the same times
  t = [0; tL_McCoGeub2006(:,1)]; % d, time since hatch
  [t_j, t_p, t_b, l_j ,l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_McCoGeub2006);
  vT = v * TC_10; kT_J = k_J * TC_10; 
  L_b = l_b * L_m; L_j = l_j * L_m; 
  %
  ULH_h = [U_Eh; L_h; U_Hh]; % state vector at h
  [a, ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f, U_Hb, U_Hj); 
  ULH(1,:) = []; U = ULH(:,1); L = ULH(:,2); % cm, structural length
  ELw_McCoGeub2006 = L/ del_ME;  % cm, total length
  EWd_McCoGeub2006 = 1e3 * (L.^3 * d_V  + w_E * J_E_Am * U); % mg, dry weight
  %
  pT_ref = TC_10 * p_Am * L_m^2; % J/d, max assimilation power at max size and T_ref
  pars_p = [kap; kap_R; g; k_J; k_M; 0; v; U_Hb; U_Hj; U_Hp]; % compose par-vector
  if any(L(2:end) <= L(1:end-1)); info = 0; prdData = []; return; end
  pACSJGRD = pT_ref * scaled_power_j(L, f_McCoGeub2006, pars_p, l_b, l_j, l_p); pADG = pACSJGRD(:,[1 7 5]);
  mu_O = [mu_X; mu_V; mu_E; mu_P];           % J/mol, chemical potentials for organics
  mu_M = 1e3 * [94.5; 68.32; 0; 19.2]/4.184; % J/mol, chemical potentials for minerals Kooy2010 Tab 4.3
  Epf_McCoGeub2006 = - ((mu_O' - mu_M' * (n_M\n_O)) * eta_O * pADG')'; % J/d, dissipation heat Kooy2010, (4.77)
  pADG(:,1) = 0; % exclude feeding
  Ep0_McCoGeub2006 = - ((mu_O' - mu_M' * (n_M\n_O)) * eta_O * pADG')'; % J/d, dissipation heat Kooy2010, (4.77)
    
  % FinnFyhn1995 data all at TC_6
  f = 0; %  when feeding, no food is available
  vT = v * TC_6; kT_J = k_J * TC_6; pT_Am = p_Am * TC_6; 
  LUH_0 = [1e-4; U_E0; 0];  % initial state vector
  pT_ref = pT_Am * L_m^2;   % J/d, max assimilation power at max size
  %
  [t, LUH] = ode45(@dget_LUH, [-1e-8;tJO2(:,1)], LUH_0, [], kap, vT, kT_J, g, L_m); LUH(1,:) = [];
  L = LUH(:,1); l = L/ L_m; e = J_E_Am * LUH(:,2) ./ (L.^3 * M_V)/ m_Em; pA = 0 * l;
  pD = kap * l .^3  + (1 - kap) * e .* l .^2 .* (g + l) ./ (g + e);  % scaled dissapating power (page 78 DEB book)
  pG = kap * l.^2.* (e-l)./(1 + e/g);  pADG = pT_ref * [pA, pD, pG]; % scaled growth (page 78 DEB book)
  JM = - (n_M\n_O) * eta_O * pADG'; % mol/d, mineral fluxes
  EJO2 = - 1e9/ 24 * JM(3,:)';      % nmol O2/h, O2-consumption
  %
  [t, LUH] = ode45(@dget_LUH, [-1e-8;tJNH3(:,1)], LUH_0, [], kap, vT, kT_J, g, L_m); LUH(1,:) = [];
  L = LUH(:,1); l = L/ L_m; e = J_E_Am * LUH(:,2) ./ (L.^3 * M_V)/ m_Em; pA = 0 * l;
  pD = kap * l .^3  + (1 - kap) * e .* l .^2 .* (g + l) ./ (g + e);  % Dissapating power (page 78 DEB book)
  pG = kap * l.^2.* (e-l)./(1 + e/g);  pADG = pT_ref * [pA, pD, pG]; % Growth (page 78 DEB book)
  JM = - (n_M\n_O) * eta_O * pADG'; % mol/d, mineral fluxes
  EJNH3 = 1e9/ 24 * JM(4,:)';       % nmol O2/h, NH3-production
  %
  [t, LUH] = ode45(@dget_LUH, [-1e-8; tVY(:,1)], LUH_0, [], kap, s_Y*vT, s_Y*kT_J, g, L_m); LUH(1,:) = [];
  UEb = E_m * L_b^3/ p_Am; % d.cm, scaled reserve at birth
  UE = max(0, LUH(:,2) - UEb * (LUH(:,1)/ L_b).^3); % cm.d, scaled yolk volume (is zero at birth)
  EVY = 1e3/del_MY^3 * J_E_Am * w_E * UE; % muL, yolk volume
  %
  [t, LUH] = ode45(@dget_LUH, [-1e-8;tE(:,1)], LUH_0, [], kap, vT, kT_J, g, L_m); LUH(1,:) = [];
  EE = mu_V * M_V * LUH(:,1).^3 + LUH(:,2) * p_Am; % J, energy content
  %
  [t, LUH] = ode45(@dget_LUH, [-1e-8;tL_FinnFyhn1995(:,1)], LUH_0, [], kap, vT, kT_J, g, L_m);  LUH(1,:) = [];
  ELw_FinnFyhn1995 = LUH(:,1)/ del_M; % cm, total length
  %
  [t, LUH] = ode45(@dget_LUH, [-1e-8;tWw_FinnFyhn1995(:,1)], LUH_0, [], kap, vT, kT_J, g, L_m);  LUH(1,:) = [];
  EWw_FinnFyhn1995 = 1e6 * (LUH(:,1).^3 + w_E/ d_E * J_E_Am * LUH(:,2)); % mug, wet weight
  %
  [t, LUH] = ode45(@dget_LUH, [-1e-8;tWd_FinnFyhn1995(:,1)], LUH_0, [], kap, vT, kT_J, g, L_m);  LUH(1,:) = [];
  EWd_FinnFyhn1995 = 1e6 * (d_V * LUH(:,1).^3 + w_E * J_E_Am * LUH(:,2)); % mug, dry weight
  %
  [t, LUH] = ode45(@dget_LUH, [-1e-8;tWa_FinnFyhn1995(:,1)], LUH_0, [], kap, vT, kT_J, g, L_m);  LUH(1,:) = [];
  EWa_FinnFyhn1995 = 1e6 * w_ad * (d_V * LUH(:,1).^3 + w_E * J_E_Am * LUH(:,2)); % mug, ash-free dry weight

  % T-ab data
  EaT_b = a_b ./ TC_Tab; 
   
  % pack to output
  prdData.tWd_OtteNyha1999_14 = EWd_OtteNyha1999_14;
  prdData.tWd_OtteNyha1999_12 = EWd_OtteNyha1999_12;
  prdData.tWd_OtteNyha1999_10 = EWd_OtteNyha1999_10;
  prdData.tWd_OtteNyha1999_8  = EWd_OtteNyha1999_8;
  prdData.tWd_OtteNyha1999_6  = EWd_OtteNyha1999_6;
  prdData.tWd_OtteNyha1999_4  = EWd_OtteNyha1999_4;
  prdData.tL_OtteNyha1999_14  = ELw_OtteNyha1999_14;
  prdData.tL_OtteNyha1999_12  = ELw_OtteNyha1999_12;
  prdData.tL_OtteNyha1999_10  = ELw_OtteNyha1999_10;
  prdData.tL_OtteNyha1999_8   = ELw_OtteNyha1999_8;
  prdData.tL_OtteNyha1999_6   = ELw_OtteNyha1999_6;
  prdData.tL_OtteNyha1999_4   = ELw_OtteNyha1999_4;
  %
  prdData.tL_FinnFyhn1995  = ELw_FinnFyhn1995;
  prdData.tWa_FinnFyhn1995 = EWa_FinnFyhn1995;
  prdData.tWd_FinnFyhn1995 = EWd_FinnFyhn1995;
  prdData.tWw_FinnFyhn1995 = EWw_FinnFyhn1995;
  prdData.tVY = EVY;
  prdData.tJNH3 = EJNH3;
  prdData.tJO2 = EJO2;
  prdData.Tab = EaT_b;
  prdData.tE = EE;
  prdData.tp0_McCoGeub2006 = Ep0_McCoGeub2006;
  prdData.tpf_McCoGeub2006 = Epf_McCoGeub2006;
  prdData.tWd_McCoGeub2006 = EWd_McCoGeub2006;
  prdData.tL_McCoGeub2006  = ELw_McCoGeub2006;
  prdData.LN = EN;
  prdData.tWw_McCoGeub2006 = EWw_McCoGeub2006;
  prdData.LWw = EWw;
  prdData.tWw_BjorStei2007 = EWw_BjorStei2007;

end
  
%% sub subfuctions
         
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
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
  e = v * U/ L^3; % -, scaled reserve density
  r = s * v * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  SC = U * (s * v/ L - r); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dH = (1 - kap) * SC - kJ * H;
  dU = (L > Lb) * s * f * L^2 - SC;
  dL = L * r/ 3;

  % pack derivatives
  dULH = [dU; dL; dH];
  end

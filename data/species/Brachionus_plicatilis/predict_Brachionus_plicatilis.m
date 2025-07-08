function [prdData, info] = predict_Brachionus_plicatilis(par, data, auxData)
  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_JCi = tempcorr(temp.JCi, T_ref, T_A);
  TC_JXi = tempcorr(temp.JXi, T_ref, T_A);
  
  % get predictions
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f (remove d_V for wet weight)
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty (remove d_V for wet weight)
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate dry weight (remove d_V for wet weight)
 
  % respiration at L_i
  L = L_i; L2 = L * L; L3 = L2 * L; E = E_m * L3;
  pA = f * p_Am * L2; pJ = k_J * E_Hp; 
  r = 0; pC = E * (v/ L - r); pM = p_M * L3; pG = 0; 
  pR = (1 - kap) * pC - pJ; pD = pM + pJ + (1 - kap_R) * pR;
  eta_XA = 1/ mu_E/ y_E_X; eta_PA = y_P_X/ mu_E/ y_E_X; eta_VG = d_V/ E_G/ w_V; % mol/J
  eta = [- eta_XA 0 0; 0 0 eta_VG; [1 -1 -1]/ mu_E; eta_PA 0 0]; % mol/J, mass-energy couplers
  J_M = (- n_M\n_O * eta * [pA pD pG]')';           % mol/d, mineral fluxes
  JT_Ci = TC_JCi * J_M(:,1) * 12e9;                 % ng C/d,  J_CO2 flux

  % feeding
  JT_Xi = TC_JXi * 1e6 * w_X * y_X_E * J_E_Am * L_i^2; % mug/d, ingestion rate in dry mass
  K = w_X * y_X_E * J_E_Am/ F_m;            % g/l, half saturation coefficient

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.JCi = JT_Ci;
  prdData.JXi = JT_Xi;
  prdData.K = K;


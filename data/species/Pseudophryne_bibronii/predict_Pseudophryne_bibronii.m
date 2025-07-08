function [prdData, info] = predict_Pseudophryne_bibronii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  if 0 % if skipped, E_0 is treated as parameter
    pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
    U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
    E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap constant
  else
    U_E0 = E_0/ J_E_Am/ mu_E;   % d.cm^2, initial scaled reserve
  end
  Wd_0 = w_E * E_0/ mu_E;       % g, initial dry weight

  % birth
  [U_H aUL] = ode45(@dget_aul, [0, U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_b = aUL(end,1); aT_b = a_b/ TC;  % d, age at birth at f and T
  U_Eb = aUL(end, 2); M_Eb = J_E_Am * U_Eb; % mol, reserve at hatch at f
  L_b = aUL(end,3); l_b = L_b/ L_m;  % cm, structural length at f
  Lw_b = L_b/ del_M;                 % cm, S-V length at birth at f
  Wd_b = L_b^3 * d_V  + M_Eb * w_E;  % g, dry weight at birth at f
  E_b = aUL(end,2) * p_Am + mu_V * M_V * L_b^3; % J, energy at birth at f
  e_b = M_Eb/ M_V/ L_b^3/ m_Em;      % -, scaled reserve density at birth

  % metamorphosis
  kT_M = k_M * TC;              % 1/d, correct k_M for temperature
  pars_tj = [g; k; l_T; v_Hb; v_Hj]; % compose parameter vector
  [t_j t_b l_j l_b info] = get_tp(pars_tj, 0.8, l_b); % -, scaled length at birth at f
  L_j = L_m * l_j;              % cm, structural length at metamorphosis at f
  Wd_j = L_j^3 *d_V * (1 + f * w);  % g, dry weight at metam
  aT_j = t_j/ kT_M;             % d, age at metamorphosis at f and T
  E_j = M_V * L_j^3 * (mu_V + f * m_Em * mu_E); % J, total energy at metamorphosis

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Wd_p = L_p^3 *d_V * (1 + f * w);  % g, dry weight at puberty 
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_E0(L_i, f, pars_R, L_p, U_E0); % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wd0 = Wd_0;
  prdData.Wdb = Wd_b;
  prdData.Wdj = Wd_j;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.E0 = E_0;
  prdData.Eb = E_b;
  prdData.Ej = E_j;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % embryo and juvenile respiration
  f = 0.8;         % this information was given in mydata_Pseudophryne bibronii
  vT = v * TC; kT_J = TC * k_J; JT_E_M = J_E_M * TC; JT_E_Am = J_E_Am * TC; 
  FT_m = TC * F_m; pT_Am = TC * p_Am; pT_M = TC * p_M; UT_E0 = U_E0/ TC;
  X = f/ (1 - f) * J_X_Am/ F_m; 
  par_EVH = [JT_E_Am; FT_m; y_E_X; y_V_E; vT; JT_E_M; kT_J; kap; kap_R; M_Hb; M_Hp; M_V; UT_E0]; 
  EVH = get_evh_E0(aJO(:,1), par_EVH, X);
  L3 = EVH(:,2)/ M_V; L = L3 .^ (1/3); M_E = EVH(:,1); ee = mu_E * M_E ./ L3/ E_m; M_H = EVH(:,3);
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* M_E * mu_E; 
  pA = f * pT_Am * ((M_H > M_Hb) .* L).^2; pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_XA = 1/ mu_E/ y_E_X; eta_PA = y_P_X/ mu_E/ y_E_X; eta_VG = d_V/ E_G/ w_V; % mol/J
  eta = [- eta_XA 0 0; 0 0 eta_VG; [1 -1 -1]/ mu_E; eta_PA 0 0]; % mol/J, mass-energy couplers
  J_M = (- n_M\n_O * eta * [pA pD pG]')'; % mol/d, mineral fluxes
  EJO = - J_M(:,3) * 1e6/ 24; % µmol/h, -J_O2 flux
  
  % tadpole length
  EVH = get_evh_E0(tL(:,1), par_EVH, X);
  L3 = EVH(:,2)/ M_V; 
  ELw = L3.^(1/3)/ del_M;

  % embryo yolk
  [a LUH] = ode45(@dget_LUH, aWY(:,1), [1e-10 UT_E0 0], [], kap, vT, kT_J, g, L_m);
  EWd_Y = max(0, LUH(:,2) * JT_E_Am  - e_b * m_Em * LUH(:,1) .^ 3 * M_V) * w_E * 1e3; % predicted yolk in mg
  
  % embryo body mass
  EWd_V = LUH(:,1).^3 * d_V * 1e3 * (1 + e_b * w); % predicted dry structure in mg
  
  % embryo total mass
  EVH = get_evh_E0(aWtot(:,1), par_EVH, X);
  EWd = EVH(:,1) * w_E + EVH(:,2) * w_V; % g, total dry mass
  EWd = EWd * 1e3; % mg, total dry mass

  % a_b(T)
  Eab = a_b ./ TC_Tab;
  
  % pack to output
  prdData.tL = ELw;
  prdData.aWV = EWd_V;
  prdData.aWY = EWd_Y;
  prdData.aWtot = EWd;
  prdData.aJO = EJO;
  prdData.Tab = Eab;
  
end

% %% SUBFUNCTIONS

function EVH = get_evh_E0(a,p,X)
  % EVH = get_evh_E0(a,p,X)
  % a: (na,1)-matrix with ages
  % p: 12 or 13 -vector with parameters of standard DEB model
  % X: scalar with food density
  % EVH: (na,3)-matrix with
  %   masses of reserve M_E, structure M_V, maturity M_H
  
  % unpack p
    JEAm = p(1); Fm = p(2); yEX = p(3); yVE = p(4); v = p(5);
    JEM = p(6); kJ = p(7); kap = p(8); kapR = p(9); MHb = p(10);
    MHp = p(11); MV = p(12); UE0 = p(13); JET = 0; 

  kM = yVE * JEM/ MV; % 1/d, somatic maintenance rate coefficient
  g = v * MV/ (kap * JEAm * yVE); % -, energy investment ratio
  JXAm = JEAm/ yEX;   % mol/d.cm^2, max spec food uptake rate
  K = JXAm/ Fm;       % M, half saturation coefficient
  f = X/ (X + K);     % -, scaled functional response
  ME0 = JEAm * UE0;   % mol

  MEm = JEAm/ v;      % mol/cm^3, [M_Em] = {J_EAm}/v  max reserve density (mass/ vol)
  mEm = MEm/ MV;      % mol/mol, max reserve density (mass/ mass)
  Lm = v/ (kM * g);   % cm, maximum length
  LT = JET/ JEM;      % cm, heating length

  a = [-1e-10; a];    % d, prepend zero
  [a EVH] = ode45(@dget_evh, a, [ME0; 1e-10; 1e-10], [], f, Lm, LT, mEm, g, v, JEAm, yVE, JEM, JET, kJ, kap, MHb, MHp, MV);
  EVH(1,:) = [];      % remove first row
end
  
function R = reprod_rate_E0(L, f, p, Lp, UE0)
  
  % unpack parameters; parameter sequence, cf get_pars_r
  kap = p(1); kapR = p(2); g = p(3); kJ = p(4); kM = p(5);
  LT = p(6); v = p(7); UHb = p(8); UHp = p(9); 
  
  Lm = v/ kM/ g;
  SC = f * L.^3 .* (g ./ L + (1 + LT ./ L)/ Lm)/ (f + g);
  SR = (1 - kap) * SC - kJ * UHp;
  R = (L >= Lp) * kapR .* SR/ UE0; % set reprod rate of juveniles to zero
end
function [prdData, info] = predict_Eudyptes_chrysocome(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % zero-variate data

  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
  tau_x = get_tp(pars_tx, f); 
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);  % -, scaled times & lengths
  if ~info; prdData = []; return; end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
%   U_E0 = initial_scaled_reserve(f, pars_UE0);
%   E_0 = p_Am * U_E0;            % J, initial energy content
%   Ww_0 = w_E * E_0/ mu_E/ d_E;  % g, initial wet weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f 
  aT_b = tau_b/ k_M/ TC_ab;     % d, age at birth at f and T

  % fledging
  tT_x = (tau_x - tau_b)/ kT_M;         % d, time since birth at fledging

  % puberty
  tT_p = (tau_p - tau_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tR = t_R;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  % time-weight
  tf = [0 f_00; 7 f_07; 35 f_35; 40 f_40]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b, f, l_b], tW(:,1)*kT_M);
  EWw = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
  %
  tf = [0 f1_00; 7 f1_07; 35 f1_35; 40 f1_40]; tf(:,1) = tf(:,1)*kT_M;
  [tvel, tau_p, ~, lp, lb, info]  = get_tp(pars_tp, tf, [tau_b, f, l_b], tWpT(:,1)*kT_M); %state vars and states at b and p at T
  if ~info; prdData = []; return; end
  EWw_1 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
%   pACSJGRD = scaled_power(L_m * tvel(:,4), f_tW1, [kap kap_R g k_J k_M L_T v U_Hb U_Hp],NaN,NaN);
  tau = tvel(:,1); % -, scaled time
  v_H = tvel(:,2); u_H = v_H * (1 - kap); % -, scaled maturity
  e = tvel(:,3); % -, scaled reserve
  l = tvel(:,4); % -, scaled length
  lT = (l > lb) .* l_T;
  kapR = kap_R * (l > lp); 
  tf = spline1(tau,tf);
  pA = (l >= lb) .* tf .* l.^2;                    % assim
  pC = e .* l.^2 .* (g + l + lT) ./ (g + e); % mobilisation
  pS = kap * l.^2 .* (l + lT);               % somatic  maint
  pJ = k * u_H;                               % maturity maint
  pG = kap * pC - pS;                        % growth
  pR = (1 - kap) * pC - pJ;                  % maturation/reproduction
  pD = pS + pJ + (1 - kapR) .* pR ;          % dissipation
  pT_ref = TC * p_Am * L_m^2;               % J/d, max assimilation power at max size
  pADG = [pA, pD, pG].* pT_ref; % pADG(:,1) = 0; % exclude assim contribution 
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
%   pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  JM = pADG * eta_O' * O2M ;   % mol/d, mineral fluxes
  X_gas = 24.06;  % gas correction factor, L/mol
  VO = -1*JM(:,3) * X_gas; % O2 consumption L/day 
  % authors use this following conversion: 1 1 0 2 = 20.083 kJ. pp. 98
  EpT_T = VO * 20.083;  % kJ/d
  
%   EpT_T = pT_ref * pACSJGRD(:,7)/1e3; % kJ/d
%   - equation in mod_2 - 

  % time-respiration
  % embryo data
  vT = v * TC_ab; kT_J = k_J * TC_ab; pT_M = p_M * TC_ab; 
  U_E0 = initial_scaled_reserve(fA_e, pars_UE0)/ TC_ab;
  a = [-1e-10; tJOe_A(:,1)];  n=length(a); for i=2:n; if a(i)<=a(i-1); a(i)=a(i-1)+1e-8;end;end
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * J_E_Am; ee = mu_E * M_E ./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* M_E * mu_E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJO_A = - J_M(:,3) * 24.4e3; % ml/d, O2 consumption
  %
  U_E0 = initial_scaled_reserve(fB_e, pars_UE0)/ TC_ab;
  a = [-1e-10; tJOe_B(:,1)];  n=length(a); for i=2:n; if a(i)<=a(i-1); a(i)=a(i-1)+1e-8;end;end
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); L3 = L .^3; M_E = LUH(:,2) * J_E_Am; ee = mu_E * M_E ./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* M_E * mu_E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJO_B = - J_M(:,3) * 24.4e3; % ml/d, O2 consumption

  % pack to output
  prdData.tW = EWw;
  prdData.tWpT = [EWw_1 EpT_T];
  prdData.tJOe_A = EJO_A;
  prdData.tJOe_B = EJO_B;

end


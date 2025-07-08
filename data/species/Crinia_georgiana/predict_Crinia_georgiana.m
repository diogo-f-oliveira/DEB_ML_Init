function [prdData, info] = predict_Crinia_georgiana(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hh >= E_Hb
      info = 0; prdData = []; return
  end

  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  if 0 % if skipped, E_0 is treated as parameter
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f_b, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap constant
  norm = 1; E_00 = 0; E_01 = E_0; i = 0;
  while abs(norm) > 1e-4 && i < 200 
    i = i + 1;
    E_0 = (E_00 + E_01)/ 2;
    norm = fnget_E0(E_0, p_Am, kap_h, kap_b, v, k_J, p_M, E_G, E_Hh, E_Hb, E_Hj, f_j);
    if norm > 0
      E_01 = E_0;
    else
      E_00 = E_0;
    end
  end
  if abs(norm) > 1e-3 || i == 200
    fprintf(['no convergence for E_O; ', num2str(i), ' steps, norm: ', num2str(norm), '\n'])
  end
  end
  Wd_0 = w_E * E_0/ mu_E; % g, initial dry weight

  % get stages at maturities
  pT_Am = TC * p_Am; vT = TC * v; pT_M = TC * p_M; kT_J = TC * k_J; 
  [E_H LEa] = ode45(@dget_LEa_kap, [0; E_Hh; E_Hb; E_Hj; E_Hp], [1e-4; E_0; 1e-10], ...
      [], pT_Am, kap, kap_b, vT, kT_J, pT_M, E_G, E_Hh, E_Hb, E_Hj, f_bj, f_jm); 

  % hatch   
  L_h = LEa(2,1); E_h = LEa(2,2); aT_h = LEa(2,3);
  Lw_h = L_h/ del_M;              % cm, physical length at hatch
  Wd_h = L_h^3 * d_V + E_h * w_E/ mu_E;% g, dry weight at hatch
  Ew_h = M_V * L_h^3 * mu_V + E_h;% J, energy content at hatch
  
  % birth
  L_b = LEa(3,1); E_b = LEa(3,2); aT_b = LEa(3,3);
  Lw_b = L_b/ del_M;              % cm, physical length at birth
  Wd_b = L_b^3 * d_V + E_b * w_E/ mu_E;% g, dry weight at birth
  e_b = E_b/ L_b^3/ E_m;          % -, scaled reserved density at birth

  % metamorphosis
  L_j = LEa(4,1); E_j = LEa(4,2); aT_j = LEa(4,3);
  Lw_j = L_j/ del_M;              % cm, physical length at metamorphosis
  Wd_j = L_j^3 * d_V + E_j * w_E/ mu_E;% g, dry weight at metamorphosis
  Ew_j = M_V * L_j^3 * mu_V + E_j;% J, energy content at metamorphosis

  % puberty 
  L_p = LEa(5,1); E_p = LEa(5,2); aT_p = LEa(5,3);
  Lw_p = L_p/ del_M;              % cm, physical length at puberty
  Wd_p = L_p^3 * d_V + E_p * w_E/ mu_E;% g, ultimate dry weight (remove d_V for wet weight)

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  Wd_i = d_V * Ww_i;                % g, ultimate dry weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wd0 = Wd_0;
  prdData.Wdh = Wd_h;
  prdData.Wdb = Wd_b;
  prdData.Wdj = Wd_j;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.E0 = E_0;
  prdData.Eh = Ew_h;
  prdData.Ej = Ew_j;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % tadpole length
  a_L = [-1e-10; tL(:,1)]; % d, prepend zero
  [a  LEH] = ode45(@dget_LEH_kap, a_L, [1e-10; E_0; 1e-10], [], ...
      pT_Am, kap, kap_b, vT, kT_J, pT_M, E_G, E_Hh, E_Hb, E_Hj, f_bj, f_jm);
  LEH(1,:) = []; % remove first point
  ELw = LEH(:,1)/ del_M;
  
  % yolk: reserve - internalised reserve
  a_Y = [-1e-10; aWdY(:,1)]; % d, prepend zero
  [a  LEH_Y] = ode45(@dget_LEH_kap, a_Y, [1e-10; E_0; 1e-10], [], ...
      pT_Am, kap, kap_b, vT, kT_J, pT_M, E_G, E_Hh, E_Hb, E_Hj, f_bj, f_jm);
  LEH_Y(1,:) = []; % remove first point
  EWd_Y = max(0, LEH_Y(:,2)/ mu_E  - e_b * m_Em * LEH_Y(:,1) .^ 3 * M_V) * w_E * 1e3; % mg, dry yolk

  % body mass: structure + internalised reserve
  a_V = [-1e-0; aWd(:,1)]; % d., prepend zero
  [a LEH_V] = ode45(@dget_LEH_kap, a_V, [1e-10; E_0; 1e-10], [], ...
      pT_Am, kap, kap_b, vT, kT_J, pT_M, E_G, E_Hh, E_Hb, E_Hj, f_bj, f_jm);
  LEH_V(1,:) = []; % remove first point
  EWd = LEH_V(:,1).^3 * (d_V + e_b * m_Em * w_E * M_V) * 1e3; % mg, dry mass minus yolk
  
  % embryo total mass
  a_W = [-1e-10; aWdtot(:,1)]; % d., prepend zero
  [a LEH_W] = ode45(@dget_LEH_kap, a_W, [1e-10; E_0; 1e-10], [], ...
      pT_Am, kap, kap_b, vT, kT_J, pT_M, E_G, E_Hh, E_Hb, E_Hj, f_bj, f_jm);
  LEH_W(1,:) = []; % remove first point
  EWd_tot = (LEH_W(:,1).^3 * d_V + w_E * LEH_W(:,2)/ mu_E) * 1e3; % mg, dry total mass

  % respiration
  %  1 mol oxygen = 22.4 L
  %  1 umol = 22.4 uL (u = micro) or 0.044643 umol = 1 uL
  [a LEH] = ode45(@dget_LEH_kap, aJO(:,1), [1e-10; E_0; 1e-10], [], ...
      pT_Am, kap, kap_b, vT, kT_J, pT_M, E_G, E_Hh, E_Hb, E_Hj, f_bj, f_jm); 
  L = LEH(:,1); L2 = L .* L; L3 = L2 .* L; L4 = L3 .* L; E = LEH(:,2); E_H = LEH(:,3);
  kap_t = kap * (E_H <= E_Hh);
  kap_t = kap_t + (kap_b + (kap - kap_b) * (E_Hb - E_H)/ (E_Hb - E_Hh)) .* (E_H > E_Hh) .* (E_H <= E_Hb);
  kap_t = kap_t + kap_b * (E_H > E_Hb) .* (E_H <= E_Hj);
  kap_t = kap_t + (kap_b + (kap - kap_b) * (E_H - E_Hj) ./ (E_H + E_Hj)) .* (E_H > E_Hj);
  %kap_t = kap_t + kap * (E_H > E_Hj);
  %
  pA = f_bj * pT_Am * (E_H > E_Hb) .* L2;
  r = (E * vT ./ L4 - pT_M ./ kap_t) ./ (E ./ L3 + E_G ./ kap); 
  pC = E .* (vT ./ L - r); pM = pT_M * L3; pG = kap .* pC - pM; pD = pM + (1 - kap_t) .* pC;
  eta_XA = 1/ mu_E/ y_E_X; eta_PA = y_P_X/ mu_E/ y_E_X; eta_VG = d_V/ E_G/ w_V; % mol/J
  eta = [- eta_XA 0 0; 0 0 eta_VG; [1 -1 -1]/ mu_E; eta_PA 0 0]; % mol/J, mass-energy couplers
  J_M = (- n_M\n_O * eta * [pA pD pG]')'; % mol/d, mineral fluxes
  EJO = - J_M(:,3) * 1e6/ 24; % µmol/h,  -J_O2 flux

  % pack to output
  prdData.tL = ELw;
  prdData.aWd = EWd;
  prdData.aWdY = EWd_Y;
  prdData.aWdtot = EWd_tot;
  prdData.aJO = EJO;
  
end

% %% SUBFUNCTIONS

function dLEH = dget_LEH_kap(a, LEH, p_Am, kap_h, kap_b, v, k_J, p_M, E_G, E_Hh, E_Hb, E_Hj, f_b, f_j)
  % dLEH = dget_LEH_kap(a, LEH, p_Am, kap_h, kap_b, v, k_J, k_M, E_G, E_Hh, E_Hb, E_Hj)
  % a: scalar with age
  % LEH: 3-vector with (L, E, H = E_H) of embryo
  % dLEH: 3-vector with (dL/dt, dE/dt, dH/dt)
  % kappa moves from kap_h at E_Hh to kap_b at E_Hb, and back again after E_Hj
  
  L = LEH(1);     % cm, structural length
  E = LEH(2);     % J, reserve E
  E_H = LEH(3);   % J, maturity E_H
  
  if E_H <= E_Hh % kap moves between hatch (h) and birth (b) and goes back to b after j
    kap = kap_h;
    f = f_b;
  elseif E_H <= E_Hb
    kap = kap_b + (kap_h - kap_b) * (E_Hb - E_H)/ (E_Hb - E_Hh);
    f = f_b;
  elseif E_H <= E_Hj
    kap = kap_b;
    f = f_b;
  else
    kap = kap_b + (kap_h - kap_b) * (E_H - E_Hj)/ (E_H + E_Hj);
    %kap = kap_h;
    f = f_j;
  end

  L2 = L * L; L3 = L2 * L; L4 = L3 * L;
  pA = f * p_Am * L2 *  (E_H > E_Hb);
  r = (E * v/ L4 - p_M/ kap)/ (E/ L3 + E_G/ kap);
  pC = E * (v/ L - r);
  
  % generate dH/da, dE/da, dL/da
  dE_H = (1 - kap) * pC - k_J * E_H;
  dE = pA - pC;
  dL = L * r/ 3;
  dLEH = [dL; dE; dE_H]; % pack output 
end

function dLEa = dget_LEa_kap(E_H, LEa, p_Am, kap_h, kap_b, v, k_J, p_M, E_G, E_Hh, E_Hb, E_Hj, f_b, f_j)
  % dLEa = dget_LEa_kap(E_H, LEa, p_Am, kap_h, kap_b, v, k_J, k_M, E_G, E_Hh, E_Hb, E_Hj)
  % a: scalar with age
  % LUa: 3-vector with (L, E, a) of embryo
  % dLUa: 3-vector with (dL/dE_H, dE/dE_H, da/dE_H)
  % kappa moves from kap_h at E_Hh to kap_b at E_Hb, and back again after E_Hj
  
  L = LEa(1); % cm, structural length
  E = LEa(2); % J, reserve E
  a = LEa(3); % a, a
  LEH = [L; E; E_H];% compose new state vector

  % get dL/da, dE/da, dE_H/da
  dLEH = dget_LEH_kap(a, LEH, p_Am, kap_h, kap_b, v, k_J, p_M, E_G, E_Hh, E_Hb, E_Hj, f_b, f_j);
  dLEa = [dLEH(1:2); 1]/ dLEH(3); % dL/dE_H, dE/dE_H, da/dE_H
end

function F = fnget_E0(E_0, p_Am, kap_h, kap_b, v, k_J, p_M, E_G, E_Hh, E_Hb, E_Hj, f)     
  [a LEa] = ode23s(@dget_LEa_kap, [0; E_Hb], [1e-3; E_0; 1e-10], [], p_Am, kap_h, kap_b, v, k_J, p_M, E_G, E_Hh, E_Hb, E_Hj, f); 
  F = LEa(end,2)/ LEa(end,1)^3 * v/ p_Am - f;
end  
function [prdData, info] = predict_Crinia_nimbus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hh >= E_Hb
      info = 0; prdData = []; return
  end

  % compute temperature correction factors
  TC_15 = tempcorr(temp.ah_15, T_ref, T_A);
  TC_10 = tempcorr(temp.ah_10, T_ref, T_A);
  TC_5 = tempcorr(temp.ah_5, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_aY = tempcorr(temp.aY, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  if 0 % if skipped, E_0 is treated as parameter
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap constant
  if 0 % if skipped bisection methods is used, rather than fzero
    [E_0 F info] = fzero(@fnget_E0, E_0, [], kap_h, kap_b, v, k_J, p_M, E_G, E_Hh, E_Hb, f, p_Am);
    if abs(F) > 1e-4 || info ~= 1
      fprintf(['warning in fzero on fnget_E0: no convergence, F = ',num2str(F),', info = ', num2str(info),' \n'])
    end
  else % bisection method
    norm = 1; E_00 = 0; E_01 = E_0; i = 0;
    while abs(norm) > 1e-4 && i < 200 
      i = i + 1;
      E_0 = (E_00 + E_01)/ 2;
      norm = fnget_E0 (E_0, kap, kap_b, v, k_J, p_M, E_G, E_Hh, E_Hb, f, p_Am);
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
  end
    
  % hatch 
  [E_H LEa] = ode23s(@dget_LEa_kap, [0 E_Hh E_Hb], [1e-4 E_0 1e-10], [], kap, kap_b, v, k_J, p_M, E_G, E_Hh, E_Hb); 
  L_h = LEa(2,1); E_h = LEa(2,2); a_h = LEa(2,3);
  Lw_h = L_h/ del_M;   % cm, physical length at hatch
  Ww_h = L_h^3 + E_h * w_E/ mu_E/ d_E; % g, wet weight at hatch
  Wd_h = L_h^3 * d_V + E_h * w_E/ mu_E;% g, dry weight at hatch
  Ew_h = M_V * L_h^3 * mu_V + E_h;     % J, energy at hatch
  a15_h = a_h/ TC_15;                  % d, age at hatch at T
  a10_h = a_h/ TC_10;                  % d, age at hatch at T
  a5_h = a_h/ TC_5;                    % d, age at hatch at T

  % birth
  L_b = LEa(3,1); E_b = LEa(3,2); a_b = LEa(3,3);
  e_b = E_b/ L_b^3/ E_m;               % -, scaled reserve density at birth
  Lw_b = L_b/ del_M;   % cm, physical length at birth at f
  Ww_b = L_b^3 + E_b * w_E/ mu_E/ d_E; % g, wet weight at birth at f
  Wd_b = L_b^3 * d_V + E_b * w_E/ mu_E;% g, dry weight at birth at f
  Ew_b = M_V * L_b^3 * mu_V + E_b;     % J, energy at birth
  a15_b = a_b/ TC_15;                  % d, age at birth at f and T
  a10_b = a_b/ TC_10;                  % d, age at birth at f and T

  % puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ah_15 = a15_h;
  prdData.ah_10 = a10_h;
  prdData.ah_5 = a5_h;
  prdData.ab_15 = a15_b;
  prdData.ab_10 = a10_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wdh = Wd_h;
  prdData.Wwh = Ww_h;
  prdData.Wdb = Wd_b;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.E0 = E_0;
  prdData.Eh = Ew_h;
  prdData.Eb = Ew_b;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % respiration
  %  1 mol oxygen = 22.4 L
  %  1 umol = 22.4 uL (u = micro) or 0.044643 umol = 1 uL
  vT = TC_15 * v; kT_J = TC_15 * k_J; pT_M = TC_15 * p_M;
  a_15 = aJO_15(:,1);                   % d, age
  [a LEH_15] = ode23s(@dget_LEH_kap, a_15, [1e-10 E_0 1e-10], [], kap, kap_b, vT, kT_J, pT_M, E_G, E_Hh, E_Hb); 
  L = LEH_15(:,1); L3 = L .^3; L4 = L3 .* L; E = LEH_15(:,2); E_H = LEH_15(:,3);
  kap_t = kap * (E_H<E_Hh) + (kap_b + (kap - kap_b) * (E_H - E_Hb) ./ (E_H + E_Hb)) .* (E_H>E_Hb);
  kap_t = kap_t + (E_H>E_Hh) .* (E_H<E_Hb) .* (kap_b + (kap - kap_b) * (E_Hb - E_H)/ (E_Hb - E_Hh));
  r = (E * vT ./ L4 - pT_M ./ kap_t) ./ (E ./ L3 + E_G ./ kap_t); 
  pC = E .* (vT ./ L - r); pM = pT_M * L3; pG = kap_t .* pC - pM; pD = pM + (1 - kap_t) .* pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')';   % mol/d, mineral fluxes
  EJO_15 = - J_M(:,3) * 1e6 * 22.4/ 24; % µml/h, O2 flux
  %
  vT = TC_10 * v; kT_J = TC_10 * k_J; pT_M = TC_10 * p_M;
  a_10 = aJO_10(:,1);        % d, age
  [a LEH_10] = ode23s(@dget_LEH_kap, a_10, [1e-10 E_0 1e-10], [], kap, kap_b, vT, kT_J, pT_M, E_G, E_Hh, E_Hb); 
  L = LEH_10(:,1); L3 = L .^3; L4 = L3 .* L; E = LEH_10(:,2); E_H = LEH_10(:,3);
  kap_t = kap * (E_H<E_Hh) + (kap_b + 0*(kap - kap_b) * (E_H - E_Hb) ./ (E_H + E_Hb)) .* (E_H>E_Hb);
  kap_t = kap_t + (E_H>E_Hh) .* (E_H<E_Hb) .* (kap_b + (kap - kap_b) * (E_Hb - E_H)/ (E_Hb - E_Hh));
  r = (E * vT ./ L4 - pT_M ./ kap_t) ./ (E ./ L3 + E_G ./ kap_t); 
  pC = E .* (vT ./ L - r); pM = pT_M * L3; pG = kap_t .* pC - pM; pD = pM + (1 - kap_t) .* pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')';   % mol/d, mineral fluxes
  EJO_10 = - J_M(:,3) * 1e6 * 22.4/ 24; % µml/h, O2 flux
  %
  vT = TC_5 * v; kT_J = TC_5 * k_J; pT_M = TC_5 * p_M;
  a_5 = aJO_5(:,1); % d, age
  [a LEH_5] = ode23s(@dget_LEH_kap, a_5, [1e-10 E_0 1e-10], [], kap, kap_b, vT, kT_J, pT_M, E_G, E_Hh, E_Hb); 
  L = LEH_5(:,1); L3 = L .^3; L4 = L3 .* L; E = LEH_5(:,2); E_H = LEH_5(:,3);
  kap_t = kap * (E_H<E_Hh) + (kap_b + 0*(kap - kap_b) * (E_H - E_Hb) ./ (E_H + E_Hb)) .* (E_H>E_Hb);
  kap_t = kap_t + (E_H>E_Hh) .* (E_H<E_Hb) .* (kap_b + (kap - kap_b) * (E_Hb - E_H)/ (E_Hb - E_Hh));
  r = (E * vT ./ L4 - pT_M ./ kap) ./ (E ./ L3 + E_G ./ kap_t); 
  pC = E .* (vT ./ L - r); pM = pT_M * L3; pG = kap_t .* pC - pM; pD = pM + (1 - kap_t) .* pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')';   % mol/d, mineral fluxes
  EJO_5 = - J_M(:,3) * 1e6 * 22.4/ 24; % µml/h, O2 flux

  % yolk
  vT = TC_aY * v; kT_J = TC_aY * k_J; pT_M = TC_aY * p_M;
  a_Y = [1e-8; aY(:,1)]; % d, prepend zero
  [a  LEH_Y] = ode23s(@dget_LEH_kap, a_Y, [1e-10 E_0 1e-10], [], kap, kap_b, vT, kT_J, pT_M, E_G, E_Hh, E_Hb);
  LEH_Y(1,:) = []; % remove first point
  EY = max(0, LEH_Y(:,2)/ mu_E  - e_b * m_Em * LEH_Y(:,1) .^ 3 * M_V) * w_E * 1e3; % mg, dry yolk

  % body mass (same temp as aY)
  a_W = [1e-8; aW(:,1)]; % d., prepend zero
  [a LEH_W] = ode23s(@dget_LEH_kap, a_W, [1e-10 E_0 1e-10], [], kap, kap_b, vT, kT_J, pT_M, E_G, E_Hh, E_Hb);
  LEH_W(1,:) = []; % remove first point
  EWd = LEH_W(:,1).^3 * (d_V + e_b * m_Em * w_E * M_V) * 1e3; % mg, dry mass minus external yolk

  % pack to output
  prdData.aY = EY;
  prdData.aW = EWd;
  prdData.aJO_15 = EJO_15;
  prdData.aJO_10 = EJO_10;
  prdData.aJO_5  = EJO_5;
  
end

% %% SUBFUNCTIONS %%%%%%%%%%%%%%%%%%%%%%

function dLEH = dget_LEH_kap(a, LEH, kap_h, kap_b, v, kJ, pM, EG, E_Hh, E_Hb)
  %      dLEH = dget_LEH_kap(a, LEH, kap_h, kap_b, v, kJ, kM, EG, E_Hh, E_Hb)
  % a: scalar with age
  % LUH: 3-vector with (L, E, H = E_H) of embryo
  % dLUH: 3-vector with (dL/dt, dE/dt, dH/dt)
  % kappa moves from kap_h at E_Hh to kap_b at E_Hb, and back again after
  % E_H_j
  
  L = LEH(1); % cm, structural length
  E = LEH(2); % J, reserve E
  E_H = LEH(3); % J, maturity E_H
  
  if E_H < E_Hh % kap moves between hatch (h) and birth (b) and jumps back at b
    kap = kap_h;
  elseif E_H < E_Hb
    kap = kap_b + (kap_h - kap_b) * (E_Hb - E_H)/ (E_Hb - E_Hh);
  else % E_H < E_Hj
    kap = kap_b; 
  end
  
  L3 = L^3; L4 = L3 * L;
  r = (E * v/ L4 - pM/ kap)/ (E/ L3 + EG/ kap);
  pC = E * (v/ L - r);
  
  % generate dH/dt, dE/dt, dL/dt
  dE_H = (1 - kap) * pC - kJ * E_H;
  dE = - pC;
  dL = L * r/ 3;
  
  % pack dL/da, dU/da, dE_H/da, 
  dLEH = [dL; dE; dE_H];  
end
  
function dLEa = dget_LEa_kap(E_H, LEa, kap_h, kap_b, v, kJ, pM, EG, E_Hh, E_Hb)
  %      dLEa = dget_LEH_kap(E_H, LEa, kap_h, kap_b, v, kJ, kM, EG, E_Hh, E_Hb)
  % a: scalar with age
  % LEa: 3-vector with (L, E, a) of embryo
  % dLEa: 3-vector with (dL/dE_H, dE/dE_H, da/dE_H)
  % kappa moves from kap_h at E_Hh to kap_b at E_Hb, and back again after E_Hb
  
  L = LEa(1); % cm, structural length
  E = LEa(2); % J, reserve E
  a = LEa(3); % a, age a
  LEH = [L; E; E_H];% compose new state vector

  % get dL/da, dE/da, dE_H/da
  dLEH = dget_LEH_kap(a, LEH, kap_h, kap_b, v, kJ, pM, EG, E_Hh, E_Hb);
  dLEa = [dLEH(1:2); 1]/ dLEH(3); % dL/dE_H, dE/dE_H, da/dE_H
end

function F = fnget_E0(E_0,kap_h, kap_b, v, k_J, p_M, E_G, E_Hh, E_Hb, f, p_Am)     
  [a LEa] = ode23s(@dget_LEa_kap, [0 E_Hb], [1e-3 E_0 1e-10], [], kap_h, kap_b, v, k_J, p_M, E_G, E_Hh, E_Hb); 
  F = LEa(end,2)/ LEa(end,1)^3 * v/ p_Am - f;
end
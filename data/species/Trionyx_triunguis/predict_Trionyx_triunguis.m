function [prdData, info] = predict_Trionyx_triunguis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_27 = tempcorr(temp.tWw_27, T_ref, T_A); 
  TC_30 = tempcorr(temp.tWw_30, T_ref, T_A); 
  TC_33 = tempcorr(temp.tWw_33, T_ref, T_A); 
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Wd_0 = E_0 * w_E/ mu_E; % g, egg dry weight
  Ww_0 = Wd_0/ d_E;       % g, egg wet weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  a_b = t_b/ k_M;                   % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, plastron length at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate plastron length
  Ww_i = L_i^3 * (1 + f * w);       % g,  ultimate wet weight
    
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
 
  % pack to output

  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  p27_M = p_M*TC_27; v27 = v*TC_27; 
  p30_M = p_M*TC_30; v30 = v*TC_30; 
  p33_M = p_M*TC_33; v33 = v*TC_33;
  
  % time-wet weight
  LE_0 = [0.00001; E_0];    % initial conditions
  %
  [t, LE] = ode45(@get_LE, [0; tWw_27(:,1) - t_0], LE_0, [], kap, p27_M, v27, E_G);
  LE(1,:) = []; EWw_27 = LE(:,1).^3 .* (1 + f .* w); % g, wet weight  of embryo
  %
  [t, LE] = ode45(@get_LE, [0; tWw_30(:,1) - t_0], LE_0, [], kap, p30_M, v30, E_G);
  LE(1,:) = []; EWw_30 = LE(:,1).^3 .* (1 + f .* w); % g, wet weight  of embryo
  %
  [t, LE] = ode45(@get_LE, [0; tWw_33(:,1) - t_0], LE_0, [], kap, p33_M, v33, E_G);
  LE(1,:) = []; EWw_33 = LE(:,1).^3 .* (1 + f .* w); % g, wet weight  of embryo

  % time-dry weight
  [t, LE] = ode45(@get_LE, [0; tWd_27(:,1) - t_0], LE_0, [], kap, p27_M, v27, E_G);
  LE(1,:) = []; EWd_27 = LE(:,1).^3 .* d_V * (1 + f .* w); % g, wet weight  of embryo
  %
  [t, LE] = ode45(@get_LE, [0; tWd_30(:,1) - t_0], LE_0, [], kap, p30_M, v30, E_G);
  LE(1,:) = []; EWd_30 = LE(:,1).^3 .* d_V * (1 + f .* w); % g, wet weight  of embryo
  %
  [t, LE] = ode45(@get_LE, [0; tWd_33(:,1) - t_0], LE_0, [], kap, p33_M, v33, E_G);
  LE(1,:) = []; EWd_33 = LE(:,1).^3 .* d_V * (1 + f .* w); % g, wet weight  of embryo

  % time-respiration
  [t, LE] = ode45(@get_LE, [0; tJO_27(:,1) - t_0], LE_0, [], kap, p27_M, v27, E_G);
  LE(1,:) = []; L = LE(:,1); L3 = L .^3;      % cm, structural length, volume
  E = LE(:,2);                  % J, reserve
  ee = E ./ L3/ E_m;             % -, scaled reserve density
  r = v27 * (ee ./ L - 1/ L_m) ./ (ee + g); % 1/d, specific growth rate
  pTC = (v27 ./ L - r) .* E;      % J/d, mobilisation  (p.39 2.12)
  pTA = 0 * L;                   % J/d, asimilation 
  pTM = L3 * p27_M;               % J/d, somatic maintenance
  pTG = kap * pTC - pTM .* L3;   % J/d, growth
  pTD = pTM + (1 - kap) * pTC;   % J/d, disipation (without reproduction)
  J_O = eta_O * [pTA pTD pTG]';  % mol/d, organic fluxes
  J_M = (- n_M\n_O * J_O)';      % mol/d, mineral fluxes
  % molar volume of gas at 1 bar and 20 C is 24.4 L/mol
  X_gas = T_ref/ temp.tWw_27 / 24.4;  % M, mol of gas per litre at 20 C and 1 bar 
  EJO_27 = - J_M(:,3)/ X_gas * 1e3; % mL/ d
  %
  [t, LE] = ode45(@get_LE, [0; tJO_30(:,1) - t_0], LE_0, [], kap, p30_M, v30, E_G);
  LE(1,:) = []; L = LE(:,1); L3 = L .^3;      % cm, structural length, volume
  E = LE(:,2);                  % J, reserve
  ee = E ./ L3/ E_m;             % -, scaled reserve density
  r = v30 * (ee ./ L - 1/ L_m) ./ (ee + g); % 1/d, specific growth rate
  pTC = (v30 ./ L - r) .* E;      % J/d, mobilisation  (p.39 2.12)
  pTA = 0 * L;                   % J/d, asimilation 
  pTM = L3 * p30_M;               % J/d, somatic maintenance
  pTG = kap * pTC - pTM .* L3;   % J/d, growth
  pTD = pTM + (1 - kap) * pTC;   % J/d, disipation (without reproduction)
  J_O = eta_O * [pTA pTD pTG]';  % mol/d, organic fluxes
  J_M = (- n_M\n_O * J_O)';      % mol/d, mineral fluxes
  % molar volume of gas at 1 bar and 20 C is 24.4 L/mol
  X_gas = T_ref/ temp.tWw_30 / 24.4;  % M, mol of gas per litre at 20 C and 1 bar 
  EJO_30 = - J_M(:,3)/ X_gas * 1e3; % mL/ d
  %
  [t, LE] = ode45(@get_LE, [0; tJO_33(:,1) - t_0], LE_0, [], kap, p33_M, v33, E_G);
  LE(1,:) = []; L = LE(:,1); L3 = L .^3;      % cm, structural length, volume
  E = LE(:,2);                  % J, reserve
  ee = E ./ L3/ E_m;             % -, scaled reserve density
  r = v33 * (ee ./ L - 1/ L_m) ./ (ee + g); % 1/d, specific growth rate
  pTC = (v33 ./ L - r) .* E;      % J/d, mobilisation  (p.39 2.12)
  pTA = 0 * L;                   % J/d, asimilation 
  pTM = L3 * p33_M;               % J/d, somatic maintenance
  pTG = kap * pTC - pTM .* L3;   % J/d, growth
  pTD = pTM + (1 - kap) * pTC;   % J/d, disipation (without reproduction)
  J_O = eta_O * [pTA pTD pTG]';  % mol/d, organic fluxes
  J_M = (- n_M\n_O * J_O)';      % mol/d, mineral fluxes
  % molar volume of gas at 1 bar and 20 C is 24.4 L/mol
  X_gas = T_ref/ temp.tWw_33 / 24.4;  % M, mol of gas per litre at 20 C and 1 bar 
  EJO_33 = - J_M(:,3)/ X_gas * 1e3; % mL/ d

  % temperature-age at birth
  Ea_b = t_0 + a_b ./ tempcorr(C2K(Tab(:,1)), T_ref, T_A);  % d, age at birth

  % pack to output
  prdData.tWw_27 = EWw_27;
  prdData.tWw_30 = EWw_30;
  prdData.tWw_33 = EWw_33;
  prdData.tWd_27 = EWd_27;
  prdData.tWd_30 = EWd_30;
  prdData.tWd_33 = EWd_33;
  prdData.tJO_27 = EJO_27;
  prdData.tJO_30 = EJO_30;
  prdData.tJO_33 = EJO_33;
  prdData.Tab = Ea_b;
end
function dLE = get_LE(t, LE, kap, p_M, v, E_G)
                     
  L = LE(1); E = LE(2);   % unpack state vars   

  r = ((E * v/ L^4) - (p_M / kap)) / ((E / L^3) + (E_G / kap)); % 1/d, specific growth rate
  pC = E * (v/ L -  r);            % J/d, mobilization

  dL = L * r / 3;                  % cm/d growth
  dE = - pC;                       % J/d reserve dynamics

  dLE = [dL; dE];                % pack output

end  

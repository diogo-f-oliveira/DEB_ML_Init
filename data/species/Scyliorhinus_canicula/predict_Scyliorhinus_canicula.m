function [prdData, info] = predict_Scyliorhinus_canicula(par, data, auxData)  
 
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  if ~info; prdData = []; return; end
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth 
  aT_b = t0 +tau_b/ kT_M;             % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = tau_p/ kT_M;                 % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % max gonado-somatic index
  %   that spawns once per year see (4.89) of DEB3
  L = 47 * del_M; % Lw = 47 cm for this value of GI
  Ww_47 = L^3 * (1 + f * w);       % g, ultimate wet weight 
  GSI = 365 * TC * reprod_rate(L, f, pars_R) * Ww_b/ Ww_47;
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.GSI = GSI;
  
  %% uni-variate data
  pars_tP = pars_tp; pars_tP(5)=pars_tP(4)+1e-3;
  tvel = get_tp (pars_tP, f_tL, [], tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M; % cm, expected physical length at time

  % WO
  % mass-power couplers (assimilation set to zero)
  [l_p, l_b, info] = get_lp(pars_tp, f_WO); % -, scaled times & lengths at f
  if ~info; prdData = []; return; end
  eta_VG = y_V_E/mu_E;     % mol/J, struct-growth energy coupler
  eta_O = [0        0;     % mol/J, mass-energy coupler
  	       0   eta_VG;     %         used in: J_O = eta_O * p
  	   -1/mu_E -1/mu_E;
	       0        0];
  L = (WO(:,1) /(1 + f_WO * w)).^(1/3); % cm, structural lengths
  pT_ref = TC * p_Am * L_m^2;        % max assimilation power at max size
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  pACSJGRD = pT_ref * scaled_power_old(L, f_WO, pars_pow, l_b, l_p); % powers
  pDG = pACSJGRD(:,[7 5])';    % dissipation, growth power
  J_O = eta_O * pDG;     % J_X, J_V, J_E, J_P in rows, D, G in cols
  J_M = - (n_M\n_O) * J_O;     % J_C, J_H, J_O, J_N in rows, D, G in cols
  EO = - J_M(3,:)' * 32e3/ 24; % mg/h 

  %% pack to output
  prdData.tL = ELw;
  prdData.WO = EO;
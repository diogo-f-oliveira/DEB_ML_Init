function [prdData, info] = predict_Myxine_glutinosa(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_WO = tempcorr(temp.WO, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_lp = [g; k; l_T; v_Hb; v_Hp];     % compose parameter vector
  [l_p, l_b, info] = get_lp(pars_lp, f); % -, scaled times & lengths at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

  % food intake
  pT_X = TC * p_Am * (122.6/(1 + f * w))^(2/3)/ kap_X; % J/d, daily energy intake at 122.6 g wet weight

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at birth at f
  Lw_p = L_p/ del_M;                % cm, physical length at birth at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

  %% pack to output
  prdData.am = aT_m;
  prdData.pX = pT_X;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  % weight at length
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w);
  
  % O2 consumption rate
  % yield coefficients  
  y_E_X = kap_X * mu_X/ mu_E;      % mol/mol, yield of reserve on food
  y_X_E = 1/ y_E_X;                % mol/mol, yield of food on reserve
  y_V_E = mu_E * M_V/ E_G;         % mol/mol, yield of structure on reserve
  %y_E_V = 1/ y_V_E;               % mol/mol, yield of reserve on structure
  y_P_X = kap_P * mu_X/ mu_P;      % mol/mol, yield of faeces on food 
  %y_X_P = 1/ y_P_X;               % mol/mol, yield of food on faeces
  y_P_E = y_P_X/ y_E_X;            % mol/mol, yield of faeces on reserve
  % mass-power couplers
  eta_XA = y_X_E/mu_E;             % mol/kJ, food-assim energy coupler
  eta_PA = y_P_E/mu_E;             % mol/kJ, faeces-assim energy coupler
  eta_VG = y_V_E/mu_E;             % mol/kJ, struct-growth energy coupler
  eta_O = [-eta_XA  0       0;     % mol/kJ, mass-energy coupler
    	   0        0       eta_VG;% used in: J_O = eta_O * p
	     1/mu_E  -1/mu_E   -1/mu_E;
         eta_PA     0       0]; 
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35

  p_ref = p_Am * L_m^2;               % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  L = (WO(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power(L, f, pars_power, l_b, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  pADG(:,1) = 0; % exclude assim contributions
  JM = pADG * eta_O' * O2M;           % mol/d, mineral fluxes
  EO = - 1e6/ 24 * TC .* JM(:,3) ./ WO(:,1); % mumol/h.g, spec oxygen consumption rate
  
  % clutch size
  EN = 365 * TC_WO * reprod_rate(LN(:,1) * del_M, f, pars_R); % #/d, ultimate reproduction rate at T

  %% pack to output
  prdData.LW = EWw;
  prdData.LN = EN;
  prdData.WO = EO;
  
  
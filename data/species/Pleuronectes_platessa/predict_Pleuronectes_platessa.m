function [prdData, info] = predict_Pleuronectes_platessa(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  if E_Hh >= E_Hb
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_R68 = tempcorr(temp.R68, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  TC_aL = tempcorr(temp.aL, T_ref, T_A);

  
% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mj;               % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_68 = TC_R68 * reprod_rate_j(68 * del_M, f, pars_R);  % #/d, reproduction rate for 45 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.R68 = RT_68;
  
  % uni-variate data
  
  % Ww-pX data
  p_Xm = p_Am/ kap_X; % J/d, max spec ingestion rate
  EpX_2  = tempcorr(temp.WpX_2, T_ref, T_A) * p_Xm * (WpX_2(:,1) /(1 + f * w)) .^ (2/3);
  EpX_6  = tempcorr(temp.WpX_6, T_ref, T_A) * p_Xm * (WpX_6(:,1) /(1 + f * w)) .^ (2/3);
  EpX_10 = tempcorr(temp.WpX_10, T_ref, T_A) * p_Xm * (WpX_10(:,1)/(1 + f * w)) .^ (2/3);
  EpX_14 = tempcorr(temp.WpX_14, T_ref, T_A) * p_Xm * (WpX_14(:,1)/(1 + f * w)) .^ (2/3);
  EpX_18 = tempcorr(temp.WpX_18, T_ref, T_A) * p_Xm * (WpX_18(:,1)/(1 + f * w)) .^ (2/3);
  EpX_22 = tempcorr(temp.WpX_22, T_ref, T_A) * p_Xm * (WpX_22(:,1)/(1 + f * w)) .^ (2/3);
  
  % Ww- JO data
  p_ref = p_Am * L_m^2;               % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  % data set 1 (f=1)
  L = (WJO1_2(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO1_2 = - tempcorr(temp.WJO1_2, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate
  %
  L = (WJO1_6(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO1_6 = - tempcorr(temp.WJO1_6, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate
  %
  L = (WJO1_10(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO1_10 = - tempcorr(temp.WJO1_10, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate
  %
  L = (WJO1_14(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO1_14 = - tempcorr(temp.WJO1_14, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate
  %
  L = (WJO1_18(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO1_18 = - tempcorr(temp.WJO1_18, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate
  %
  L = (WJO1_22(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO1_22 = - tempcorr(temp.WJO1_22, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate
  %
  % data set 2 (fasting)
  L = (WJO0_2(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, 1, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  pADG(:,1) = 0; % fasting: assimilation = 0
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO0_2 = - tempcorr(temp.WJO0_2, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate
  %
  L = (WJO0_6(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  pADG(:,1) = 0; % fasting: assimilation = 0
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO0_6 = - tempcorr(temp.WJO0_6, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate
  %
  L = (WJO0_10(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  pADG(:,1) = 0; % fasting: assimilation = 0
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO0_10 = - tempcorr(temp.WJO0_10, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate
  %
  L = (WJO0_14(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  pADG(:,1) = 0; % fasting: assimilation = 0
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO0_14 = - tempcorr(temp.WJO0_14, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate
  %
  L = (WJO0_18(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  pADG(:,1) = 0; % fasting: assimilation = 0
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO0_18 = - tempcorr(temp.WJO0_18, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate
  %
  L = (WJO0_22(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  pADG(:,1) = 0; % fasting: assimilation = 0
  JM = pADG * eta_O' * O2M;               % mineral fluxes
  EJO0_22 = - tempcorr(temp.WJO0_22, T_ref, T_A) * 32e3 * JM(:,3); % mg/d, oxygen consumption rate

  % L-W data
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w);              % g, wet weight at time

  % t-L data post metam
  rT_B = TC_tL * k_M * rho_B; Lw_j = L_m * l_j/ del_M; tj = t_j/ k_M/ TC_tL; % 1/d, von Bert growth rate
  ELw = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL(:,1) - tj)); % cm, total length at time
  
  % LN, WN and aN data
  EN_L = TC_LN * 365 * reprod_rate_j(LN(:,1) * del_M, f, pars_R);  % #/d, reproduction rate for 45 cm
  EN_W = TC_LN * 365 * reprod_rate_j((WN(:,1)/ (1 + f * w)).^(1/3), f, pars_R);  % #/d, reproduction rate for 45 cm
  Lw = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (aN(:,1) - tj)); % cm, total length at time
  EN_a = TC_LN * 365 * reprod_rate_j(Lw * del_M, f, pars_R);  % #/d, reproduction rate for 45 cm

  % T-dW data post metam
  EdL1 = rho_B * k_M * tempcorr(C2K(TdL1(:,1)), T_ref, T_A) * (Lw_i - 2.65);
  EdL2 = rho_B * k_M * tempcorr(C2K(TdL2(:,1)), T_ref, T_A) * (Lw_i - 10);
  
  % T-ah data
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  EaT_h = aUL(2,1) ./ tempcorr(C2K(Tah(:,1)), T_ref, T_A); % d, age at hatch at f and T

  % W-W0 data
  
  % a-L,Wd data for embryo
  a = [0; aL(:,1)]; % d, prepend age 0
  [a, LUH] = ode45(@dget_LUH, a, [1e-10 U_E0/ TC_aL 0], [], kap, v * TC_aL, k_J * TC_aL, g, L_m); 
  LUH(1,:) = [];                   % remove age 0
  ELw_e = LUH(:,1)/ del_Mj;        % cm, total length of embryo
  EWd_e = 1e6 * d_V * LUH(:,1).^3; % mug, embryo dry mass without yolk
  
  % pack to output
  prdData.WpX_2 = EpX_2;
  prdData.WpX_6 = EpX_6;
  prdData.WpX_10 = EpX_10;
  prdData.WpX_14 = EpX_14;
  prdData.WpX_18 = EpX_18;
  prdData.WpX_22 = EpX_22;
  prdData.WJO1_2 = EJO1_2;
  prdData.WJO1_6 = EJO1_6;
  prdData.WJO1_10 = EJO1_10;
  prdData.WJO1_14 = EJO1_14;
  prdData.WJO1_18 = EJO1_18;
  prdData.WJO1_22 = EJO1_22;
  prdData.WJO0_2 = EJO0_2;
  prdData.WJO0_6 = EJO0_6;
  prdData.WJO0_10 = EJO0_10;
  prdData.WJO0_14 = EJO0_14;
  prdData.WJO0_18 = EJO0_18;
  prdData.WJO0_22 = EJO0_22;
  prdData.LW_f = EWw_f;
  prdData.tL = ELw;
  prdData.LN = EN_L;
  prdData.WN = EN_W;
  prdData.aN = EN_a;
  prdData.TdL1 = EdL1;
  prdData.TdL2 = EdL2;
  prdData.Tah = EaT_h;
  prdData.aL = ELw_e;
  prdData.aW = EWd_e;
      
function [prdData, info] = predict_Pinctada_margaritifera(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if kap_X * mu_X / mu_E + kap_P * mu_X / mu_P > 1 || f_WdJO1 > 2
    prdData = []; info = 0; return
  end
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);               
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);        
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);      
  TC_tL = tempcorr(temp.tL, T_ref, T_A);        
  TC_tL3 = tempcorr(temp.tL3, T_ref, T_A);
  TC_tLC = tempcorr(temp.tLC4, T_ref, T_A);     
  TC_LJO = tempcorr(temp.LJO4, T_ref, T_A);
  TC_WdF = tempcorr(temp.WdF, T_ref, T_A);      
  TC_LF1  = tempcorr(temp.LF1, T_ref, T_A);
  TC_WdJO = tempcorr(temp.WdJO, T_ref, T_A);    
  TC_WdJO1 = tempcorr(temp.WdJO1, T_ref, T_A);  
  TC_WdJO2 = tempcorr(temp.WdJO2, T_ref, T_A);
  TC_WdJO3 = tempcorr(temp.WdJO3 , T_ref, T_A); 
  TC_WdJO4 = tempcorr(temp.WdJO4 , T_ref, T_A); 
  TC_WdJO5 = tempcorr(temp.WdJO5, T_ref, T_A);
  TC_xf_amph = tempcorr(temp.xf_amph, T_ref, T_A);  
  TC_xf_nitz = tempcorr(temp.xf_nitz, T_ref, T_A);  
  TC_xf_isoc = tempcorr(temp.xf_isoc, T_ref, T_A);
  
  %% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp]; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mb;               % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis
  L_j = L_m * l_j;                  % cm, structural length at metam
%   Lw_j = L_j/ del_M;                % cm, total length at metam
  Lw_j = L_j/ del_Mb;                % cm, total length at metam % note: using del_Mb
  aT_j = t_j/ k_M/ TC_aj;   % d, time since birth at metam
  
  s_M = L_j/ L_b;                   % -, acceleration factor
  
  % puberty 
  pars_tj = [g k l_T v_Hb v_Hj v_Hp]; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, physical length at puberty
  aT_p = t_p / k_M / TC_ap;         % d,  age at puberty at f and T
  
 % ultimate   
  pars_tj = [g k l_T v_Hb v_Hj v_Hp]; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_i = L_m * l_i;                  % cm, ultimate structural length
  Lw_i = L_i/ del_M;                % cm, ultimate physical length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction GSI
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
 
  %   % max gonado-somatic index of fully grown individual that spawns once per year see (4.89) of DEB3
  GSI = 365 * TC_GSI * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^2); % mol E_R/ mol W 
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
%   prdData.as = aT_s;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
%   prdData.Ls = Lw_s;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.GSI = GSI;
%   prdData.Ri = RT_i;
  
  
  %% Uni-variate data
 
  % Time-length post metam
  pars_tjj = [g k l_T v_Hb v_Hj v_Hj+1e-3]; 
  tvel = get_tj(pars_tjj,f_tL,[],tL(:,1)*k_M*TC_tL);
  EtL = L_m * tvel(:,4)/ del_M; % cm, shell length
  %
  tvel = get_tj(pars_tjj,f_tL3,[],tL3(:,1)*k_M*TC_tL3);
  EtL3 = L_m * tvel(:,4)/ del_M; % cm, shell length

  % Time-length for larvae at different f
  tvel = get_tj(pars_tjj,f_tLC1,[],tLC1(:,1)*k_M*TC_tLC);
  EtLC1 = L_m * tvel(:,4)/ del_M; % cm, shell length
  %
  tvel = get_tj(pars_tjj,f_tLC2,[],tLC2(:,1)*k_M*TC_tLC);
  EtLC2 = L_m * tvel(:,4)/ del_M; % cm, shell length
  %
  tvel = get_tj(pars_tjj,f_tLC3,[],tLC3(:,1)*k_M*TC_tLC);
  EtLC3 = L_m * tvel(:,4)/ del_M; % cm, shell length
  %
  tvel = get_tj(pars_tjj,f_tLC4,[],tLC4(:,1)*k_M*TC_tLC);
  EtLC4 = L_m * tvel(:,4)/ del_M; % cm, shell length

  % Length-weight
  ELWd4 =  (LWd4(:,1) * del_M).^3 * d_V * (1 + f_lagoon * w);    % g, dry weight
  ELWd41 = (LWd41(:,1) * del_M).^3 * d_V * (1 + f_lagoon * w);   % g, dry weight
  ELWd42 = (LWd42(:,1) * del_M).^3 * d_V * (1 + f_lagoon * w);   % g, dry weight
  ELWd43 = (LWd43(:,1) * del_M).^3 * d_V * (1 + f_lagoon * w);   % g, dry weight
  ELWd44 = (LWd44(:,1) * del_M).^3 * d_V * (1 + f_lagoon * w);   % g, dry weight
  ELWd45 = (LWd45(:,1) * del_M).^3 * d_V * (1 + f_lagoon * w);   % g, dry weight
  %
  ELWw = (LWw(:,1) * del_M).^3 * (1 + f_lagoon * w);  % g, wet weight
  
  % Flesh dry weight - O2 consumption (adult stage at several f and T)
  p_ref = p_Am * L_m^2;                                       % J/d, max assimilation power at max size
  % f= 0.1 - T = 24 C
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, ~, info] = get_tj(pars_tj, f_WdJO);
  L = (WdJO(:,1)/ d_V/ (1 + f_WdJO * w)) .^ (1/3);               % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f_WdJO, pars_R, l_b, l_j, l_p);  % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                  % mol/d: J_C, J_H, J_O, J_N in rows
  EWdJO = - J_M(3,:)' * TC_WdJO * 32e3 / 24;         % mg O2/h, O2 consumption
  % f= 0.9 - T = 24 C
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_WdJO1);
  L = (WdJO1(:,1) / d_V/ (1 + f_WdJO1 * w)) .^ (1/3);           % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f_WdJO1, pars_R, l_b, l_j, l_p);  % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                  % mol/d: J_C, J_H, J_O, J_N in rows
  EWdJO1 = - J_M(3,:)' * TC_WdJO1 * 32e3 / 24;         % mg O2/h, O2 consumption
  % f= 0.1 - T = 27 C
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_WdJO);
  L = (WdJO2(:,1)/ d_V/ (1 + f_WdJO * w)) .^ (1/3);            % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f_WdJO, pars_R, l_b, l_j, l_p);  % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                  % mol/d: J_C, J_H, J_O, J_N in rows
  EWdJO2 = - J_M(3,:)' * TC_WdJO2 * 32e3 / 24 ;         % mg O2/h, O2 consumption
  % f= 0.9 - T = 27 C
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_WdJO1);
  L = (WdJO3(:,1)/  d_V/ (1 + f_WdJO1 * w)) .^ (1/3);           % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f_WdJO1, pars_R, l_b, l_j, l_p);  % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                  % mol/d: J_C, J_H, J_O, J_N in rows
  EWdJO3 = - J_M(3,:)' * TC_WdJO3 * 32e3 / 24;         % mg O2/h, O2 consumption
  % f= 0.1 - T = 30 C
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_WdJO);
  L = (WdJO4(:,1)/  d_V/ (1 + f_WdJO * w)) .^ (1/3);           % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f_WdJO, pars_R, l_b, l_j, l_p);  % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                  % mol/d: J_C, J_H, J_O, J_N in rows
  EWdJO4 = - J_M(3,:)' * TC_WdJO4 * 32e3 / 24;         % mg O2/h, O2 consumption
  % f= 0.9 - T = 30 C
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_WdJO1);
  L = (WdJO5(:,1)/  d_V/ (1 + f_WdJO1 * w)) .^ (1/3);           % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f_WdJO1, pars_R, l_b, l_j, l_p);  % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                  % mol/d: J_C, J_H, J_O, J_N in rows
  EWdJO5 = - J_M(3,:)' * TC_WdJO5 * 32e3 / 24;         % mg O2/h, O2 consumption
  
  % Length - O2 consumption at larvae stage at several f
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tLC4);
  pACSJGRD = p_ref * scaled_power_j(LJO4(:,1) * del_Mb, f_tLC4, pars_R, l_b, l_j, l_p);  % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                  % mol/d: J_C, J_H, J_O, J_N in rows
  ELJO4 = - J_M(3,:)' * TC_LJO * 32e9 / 24;         % ng O2/h, O2 consumption
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tLC3);
  pACSJGRD = p_ref * scaled_power_j(LJO3(:,1) * del_Mb, f_tLC3, pars_R, l_b, l_j, l_p);  % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                  % mol/d: J_C, J_H, J_O, J_N in rows
  ELJO3 = - J_M(3,:)' * TC_LJO * 32e9 / 24;         % ng O2/h, O2 consumption
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tLC2);
  pACSJGRD = p_ref * scaled_power_j(LJO2(:,1) * del_Mb, f_tLC2, pars_R, l_b, l_j, l_p);  % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                  % mol/d: J_C, J_H, J_O, J_N in rows
  ELJO2 = - J_M(3,:)' * TC_LJO * 32e9 / 24;         % ng O2/h, O2 consumption
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tLC1);
  pACSJGRD = p_ref * scaled_power_j(LJO1(:,1) * del_Mb, f_tLC1, pars_R, l_b, l_j, l_p);  % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                  % mol/d: J_C, J_H, J_O, J_N in rows
  ELJO1 = - J_M(3,:)' * TC_LJO * 32e9 / 24;         % ng O2/h, O2 consumption
  
  % Dry weight - filtering rate
  EWdF  = TC_WdF * F_m * (WdF(:,1)/ d_V/ (1 + f_lagoon * w)).^(2/3) * (1 - f_lagoon) / 24; % l/h, clearance rate
    
  % Length - filtering rate for larvae
  ELF1   = TC_LF1 * F_mb * (LF1(:,1) * del_Mb).^2 * (1 - f_tLC1) /24; % l/h, clearance rate
  ELF2   = TC_LF1 * F_mb * (LF2(:,1) * del_Mb).^2 * (1 - f_tLC2) /24; % l/h, clearance rate
  ELF3   = TC_LF1 * F_mb * (LF3(:,1) * del_Mb).^2 * (1 - f_tLC3) /24; % l/h, clearance rate
  ELF4   = TC_LF1 * F_mb * (LF4(:,1) * del_Mb).^2 * (1 - f_tLC4) /24; % l/h, clearance rate
  
  % Feeding functional response data - Amphidiniumn
  L = 1.3; % cm, shell length
  K = J_X_Am/ F_m_amph;        % c-mol X/l, half-saturation coefficient
  xK = K * w_X; % g/l or mg/ml
  J_XLm_amph = s_M * p_Xm_amph / mu_X * w_X * 1e3 * (del_M * L)^2; % mg/d, maximum ingestion of a 1.3-cm P margaritifera at T_ref
  Exf_amph = TC_xf_amph * J_XLm_amph * xf_amph(:,1)./(xK + xf_amph(:,1)); % mg/d, ingestion of a 1.3-cm P margaritifera at T
  
  % Feeding functional response data - Nitzschia
  L = 1.3; % cm, shell length
  K = J_X_Am/ F_m_nitz;        % c-mol X/l, half-saturation coefficient
  xK = K * w_X; % g/l or mg/ml
  J_XLm_nitz = s_M * p_Xm_nitz / mu_X * w_X * 1e3 * (del_M * L)^2; % mg/d, maximum ingestion of a 1.3-cm P margaritifera at T_ref
  Exf_nitz = TC_xf_nitz * J_XLm_nitz * xf_nitz(:,1)./(xK + xf_nitz(:,1)); % mg/d, ingestion of a 1.3-cm P margaritifera at T
  
  % Feeding functional response data - Isochrysis
  L = 1.3; % cm, shell length
  K = J_X_Am/ F_m_isoc;        % c-mol X/l, half-saturation coefficient
  xK = K * w_X; % g/l or mg/ml
  J_XLm_isoc = s_M * p_Xm_isoc / mu_X * w_X * 1e3 * (del_M * L)^2; % mg/d, maximum ingestion of a 1.3-cm P margaritifera at T_ref
  Exf_isoc = TC_xf_isoc * J_XLm_isoc * xf_isoc(:,1)./(xK + xf_isoc(:,1)); % mg/d, ingestion of a 1.3-cm P margaritifera at T
  

 %%  pack to output
  prdData.tL = EtL;
  prdData.tL3 = EtL3;
  prdData.tLC4 = EtLC4;
  prdData.tLC3 = EtLC3;
  prdData.tLC2 = EtLC2;
  prdData.tLC1 = EtLC1;
  prdData.LWd4 = ELWd4;
  prdData.LWd41 = ELWd41;
  prdData.LWd42 = ELWd42;
  prdData.LWd43 = ELWd43;
  prdData.LWd44 = ELWd44;
  prdData.LWd45 = ELWd45;
  prdData.LWw = ELWw;
  prdData.WdJO = EWdJO;
  prdData.WdJO1 = EWdJO1;
  prdData.WdJO2 = EWdJO2;
  prdData.WdJO3 = EWdJO3;
  prdData.WdJO4 = EWdJO4;
  prdData.WdJO5 = EWdJO5;
  prdData.LJO1 = ELJO1;
  prdData.LJO2 = ELJO2;
  prdData.LJO3 = ELJO3;
  prdData.LJO4 = ELJO4;
  prdData.WdF = EWdF;
  prdData.LF1 = ELF1;
  prdData.LF2 = ELF2;
  prdData.LF3 = ELF3;
  prdData.LF4 = ELF4;
  prdData.xf_amph = Exf_amph;
  prdData.xf_nitz = Exf_nitz;
  prdData.xf_isoc = Exf_isoc;

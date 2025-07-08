function [prdData, info] = predict_Nitokra_spinipes(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);  vars_pull(par);
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC     = tempcorr(temp.ah, T_ref, T_A);  kT_M = k_M * TC;
  TC_JOi = tempcorr(temp.JOi, T_ref, T_A);
  TC_Tab = tempcorr(C2K(Tah(:,1)), T_ref, T_A);
  TC_Ttj = tempcorr(C2K(Ttj(:,1)), T_ref, T_A);
  TC_Ttp = tempcorr(C2K(Ttp(:,1)), T_ref, T_A);
  
  % zero-variate data at control conditions
  
  % life cycle
  pars_tjj = [g k l_T v_Hb v_Hj v_Hp];
  pars_tjp = [g k l_T v_Hb v_Hp v_Hp+1e-8];
  % gets scaled age and length at birth and metam
  [tau_j, ~, tau_b, l_j, ~, l_b, ~, ~, ~, info_j] = get_tj(pars_tjj, f);
  % gets scaled age and length at puberty
  [tau_p, ~, tau_b, l_p, ~, l_b, ~, ~, ~, info_p] = get_tj(pars_tjp, f);
  info = info_j == 1 && info_p == 1;
  
  % initial (used in R_i)
  pars_UE0 = [V_Hb; g; k_J; k_M; v];                % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial reserve
  
  % birth (start of acceleration)
  L_b  = L_m * l_b;                  % cm, structural length at birth at f (max structural length * scaled lenght at birth)
  Lw_b = L_b/ del_M;                 % cm, length at birth at f
  a_b  = tau_b/ k_M; aT_b  = a_b/ TC; % d, age at birth at f
  
  % metam (morphological only)
  L_j  = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                 % cm, length at metam at f
  aT_j = tau_j/ kT_M;                % d, age at metam at f
  
  % puberty (end of acceleration and growth and kappa-rule)
  L_p  = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                 % cm, length at puberty at f
  aT_p = tau_p/ kT_M;                % d, age at puberty at f
  Ww_p = 1e6 * L_p^3 * (1 + f * w);  % mug, wet weight at puberty
  
  % ultimate
  Wd_i = Ww_p * d_V;                 % mug, ultimate dry weight
  
  % reproduction (no kappa-rule)
  s_M  = L_p/ L_b;                                                          % -. acceleration factor
  RT_i = TC * kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate
  
  % respiration at/after puberty
  pTA_p = TC_JOi * f * p_Am * s_M * L_p^2;             % J/d, assimilation flux at/after puberty
  pTC_p = pTA_p;                                       % J/d, mobilization flux at/after puberty
  pTG_p = TC_JOi * 0;                                  % J/d, growth flux at/after puberty = 0
  pTs_p = TC_JOi * p_M * L_p^3;                        % J/d, somatic maintenance flux at/after puberty
  pTJ_p = TC_JOi * k_J * E_Hp;                         % J/d, maturity maintenance flux at/after puberty
  pTR_p = pTC_p - pTs_p - pTJ_p;                       % J/d, reproduction flux at/after puberty
  pTD_p = pTs_p + pTJ_p + (1-kap_R) * pTR_p;           % J/d, dissipation flux at/after puberty
  JT_M_p = -(n_M\ n_O) * eta_O * [pTA_p pTD_p pTG_p]'; % mol/d, mineral fluxes (J_C, J_H, J_O, J_N in rows)
  JT_O_p = -JT_M_p(3) * 24.4/ 24/ 1e-9/ Wd_i;          % nL O2/h/mug, dw specific O2 consumption (with 24.4 L O2/mol)
  
  % life span
  h3_W = f * h_a * v/ 6/ L_p;        % 1/d^3, cubed Weibull ageing rate
  aT_m = gamma(4/3)/ h3_W^(1/3)/ TC; % d, mean life span at T
  
  % pack to output
  prdData.am  = aT_m;            % d, life span
  prdData.ah  = (t_0 + a_b)/ TC; % d, age at hatch
  prdData.tj  = aT_j - aT_b;     % d, time since hatch at metam
  prdData.tp  = aT_p - aT_j;     % d, time since hatch at puberty
  prdData.Lh  = Lw_b;            % cm, length at hatch (assumed to equal length at birth)
  prdData.Lj  = Lw_j;            % cm, length at metam at f
  prdData.Lp  = Lw_p;            % cm, length at puberty at f
  prdData.Li  = Lw_p;            % cm, ultimate length (same as at puberty)
  prdData.Wdi = Wd_i;            % mug, ultimate dry weight (same as at puberty)
  prdData.JOi = JT_O_p;          % nL/h/mug, dry weight specific O2 consumption
  prdData.Ri  = RT_i;            % #/d, ultimate reproduction rate
  
  % uni-variate data
  
  % time-length
  [l_p, l_b] = get_lp(pars_tjp, f_tL);                  % overwrite l_p and l_b
  L_b  = L_m * l_b;                                     % cm, structural length at birth at f (max lenght * scaled lenght at birth)
  L_p  = L_m * l_p;                                     % cm, structural length at birth at f (max lenght * scaled lenght at birth)
  rT_j = TC * v * (f_tL/ L_b - 1/ L_m)/ (f_tL + g);     % 1/d, specific growth rate during accelleration
  ELw  = min(L_p, L_b * exp(tL(:,1) * rT_j/ 3))/ del_M; % cm, length
  
  % food-feeding rate, food in ug C/mL
  fX = Xtj(:,1) ./ (12e6*p_Am/kap_X/mu_X/F_m + Xtj(:,1)); % Holling type II functional response
  
  % food-development time and reproduction rate
  aT_jX = zeros(6, 1); % preallocating aT_jX for all food levels
  aT_pX = zeros(6, 1); % preallocating aT_pX for all food levels
  RT_iX = zeros(5, 1); % preallocating RT_iX for all food levels
  
  % get scaled time and length at birth at f = 1 (parents fed ad libitum)
  [t_b, l_b] = get_tb(pars_tjj([1 2 4]), 1); % overwrite t_b and l_b
  
  % birth
  aT_bX = t_b/ kT_M; % d, age at birth at f = 1 (parents fed ad libitum)
  
  for c = 1:length(fX) % loop for different fX
      % get scaled age at metam at f for all given X
      tau_j = get_tj(pars_tjj, fX(c), l_b);
      % get scaled age and length at puberty at f for all given X
      [tau_p, ~, tau_b, l_p, ~, l_b] = get_tj(pars_tjp, fX(c));
      % get initial reserve at f = 1 (parents fed ad libitum)(used in R_iX)
      E_0 = p_Am * initial_scaled_reserve(1, pars_UE0); % J, initial reserve
      
      % metam and puberty
      aT_jX(c) = tau_j/ kT_M; % d, age at metam at f for all given X
      aT_pX(c) = tau_p/ kT_M; % d, age at puberty at f for all given X
      
      % reproduction (no kappa-rule)
      if length(fX)~= 6 || c ~= 6 % reproduction data only available for the first five food levels (skip c = 6)
          L_p = L_m * l_p;        % cm, structural length at puberty at different f
          s_M = l_p/ l_b;         % -, acceleration factor
          RT_iX(c) = TC * kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate
      end
  end
  
  % temperature-development time
  tau_j = get_tj(pars_tjj, f_Tt); % overwrite t_j and t_b
  [tau_p, ~, tau_b, l_p, ~, l_b] = get_tj(pars_tjp, f_Tt); % overwrite t_p
  Ea_b = (t_0 + tau_b/ k_M) ./ TC_Tab;
  Et_j = (tau_j - tau_b)/ k_M ./ TC_Ttj;
  Et_p = (tau_p - tau_j)/ k_M ./ TC_Ttp;
  
  % pack to output
  prdData.tL  = ELw;
  prdData.Xtj = aT_jX - aT_bX;
  prdData.Xtp = aT_pX - aT_jX;
  prdData.XR  = RT_iX;
  prdData.Tah = Ea_b;
  prdData.Ttj = Et_j;
  prdData.Ttp = Et_p;
  
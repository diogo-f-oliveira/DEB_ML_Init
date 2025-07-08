function [prdData, info] = predict_Ictalurus_furcatus_JR(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); 
  vars_pull(par);  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % Customized filter
  if f_tL0  > 1.0 || f_tL0  < f_tL1 || f_tL1  < 0  
    info = 0;
    prdData = {};
    return
  end  

  % compute temperature correction factors
  TC_ab   = tempcorr(temp.ab, T_ref, T_A);
  TC_am   = tempcorr(temp.am, T_ref, T_A);
  TC_tL0 = tempcorr(temp.tL0, T_ref, T_A);
  TC_tL1 = tempcorr(temp.tL1, T_ref, T_A);
  TC_WwJO = tempcorr(temp.WwJO, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL1);
  s_M = l_j / l_b;
   
  % zero-variate data
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];                   % compose parameter vector
  U_E0 = initial_scaled_reserve(f_tL1, pars_UE0);      % d.cm^2, initial scaled reserve
  E_0 = U_E0 * p_Am;                                   % J, initial energy in the egg
  Wd_0 = E_0 * w_E / mu_E;                             % g, egg dry weight

  % birth
  L_b = L_m * l_b;                                     % cm, structural length at birth
  Lw_b = L_b / del_M;                                  % cm, physical length at birth
  aT_b = t_b / k_M/ TC_ab;                             % d,  age at birth

  % puberty 
  L_p  = L_m * l_p;                                    % cm, structural length at puberty at f_tL1J
  Lw_p = L_p / del_M;                                  % cm, total length at puberty at f_tL1J
  tT_p = (t_p - t_b)/ k_M/ TC_tL1;                     % d, time since birth at puberty at f_tL1J and T; or   aT_p = t_p/ k_M/ TC_ap; if assume age at puberty
  Ww_p = L_p^3 * (1 + f_tL1 * w);                      % g, somatic wet weight at puberty

  % ultimate; using f_tL0 instead of f_tL1 because the largest/oldest fish likely experienced higher food condition earlier in the invasion
  [~, ~, ~, ~, ~, ~, l_i, ~, ~, info] = get_tj(pars_tj, f_tL0);
  L_i  = L_m * l_i;                                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                                   % cm, ultimate physical length at f
  Ww_i = L_i.^3 * (1 + f_tL1 * w);                     % g, ultimate somatic wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];   % compose parameter vector at T
  RT_i = TC_tL1 * reprod_rate_j(L_i, f_tL1, pars_R);              % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];                            % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f_tL1, l_b);                            % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;                                         % d, mean life span at T
  
  % males
  % ultimate; using f_tL0 instead of f_tL1 because the largest/oldest fish likely experienced higher food condition earlier in the invasion
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [~, ~, ~, ~, ~, l_bm, l_im, ~, ~, info] = get_tj(pars_tjm, f_tL0);
  L_im  = L_mm * l_im;                                    % cm, ultimate structural length at f
  Lw_im = L_im/ del_M;                                    % cm, ultimate physical length at f
  Ww_im = L_im.^3 * (1 + f_tL1 * w_m);                    % g, ultimate somatic wet weight 
  % life span
  pars_tm = [g_m; l_T; h_am/ k_M^2; s_G];                  % compose parameter vector at T_ref
  t_mm = get_tm_s(pars_tm, f_tL1, l_bm);                  % -, scaled mean life span at T_ref
  aT_mm = t_mm/ k_M/ TC_am;                               % y, mean life span at T
  
  % pack to output
  prdData.ab   = aT_b;
  prdData.tp   = tT_p;
  prdData.am   = aT_m;
  prdData.amm  = aT_mm;
  prdData.Lb   = Lw_b;
  prdData.Lp   = Lw_p;
  prdData.Li  = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wd0  = Wd_0;
  prdData.Wwp  = Ww_p;
  prdData.Wwi  = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri   = RT_i;

  % uni-variate data
  
  % time-length females
  prdData.tL0 = get_Lw(f_tL0, TC_tL0, tL0, pars_tj, L_m, k_M, del_M); % James female Early
  prdData.tL1 = get_Lw(f_tL1, TC_tL1, tL1, pars_tj, L_m, k_M, del_M); % James female Latest
  
% length-weight females
  prdData.LWw0  = (LWw0(:, 1) * del_M).^3 * (1 + f_tL0 * w);    % g, expected wet weight at time
  prdData.LWw1  = (LWw1(:, 1) * del_M).^3 * (1 + f_tL1 * w);    % g, expected wet weight at time
  
% time-length males
  prdData.tL0_m = get_Lw(f_tL0, TC_tL0, tL0_m, pars_tjm, L_mm, k_M, del_M);  % James male Early
  prdData.tL1_m = get_Lw(f_tL1, TC_tL1, tL1_m, pars_tjm, L_mm, k_M, del_M);  % James male Latest
  
% length-weight males
  prdData.LWw0_m  = (LWw0_m(:, 1) * del_M).^3 * (1 + f_tL0 * w_m);    % g, expected wet weight at time
  prdData.LWw1_m  = (LWw1_m(:, 1) * del_M).^3 * (1 + f_tL1 * w_m);    % g, expected wet weight at time

% length-fecundity
  LN = reprod_rate_j(LN1(:,1) * del_M, f_tL1, pars_R);           % #/d, reprod rate
  prdData.LN1 = 365 * TC_tL1 * LN;                               % #, yearly ecundity at TC_tL1 

% length-GSI: GSI = gonad weight/ total weight
  L_gsi = LGSI1(:, 1) .* del_M;                                  % cm, structural length
  Ww = L_gsi.^3 * (1 + f_tL1 * w);                               % g, somatic wet weight
  LN = reprod_rate_j(L_gsi, f_tL1, pars_R);                      % #/d, reprod rate
  Ww0 = U_E0 * p_Am * w_E/ mu_E/ d_E;                            % g, Wet weight of an egg
  GWW = 365 * TC_tL1 * LN * Ww0;                                 % g, Wet weight of all eggs (i.e., the whole gonad)
  prdData.LGSI1 = GWW ./ (Ww + GWW);                             % -, estimate of the GSI

% Weight-oxygen consumption
% Females
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];          % compose pars; all fish are juveniles here
  p_ref = p_Am * L_m^2;                                                    % J/d, max assimilation power at max size
  L_O = (WwJO(:,1)/ (1 + f_tL1 * w)).^(1/3);                                   % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L_O, f_tL1, pars_pow, l_b, l_j, l_p);      % J/d, powers
  pADG = pACSJGRD(:, [1 7 5]);                                             % only need these columns
  pADG(:, 1) = 0;                                                          % set assim to zero because starving
  JO = pADG * eta_O';                                                      % organic fluxes
  O2M = (-n_M\n_O)';                                                       % matrix that converts organic to mineral fluxes
  JM = JO * O2M;                                                           % mineral fluxes; mol/d: J_C, J_H, J_O, J_N in columns
  prdData.WwJO = - JM(:, 3) * TC_WwJO * 32e3;                              % mg O2/d, O2 consumption 

% Males
  pars_pow = [kap; kap_R; g_m; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];        % compose pars; all fish are juveniles here
  [~, ~, ~, l_jm, l_pm, l_bm, ~, ~, ~, info] = get_tj(pars_tjm, f_tL1);
  p_ref = p_Am_m * L_mm^2;                                                 % J/d, max assimilation power at max size
  L_O = (WwJO_m(:,1)/ (1 + f_tL1 * w_m)).^(1/3);                           % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L_O, f_tL1, pars_pow, l_bm, l_jm, l_pm); % J/d, powers
  pADG = pACSJGRD(:, [1 7 5]);                                             % only need these columns
  pADG(:, 1) = 0;                                                          % set assim to zero because starving
  JO = pADG * eta_O';                                                      % organic fluxes
  O2M = (-n_M\n_O)';                                                       % matrix that converts organic to mineral fluxes
  JM = JO * O2M;                                                           % mineral fluxes; mol/d: J_C, J_H, J_O, J_N in columns
  prdData.WwJO_m = - JM(:, 3) * TC_WwJO * 32e3;                            % mg O2/d, O2 consumption 
end


function ELw = get_Lw(f, TC, tL, pars_tj, L_m, k_M, del_M)
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);  
  kT_M = k_M * TC;
  rT_j = rho_j * kT_M;
  rT_B = rho_B * kT_M;        
  L_b = L_m * l_b;
  L_j = L_m * l_j;
  L_i = L_m * l_i;
  tT_j = (t_j - t_b) / kT_M; % d, time since birth at puberty 
  L_bj = L_b * exp(tL((tL(:, 1) <= tT_j), 1) * rT_j / 3); % cm, struct length
  L_jm = L_i - (L_i - L_j) * exp(-rT_B * (tL((tL(:, 1) > tT_j), 1) - tT_j)); % cm, struct length
  ELw = [L_bj; L_jm]/ del_M;  % cm, fork length     
end

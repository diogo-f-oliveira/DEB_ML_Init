function [prdData, info] = predict_Crepidula_fornicata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_dLj = tempcorr(temp.dLj, T_ref, T_A);
  TC_JXm = tempcorr(temp.JXm, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_spr = tempcorr(temp.WdJC_spr, T_ref, T_A);
  TC_sum = tempcorr(temp.WdJC_sum, T_ref, T_A);
  TC_aut = tempcorr(temp.WdJC_aut, T_ref, T_A);
  TC_win = tempcorr(temp.WdJC_win, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i.^3 * (1 + f * w);      % g, ultimate wet weight at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % growth
  dLw_j = TC_dLj * rho_B * k_M * L_m * (l_i - l_j)/ del_M; % cm/d, growth rate at L_j

  % feeding rate
  JT_Xm = TC_JXm * p_Am * L_i^2/ kap_X/ Ww_i/ E_X; % cells/d.g, ultimate feeding rate

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.dLj = dLw_j;
  prdData.Ri = RT_i;
  prdData.JXm = JT_Xm;
  
  % uni-variate data
  
  % time-weight 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_tL; rT_B = rho_B * kT_M; Lw_i = L_m * l_i/ del_M;
  Lw = Lw_i - (Lw_i - Lw_0) * exp( - rT_B * tL(:,1)); % cm, expected length at time
  EL = (Lw - Lw_0)/ Lw_0; % -, length as fraction increase relative to L_0
  
  % length-weight
  EWd = (LWd(:,1) * del_M).^3 * d_V * (1 + f_tL * w); % g, dry weight
  EWs = (LWs(:,1) * del_M).^3 * d_s;                  % g, shell weight

  % flux-data
  f = f_J;
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B] = get_tj(pars_tj, f);
  p_ref = p_Am * L_m^2;        % max assimilation power at max size
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  % summer
  Wd = WdJC_sum(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;          % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_C_sum = 1e6 * TC_sum * J_M(1,:)'/ 24 ./ Wd;   % mumol C/h.g
  Wd = WdJO_sum(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;          % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_O_sum = 1e6 * TC_sum * J_M(3,:)'/ 24 ./ Wd;   % mumol O@/h.g
  Wd = WdJN_sum(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;          % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_N_sum = 1e6 * TC_sum * J_M(4,:)'/ 24 ./ Wd;  % mumol NH3/h.g
  % autumn
  Wd = WdJC_aut(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;          % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_C_aut = 1e6 * TC_aut * J_M(1,:)'/ 24 ./ Wd;   % mumol C/h.g
  Wd = WdJO_aut(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;          % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_O_aut = 1e6 * TC_aut * J_M(3,:)'/ 24 ./ Wd;   % mumol O/h.g
  Wd = WdJN_aut(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;         % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_N_aut = 1e6 * TC_aut * J_M(4,:)'/ 24 ./ Wd;  % mumol NH3/h.g
  % winter
  Wd = WdJC_win(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;         % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_C_win = 1e6 * TC_win * J_M(1,:)'/ 24 ./ Wd;   % mumol C/h.g
  Wd = WdJO_win(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;         % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_O_win = 1e6 * TC_win * J_M(3,:)'/ 24 ./ Wd;   % mumol O@/h.g
  Wd = WdJN_win(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;         % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_N_win = 1e6 * TC_win * J_M(4,:)'/ 24 ./ Wd;  % mumol NH3/h.g
  % spring
  T = 273 + 13.18; TC = tempcorr(T, T_ref, T_A); 
  Wd = WdJC_spr(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;         % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_C_spr = 1e6 * TC_spr * J_M(1,:)'/ 24 ./ Wd;   % mumol C/h.g
  Wd = WdJO_spr(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;         % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_O_spr = 1e6 * TC_spr * J_M(3,:)'/ 24 ./ Wd;   % mumol O/h.g
  Wd = WdJN_spr(:,1); L = (Wd/ d_V/ (1 + f * w)).^(1/3);
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_pow, l_b, l_j, l_p); % powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(:,1) = 0; % exclude assimilation
  J_O = eta_O * pADG;          % J_X, J_V, J_E, J_P in rows
  J_M = - n_M\n_O * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJT_N_spr = 1e6 * TC_spr * J_M(4,:)'/ 24 ./ Wd;  % mumol NH3/h.g

  % pack to output
  prdData.tL = EL;
  prdData.LWd = EWd;
  prdData.LWs = EWs;
  prdData.WdJC_spr = EJT_C_spr;
  prdData.WdJC_sum = EJT_C_sum;
  prdData.WdJC_aut = EJT_C_aut;
  prdData.WdJC_win = EJT_C_win;
  prdData.WdJO_spr = EJT_O_spr;
  prdData.WdJO_sum = EJT_O_sum;
  prdData.WdJO_aut = EJT_O_aut;
  prdData.WdJO_win = EJT_O_win;
  prdData.WdJN_spr = EJT_N_spr;
  prdData.WdJN_sum = EJT_N_sum;
  prdData.WdJN_aut = EJT_N_aut;
  prdData.WdJN_win = EJT_N_win;
  

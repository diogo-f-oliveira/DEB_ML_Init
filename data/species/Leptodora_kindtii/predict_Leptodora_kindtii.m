function [prdData, info] = predict_Leptodora_kindtii(par, data, auxData)
  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
   % customized filters for allowable parameters of the standard DEB model (std)
  % for other models consult the appropriate filter function.
  filterChecks = k * v_Hp >= f_tL^3 || ...         % constraint required for reaching puberty with f_tL
                 ~reach_birth(g, k, v_Hb, f_tL) ;   
             
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  
  % compute temperature correction factors
  TC_15 = tempcorr(temp.ab_15, T_ref, T_A);
  TC_20 = tempcorr(temp.ab_20, T_ref, T_A);
  TC_25 = tempcorr(temp.ab_25, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_5 = tempcorr(temp.LJO_5, T_ref, T_A);
  TC_10 = tempcorr(temp.LJO_10, T_ref, T_A);
  TC_22 = tempcorr(temp.LJO_22, T_ref, T_A);
  TC_30 = tempcorr(temp.LJO_30, T_ref, T_A);
  TC_TJO = tempcorr(C2K(TJO(:,1)), T_ref, T_A);
 
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  a_b = t_0 + t_b/ k_M;             % d, age at birth at T_ref
  a15_b = a_b/ TC_15;  a20_b = a_b/ TC_20; a25_b = a_b/ TC_25;               % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled structural length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [tau_pm, tau_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  aT_pm = tau_pm/ k_M/ TC_am;                 % d, age at puberty
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, total length at puberty
  Ww_pm = L_pm.^3 * (1 + f * w_m);     % g, wet weight at puberty
  L_im = f * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.ab_15 = a15_b;
  prdData.ab_20 = a20_b;
  prdData.ab_25 = a25_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL - l_T; % cm, lengths
  rT_B = TC_tL * k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate       
  ELw = (L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)))/ del_M; % cm, length at time
  
  % length-weight
  EWd = 1e6 * (LWd(:,1) * del_M).^3 * d_V * (1 + f_tL * w); % ng, dry weight
  
  % L-JO-data
  p_ref = p_Am * L_m^2;  % max assimilation power at max size
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  %
  L = LJO_5(:,1) * del_M; Wd = L.^3 * d_V * (1 + f_tL * w); % g, dry weight
  pACSJGRD = p_ref * scaled_power(L, f_tL, pars_pow, l_b, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';   % assimilation, dissipation, growth power
  pADG(1,:) = 0; % exclude contributions from assimulation
  J_O = eta_O * pADG;            % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;       % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJ5_O = - 1e4 * TC_5 .* J_M(3,:)'/ 24/ 24.4 ./ Wd;  % ml/h.g,litre O2-use per g dry per h
  %
  L = LJO_10(:,1) * del_M; Wd = L.^3 * d_V * (1 + f_tL * w); % g, dry weight
  pACSJGRD = p_ref * scaled_power(L, f_tL, pars_pow, l_b, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';   % assimilation, dissipation, growth power
  pADG(1,:) = 0; % exclude contributions from assimulation
  J_O = eta_O * pADG;            % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;       % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJ10_O = - 1e4 * TC_10 .* J_M(3,:)'/ 24/ 24.4 ./ Wd;  % ml/h.g,litre O2-use per g dry per h
  %
  L = LJO_15(:,1) * del_M; Wd = L.^3 * d_V * (1 + f_tL * w); % g, dry weight
  pACSJGRD = p_ref * scaled_power(L, f_tL, pars_pow, l_b, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';   % assimilation, dissipation, growth power
  pADG(1,:) = 0; % exclude contributions from assimulation
  J_O = eta_O * pADG;            % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;       % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJ15_O = - 1e4 * TC_15 .* J_M(3,:)'/ 24/ 24.4 ./ Wd;  % ml/h.g,litre O2-use per g dry per h
  %
  L = LJO_20(:,1) * del_M; Wd = L.^3 * d_V * (1 + f_tL * w); % g, dry weight
  pACSJGRD = p_ref * scaled_power(L, f_tL, pars_pow, l_b, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';   % assimilation, dissipation, growth power
  pADG(1,:) = 0; % exclude contributions from assimulation
  J_O = eta_O * pADG;            % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;       % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJ20_O = - 1e4 * TC_20 .* J_M(3,:)'/ 24/ 24.4 ./ Wd;  % ml/h.g,litre O2-use per g dry per h
  %
  L = LJO_22(:,1) * del_M; Wd = L.^3 * d_V * (1 + f_tL * w); % g, dry weight
  pACSJGRD = p_ref * scaled_power(L, f_tL, pars_pow, l_b, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';   % assimilation, dissipation, growth power
  pADG(1,:) = 0; % exclude contributions from assimulation
  J_O = eta_O * pADG;            % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;       % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJ22_O = - 1e4 * TC_22 .* J_M(3,:)'/ 24/ 24.4 ./ Wd;  % ml/h.g,litre O2-use per g dry per h
  %
  L = LJO_25(:,1) * del_M; Wd = L.^3 * d_V * (1 + f_tL * w); % g, dry weight
  pACSJGRD = p_ref * scaled_power(L, f_tL, pars_pow, l_b, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';   % assimilation, dissipation, growth power
  pADG(1,:) = 0; % exclude contributions from assimulation
  J_O = eta_O * pADG;            % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;       % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJ25_O = - 1e4 * TC_25 .* J_M(3,:)'/ 24/ 24.4 ./ Wd;  % ml/h.g,litre O2-use per g dry per h
  %
  L = LJO_30(:,1) * del_M; Wd = L.^3 * d_V * (1 + f_tL * w); % g, dry weight
  pACSJGRD = p_ref * scaled_power(L, f_tL, pars_pow, l_b, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';   % assimilation, dissipation, growth power
  pADG(1,:) = 0; % exclude contributions from assimulation
  J_O = eta_O * pADG;            % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;       % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJ30_O = - 1e4 * TC_30 .* J_M(3,:)'/ 24/ 24.4 ./ Wd;  % ml/h.g,litre O2-use per g dry per h

  % warning 1e4 is only based on mis-match with MoshCumm69 data
  
  % T-L data for Lw = 1.1 mm
  pACSJGRD = p_ref * scaled_power(1.1 * del_M, f_tL, pars_pow, l_b, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';   % assimilation, dissipation, growth power
  pADG(1,:) = 0; % exclude contributions from assimulation  
  J_O = eta_O * pADG;            % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;       % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJ_O = - 1e4 * 1e7 * TC_TJO .* J_M(3,:)'/ 24/ 24.4; % 10^-4 ml/h, O2-use
  % warning 1e4 is only based on mis-match with MoshCumm69 data
  
  % pack to output
  prdData.tL = ELw;
  prdData.LWd = EWd;
  prdData.LJO_5 = EJ5_O;
  prdData.LJO_10 = EJ10_O;
  prdData.LJO_15 = EJ15_O;
  prdData.LJO_20 = EJ20_O;
  prdData.LJO_22 = EJ22_O;
  prdData.LJO_25 = EJ25_O;
  prdData.LJO_30 = EJ30_O;
  prdData.TJO = EJ_O;
  
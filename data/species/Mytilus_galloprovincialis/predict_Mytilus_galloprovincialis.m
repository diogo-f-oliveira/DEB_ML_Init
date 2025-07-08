function [prdData, info] = predict_Mytilus_galloprovincialis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if T_L > T_ref || T_H < T_ref
      info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  pars_TC = [T_A T_L T_H T_AL T_AH];
  TC_ab = tempcorr(temp.ab, T_ref, pars_TC);
  TC_aj = tempcorr(temp.aj, T_ref, pars_TC);
  TC_ap = tempcorr(temp.ap, T_ref, pars_TC);
  TC_am = tempcorr(temp.am, T_ref, pars_TC);
  TC_GSI_f = tempcorr(temp.GSI_f, T_ref, pars_TC);
  TC_tL_subt = tempcorr(temp.tL_subt, T_ref, pars_TC);
  TC_TjOw = tempcorr(C2K(TjOw(:,1)), T_ref, pars_TC);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp]; 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mb;               % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * ome); % g, dry weight at birth
  aT_b = tau_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
%   Wd_j = L_j^3 * d_V * (1 + f * ome); % g, dry weight at metam
%   Ww_j = L_j^3 * (1 + f * ome);       % g, wet weight at metam
  aT_j = (tau_j - tau_b)/ k_M/ TC_aj;   % d, time since birth at metam
  
  s_M = L_j/ L_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f_sub
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f_sub
  Ww_p = L_p^3 * (1 + f * ome);       % g, wet weight at puberty at f_sub 
  
  tT_p = (tau_p - tau_b)/ k_M/ TC_ap;   % d, time since birth at puberty at f and T

  % ultimate 
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight at f  

  % reproduction GSI
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  GSI_f = TC_GSI_f * 365 * k_M * g/ f.^3./ (f + kap * g * y_V_E);  % see eqn 2 LikaKooy2014
  GSI_f = GSI_f.* ((1 - kap) * f.^3 - ...
           k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol ome, gonado-somatic index at f
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  a_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = a_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI_f = GSI_f;
  
% uni-variate data

  % t-L data, Ancona (Italy)
  TC = TC_tL_subt;
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, fsubt);
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;      
  L_b = l_b * L_m; L_i = l_i * L_m; 
  tT_j = (tau_j - tau_b)/ k_M/ TC;   % d, time since birth at metam
  L_bj = L_b * exp(tL_subt((tL_subt(:,1) <= tT_j),1) * rT_j/ 3);  
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_subt((tL_subt(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw_subt = [L_bj; L_jm]/ del_M;    % cm, physical length
  
  % length-weight
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight
  
  % temperature - specific respiration in water
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  Lw = 3.5; % cm, physical length
  Wd = (Lw * del_M).^3 * d_V * (1 + ome * f) ; % g. dry weight
  L = Lw * del_M; % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_R, l_b, l_j, l_p);   % J/d, powers
  pACSJGRD(:, 1) = 0;   % Assimilation is zero for starved animals
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                % mol/d: J_C, J_H, J_O, J_N in rows
  EjT_Ow = - J_M(3,:)' * TC_TjOw * 24.4e3/ 24/ Wd;                     % ml O2/h.g, specific O2 consumption

  
  % pack to output
  prdData.tL_subt = ELw_subt;
  prdData.LW = EWw_L;
  prdData.TjOw = EjT_Ow;
  
  
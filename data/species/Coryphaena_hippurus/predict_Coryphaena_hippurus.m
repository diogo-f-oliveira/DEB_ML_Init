function [prdData, info] = predict_Coryphaena_hippurus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); kT_M = TC * k_M;
  
% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % L15 & L30, assuming that a_j > 30
  rT_j = TC * rho_j * k_M;  % 1/d, exponential growth rate
  Lw_15 = Lw_b * exp(15 * rT_j/3); % cm, total length at 15 d
  Lw_30 = Lw_b * exp(30 * rT_j/3); % cm, total length at 30 d

  % metamorphosis
  L_j = l_j * L_m; Lw_j= L_j/ del_M; % cm, length at metam
  aT_j = t_j/ kT_M;                  % d, age at metamorphosis at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ kT_M;                 % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_MF;               % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Amm = z_m * p_M/ kap;          % J/d.cm^2, {p_Am} spec assimilation flux for male
  E_mm = p_Amm/ v;                 % J/cm^3, reserve capacity [E_m] for male
  m_Emm = y_E_V * E_mm/ E_G;       % mol/mol, reserve capacity for male
  gm = E_G/ (kap * E_mm);          % -, energy investment ratio for male
  wm = m_Emm * w_E/ w_V;           % -, contribution of reserve to weight for male
  L_mm = v/ k_M/ gm;               % cm, maximum length for male
  pars_tjm = [gm k l_T v_Hb v_Hj v_Hp];
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.L15 = Lw_15;
  prdData.L30 = Lw_30;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length

  % lenth-weight
  EWw_f = (LW_f(:,1) * del_MF).^3 * (1 + f * w);
  EWw_m = (LW_m(:,1) * del_MF).^3 * (1 + f * wm);
  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
function [prdData, info] = predict_Chelidonichthys_lucerna(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  if E_Hh >= E_Hb
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  
% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC;              % d, age at hatch at f and T
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_M;               % cm, S-V length at hatch at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % males
  p_Amm = z_m * p_M/ kap;              % J/d.cm^2, {p_Am} max spec assimilation flux for males
  E_mm = p_Amm/ v;                     % J/cm^3, [E_m] reserve capacity for males
  g_m = E_G/ kap/ E_mm;                % -, energy investment ratio for males
  m_Emm = y_E_V * E_mm/ E_G;           % mol/mol, reserve capacity 
  w_m = m_Emm * w_E/ w_V;              % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, maximum structural length for males
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tjm, f);
  Lw_pm = l_p * L_mm/ del_M;           % cm, total length at puberty for male
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lp_m = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-length post metam 
  rT_B = TC * rho_B * k_M; tT_j = (t_j - t_b)/ k_M/ TC;
  ELw = (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j)))/ del_M; 
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN = 365 * TC * reprod_rate_j(LN(:,1) * del_M, f, pars_R);                 % #/d, ultimate reproduction rate at T
 
  % length-weight
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w_m);             % g, expected wet weight at time
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w);               % g, expected wet weight at time

  % pack to output
  prdData.tL = ELw;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  prdData.LN = EN;
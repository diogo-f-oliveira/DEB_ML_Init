function [prdData, info] = predict_Cyclopterus_lumpus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  if E_Hh >= E_Hb
      info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_tb = tempcorr(temp.tb, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  tT_b = (t_b/ k_M - a_h)/ TC_tb;    % d, age at birth at f and T
  
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
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % males
  p_Amm = z_m * p_M/ kap;              % J/d.cm^2, {p_Am} max spec assimilation flux for males
  E_mm = p_Amm/ v;                     % J/cm^3, [E_m] reserve capacity for males
  g_m = E_G/ kap/ E_mm;                % -, energy investment ratio for males
  m_Emm = y_E_V * E_mm/ E_G;           % mol/mol, reserve capacity 
  w_m = m_Emm * w_E/ w_V;              % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, maximum structural length for males
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tjm, f);
  Lw_pm = l_p * L_mm/ del_M; Lw_im =  l_i * L_mm/ del_M;   % cm, total length at puberty, ulitmate for male
  
  % pack to output
  prdData.ah = aT_h;
  prdData.tb = tT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lp_m = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Li_m = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
   
  % uni-variate data
  
  % Ww-dWw data
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_WdW);
  r_j = rho_j * k_M; r_B = rho_B * k_M;    % 1/d, exponential, von Bert growth rate
  L_j = L_m * l_j;  L_i = L_m * l_i;       % cm, structural length at metam
  %
  TC = tempcorr(C2K(3), T_ref, T_A);       % -, Temperature Correction factor
  L = (WdW_4(:,1)/ (1 + f_WdW * w)).^(1/3);    % cm, structural length
  EdW_4 = TC * 100 * ((L <= L_j) * r_j + (L > L_j) * 3 * r_B .* (L_i ./ L - 1));  %/d, relative growth
  %
  TC = tempcorr(C2K(7), T_ref, T_A);       % -, Temperature Correction factor
  L = (WdW_7(:,1)/ (1 + f_WdW * w)).^(1/3);    % cm, structural length
  EdW_7 = TC * 100 * ((L <= L_j) * r_j + (L > L_j) * 3 * r_B .* (L_i ./ L - 1));  %/d, relative growth
  %
  TC = tempcorr(C2K(10), T_ref, T_A);      % -, Temperature Correction factor
  L = (WdW_10(:,1)/ (1 + f_WdW * w)).^(1/3);   % cm, structural length
  EdW_10 = TC * 100 * ((L <= L_j) * r_j + (L > L_j) * 3 *  r_B .* (L_i ./ L - 1)); %/d, relative growth
  %
  TC = tempcorr(C2K(13), T_ref, T_A);      % -, Temperature Correction factor
  L = (WdW_13(:,1)/ (1 + f_WdW * w)).^(1/3);   % cm, structural length
  EdW_13 = TC * 100 * ((L <= L_j) * r_j + (L > L_j) * 3 * r_B .* (L_i ./ L - 1)); %/d, relative growth

  % time-length 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  rT_B = TC_tL * rho_B * k_M; rT_j = TC_tL * rho_j * k_M; tT_j = (t_j - t_b)/ k_M/ TC_tL;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL(:,1) * rT_j/ 3) .* (tL(:,1) < tT_j);
  L = L + (tL(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j))); % cm, expected length at time
  ELw = L/ del_M;

  % pack to output
  prdData.WdW_4 = EdW_4;
  prdData.WdW_7 = EdW_7;  
  prdData.WdW_10 = EdW_10;  
  prdData.WdW_13 = EdW_13;
  prdData.tL = ELw;
function [prdData, info] = predict_Eurycea_lucifuga(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_10 = tempcorr(temp.ab10, T_ref, T_A);
  TC_15 = tempcorr(temp.ab15, T_ref, T_A);
  TC_21 = tempcorr(temp.ab21, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0, U_Hh], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(end,1);                  % age at hatch at T_ref
  aT_h10 = a_h/ TC_10; aT_h15 = a_h/ TC_15; aT_h21 = a_h/ TC_21; % d, age at hatch  T
  L_h = aUL(end,3);                  % cm, structural length at f
  Lw_h = L_h/ del_M;                 % cm, total length at hatch at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  a_b = t_b/ k_M;                   % d, age at birth at T_ref
  aT_b10 = a_b/ TC_10; aT_b15 = a_b/ TC_15; aT_b21 = a_b/ TC_21; % d, age at hatch  T


  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_15 * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T
  
  % change in TL at birth
  r_B = k_M/ 3/ (1 + f/ g);             % 1/d, von Bert growth rate
  dLw_b = r_B * (L_m - L_b)/ del_M;     % cm/d, change in total length at birth at T_ref
  dLw_b10 = dLw_b * TC_10; dLw_b15 = dLw_b * TC_15; dLw_b21 = dLw_b * TC_21; % cm/d, change in total length at birth at T
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_15;               % d, mean life span at T
  
  % males
  pars_tpm = [g; k; l_T; v_Hb; v_Hpm];             % compose parameter vector
  [l_pm, l_bm] = get_lp(pars_tpm, f);              % -, scaled lengths at f
  L_pm = L_m * l_pm;                               % cm, struc length at puberty
  Lw_pm = L_pm/ del_M;                             % cm, total length at puberty

  % pack to output
  prdData.ah10 = aT_h10;
  prdData.ah15 = aT_h15;
  prdData.ah21 = aT_h21;
  prdData.ab10 = aT_b10;
  prdData.ab15 = aT_b15;
  prdData.ab21 = aT_b21;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.dLb10 = dLw_b10;
  prdData.dLb15 = dLw_b15;
  prdData.dLb21 = dLw_b21;
  
  
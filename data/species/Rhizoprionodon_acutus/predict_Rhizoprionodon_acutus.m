function [prdData, info] = predict_Rhizoprionodon_acutus(par, data, auxData)  
 
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth 
  aT_b = t_b/ kT_M;                 % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  aT_p = t_p/ kT_M;                 % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Amm = z_m * p_M/ kap;          % J/d.cm^2, {p_Am} max spec assimilation flux for male
  E_mm = p_Amm/ v;                 % J/cm^3, [E_m] reserve capacity for male
  m_Emm = y_E_V * E_mm/ E_G;       % mol/mol, reserve capacity for males
  g_m = E_G/ kap/ E_mm;            % -, energy investment ratio for male
  L_mm = v/ k_M/ g_m;              % cm, maximum structural length
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_pm t_b l_pm l_b info] = get_tp(pars_tpm, f, l_b); % -, scaled length at birth at f
  L_pm = L_mm * l_pm;             % cm, structural length at puberty at f
  Lw_pm = L_pm/ del_M;            % cm, physical length at puberty at f
  Lw_im = L_mm/ del_M;          % cm, ultimate physical length at f for male

  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp_f = Lw_p;
  prdData.Lp_m = Lw_pm;
  prdData.Li_f = Lw_i;
  prdData.Li_m = Lw_im;
  prdData.Wwi_f = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data

  % time-length for embryo
  par_UE0 = [V_Hb/ TC; g; k_J * TC; k_M * TC; v * TC]; % pars for initial scaled reserve
  UE0 = initial_scaled_reserve(f, par_UE0); LUH0 = [1e-6; UE0; 0];
  t = tL_e(:,1) - t_0; t = [0; t(t>0)]; % d, age
  [t LUH] = ode45(@dget_LUH, t, LUH0, [], kap, v * TC, k_J * TC, g, L_m);
  Lw = LUH(:,1)/ del_M; % cm, total length of embryo
  Lw(1) = []; n = size(tL_e,1); n_a = size(Lw,1); ELw_e = [zeros(n - n_a,1); Lw]; 
  
  % time-length
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tpm(pars_tp, f, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tpm(pars_tpm, f, [t_b, f*z/z_m, l_b*z/z_m], tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 


  %% pack to output
  prdData.tL_m = ELw_m;
  prdData.tL_f = ELw_f;
  prdData.tL_e = ELw_e;

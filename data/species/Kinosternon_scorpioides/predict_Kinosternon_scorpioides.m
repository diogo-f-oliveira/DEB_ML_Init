function [prdData, info] = predict_Kinosternon_scorpioides(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_tLe = tempcorr(temp.tLe, T_ref, T_A); 
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % start
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  E_0 = U_E0 * p_Am;
  Ww_0 = w_E/ mu_E * E_0/ d_E; % g, wet weight of egg

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, carapace length
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Ww_i = L_i^3 * (1 + f * w);       % g,  ultimate wet weight
    
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m; L_im = f * L_mm; % cm, max struct length
  Lw_im = L_im/ del_M;                 % cm, carapace length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m k l_T v_Hb v_Hpm];   % compose par-vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_bm = l_bm * L_mm;  % cm, struct length, birth & ultimate
  Lw_pm = l_pm * L_mm/ del_M;          % carapace length at puberty
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Ww0 = Ww_0;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % univar data
  
  % time-length
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = f_tL * L_m;
  rT_B = kT_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  ELw = (L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)))/ del_M; % cm, SVL 

  % time-embryo length
  a = [0; tLe(:,1)-t_0]; 
  [a LUH] = ode45(@dget_LUH, a, [1e-10 U_E0/TC_tLe 0], [], kap, v*TC_tLe, k_J*TC_tLe, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); % cm, structural length
  ELw_e = L/ del_M; % cm, physical length
  
  % pack to output
  prdData.tL = ELw;
  prdData.tLe = ELw_e;


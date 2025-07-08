function [prdData, info] = predict_Naja_kaouthia(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, carpace length
  a_b = t_b/ k_M; aT_b = a_b/ TC;   % d, age at birth
  
  % puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, carpace length at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carpace length
    
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  tT_pm = (t_pm - t_bm)/ k_M/ TC;      % d, time since birth at puberty
  L_bm = L_mm * l_bm; Lw_bm = L_bm/ del_M; % cm, struc, carpace length at birth
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, struc, carpace length at puberty
  L_im = f * L_mm; Lw_im = L_im/ del_M; % cm, ultimate struct, carpace length

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length * length-change in length
  rT_B = TC * k_M/ 3/ (1 + f/ g);
  EdLw_f = rT_B * (Lw_i - LdL_f(:,1));
  %
  rT_Bm = TC * k_M/ 3/ (1 + f/ g_m);
  EdLw_m = rT_Bm * (Lw_im - LdL_m(:,1));
  
  % time-length for embryo                                        
  par_UE0 = [V_Hb; g; k_J; k_M; v]; U_E0 = initial_scaled_reserve(1, par_UE0)/ TC;
  [t LUH] = ode45(@dget_LUH, [1e-10; tLe(:,1)], [1e-10; U_E0; 1e-10], [], kap, TC * v, TC * k_J, g, L_m);
  LUH(1,:) = []; ELw_e = LUH(:,1)/ del_M; 

  % length-weight
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w_m); % g, wet weight
  
  % pack to output
  prdData.LdL_f = EdLw_f;
  prdData.LdL_m = EdLw_m;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  prdData.tLe = ELw_e;
    
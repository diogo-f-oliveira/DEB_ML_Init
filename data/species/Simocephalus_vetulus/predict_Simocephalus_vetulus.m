function [prdData, info] = predict_Simocephalus_vetulus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tL, T_ref, T_A); kT_M = TC * k_M;
  TC_tp = tempcorr(C2K(Ttp(:,1)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled length at birth at f
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = tau_b/ kT_M;               % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  t_p = (tau_p - tau_b)/ k_M;       % d, time since birth at puberty
  Wd_p = L_p^3 * d_V * (1 + f * ome); % g, dry weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = 1e6 * L_i^3 * d_V * (1 + f * w); % mug, ultimate dry weight
   
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i,f, pars_R); % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  a_m = tau_m/ k_M;                     % d, mean life span at T_ref

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b] = get_tp(pars_tpm, f);
  L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M; % cm, total length at puberty
  Ww_pm = L_pm.^3 * (1 + f * w_m);     % g, wet weight at puberty
  L_im = f * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
 
  % uni-variate data
  
  % time-length-data
  tvel = get_tp(pars_tp, f_tL1, [], tL(:,1)*kT_M);
  ELw_1 = L_m * tvel(:,4)/del_M; % cm, carapace length
  %
  tvel = get_tp(pars_tp, f_tL2, [], tL(:,1)*k_M);
  ELw_2 = L_m * tvel(:,4)/del_M; % cm, carapace length
  
  % temperature-time since birth at puberty
  EtT_p = t_p ./ TC_tp; 
 
  % temperature-life span
  TC = tempcorr(C2K(Ttp(:,1)), T_ref, T_A); % -, Temperature Correction factor for a_m; ONLY WORK WITH T_A
  EaT_m = a_m ./ TC_tp; 

  % pack to output
  prdData.tL = [ELw_1 ELw_2];
  prdData.Ttp = EtT_p;
  prdData.Tam = EaT_m;
  
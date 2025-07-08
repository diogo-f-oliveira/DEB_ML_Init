function [prdData, info] = predict_Acipenser_oxyrinchus(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   

%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_tpm = tempcorr(temp.tp_m, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth of foetus at f and T

  % puberty 
  tT_p = (tau_p - tau_b)/ k_M/ TC_tp; % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

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
  L_im = f * L_mm; Lw_im = L_im/ del_M; % cm, ultimate length
  pars_tpm = [g k l_T v_Hb v_Hpm];
  [tau_pm, tau_bm] = get_tp(pars_tpm, f);
  tT_pm = (tau_pm - tau_bm)/ k_M/ TC_tpm;

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tp_m = tT_pm;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Li_m = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
    
  % t-Ww-data
  rT_B = TC_tW * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  L    = L_i - (L_i - L_b) * exp(- rT_B * tW(:,1)); % cm, structural length
  EWw  = L.^3 * (1 + f * w); % g, wet weight
  ELw  = L/ del_M; % cm, total length
  ELW  = (LW(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight

  % pack to output
  prdData.tW = EWw;
  prdData.tL = ELw;
  prdData.LW = ELW;
     
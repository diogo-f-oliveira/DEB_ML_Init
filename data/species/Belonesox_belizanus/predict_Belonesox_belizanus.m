function [prdData, info] = predict_Belonesox_belizanus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
 
    
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
    
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b,  info] = get_tp(pars_tp, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
    
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_Mm/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  k_Mm = p_Mm/ E_G; kT_Mm = TC * k_Mm; % 1/d, maint rate coeff 
  k_m = k_Mm/ k_J;                     % -, maint ration
  L_mm = v/ k_Mm/ g_m;                 % cm, max struct length
  L_im = f * L_mm;  % cm, ultimate struc length
  pars_tpm = [g_m k_m l_T v_Hb v_Hpm];
  [tau_pm, tau_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, length at puberty
  L_im = L_mm * f; Lw_im = L_im/ del_M; % cm, ultimate length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate weight
  tT_pm = (tau_pm - tau_bm)/ kT_Mm;    % d, time since birth at puberty
  
  % pack to output
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  
  % univatiate data
  % length - fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  EN = 40 * TC * reprod_rate(LN(:,1) * del_M, f, pars_R);  % #, litter size

  % pack to output
   prdData.LN = EN;
   
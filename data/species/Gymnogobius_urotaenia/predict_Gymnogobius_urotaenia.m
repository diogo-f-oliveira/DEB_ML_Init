function [prdData, info] = predict_Gymnogobius_urotaenia(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b,  l_p, l_b, info] = get_tp(pars_tp, f);
  

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth 
  aT_b = t_b/ kT_M;                 % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * f;                   % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;               % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];    % pack parameters

  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;

  % uni-variate data
  
  % time-length/weight 
  % females
  [t_p, t_b, l_p, l_b] = get_tp(pars_tp, f);
  L_b = L_m * l_b;  L_i = L_m * f; rT_B = kT_M/ 3/ (1 + f/ g);
  L = L_i - (L_i - L_b) * exp( - rT_B * tL_f(:,1)); % cm, struc length
  ELw_f = L/ del_M; % cm, total length
  EWw_f = L.^3 * (1 + f * w); % g, wet weight
  % males
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_bm = L_mm * l_bm;  L_im = L_mm * f; rT_Bm = kT_M/ 3/ (1 + f/ g_m);
  L = L_im - (L_im - L_bm) * exp( - rT_Bm * tL_m(:,1)); % cm, struc length
  ELw_m = L/ del_M; % cm, total length
  EWw_m = L.^3 * (1 + f * w_m); % g, wet weight
  
  % length-weight
  EWw_fL = (LW_f(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  EWw_mL = (LW_m(:,1) * del_M).^3 * (1 + f * w_m); % g, wet weight
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  EN = TC * 365 * reprod_rate(LN(:,1) * del_M, f, pars_R); % #, fecundity

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
  prdData.LW_f = EWw_fL;
  prdData.LW_m = EWw_mL;
  prdData.LN = EN;

function [prdData, info] = predict_Nerodia_sipedon(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  pars_T = T_A;
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC = tempcorr(temp.ab, T_ref, pars_T);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth     

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  L_p = l_p * L_m;                  % cm, struc length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f


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
  L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  Lw_im = L_im/ del_M;                 % cm, ultimate SVL

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;

  % univar data
  % SVL-change in SVL
  Lw_i = f_tL * L_m/ del_M; 
  rT_B = TC * k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  EdLw_f = rT_B * (Lw_i - LdL_f(:,1)); % cm/d, change in SVL
  %
  Lw_im = f_tL * L_mm/ del_M; 
  rT_Bm = TC * k_M/ 3/ (1 + f_tL/ g_m); % 1/d, von Bert growth rate
  EdLw_m = rT_Bm * (Lw_im - LdL_m(:,1)); % cm/d, change in SVL

  % length-weight
  EWw_f = (LW_f(:,1)*del_M).^3 * (1 + f_tL * w); % g, weight
  EWw_m = (LW_m(:,1)*del_M).^3 * (1 + f_tL * w_m); % g, weight
  
  % length-yearly fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN = TC * 365 * reprod_rate(LN(:,1)*del_M, f_tL, pars_R);  % #, yearly fecundity

  % pack to output
  prdData.LdL_f = EdLw_f;
  prdData.LdL_m = EdLw_m;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  prdData.LN = EN;

end

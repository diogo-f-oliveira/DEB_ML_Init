function [prdData, info] = predict_Phoca_largha(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ kT_M;           % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
%   Lw_x = L_x/ del_M;                % cm, total length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ kT_M;          % d, time since birth at weaning
  
  % puberty 
%   L_p = L_m * l_p;                  % cm, structural length at puberty at f
%   Lw_p = L_p/ del_M;                % cm, total length at puberty at f
%   Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty at f
  tT_p = (t_p - t_b)/ kT_M;           % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);      % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
 
  % males
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_txm = [g k l_T v_Hb v_Hx v_Hpm]; 
  [t_pm, t_xm, t_bm, l_pm, l_xm, l_bm, info] = get_tx(pars_txm, f);
  tT_pm = (t_pm - t_bm)/ kT_M;           % d, time since birth at puberty

  
  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwi = Ww_i;
  prdData.Ri  = RT_i;
  
  % uni-variate data
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL;
  rT_B = kT_M/ 3/ (1 + f_tL/ g);  % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)); % cm, structural length  
  ELw = L/ del_M; % cm, length
 
  % pack to output
  prdData.tL = ELw;

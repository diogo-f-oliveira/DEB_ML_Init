function [prdData, info] = predict_Eumetopias_jubatus(par, data, auxData)
  
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
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  tT_g = t_0 + t_b/ kT_M;           % d, gestation time 

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
%   Lw_x = L_x/ del_M;              % cm, total length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at weaning 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at 
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
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_txm = [g_m k l_T v_Hb v_Hx v_Hpm]; 
  [t_pm, t_xm, t_bm, l_pm, l_xm, l_bm, info] = get_tx(pars_txm, f);
  tT_pm = (t_pm - t_bm)/ kT_M;         % d, time since birth at puberty at f and T
  L_im = l_i * L_mm;                   % cm, ultimate struct length
  Lw_im = L_im/del_M; 
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  
  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri  = RT_i;
  
  % uni-variate data
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL;
  rT_B = kT_M/ 3/ (1 + f_tL/ g);  % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tL_f(:,1)); % cm, structural length  
  ELw_f = L/ del_M; % cm, length
  %
  L = L_i - (L_i - L_b) * exp( - rT_B * tWw_f(:,1)); % cm, structural length  
  EWw_f = L.^3 * (1 + f_tL * w); % g, weight
  %
  [t LE] = ode45(@get_LE_male, tL_m(:,1), [L_b E_m * f], [], f_tL, kap, TC * v, L_p, E_G, TC * p_M, TC * p_Am, TC * p_Am * z_m/ z);
  L = LE(:,1); E = LE(:,2); 
  ELw_m = L/ del_M; % g, length for males
  %
  [t LE] = ode45(@get_LE_male, tWw_m(:,1), [L_b E_m * f], [], f_tL, kap, TC * v, L_p, E_G, TC * p_M, TC * p_Am, TC * p_Am * z_m/ z);
  L = LE(:,1); E = LE(:,2); 
  EWw_m = L.^3 .* (1 + E * w_E/ mu_E/ d_E); % g, weight for males

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;  
  prdData.tWw_f = EWw_f;
  prdData.tWw_m = EWw_m;
end
% %% subfunction

function dLE = get_LE_male (t, LE, f, kap, v, L_p, E_G, p_M, p_Am_f, p_Am_m)
 L = LE(1); E = LE(2); % [E]
 if L < L_p
   p_Am = p_Am_f;
 else
   p_Am = p_Am_m;
 end
 L_m = kap * p_Am/ p_M; 
 E_m = p_Am/ v;
 g = E_G/ kap/ E_m;
 e = E/ E_m;
 r = v * (e/ L - 1/ L_m)/ (e + g);
 dL = r * L/ 3;
 dE = (p_Am * f - E * v)/ L;
 dLE = [dL; dE]; 
 
end

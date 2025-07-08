function [prdData, info] = predict_Monodelphis_domestica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC    = tempcorr(temp.tW_f, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_b, l_b] = get_tb_foetus([g, k, v_Hb]);
  [tau_x, tau_b, l_x] = get_tp([g k l_T v_Hb v_Hx], f_bx, [tau_b, f, l_b]);
  [tau_p, ~, l_p, ~, info] = get_tp([g k l_T v_Hx v_Hp], f, [tau_x, f_bx, l_x]);
  if ~info; prdData = []; return; end
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + tau_b/ kT_M;           % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (tau_x - tau_b)/ kT_M;     % d, time since birth at weaning at f and T
  
  % puberty 
  tT_p = (tau_p - tau_b)/ kT_M; % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_im = l_i * L_mm; L_bm = l_bm * L_mm;% cm, ultimate struct length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;

  % univariate data
  % time-weight
  % female post weaning
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f, [tau_x, f_bx, l_x], tW_f(:,1)*kT_M - tau_x + tau_b);
  EWw_f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male post weaning
  tvel = get_tp(pars_tpm, f, [tau_x, f_bx, l_x*z/z_m], tW_m(:,1)*kT_M - tau_x + tau_b);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  % pack to output
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
  
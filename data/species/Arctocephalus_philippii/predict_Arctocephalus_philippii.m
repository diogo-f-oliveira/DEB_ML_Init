function [prdData, info] = predict_Arctocephalus_philippii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; pars_tp = [g k l_T v_Hb v_Hp]; 
  [tau_p, tau_x, tau_b, l_p, l_x, l_b, info] = get_tx_old(pars_tx, f);
  if ~info; prdData = []; return; end
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, standard length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + tau_b/ kT_M;         % d, gestation time at f and T

  % weaning
  tT_x = (tau_x - tau_b)/ kT_M;     % d, time since birth at fledging
  
  % puberty 
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length
  Lw_i = L_i/ del_M;                % cm, standard length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length  
  pars_txm = [g k l_T v_Hb v_Hx v_Hpm];% use g, not g_m, since till puberty males are identical to females
  [tau_pm, tau_xm, tau_bm, l_pm, l_xm, l_bm, info] = get_tx_old(pars_txm, f);
  if ~info; prdData = []; return; end
  tT_pm = (tau_pm - tau_bm)/ kT_M;     % d, time since birth at puberty at f and T
  L_im = l_i * L_mm;                   % cm, ultimate struct length
  Lw_im = L_im/ del_M;                 % cm, ultimate standard length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T
  
  % pack to output
  prdData.tg = aT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  tvel = get_tp(pars_tp, f_tW, [], tWw(:,1)*kT_M);
  EWw = (L_m * tvel(:,4)).^3 .* (1 + ome * tvel(:,3)); % g, weight 
  %
  tvel = get_tp(pars_tp, f_tW, [], tL(:,1)*kT_M);
  ELw = (L_m * tvel(:,4))/ del_M; % cm, length

  % pack to output
  prdData.tWw = EWw;
  prdData.tL = ELw;
end


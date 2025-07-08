function [prdData, info] = predict_Macroscelides_proboscideus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp]; 
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ kT_M;           % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at fledging at f and T
  
  % puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  Ww_im = L_mm^3 * (1 + f * w_m);      % g, wet weight
  pars_tpm = [g_m k l_T v_Hb v_Hp]; 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tW, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tp(pars_tpm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % time-weight
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tW, [], tW_f(:,1)*kT_M);
  EWw_f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male
  tvel = get_tp(pars_tpm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], tW_m(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  % female E
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tW, [], tW_f4E(:,1)*kT_M);
  EWw_f4E = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  %
  % female F
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tWF, [], tW_f4F(:,1)*kT_M);
  EWw_f4F = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % female I
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tWI, [], tW_f4I(:,1)*kT_M);
  EWw_f4I = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male B
  tvel = get_tp(pars_tpm, f_tWB, [t_b, f_tWB*z/z_m, l_b*z/z_m], tW_m4B(:,1)*kT_M);
  EWw_m4B = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  % male C
  tvel = get_tp(pars_tpm, f_tWC, [t_b, f_tWC*z/z_m, l_b*z/z_m], tW_m4C(:,1)*kT_M);
  EWw_m4C = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  % male J
  tvel = get_tp(pars_tpm, f_tWJ, [t_b, f_tWJ*z/z_m, l_b*z/z_m], tW_m4J(:,1)*kT_M);
  EWw_m4J = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  % male G
  tvel = get_tp(pars_tpm, f_tWG, [t_b, f_tWG*z/z_m, l_b*z/z_m], tW_m4G(:,1)*kT_M);
  EWw_m4G = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tW_f = EWw_f;
  prdData.tW_f4E = EWw_f4E;
  prdData.tW_f4F = EWw_f4F;
  prdData.tW_f4I = EWw_f4I;
  prdData.tW_m = EWw_m;
  prdData.tW_m4B = EWw_m4B;
  prdData.tW_m4J = EWw_m4J;
  prdData.tW_m4G = EWw_m4G;
  prdData.tW_m4C = EWw_m4C;
  
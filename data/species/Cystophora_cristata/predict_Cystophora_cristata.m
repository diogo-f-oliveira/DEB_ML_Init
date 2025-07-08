function [prdData, info] = predict_Cystophora_cristata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  [t_x t_b l_x l_b info] = get_tp_foetus([g k l_T v_Hb v_Hx], f_bx); % high intake during lactation
  [t_p tbx l_p lbx]      = get_tp_foetus([g k l_T v_Hb v_Hp], f, [l_x v_Hx]);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, body length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + t_b/ k_M/ TC;        % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Ww_x = L_x^3 * (1 + f_bx * w);    % g, wet weight at weaning
  tT_x = (t_x - t_b)/ k_M/ TC;      % d, time since birth at fledging at f and T
  
  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m; L_im = f * L_mm; % cm, max struct length
  [t_xm t_bm l_xm l_bm] = get_tp_foetus([g_m k l_T v_Hb v_Hx], f_bx); % high intake during lactation
  [t_pm txm l_pm lxm]   = get_tp_foetus([g_m k l_T v_Hx v_Hpm], f); t_pm = t_pm + t_xm - t_bm; 
  tT_xm = (t_xm - t_bm)/ k_M/ TC;     % d, time since birth at weaning
  tT_pm = (t_pm - t_bm)/ k_M/ TC;     % d, time since birth at puberty
  Lw_im = L_im/ del_M;                % cm, length of male
  L_xm = l_x * L_mm;                  % cm, structural length at weaning
  Ww_im = L_im^3 * (1 + f * w_m);     % g, ultimate wet weight of male

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
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
  prdData.Wwx = Ww_x;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  ir_B = 3/ k_M + 3 * f * L_mm/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  L = L_im - (L_im - L_xm) * exp( - TC * r_B * (tL_m(:,1) - tT_xm)); % cm, structural length
  ELw_m = L/ del_M; % g, length for males
  
  % pack to output
  prdData.tL_m = ELw_m;
end

function [prdData, info] = predict_Arctocephalus_pusillus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx_old(pars_tx, f);
  if ~info
    prdData = []; return;
  end
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + t_b/ kT_M;           % d, gestation time at f and T

  % weaning
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at fledging at f and T
  
  % puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length  
  pars_txm = [g_m k l_T v_Hb v_Hx v_Hpm];% use g, not g_m, since till puberty males are identical to females
  [t_pm, t_xm, t_bm, l_pm, l_xm, l_bm, info] = get_tx(pars_txm, f);
  if ~info
    prdData = []; return;
  end
  L_pm = l_pm * L_mm;                    % cm, struc length at puberty
  tT_pm = (t_pm - t_bm)/ kT_M;           % d, time since birth at puberty at f and T
  % after puberty
  p_Am_mm = z_mm * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_mm = p_Am_mm/ v;                   % J/cm^3, reserve capacity [E_m]
  g_mm = E_G/ (kap* E_m_mm);             % -, energy investment ratio
  m_Em_mm = y_E_V * E_m_mm/ E_G;         % mol/mol, reserve capacity 
  w_mm = m_Em_mm * w_E/ w_V;             % -, contribution of reserve to weight
  L_mmm = v/ k_M/ g_mm;                  % cm, max struct length  
  L_imm = f * L_mmm;                    % cm, ultimate struct length
  Ww_imm = L_imm^3 * (1 + f * w_mm);     % g, ultimate wet weight


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
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_imm;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight before puberty
  L_i = L_m * f_tW; L_b = L_m * get_lb([g k v_Hb], f_tW);
  rT_B = TC * k_M/ 3/ (1 + f_tW/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - TC * rT_B * tW_f(:,1)); % cm, structural length
  EWw_f = L.^3 * (1 + f_tW * w)/ 1e3; % kg, weight 
  %
  L_im = L_mm * f_tW; L_bm = L_mm * get_lb([g_m k v_Hb], f_tW);
  rT_Bm = kT_M/ 3/ (1 + f_tW/ g_m); % 1/d, von Bert growth rate
  L = L_im - (L_im - L_bm) * exp( - TC * rT_Bm * tW_m(:,1)); % cm, structural length
  EWw_m = L.^3 * (1 + f_tW * w_m)/ 1e3; % kg, weight 
  
  % time-length
  [t_pm, t_xm, t_bm, l_pm, l_xm, l_bm, info] = get_tx(pars_txm, f_tW);
  if ~info
    prdData = []; return;
  end
  tT_pm = (t_pm - t_bm)/ kT_M; L_bm = L_mm * l_bm; L_pm = L_mm * l_pm; L_im = L_mm * f_tW; L_imm = L_mmm * f_tW; 
  L_bp = L_im - (L_im - L_bm) * exp(-rT_Bm * (tL_m(tL_m(:,1) < tT_pm,1))); % cm, structural length
  rT_Bmm = kT_M/ 3/ (1 + f_tW/ g_mm); % 1/d, von Bert growth rate  
  L_pi = L_imm - (L_imm - L_pm) * exp(-rT_Bmm * (tL_m(tL_m(:,1) >= tT_pm,1) - tT_pm)); % cm, structural length
  ELw_m = [L_bp; L_pi]/ del_M; % cm, standard body length
  
  % time-milk energy intake
  L = L_i - (L_i - L_b) * exp( - TC * rT_B * tJX(:,1)); % cm, structural length
  EJT_X = TC * f * p_Am/ kap_X * L.^2/ 1e6; % MJ/d, milk energy intake 

  % pack to output
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
  prdData.tL_m = ELw_m;
  prdData.tJX = EJT_X;
end


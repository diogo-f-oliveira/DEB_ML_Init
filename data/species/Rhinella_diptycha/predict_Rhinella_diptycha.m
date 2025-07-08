function [prdData, info] = predict_Rhinella_diptycha(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A);
  
  if  E_Hj <= E_Hb || E_Hj > E_Hp
      info = 0; prdData = []; return;
  end
  
  % zero-variate data
   
  % life cycle 
  pars_tp = [g; k; l_T; v_Hb; v_Hj]; 
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tp, f);
  if ~info; prdData = []; return; end
    pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled length at birth at f
  if ~info; prdData = []; return; end
    
  % birth
  L_b = L_m * l_b;                 % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);    % g, weight at birth

  % metam
  L_j = L_m * l_j;                 % cm, structural length at metamorphosis at f
  Lw_j = L_j/ del_M;               % cm, total at metamorphosis at f
  tT_j = (t_j - t_b)/ k_M/ TC;     % d, time since birth at metamorphosis at f and T
  
  % puberty for toad
  L_p = L_m * l_p;                % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;              % cm, SVL at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC; % d, time since birth at puberty at f and T
  
  % ultimate for toad
  l_i = f - l_T;                  % -, scaled ultimate length at f
  L_i = L_m * l_i;                % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;              % cm, ultimate SVL at f
  Ww_i = L_i^3 * (1 + f * w);     % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                 % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate struct, SVL
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, SVL at puberty

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % length-change in length
  Lw_i = L_m * f_LdL/ del_M; rT_B = TC * k_M/ 3/ (1 + f_LdL/ g); % 1/d, von Bert growth rate
  EdLw_f = rT_B * (Lw_i - LdL_f(:,1)); % cm/d, change in SVL
  %
  Lw_im = L_mm * f_LdL/ del_M; rT_Bm = TC * k_M/ 3/ (1 + f_LdL/ g_m); % 1/d, von Bert growth rate
  EdLw_m = rT_Bm * (Lw_im - LdL_m(:,1)); % cm/d, change in SVL
  
  % pack to output
  prdData.LdL_f = EdLw_f;
  prdData.LdL_m = EdLw_m;
  
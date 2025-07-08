function [prdData, info] = predict_Pseudis_paradoxa(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  
  if E_Hj < E_Hb || E_Hj > E_Hp
    prdData = []; info = 0; return
  end

  if E_Hjm < E_Hb || E_Hjm > E_Hpm
    prdData = []; info = 0; return
  end

  if Ww_00 < 0
    prdData = []; info = 0; return
  end
      
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  if info == 0
     prdData = []; return
  end
  
  % metam
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  
  % metam
  pars_tj = [g; k; l_T; v_Hb; v_Hj];% compose parameter vector
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tj, f); % -, scaled times & lengths at f
  if info == 0
     prdData = []; return
  end
  L_j = L_m * l_j; Lw_j = L_j/ del_M; % cm, SVL at metam
  Ww_j = L_j^3 * (1 + f);             % g, wet weight at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, SVL at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

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
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate structural, body length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];% compose parameter vector
  [t_pm, t_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f); % -, scaled times & lengths at f
  if info == 0
     prdData = []; return
  end
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hjm];% compose parameter vector
  [t_jm, t_bm, l_jm, l_bm, info] = get_tp(pars_tjm, f); % -, scaled times & lengths at f
  if info == 0
     prdData = []; return
  end
  L_pm = l_pm * L_mm; Lw_pm = L_pm/ del_M; % cm, structural length at puberty
  Ww_pm = L_pm^3 * (1 + f * w_m);     % g, wet weight at puberty 
  L_jm = l_jm * L_mm; Lw_jm = L_jm/ del_M; % cm, structural length at metam
  Ww_jm = L_jm^3 * (1 + f * w_m);       % g, wet weight at puberty 

  % pack to output
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Ljm = Lw_jm;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwjm = Ww_jm;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-weight
  rT_B = TC * k_M/ 3/ (1 + f/ g); L_00 = (Ww_00/ (1 + f * w))^(1/3);
  EWw_0 = (L_i - (L_i - L_00) * exp(- rT_B * tW(:,1))).^3 * (1 + f * w); % d, wet weight
  L_01 = (Ww_01/ (1 + f * w))^(1/3);
  EWw_1 = (L_i - (L_i - L_01) * exp(- rT_B * tW1(:,1))).^3 * (1 + f * w); % d, wet weight
  
  % length-weight
  EWw_j = (LW_j(:,1) * del_M).^3 * (1 + f * w);
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w);
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w_m);

  % pack to output
  prdData.tW = EWw_0;
  prdData.tW1 = EWw_1;
  prdData.LW_j = EWw_j;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
 


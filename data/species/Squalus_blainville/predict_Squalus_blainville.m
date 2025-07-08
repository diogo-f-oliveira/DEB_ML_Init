function [prdData, info] = predict_Squalus_blainville(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
    
  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth at f and T

  % puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T
  
  % ultimate
  L_i = f * L_m;                    % cm, max total length
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

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
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hpm]; % compose parameter vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f); % -, scaled times & lengths at f
  tT_pm = (t_pm - t_bm)/ kT_M;         % d, time since birth at puberty
  L_im = f * L_mm;                     % cm, max total length
  L_bm = l_bm * L_mm;                  % cm, total length at birth

  %% pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % time-length
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tpm(pars_tp, f, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tpm(pars_tpm, f, [t_b, f*z/z_m, l_b*z/z_m], tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % length-weight males
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + w * f); % g, wet weight
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + w_m * f); % g, wet weight
  
 
  %% pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LW_m = EWw_m;
  prdData.LW_f = EWw_f;
  
end



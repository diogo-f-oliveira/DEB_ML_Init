function [prdData, info] = predict_Poroderma_africanum(par, data, auxData)  
 
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
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % length at 24 yr
  rT_B = kT_M/3/(1+f/g);
  Lw_24 = (L_i - (L_i - L_b)*exp(-rT_B*24*365))/ del_M; % cm, total length at 24 yr
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Amm = z * p_M/ kap;            % J/d.cm^2, {p_Am} max spec assimilation flux for male
  E_mm = p_Amm/ v;                   % J/cm^3, [E_m] reserve capacity for male
  m_Emm = y_E_V * E_mm/ E_G;         % mol/mol, reserve capacity for males
  g_m = E_G/ kap/ E_mm;              % -, energy investment ratio for male
  ome_m = m_Emm * w_E/ w_V;            % -, contribution of reserve to weight for males
  L_mm = v/ k_M/ g_m;                % cm, maximum structural length
  L_im = f * L_mm; Lw_im = L_im/ del_M; % cm, total length at puberty at f
  pars_tpm = [g k l_T v_Hb v_Hpm];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, total length at puberty

  %% pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.L_24 = Lw_24;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  EWw_f =  (LW_f(:,1)*del_M).^3*(1+f*ome); % cm, weight
  EWw_m =  (LW_m(:,1)*del_M).^3*(1+f*ome); % cm, weight
  
  %% pack to output
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  
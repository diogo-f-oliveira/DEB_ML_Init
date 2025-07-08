function [prdData, info] = predict_Rhizoprionodon_porosus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  kT_M = k_M * TC; 

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp_foetus(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = t_b/ kT_M;                 % d, age ate birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Amm = z_m * p_M/ kap;            % J/d.cm^2, {p_Am} max spec assimilation flux for male
  E_mm = p_Amm/ v;                   % J/cm^3, [E_m] reserve capacity for male
  m_Emm = y_E_V * E_mm/ E_G;         % mol/mol, reserve capacity for males
  g_m = E_G/ kap/ E_mm;              % -, energy investment ratio for male
  ome_m = m_Emm * w_E/ w_V;            % -, contribution of reserve to weight for males
  L_mm = v/ k_M/ g_m;                % cm, maximum structural length
  L_im = f * L_mm; Lw_im = L_im/ del_M; % cm, total length at puberty at f
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp_foetus(pars_tpm, f);
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, total length at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % uni-variate data
  % length-length
  Lw_i = f_LL * L_m/ del_M; rT_B = kT_M/ 3/ (1 + f_LL/g);
  ELL_f = Lw_i - (Lw_i - LL_f(:,1)) * exp(-rT_B*365);   % cm, length
  %
  Lw_im = f_LL * L_mm/ del_M; rT_Bm = kT_M/ 3/ (1 + f_LL/g_m);
  ELL_m = Lw_im - (Lw_im - LL_m(:,1)) * exp(-rT_Bm*365);   % cm, length 

  % length-weight
  EWw_f = (LW_f(:,1)*del_M).^3 * (1 + f_LL * ome); % g, weight
  EWw_m = (LW_m(:,1)*del_M).^3 * (1 + f_LL * ome_m); % g, weight
  
  %% pack to output
  prdData.LL_f = ELL_f;
  prdData.LL_m = ELL_m;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;


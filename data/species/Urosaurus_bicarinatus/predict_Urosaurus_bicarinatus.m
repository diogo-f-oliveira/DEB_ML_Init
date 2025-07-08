function [prdData, info] = predict_Urosaurus_bicarinatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  pars_T = T_A;  
  TC    = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, SVL at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, SVL length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

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
  L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m k l_T v_Hb v_Hpm];
  [l_pm, l_bm, info] = get_lp(pars_tpm, f);
  if l_pm < l_bm; info = 0; prdData = []; return; end
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, SVL at puberty
  Lw_im = L_im/ del_M; % cm, ultimate SVL

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-length
  Lw_i = L_m * f_tL/ del_M;
  rT_B = TC * k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  EdLw_f = rT_B * (Lw_i - LdL_f(:,1)); % cm, SVL
  %
  Lw_im = L_mm * f_tL/ del_M;
  rT_Bm = TC * k_M/ 3/ (1 + f_tL/ g_m); % 1/d, von Bert growth rate
  EdLw_m = rT_Bm * (Lw_im - LdL_m(:,1)); % cm, SVL

  % pack to output
  prdData.LdL_f = EdLw_f;
  prdData.LdL_m = EdLw_m;

end


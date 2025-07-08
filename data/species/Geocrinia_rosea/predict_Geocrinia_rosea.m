function [prdData, info] = predict_Geocrinia_rosea(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth
  aT_b = t_0 + t_b/ k_M/ TC;        % d, age at birth

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
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
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_bm = L_mm * l_bm; L_im = (f - l_T) * L_mm; 
  Ww_im = L_im^3 * (1 + f * w_m);

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight 
  r_B = k_M/ 3/ (1 + f/ g);                           % d, 1/von Bert growth rate
  [t, L] = ode45(@get_L, tW_f(:,1), L_b, [], L_i, r_B, temp.tW_f, T_ref, T_A);
  EWw_f = L.^3 * (1 + f * w);                          % g, wet weight
  %
  r_Bm = k_M/ 3/ (1 + f/ g_m);                        % d, 1/von Bert growth rate
  [t, L] = ode45(@get_L, tW_m(:,1), L_b, [], L_im, r_Bm, temp.tW_f, T_ref, T_A);
  EWw_m = L.^3 * (1 + f * w_m);                        % g, wet weight
  
  % pack to output
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;

end

function dL = get_L(t, L, L_i, r_B, tT, T_ref, T_A)
  TC = tempcorr(C2K(spline1(t, tT)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
  
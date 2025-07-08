function [prdData, info] = predict_Malaclemys_terrapin(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_26 = tempcorr(temp.ab_26, T_ref, T_A);
  TC_32 = tempcorr(temp.ab_32, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  a_b = t_b/ k_M; a26_b = a_b/ TC_26; a32_b = a_b/ TC_32; % d, age at birth at f and T

  % puberty 
  aT_p = t_p/ kT_M;                 % d, age at puberty at f and T

  % ultimate
  L_i = L_m * f;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + w * f);     % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

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
  L_im = f * L_mm;                     % cm, ultimate struct
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  tT_pm = (t_pm - t_bm)/ kT_M;         % d, time since birth at puberty

  
  % pack to output
  prdData.ab_26 = a26_b;
  prdData.ab_32 = a32_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight
  % female
  t=max(0,tWw_f(:,1)-t_0); n=size(t); for i=2:n; if t(i)<=t(i-1);t(i)=t(i-1)+1e-3; end; end
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tW, [], t*k_M*TC_32);
  EWw_f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male
  t=max(0,tWw_m(:,1)-t_0); n=size(t); for i=2:n; if t(i)<=t(i-1);t(i)=t(i-1)+1e-3; end; end
  tvel = get_tp(pars_tpm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], t*k_M*TC_26);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  % pack to output
  prdData.tWw_f = EWw_f;
  prdData.tWw_m = EWw_m;

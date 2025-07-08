function [prdData, info] = predict_Emydocephalus_ijimae(par, data, auxData)

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
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, carpace length
  a_b = t_b/ k_M; aT_b = a_b/ TC;   % d, age at birth
  
  % puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, carpace length at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carpace length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate weight
    
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
  L_im = f * L_mm; Lw_im = L_im/ del_M; % cm, ultimate struct, carpace length
  Ww_im = L_im^3 * (1 + f * w_m);     % g, ultimate weight
  pars_tpm = [g_m k l_T v_Hb v_Hpm];
  Lw_pm = L_mm * get_lp(pars_tpm, f)/ del_M; % cm, SVP at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length * length-change in length
  Lw_i = f_tL * L_m/ del_M; 
  rT_B = TC * k_M/ 3/ (1 + f_tL/ g);
  EdLw_f = rT_B * (Lw_i - LdL_f(:,1));
  %
  Lw_im = f_tL * L_mm/ del_M; 
  rT_Bm = TC * k_M/ 3/ (1 + f_tL/ g_m);
  EdLw_m = rT_Bm * (Lw_im - LdL_m(:,1));

  % pack to output
  prdData.LdL_f = EdLw_f;
  prdData.LdL_m = EdLw_m;
     
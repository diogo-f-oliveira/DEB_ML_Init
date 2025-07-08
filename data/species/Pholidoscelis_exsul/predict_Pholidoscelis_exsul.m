function [prdData, info] = predict_Pholidoscelis_exsul(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if f_P > 1
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_P = tempcorr(temp.LdL_Pf, T_ref, T_A);
  TC_J = tempcorr(temp.LdL_Jf, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth
  Lw_b = L_b/ del_M;                % cm, SVL at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, ultimate structural length at f
  Lw_p = L_p/ del_M;                % cm, SVL at birth
  Ww_p = L_p^3 * (1 + f * w);       % g,  wet weight at puberty

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;               % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;          % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);          % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;      % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;          % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;               % cm, max struct length
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * w_m);   % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % length-change in length
  Lw_i = L_m * f_P/ del_M;
  rT_B = TC_P * k_M/ 3/ (1 + f_P/ g); % 1/d, von Bert growth rate
  EdLw_Pf = rT_B * (Lw_i - LdL_Pf(:,1)); % cm/d, change in SVL
  %
  Lw_im = L_mm * f_P/ del_M;
  rT_Bm = TC_P * k_M/ 3/ (1 + f_P/ g_m); % 1/d, von Bert growth rate
  EdLw_Pm = rT_Bm * (Lw_im - LdL_Pm(:,1)); % cm/d, change in SVL
  %
  Lw_i = L_m * f_J/ del_M;
  rT_B = TC_J * k_M/ 3/ (1 + f_J/ g); % 1/d, von Bert growth rate
  EdLw_Jf = rT_B * (Lw_i - LdL_Jf(:,1)); % cm/d, change in SVL
  %
  Lw_im = L_mm * f_J/ del_M;
  rT_Bm = TC_J * k_M/ 3/ (1 + f_J/ g_m); % 1/d, von Bert growth rate
  EdLw_Jm = rT_Bm * (Lw_im - LdL_Jm(:,1)); % cm/d, change in SVL
  
  % length-weight
  EWw_f = (LW_f(:,1)*del_M).^3 * (1 + f_P * w);
  EWw_m = (LW_m(:,1)*del_M).^3 * (1 + f_P * w_m);
  
  % pack to output
  prdData.LdL_Pf = EdLw_Pf;
  prdData.LdL_Pm = EdLw_Pm;
  prdData.LdL_Jf = EdLw_Jf;
  prdData.LdL_Jm = EdLw_Jm;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;

  

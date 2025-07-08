function [prdData, info] = predict_Holbrookia_maculata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


  % compute temperature correction factors
  pars_T = [T_A; T_L; T_H; T_AL; T_AH];  
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

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
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-length
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL;
  r_B = k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  [t, L] = ode45(@get_L, tL_fm(:,1), L_b, [], T_ref, pars_T, t_0, L_i, r_B); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_f = L/ del_M; % cm, SVL
  %
  L_bm = L_mm * get_lb([g_m k v_Hb], f_tL); L_im = f_tL * L_mm;
  r_Bm = k_M/ 3/ (1 + f_tL/ g_m); % 1/d, von Bert growth rate
  [t, L] = ode45(@get_L, tL_fm(:,1), L_bm, [], T_ref, pars_T, t_0, L_im, r_Bm); % EL: {J/cm^3, cm}, with {[E], L}
  ELw_m = L/ del_M; % cm, SVL

  % length-weight
  EWw_f = (LW_f * del_M).^3 * (1 + f * w); % g, weight
  EWw_m = (LW_m * del_M).^3 * (1 + f * w_m); % g, weight
  
  % pack to output
  prdData.tL_fm = [ELw_f ELw_m];
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;

end

function dL = get_L(t, L, T_ref, pars_T, t_0, L_i, r_B)
  TC = tempcorr(C2K(25*sin(2*pi*(t+t_0)/365)), T_ref, pars_T); % -, TC at t
  dL = TC * r_B * (L_i - L); % cm/d, change in structural length d/dt L
end
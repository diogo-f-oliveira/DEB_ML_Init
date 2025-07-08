function [prdData, info] = predict_Paramoera_walkeri(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  pars_T = [T_A; T_L; T_AL];
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  TC_tL = tempcorr(temp.tL_f, T_ref, pars_T);

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = 1e3 * L_b^3 * (1 + f * w); % mg, wet weight at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = 1e3 * L_p^3 * (1 + f * w); % mg, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = 1e3 * L_i^3 * (1 + f * w); % mg, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

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
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_bm = L_mm * l_bm; L_j_m = L_mm * l_jm; L_im = l_i * L_mm;% cm, structural lengths

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  r_B = rho_B * k_M; L_j = L_m * l_j; L_i = L_m * l_i;
  [t L] = ode45(@get_L, tL_f(:,1), L_j, [], r_B, L_i, T_ref, pars_T);
  ELw_f = L/ del_M;                              % cm, length
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tL);
  r_Bm = rho_Bm * k_M; L_jm = L_mm * l_jm; L_im = L_mm * l_im;
  [t L] = ode45(@get_L, tL_m(:,1), L_jm, [], r_Bm, L_im, T_ref, pars_T);
  ELw_m = L/ del_M;                              % cm, length
  
  % length - weight
  EWw_f = (LWw_f(:,1)*del_M).^3 * (1 + f * w); % g, wet weight
  EWw_m = (LWw_m(:,1)*del_M).^3 * (1 + f * w_m); % g, wet weight
  EWd_f = (LWd_f(:,1)*del_M).^3 * (1 + f * w) * d_V; % g, dry weight
  EWd_m = (LWd_m(:,1)*del_M).^3 * (1 + f * w_m) * d_V; % g, dry weight
  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LWw_f = EWw_f;
  prdData.LWw_m = EWw_m;
  prdData.LWd_f = EWd_f;
  prdData.LWd_m = EWd_m;
end

function dL = get_L(t,L,r_B,L_i,T_ref,pars_T)
  TC = tempcorr(C2K(2+5*sin(2*pi*(t-120)/365)), T_ref, pars_T);
  dL = TC * r_B * (L_i - L);
end

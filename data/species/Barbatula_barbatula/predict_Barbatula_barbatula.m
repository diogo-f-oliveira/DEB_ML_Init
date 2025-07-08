function [prdData, info] = predict_Barbatula_barbatula(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  a_b = t_b/ k_M;                   % d, age at birth at T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T
  s_M = l_p/ l_b;                   % -, acceleration factor

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector

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
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  tT_pm = (t_pm - t_bm)/ k_M/ TC;      % d, age at puberty
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, total length at puberty
  L_im = L_mm * l_im; Lw_im = L_im/ del_M; % cm, ultimate total length
  Ww_pm = L_pm.^3 * (1 + f * w_m);     % g, wet weight at puberty

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;

  % time-length, assume post-acceleration
  % female
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  r_B = k_M * rho_B; L_i = L_m * l_i; L_0 = Lw_0 * del_M;
  [t, L] = ode45(@get_L, tL_fm(:,1), L_0, [],  T_ref, T_A, r_B, L_i, t_0);
  ELw_f = L/ del_M;   % cm, total length 
  % male
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tL);
  r_Bm = k_M * rho_Bm; L_im = L_mm * l_im; L_0 = Lw_0 * del_M;
  [t, L] = ode45(@get_L, tL_fm(:,1), L_0, [],  T_ref, T_A, r_Bm, L_im, t_0);
  ELw_m = L/ del_M;   % cm, total length 
  
  % length-fecundity
  EN = TC * 365 * reprod_rate_j(LN(:,1)*del_M, f, pars_R); % #, yearly fecundity
  
%% pack to output
  prdData.tL_fm = [ELw_f ELw_m];
  prdData.LN = EN;
end

function dL = get_L(t,L, T_ref, T_A, r_B, L_i, t_0)
   TC = tempcorr(C2K(15+15*sin(2*pi*(t-t_0)/365)), T_ref, T_A);
   dL = TC * r_B * (L_i - L);
end


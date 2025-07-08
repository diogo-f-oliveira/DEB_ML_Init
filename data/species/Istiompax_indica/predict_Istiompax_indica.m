function [prdData, info] = predict_Istiompax_indica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); 
  T_env = K2C(temp.am); % C, environmental temperature
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, LJFL at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate LJFL at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im; 

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  tf = [0 f_0; 1000 f_1; 2000 f_2; 5000 f_5]; % functional response
  [t, L] = ode45(@get_dL, [0; tL_f(:,1)], L_b, [], TC, tf, L_b, L_j, L_m, k_M, g);
  L(1) = []; ELw_f = L/ del_M;                                            % cm, LJFL
  %
  [t, L] = ode45(@get_dL, [0; tL_m(:,1)], L_b, [], TC, tf, L_bm, L_jm, L_mm, k_M, g_m);
  L(1) = []; ELw_m = L/ del_M;                                            % cm, LJFL

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;

end

function dL = get_dL(t, L, TC, tf, L_b, L_j, L_m, k_M, g)
  f = spline1(t, tf); % -, functional response
  L_i = f * L_m * L_j/ L_b;
  
  if L < L_j
    r_j = k_M * (f * L_m/ L_b - 1)/ (1 + f/ g);
    dL = L * TC * r_j/ 3;
  else
    r_B = k_M/ 3/ (1 + f/ g);
    dL = TC * r_B * (L_i - L);
  end
end

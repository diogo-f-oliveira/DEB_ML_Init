function [prdData, info] = predict_Gennadas_elegans(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth at f and T

  % metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  Wd_i = Ww_i * d_V;                % g, ultimate dry weight
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hp]; % compose parameter vector

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i; r_j = rho_j * k_M; r_B = rho_B * k_M;
  [t L] = ode45(@get_L, [0;tL_f(:,1)], L_b, [], T_ref, T_A, t_0, L_j, L_i, r_j, r_B);
  L(1)=[]; ELw_f = L/ del_M;
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tL);
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm; L_im = L_mm * l_im; r_jm = rho_jm * k_M; r_Bm = rho_Bm * k_M;
  [t L] = ode45(@get_L, [0;tL_m(:,1)], L_bm, [], T_ref, T_A, t_0, L_jm, L_im, r_jm, r_Bm);
  L(1)=[]; ELw_m = L/ del_M;

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
end

function dL = get_L(t, L, T_ref, T_A, t_0, L_j, L_i, r_j, r_B)
  TC = tempcorr(C2K(10+5*sin((t-t_0)*2*pi/365)), T_ref, T_A);
  if L<L_j
    dL = TC * L * r_j/3;
  else
    dL = TC * r_B * (L_i - L);
  end
end  
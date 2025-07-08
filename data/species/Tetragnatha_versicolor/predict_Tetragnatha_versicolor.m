function [prdData, info] = predict_Tetragnatha_versicolor(par, data, auxData)
  
  global tcJX_C tcJX_HL tcJX_LH

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  if Ww_j > Ww_0
    info = 0; prdData = []; return
  end
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

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
  [l_jm, l_pm, l_bm] = get_lj(pars_tjm, f);
  Lw_im = f * l_jm/ l_bm * L_mm/ del_M;% cm, ultimate cephalothorax lengths
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight post metam;  
  eL_0 = [1, (Ww_0/ (1 + f * w))^(1/3)]; vT = v * TC; pT_Am = p_Am * TC;
  [t eL] = ode45(@get_deL, tW_C(:,1), eL_0, [], tcJX_C, d_X, mu_X, w_X, kap_X, kap_XH, kap_XL, L_ref, s_M * pT_Am, s_M * vT, s_M * L_m, g); 
  e = eL(:,1); L = eL(:,2); 
  EWw_C = L.^3 .* (1 + e * w); % g, wet weight
  %
  [t eL] = ode45(@get_deL, tW_HL(:,1), eL_0, [], tcJX_HL, d_X, mu_X, w_X, kap_X, kap_XH, kap_XL, L_ref, s_M * pT_Am, s_M * vT, s_M * L_m, g); 
  e = eL(:,1); L = eL(:,2); 
  EWw_HL = L.^3 .* (1 + e * w); % g, wet weight
  %
  [t eL] = ode45(@get_deL, tW_LH(:,1), eL_0, [], tcJX_LH, d_X, mu_X, w_X, kap_X, kap_XH, kap_XL, L_ref, s_M * pT_Am, s_M * vT, s_M * L_m, g); 
  e = eL(:,1); L = eL(:,2); 
  EWw_LH = L.^3 .* (1 + e * w); % g, wet weight

  
  % pack to output
  prdData.tW_C = EWw_C;
  prdData.tW_HL = EWw_HL;
  prdData.tW_LH = EWw_LH;
  
end

function deL = get_deL(t, eL, tcJ_X, d_X, mu_X, w_X, kap_X, kap_XH, kap_XL, L_ref, p_Am, v, L_m, g)
  e = eL(1); L = eL(2);
  
  
  % food intake
  [cJ_X J_X] = spline1(t, tcJ_X);        % #/d, food supply rate in # of Drosophila per d
  p_X = J_X * 1.07e-3 * d_X * mu_X/ w_X; % J/d, food intake
  if p_X > 4
    kap_X = kap_XH;
  elseif p_X < 2
    kap_X = kap_XL;
  end
  p_A = kap_X * p_X * L/L_ref;            % J/d, assim rate
  f = p_A/ (p_Am * L^2);                 % scaled func response at t
  
  r = v * (e/ L - 1/ L_m)/ (e + g);      % 1/d, specific growth rate
  de = (f - e) * v/ L;                   % 1/d, change in e
  dL = L * r/ 3;                         % cm/d, change in L
  
  deL = [de; dL];
end
  
function [prdData, info] = predict_Orthriophis_taeniurus(par, data, auxData)

  global tX2 tX4
  
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
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth
  
  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

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
  L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight             
  L_bm = L_mm * get_lb([g_m k v_Hb], f); Lw_bm = L_bm/ del_M;
  Ww_bm = L_bm^3 * (1 + w_m * f);      % g, weight at birth
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lbm = Lw_bm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwbm = Ww_bm;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-length
  J_Xm = w_X * p_Am/ kap_X/ mu_X/ d_X; % g/d.cm^2, {J_Xm}, max spec feeding rate in g wet food
  [t, eL] = ode45(@Bert, tL2(:,1), [1, L_b], [], tX2, TC * J_Xm, TC * v, g, L_m);
  ELw_2 = eL(:,2)/ del_M; % cm, SVL
  %
  [t, LW] = ode45(@Bert, tL4(:,1), [1, L_b], [], tX4, TC * J_Xm, TC * v, g, L_m);
  ELw_4 = eL(:,2)/ del_M; % cm, SVL
  
  % time-weight
  [t, eL] = ode45(@Bert, tW2(:,1), [1, L_b], [], tX2, TC * J_Xm, TC * v, g, L_m);
  EWw_2 = eL(:,2).^3 .* (1 + eL(:,1) * w); % g, wet weight
  %
  [t, eL] = ode45(@Bert, tW4(:,1), [1, L_b], [], tX4, TC * J_Xm, TC * v, g, L_m);
  EWw_4 = eL(:,2).^3 .* (1 + eL(:,1) * w); % g, wet weight

  % pack to output
  prdData.tL2 = ELw_2;
  prdData.tL4 = ELw_4;
  prdData.tW2 = EWw_2;
  prdData.tW4 = EWw_4;
end

function deL = Bert(t, eL, tX, J_Xm, v, g, L_m)
   e = eL(1); L = eL(2);
   [X, J_X] = spline1(t, tX);  % g, g/d, cum food, food intake
   f = J_X/ J_Xm/ L^2;
   r = v * (e/ L - 1/ L_m)/ (e + g);
   dL = r * L/ 3;
   de = (f - e) * v/ L;
   deL = [de; dL];
end
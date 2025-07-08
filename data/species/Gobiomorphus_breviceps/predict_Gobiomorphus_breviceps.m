function [prdData, info] = predict_Gobiomorphus_breviceps(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if info == 0
    prdData = []; return
  end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
   
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                     % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm; Lw_im = L_im/ del_M; % cm, ultimate length

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time - length 
  tf = [0200 f_0200; 0300 f_0300; 0500 f_0500; 1000 f_1000];
  [t, eL] = ode45(@get_eL, tW_f(:,1), [1; L_b], [], T_ref, T_A, t_0, tf, L_m, g, v); 
  EWw_f = eL(:,2).^3.*(1+eL(:,1)*ome); % g, weight
  %
  [t, eL] = ode45(@get_eL, tW_m(:,1), [1; L_b], [], T_ref, T_A, t_0, tf, L_mm, g_m, v); 
  EWw_m = eL(:,2).^3.*(1+eL(:,1)*ome_m); % g, weight

  % pack to output
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
  
end

function deL = get_eL(t, eL, T_ref, T_A, t_0, tf, L_m, g, v)
  e = eL(1); L = eL(2);
  TC = tempcorr(C2K(14+10*sin(2*pi*(t-t_0)/365)), T_ref, T_A);
  f = spline1(t,tf); de = TC * v * (f - e)/ L; 
  r = v * (e/ L - 1/ L_m)/ (e + g);
  deL = [de; TC * r * L/ 3];
end

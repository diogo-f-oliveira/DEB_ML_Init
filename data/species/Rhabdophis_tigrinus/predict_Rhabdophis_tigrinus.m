function [prdData, info] = predict_Rhabdophis_tigrinus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_w = tempcorr(C2K(5), T_ref, T_A);
  TC_s = tempcorr(C2K(30), T_ref, T_A);
      
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth
  
  % puberty 
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

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

  % pack to output
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-length
  [t, eL] = ode45(@std, tL2(:,1), [f_2 L_b], [], f_2, TC_w, TC_s, v, g, L_m);
  ELw_2 = eL(:,2)/ del_M; % cm, SVL
  %
  [t, eL] = ode45(@std, tL4(:,1), [f_4 L_b], [], f_4, TC_w, TC_s, v, g, L_m);
  ELw_4 = eL(:,2)/ del_M; % cm, SVL
  
  % time-weight
  [t, eL] = ode45(@std, tW2(:,1), [f_2 L_b], [], f_2, TC_w, TC_s, v, g, L_m);
  EWw_2 = eL(:,2).^3 .* (1 + w * eL(:,1)); % g, weight
  %
  [t, eL] = ode45(@std, tW4(:,1), [f_4 L_b], [], f_4, TC_w, TC_s, v, g, L_m);
  EWw_4 = eL(:,2).^3 .* (1 + w * eL(:,1)); % g, weight

  % pack to output
  prdData.tL2 = ELw_2;
  prdData.tL4 = ELw_4;
  prdData.tW2 = EWw_2;
  prdData.tW4 = EWw_4;
end

function deL = std(t, eL, f, TC_w, TC_s, v, g, L_m)
  e = eL(1); L = eL(2);
  if (t > 70 && t < 230) || (t > 400 && t < 570) || (t > 775 && t < 950) % winter
    TC = TC_w; f = 0;
  else % summer
    TC = TC_s;
  end
  
  r = TC * v * (e/L - 1/L_m)/ (e + g);
  de = (f - e) * TC * v/ L;
  dL = r * L/3;
  deL = [de; dL];
end

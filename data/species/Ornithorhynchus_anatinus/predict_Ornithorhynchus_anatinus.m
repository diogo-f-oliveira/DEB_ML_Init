function [prdData, info] = predict_Ornithorhynchus_anatinus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx];
  tau_x = get_tp(pars_tx, f);
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_0 + tau_b/ k_M/ TC_ab;   % d, incubation time at f and T

  % weaning
  tT_x = (tau_x - tau_b)/ kT_M;     % d, time since birth at weaning at f and T
  
  % puberty 
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  Lw_im = L_mm * l_i/ del_M;           % cm, total length

  % pack to output
  prdData.ab = aT_b;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight 
  tf = [25 fB_025; 50 fB_050; 100 fB_100 ; 200 fB_200]; tf(:,1)= tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b, 1 l_b], tW_B(:,1) * kT_M);
  EWw_B = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome); % g, wet weight
  %
  tf = [25 fY_025; 50 fY_050; 100 fY_100 ; 200 fY_200]; tf(:,1)= tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b, 1 l_b], tW_Y(:,1) * kT_M);
  EWw_Y = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome); % g, wet weight
  
  % pack to output
  prdData.tW_B = EWw_B;
  prdData.tW_Y = EWw_Y;
  
end

function [prdData, info] = predict_Fratercula_arctica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  

  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % zero-variate data

  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
  t_x = get_tp(pars_tx, f); % -, scaled time
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths
  
  % intitial
  Ww_0 = p_Am * initial_scaled_reserve(f, [V_Hb, g, k_J, k_M, v]) * w_E/ mu_E/ d_E; % g, egg volume

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f 
  Wd_b = d_V * Ww_b;                % g, dry wirhgt at birth
  aT_b = t_b/ k_M/ TC_ab;      % d, age at birth at f and T
  
  % fledging
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at fledging

  % puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, wing length at ultimate
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % O2 consumption
  vT = v * TC; pT_M = p_M * TC; L3 = L_i^3; M_E = f * E_m * L3/ mu_E; 
  pC = vT/ L_i .* M_E * mu_E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  % molar volume of gas at 1 bar and 20 C is 24.4 L/mol
  X_gas = 1/ 24.4;                  % M, mol of gas per litre at 20 C and 1 bar 
  JT_Oi = - J_M(:,3) * 1e3/ 24/ X_gas; % cc/h  

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tR = t_R;
  prdData.am = aT_m;
  prdData.V0 = Ww_0;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
%   prdData.Wdb = Wd_b;
%   prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.JOi = JT_Oi;
  
  % uni-variate data

  % time-wing length
  tvel = get_tp(pars_tp, f_tL, [], tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M;   % cm, wing length

  % time-weight
  tvel = get_tp(pars_tp, f_0, [], tW(:,1)*kT_M);
  EWw = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
  %
  tvel = get_tp(pars_tp, f_1, [], tW1(:,1)*kT_M);
  EWw_1 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
%
  tvel = get_tp(pars_tp, f_2, [], tW2(:,1)*kT_M);
  EWw_2 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
%
  tvel = get_tp(pars_tp, f_3, [], tW3(:,1)*kT_M);
  EWw_3 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
%
  tvel = get_tp(pars_tp, f_4, [], tW4(:,1)*kT_M);
  EWw_4 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
%
  tvel = get_tp(pars_tp, f_5, [], tW5(:,1)*kT_M);
  EWw_5 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
    
  % time-cum reprod
  EN = cum_reprod(tN(:,1)* TC, f, pars_R);
  N_0 = spline1(t_R,[tN(:,1),EN]); EN = max(0,EN-N_0);

  % pack to output
  prdData.tW = EWw;
  prdData.tW1 = EWw_1;
  prdData.tW2 = EWw_2;
  prdData.tW3 = EWw_3;
  prdData.tW4 = EWw_4;
  prdData.tW5 = EWw_5;
  prdData.tL = ELw;
  prdData.tN = EN;
end

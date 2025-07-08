function [prdData, info] = predict_Passerculus_sandwichensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % zero-variate data

  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
  tau_x = get_tp(pars_tx, f); 
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);  % -, scaled times & lengths
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth at f 
  aT_b = t_0 + tau_b/ k_M/ TC_ab;   % d, age at birth at f and T

  % fledging
  tT_x = (tau_x - tau_b)/ kT_M;         % d, time since birth at fledging

  % puberty
  tT_p = (tau_p - tau_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

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
  prdData.Wwb = Ww_b;
%   prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  % time-wet weight
  tf = [2 f_02; 4 f_04; 6 f_06; 8 f_08]; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tWw(:,1)*kT_M);
  EWw = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, wet weight
  % time-dry weight
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tWd(:,1)*kT_M);
  EWd = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome) * d_V;   % g, dry weight
  % time-energy
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tE(:,1)*kT_M);
  EE = 1e-3 * (L_m * tvel(:,4)).^3 .* (M_V * mu_V + E_m * tvel(:,3)); % kJ, energy content
  % time-respiration
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tJO(:,1)*kT_M);
  L = L_m * tvel(:,4); L3 = L.^3; e = tvel(:,3); M_E = E_m * e .* L3/ mu_E;
  r = TC * v * (e ./ L - 1/ L_m) ./ (e + g); 
  pC = (TC * v ./ L - r) .* M_E * mu_E; 
  pM = TC * p_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  pA = TC * p_Am * spline1(tJO(:,1)*kT_M, tf) .* L.^2/ kap_X;
  J_M = - (n_M\n_O) * eta_O * [pA pD pG]';  % mol/d: J_C, J_H, J_O, J_N in rows
  % molar volume of gas at 1 bar and 20 C is 24.4 L/mol
  X_gas = 1/ 24.4;                  % M, mol of gas per litre at 20 C and 1 bar 
  EJO = - J_M(3,:)' * 1e3/ 24/ X_gas; % cc/h  
  
  % pack to output
  prdData.tWd = EWd;  
  prdData.tWw = EWw;  
  prdData.tE = EE;
  prdData.tJO = EJO;
end

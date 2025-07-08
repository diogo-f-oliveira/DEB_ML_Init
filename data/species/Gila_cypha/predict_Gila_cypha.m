function [prdData, info] = predict_Gila_cypha(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hh < 0 || E_Hh > E_Hb
    info = 0; prdData = []; return
  end
  
%% compute temperature correction factors
  TC_tL = tempcorr(temp.tL, T_ref, T_A); 
  TC = tempcorr(temp.am, T_ref, T_A); 
  kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if info == 0
      prdData = []; return
  end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
   
  % hatch 
  [~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC; 

  % birth
  L_b = L_m * l_b;                  % cm, structural length 
  Lw_b = L_b/ del_M;                % cm, total length
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];  % compose parameter vector
  R_L = TC * reprod_rate_j(40.6 * del_M, f, pars_R);             % #/d, reprod rate at length

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.RL = R_L;

  % univariate data
  % time - length 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);
  if info == 0
    prdData = []; return
  end
  kT_M = TC_tL * k_M; rT_j = TC_tL * k_M * rho_j; rT_B = kT_M * rho_B; % 1/d, von Bertalanffy growth rate
  L_i = L_m * l_i; L_j = L_m * l_j; L_b = L_m * l_b; tT_j = (tau_j - tau_b)/ kT_M;
  L_bj = L_b * exp(rT_j * tL(tL(:,1)< tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(- rT_B * (tL(tL(:,1)>=tT_j,1) - tT_j)); 
  ELw = [L_bj; L_ji]/ del_M; % cm, total length
  
  % time - weight
  L_bj = L_b * exp(rT_j * tWw(tWw(:,1)< tT_j,1)/ 3);
  L_ji = L_i - (L_i - L_j) * exp(- rT_B * (tWw(tWw(:,1)>=tT_j,1) - tT_j)); 
  EWw = [L_bj; L_ji].^3 * (1 + f_tL * ome); % cm, total length
  
  % pack to output
  prdData.tL = ELw;
  prdData.tWw = EWw;

 

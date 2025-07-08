function [prdData, info] = predict_Echinotriton_andersoni(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if t_0 > 8
      prdData = []; info = 0; retrun
  end
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [tau_j, tau_b, l_j, l_b] = get_tp(pars_tj, f);    % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth
  Lw_b = L_b/ del_Mt;               % cm, total length at birth 
  
  % metam
  tT_j = (tau_j - tau_b)/ k_M/ TC;  % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, struc length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty
  tT_p = (tau_p - tau_b)/ k_M/ TC;  % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC *  reprod_rate(L_i, f, pars_R);% #/d, reprod rate 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-length 
  % embryo
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  [a LUH] = ode45(@dget_LUH, [t_0; tLe(:,1)], [1e-10 U_E0 0], [], kap, TC * v, TC * k_J, g, L_m); 
  LUH(1,:) = [];
  ELw_e = LUH(:,1)/ del_Mt;

  % pack to output
  prdData.tLe = ELw_e;


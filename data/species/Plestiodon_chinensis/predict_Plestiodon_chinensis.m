function [prdData, info] = predict_Plestiodon_chinensis(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp_foetus(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Wd_b = L_b^3 * (1 + f * w) * d_V; % g, dry weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wdb = Wd_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time - dry weight for embryo                                        
  par_UE0 = [V_Hb; g; k_J; k_M; v]; U_E0 = initial_scaled_reserve(1, par_UE0)/ TC;
  [t LUH] = ode45(@dget_LUH, tWe(:,1), [1e-10; U_E0; 1e-10], [], kap, TC * v, TC * k_J, g, L_m);
  EWd_e = LUH(:,1).^3 * (1 + f * w) * d_V; % g, embryo dry weight 

  % time - yolk dry weight                                    
  [t LUH] = ode45(@dget_LUH, tYe(:,1), [1e-10; U_E0; 1e-10], [], kap, TC * v, TC * k_J, g, L_m);
  EWd_Ye = LUH(:,2) * p_Am * w_E/ mu_E - LUH(:,1).^3 * f * w * d_V; % g, yolk dry weight

  % pack to output
  prdData.tWe = EWd_e;
  prdData.tYe = EWd_Ye;


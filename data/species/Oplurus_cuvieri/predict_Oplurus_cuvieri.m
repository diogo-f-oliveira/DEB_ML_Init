function [prdData, info] = predict_Oplurus_cuvieri(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J ;k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0); %d.cm2, initial scaled reserve. Fraction des réserves restantes at birth
  Ww_0 = U_E0 * p_Am * w_E/ mu_E/ d_V; % g, initial wet weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, struc length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  

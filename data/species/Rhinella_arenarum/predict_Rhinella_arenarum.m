function [prdData, info] = predict_Rhinella_arenarum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);    
  
  filterChecks = E_Hj <= E_Hb;

  if filterChecks
      info = 0;
      return;
  end
  
  % zero-variate data
   
  
  % life cycle 
  pars_tp = [g; k; l_T; v_Hb; v_Hj]; 
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tp, f);
  if info == 0
     prdData = []; return
  end
  pars_UE0 = [ V_Hb, g, k_J, k_M, v];
  [U_E0, L_b, info] = initial_scaled_reserve(f, pars_UE0);
  if info == 0
     prdData = []; return
  end
  
  % start
  E_0 = U_E0 * p_Am; % J, initial size of egg
  Ww_0 = w_E/ mu_E * E_0/ d_E; % g, wet weight
  
  % birth
  L_b = L_m * l_b;                 % cm, structural length at birth at f
  Lw_b = L_b/ del_M;               % cm, SVL at birth at f
  aT_b = t_0 + t_b/ k_M/ TC_ab;    % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                 % cm, structural length at metamorphosis at f
  Lw_j = L_j/ del_Mt;              % cm, total at metamorphosis at f
  Ww_j = L_j^3 * (1 + f * w);      % g, wet weight at metamorphosis 
  tT_j = (t_j - t_b)/ k_M/ TC_tj;  % d, time since birth at metamorphosis at f and T
  
  % puberty for toad
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled length at birth at f
  if info == 0
     prdData = []; return
  end
  L_p = L_m * l_p;                % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;              % cm, SVL at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp; % d, time since birth at puberty at f and T
  
  % ultimate for toad
  l_i = f - l_T;                  % -, scaled ultimate length at f
  L_i = L_m * l_i;                % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;              % cm, ultimate SVL at f
  Ww_i = L_i^3 * (1 + f * w);     % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);                  % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;                 % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwj = Ww_j;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % t-L data for larva
  rT_B = TC_tL * k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL(:,1)); % cm, expected length at time
  
  % pack to output
  prdData.tL = ELw;

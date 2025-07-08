function [prdData, info] = predict_Euspira_nitida(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_14 = tempcorr(temp.ab14, T_ref, T_A);
  TC_16 = tempcorr(temp.tp, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  aT_b20 = t_b/ k_M;                % d, age at birth at f and T
  aT_b14 = aT_b20/ TC_14;           % d, age at birth at 14 C
  
  % metam
  tT_j = (t_j - t_b)/ k_M/ TC_16;   % d, time since birth at metam

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_16;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_16 * reprod_rate_j(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_16;                % d, mean life span at T
  
  % pack to output
  prdData.ab14 = aT_b14;
  prdData.ab20 = aT_b20;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length at T_ref
  f = f_tL; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  tT_j = (t_j - t_b)/ k_M; rT_j = rho_j * k_M; rT_B = rho_B * k_M; L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; 
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) *  rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, struc length at time
  L = [L_bj; L_jm]; w = min(1,(L - L_b)/ (del_M * 0.7 - L_b)).^0.5; % weight coefficient for shape corr during veliger stage
  ELw = L ./ ((1 - w) * del_M + w * del_M);   % cm, shell length
    
  % pack to output
  prdData.tL = ELw;
  
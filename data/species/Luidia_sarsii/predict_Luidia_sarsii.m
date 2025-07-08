function [prdData, info] = predict_Luidia_sarsii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_dWw = tempcorr(temp.dWw, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wegt weight at birth 

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % growth & feeding
  L = (8.9/ (1 + f_dW * w))^(1/ 3); % cm, sturcural length
  rT_B = rho_B * k_M * TC_dWw;
  dWw = 3 * L^2 * (1 + f_dW * w) * rT_B * (f_dW * L_i - L);               % g/d, growth in wet weight
  JT_X = TC_dWw * f_dW * p_Am * s_M * L^2 * w_X/ mu_X/ d_X/ kap_X; % g/d, feeding rate
  
  % pack to output
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  prdData.dWw = dWw;
  prdData.JX = JT_X;
  
  % uni-variate data
  
  % time-length/weight
  rT_B = rho_B * k_M * TC;
  ELw = Lw_i - (Lw_i - Lw_0) * exp(-rT_B * tL(:,1)); % cm, radius
  EWw = (L_i - (L_i - Lw_0 * del_M) * exp(-rT_B * tW(:,1))).^3 * (1 + f * w); % g, wet weight
  
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
   
  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;  
  prdData.LW = EWw_L;
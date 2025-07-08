function [prdData, info] = predict_Cryptochiton_stelleri(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if kap_X + kap_P > 1
    info = 0; prdData = []; return;
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Ww_j = L_j^3 * (1 + w * g);       % g, wet weight at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i*3 * (1 + f * ome);     % g, ultimate wet weight
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
      
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Ri = RT_i;
  
  % uni-variate data
    
  % time-length 
  f = f_tL; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L_b = l_b * L_m; L_i = l_i * L_m; kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  ELw = [L_bj; L_ji]/ del_M;                               % cm, shell length
  %
  L_bj = L_b * exp(tWw((tWw(:,1) <= tT_j),1) *  rT_j/ 3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tWw((tWw(:,1) > tT_j),1) - tT_j)); % cm, structural length at time
  EWw = [L_bj; L_ji].^3 * (1 + f_tL * ome); % g, wet weight
  
  % pack to output
  prdData.tL = ELw;  
  prdData.tWw = EWw;

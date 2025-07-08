function [prdData, info] = predict_Paracentrotus_lividus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_JX = tempcorr(temp.JX0, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  s_M = L_j/ L_b;                   % -, acceleration
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % GSI
  t1 = 365; % d, period of accumulaton of reprod buffer
  GSI = TC_GSI * (t1 * k_M * g/ f^3)/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^3);

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % feeding
  L = (0.006/ (1 + f * w))^(1/3); % cm, structural length for Ww = 0.006 g
  JT_X0 = TC_JX * L^2 * p_Am/ kap_X/ mu_X * w_X/ d_X; % g/d, feeding rate for Ww = 0.006 g
  L = (4.45/ (1 + f * w))^(1/3); % cm, structural length for Ww = 4.45 g
  JT_X1 = TC_JX * L^2 * p_Am/ kap_X/ mu_X * w_X/ d_X; % g/d, feeding rate for Ww = 4.45 g

  % pack to output
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.GSI = GSI;
  prdData.JX0 = JT_X0;
  prdData.JX1 = JT_X1;
  
  % uni-variate data
  
  % time-length
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL(:,1)*k_M*TC_tL);
  ELw = L_m * tvel(:,4)/ del_M;   % cm, length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL1, [], tL1(:,1)*k_M*TC_tL);
  ELw_1 = L_m * tvel(:,4)/ del_M;   % cm, length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL2, [], tL2(:,1)*k_M*TC_tL);
  ELw_2 = L_m * tvel(:,4)/ del_M;   % cm, length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL3, [], tL3(:,1)*k_M*TC_tL);
  ELw_3 = L_m * tvel(:,4)/ del_M;   % cm, length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL4, [], tL4(:,1)*k_M*TC_tL);
  ELw_4 = L_m * tvel(:,4)/ del_M;   % cm, length

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w);       % g, wet weight
  
  % pack to output
  prdData.tL = ELw;
  prdData.tL1 = ELw_1;
  prdData.tL2 = ELw_2;
  prdData.tL3 = ELw_3;
  prdData.tL4 = ELw_4;
  prdData.LW = EWw;
  
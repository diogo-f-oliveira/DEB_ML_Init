function [prdData, info] = predict_Littorina_littorea(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if kap_X + kap_P > 1
    info = 0; prdData = []; return;
  end
  
  % compute temperature correction factors
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % initial
  Wd_0 = p_Am * initial_scaled_reserve(f, [V_Hb, g, k_J, k_M, v]) * w_E/ mu_E; % g, egg dry weight 
    
  % metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, shell height at metam
  
  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
      
  % spec feeding rate
  L = (0.3/ (1 + f * w)/ d_V)^(1/3);    % cm, structural length at 0.3 g dry
  pT_Xm = TC * p_Am * L^2/ kap_X/ 0.3;  % J/d.g, spec feeding rate

  % pack to output
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wd0 = Wd_0;
  prdData.pXm = pT_Xm;
  
  % uni-variate data
    
  % length-weight
  EWd = (LW(:,1) * del_M).^3 * (1 + f_W * w) * d_V;

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN = TC * 365 * reprod_rate_j(LN(:,1) * del_M, f, pars_R); % #/d, ultimate reproduction rate at T

  % time-length 
  f = f_C; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; L_i = l_i * L_m; Lw_i = L_i/ del_M;
  ELw_0 = Lw_i - (Lw_i - Lw_00) * exp( - rT_B * (tL0(:,1) - tL0(1,1))); % cm, shell height at time
  ELw_1 = Lw_i - (Lw_i - Lw_01) * exp( - rT_B * (tL1(:,1) - tL1(1,1))); % cm, shell height at time
  ELw_2 = Lw_i - (Lw_i - Lw_02) * exp( - rT_B * (tL2(:,1) - tL2(1,1))); % cm, shell height at time
  ELw_3 = Lw_i - (Lw_i - Lw_03) * exp( - rT_B * (tL3(:,1) - tL3(1,1))); % cm, shell height at time
  ELw_4 = Lw_i - (Lw_i - Lw_04) * exp( - rT_B * (tL4(:,1) - tL4(1,1))); % cm, shell height at time
  %
  f = f_T; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; Lw_i = l_i * L_m/ del_M;
  ELw_0T = Lw_i - (Lw_i - Lw_00T) * exp( - rT_B * (tL0T(:,1) - tL0T(1,1))); % cm, shell height at time
  ELw_1T = Lw_i - (Lw_i - Lw_01T) * exp( - rT_B * (tL1T(:,1) - tL1T(1,1))); % cm, shell height at time
  % time-weight 
  L_0T = (Wd_00T/ (1 + f * w)/ d_V)^(1/3); L_1T = (Wd_01T/ (1 + f * w)/ d_V)^(1/3); L_2T = (Wd_02T/ (1 + f * w)/ d_V)^(1/3);
  L_0T = L_i - (L_i - L_0T) * exp( - rT_B * (tW0T(:,1) - tW0T(1,1))); % cm, structural length at time
  L_1T = L_i - (L_i - L_1T) * exp( - rT_B * (tW1T(:,1) - tW1T(1,1))); % cm, structural length at time
  L_2T = L_i - (L_i - L_2T) * exp( - rT_B * (tW2T(:,1) - tW2T(1,1))); % cm, structural length at time
  EWd_0T = L_0T.^3 * (1 + f * w) * d_V; EWd_1T = L_1T.^3 * (1 + f * w) * d_V; EWd_2T = L_2T.^3 * (1 + f * w) * d_V;
  
  
  % pack to output
  prdData.tL0 = ELw_0;
  prdData.tL1 = ELw_1;
  prdData.tL2 = ELw_2;
  prdData.tL3 = ELw_3;
  prdData.tL4 = ELw_4;
  prdData.tL0T = ELw_0T;
  prdData.tL1T = ELw_1T;
  prdData.tW0T = EWd_0T;
  prdData.tW1T = EWd_1T;
  prdData.tW2T = EWd_2T;
  prdData.LW = EWd;
  prdData.LN = EN;
  
  

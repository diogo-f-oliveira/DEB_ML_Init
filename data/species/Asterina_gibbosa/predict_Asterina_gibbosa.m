function [prdData, info] = predict_Asterina_gibbosa(par, data, auxData)
  
  par.E_Hj = par.E_Hb * 1.01;
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  TC_LdL = tempcorr(temp.LdL, T_ref, T_A);

  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;
  
  % univariate data
  
  % LW_mar,oct- data
  EWd_mar = (LW_mar(:,1) * del_M).^3 * d_V * (1 + f_mar * w);
  EWd_oct = (LW_oct(:,1) * del_M).^3 * d_V * (1 + f_oct * w);

  % WdWw-data
  EWw = WdWw(:,1) * w_ash/ d_V;
  
  % WdWd-data
  EWd_afd = WdWd(:,1) * w_ash;
  
  % LdL-data
  Lw_i = (f * L_m - L_T)/ del_M;        % cm, ultimate length
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_LdL/ ir_B; % d, 1/von Bert growth rate
  EdL = rT_B * (Lw_i - LdL(:,1));       % cm, expected length at time
  
  % LN-data 
  EN = TC_LN * 365 * reprod_rate_j(LN(:,1) * del_M, f_LN, pars_R); % #/d, ultimate reproduction rate at T

  % TJO-data
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  p_ref = p_Am * L_m^2;               % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  f = f_JO;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  L = ([0.03; 0.3]/ d_V/ (1 + f * w)).^(1/3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  %pADG(:,1) = 0; % exclude assim contribution
  JM = pADG * eta_O' * O2M;                     % mol/d, mineral fluxes
  EJO = - 24.4e6/ 24 * JM(:,3);                  % mul/h, O_2 consumption
  EJO_30_aqua = EJO(1) * tempcorr(C2K(TJO_30_aqua(:,1)), T_ref, T_A); % ml/h for 0.03 g dry
  EJO_300_aqua = EJO(2) * tempcorr(C2K(TJO_300_aqua(:,1)), T_ref, T_A); % ml/h for 0.3 g dry
  EJO_30_air = EJO(1) * tempcorr(C2K(TJO_30_air(:,1)), T_ref, T_A); % ml/h for 0.03 g dry
  EJO_300_air = EJO(2) * tempcorr(C2K(TJO_300_air(:,1)), T_ref, T_A); % ml/h for 0.3 g dry
  
  % pack to output
  prdData.LW_oct = EWd_oct;
  prdData.LW_mar = EWd_mar;
  prdData.LdL = EdL;
  prdData.LN = EN;
  prdData.WdWw = EWw;
  prdData.WdWd = EWd_afd;
  prdData.TJO_30_aqua = EJO_30_aqua;
  prdData.TJO_30_air = EJO_30_air;
  prdData.TJO_300_aqua = EJO_300_aqua;
  prdData.TJO_300_air = EJO_300_air;
  
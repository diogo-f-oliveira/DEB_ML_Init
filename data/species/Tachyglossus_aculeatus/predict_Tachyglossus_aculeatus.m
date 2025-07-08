function [prdData, info] = predict_Tachyglossus_aculeatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tx = tempcorr(temp.tx, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx];
  [t_x, t_b, l_x, l_b] = get_tp(pars_tx, f);
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f, l_b);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, incubation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning at f
  Lw_x = L_x/ del_M;                % cm, total length at weaning at f
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning at f 
  tT_x = (t_x - t_b)/ k_M/ TC_tx;   % d, time since birth at weaning at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % milk production at ultimate size (r = 0)
  pars_L = [L_b; L_x; L_i; tT_x; kap_L];
  E_L = p_Am * milk(f, pars_L);      % J, yearly milk production

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lx = Lw_x;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.EL = E_L;
  
  % uni-variate data
  
  % time-weight 
  f = f_tW; pars_lb = [g; k; v_Hb];                    % compose parameters
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_tW/ ir_B;  % d, 1/von Bert growth rate
  L_i = f * L_m - L_T; L_b = get_lb(pars_lb, f) * L_m; % cm, length at birth, ultimate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW(:,1));      % cm, structural length at time
  EWw = L.^3 * (1 + f * w);                            % g, wet weight
  
  % Ww-JO data
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35  
  % molar volume of gas at 1 bar and 20 C is 24.4 L/mol
  X_gas = 1/ 24.4;    % M, mol of gas per litre at 20 C and 1 bar 
  f = 1;
  pT_ref = TC_tW * p_Am * L_m^2;      % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hx; U_Hp];
  L = (WJO(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  pACSJGRD = pT_ref * scaled_power_old(L, f, pars_power, l_b, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM =  - pADG * eta_O' * O2M;        % mineral fluxes
  EJO = 1e3 * JM(:,3)/ 24/ X_gas;     % ml/h, oxygen consumption rate

  % pack to output
  prdData.tW = EWw;
  prdData.WJO = EJO;
  
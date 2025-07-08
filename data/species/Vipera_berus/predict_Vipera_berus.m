function [prdData, info] = predict_Vipera_berus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL1 = tempcorr(temp.tL1, T_ref, T_A);
  
  del_S = del_S * del_M; % couple SVL to total length. Adders have very short tails
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth

  % puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-SVL
  pars_lb = [g k v_Hb]; 
  %
  L_b = L_m * get_lb(pars_lb, f_tL); L_i = f_tL * L_m;
  ir_B = 3/ k_M + 3 * L_i/ v; rT_B = TC_tL/ ir_B; % yr, 1/von Bert growth rate
  ELw = (L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)))/ del_M; % cm, total length
  %
  L_b = L_m * get_lb(pars_lb, f); L_i = f * L_m;
  ir_B = 3/ k_M + 3 * L_i/ v; rT_B = TC_tL1/ ir_B; % yr, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tL1(:,1)); ELw_1 = L/ del_S; % cm, SVL 
  EWw_1 = L.^3 * (1 + f * w); % g, wet weight
  %
  L_b = L_m * get_lb(pars_lb, f_0); L_i = f_0 * L_m;
  ir_B = 3/ k_M + 3 * L_i/ v; rT_B = TC_tL1/ ir_B; % yr, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tL0(:,1)); ELw_0 = L/ del_S; % cm, SVL 
  EWw_0 = L.^3 * (1 + f * w); % g, wet weight

  % pack to output
  prdData.tL = ELw;
  prdData.tL1 = ELw_1;
  prdData.tL0 = ELw_0;
  prdData.tW1 = EWw_1;
  prdData.tW0 = EWw_0;

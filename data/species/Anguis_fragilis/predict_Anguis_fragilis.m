function [prdData, info] = predict_Anguis_fragilis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.ap, T_ref, T_A);
      
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, SVL at puberty
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T
  
  % weight-at-length
  Ww_L = (16.8 * del_M)^3 * (1 + f * w); % g, wet weight at SVL = 16.8 cm

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate((13.8/(1+f*w))^(1/3), f, pars_R); % #/d, reproduction rate at 13.8 g at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ww_L = Ww_L;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-SVL
  ir_B = 3/ k_M + 3 * L_i/ v; rT_B = TC/ ir_B; % yr, 1/von Bert growth rate
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL(:,1) * 365); % cm, total length
  
  % Weight-litter data
  EN = TC * 365 * reprod_rate(LN(:,1) * del_M, f, pars_R); % #, clutch size at T
  
  % pack to output
  prdData.tL = ELw;
  prdData.LN = EN;


function [prdData, info] = predict_Oligosoma_suteri(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_22 = tempcorr(temp.ab22, T_ref, T_A);
  TC_26 = tempcorr(temp.ab26, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp_foetus(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth
  a22_b = t_b/ k_M/ TC_22;          % d, age at birth at 22 C
  a26_b = t_b/ k_M/ TC_26;          % d, age at birth at 26 C

  % puberty 
  L_p = L_m * l_p;                  % cm, struc length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f
  
  % weight at 1 yr
  rT_B = TC * k_M/ 3/ (1 + f * w);  % 1/d, von Bert growth rate
  L_1 = L_i - (L_i - L_b) * exp(- rT_B * 365); % cm, struc length at 1 yr
  Ww_1 = L_1^3 * (1 + f * w);       % g, weight at 1 yr

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab22 = a22_b;
  prdData.ab26 = a26_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ww1 = Ww_1;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-SVL
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL;
  rT_B = TC * k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  ELw = (L_i - (L_i - L_b) * exp(-rT_B * tL(:,1)))/ del_M; % cm, SVL 

  % pack to output
  prdData.tL = ELw;


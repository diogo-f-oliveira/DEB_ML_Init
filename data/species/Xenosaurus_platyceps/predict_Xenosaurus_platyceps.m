function [prdData, info] = predict_Xenosaurus_platyceps(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_GF = tempcorr(temp.LdL_GF, T_ref, T_A);
  TC_EM = tempcorr(temp.LdL_EM, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, body weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, struc length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, body weight at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  pars_tpm = [g k l_T v_Hb v_Hpm];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_pm = l_pm * L_m; Lw_pm = L_pm/ del_M; % cm,  SVL at puberty
  tT_pm = (t_pm - t_bm)/ k_M/ TC;

  % pack to output
  prdData.ab = aT_b;  
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-length
  Lw_i = L_m * f_GF/ del_M;
  rT_B = TC_GF * k_M/ 3/ (1 + f_GF/ g); % 1/d, von Bert growth rate
  EdLw_GF = rT_B * (Lw_i - LdL_GF(:,1)); % cm/d, change in SVL
  %
  Lw_i = L_m * f_EM/ del_M;
  rT_B = TC_EM * k_M/ 3/ (1 + f_EM/ g); % 1/d, von Bert growth rate
  EdLw_EM = rT_B * (Lw_i - LdL_EM(:,1)); % cm/d, change in SVL
  
  % pack to output
  prdData.LdL_GF = EdLw_GF;
  prdData.LdL_EM = EdLw_EM;


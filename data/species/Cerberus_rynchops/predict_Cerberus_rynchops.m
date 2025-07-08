function [prdData, info] = predict_Cerberus_rynchops(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth
  a_b = t_b/ k_M; aT_b = a_b/ TC;   % d, age at birth
  
  % puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, carpace length at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % length - change in length
  rT_B = TC * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  EdL = rT_B * (Lw_i - LdL(:,1)); % cm/d, change in SVL
  EdWw = rT_B * (L_i - ((WdW(:,1)/(1 + f * w)).^(1/3))).^3 * (1 + f * w); % g/d, change in weight
  ELw_f = (L_i - (L_i - LL_f(:,1) * del_M) * exp(-rT_B * 30.5))/ del_M;
  ELw_m = (L_i - (L_i - LL_m(:,1) * del_M) * exp(-rT_B * 30.5))/ del_M;
  
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, weight
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w); % g, weight
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w); % g, weight
  
  % pack to output
  prdData.LdL = EdL;
  prdData.LL_f = ELw_f;
  prdData.LL_m = ELw_m;
  prdData.WdW = EdWw;
  prdData.LW = EWw;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;


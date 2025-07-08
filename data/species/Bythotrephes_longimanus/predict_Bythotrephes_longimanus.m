function [prdData, info] = predict_Bythotrephes_longimanus(par, data, auxData)
  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_12 = tempcorr(temp.tp_12, T_ref, T_A);
  TC_21 = tempcorr(temp.tp_21, T_ref, T_A);
 
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Wd_b = L_b^3 * (1 + f * ome) * d_V * 1e6; % mug, dry weight at birth
  a_b = t_b/ k_M;                   % d, age at birth at T_ref

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Wd_p = 1e6 * d_V * L_p.^3 * (1 + f * ome); % mug, dry weight at puberty
  t12_p = (t_p - t_b)/ k_M/ TC_12;  % d, time since birth at puberty 12 C
  t21_p = (t_p - t_b)/ k_M/ TC_21;  % d, time since birth at puberty 21 C

  % ultimate
  l_i = f - l_T;                    % -, scaled structural length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Wd_i = 1e6 * L_i.^3 * d_V * (1 + f * ome); % mug, ultimate dry weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tp_12 = t12_p;
  prdData.tp_21 = t21_p;
  prdData.am = aT_m;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight
  tvel = get_tp(pars_tp, f_tW, [], tW(:,1)  * kT_M);
  EWd = 1e6 * d_V * (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome); % mug, dry weight

  % temperature-incubation time
  Eab = a_b ./ TC_ab;
  
  % pack to output
  prdData.tW = EWd;
  prdData.Tab = Eab;


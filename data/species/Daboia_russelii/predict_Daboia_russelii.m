function [prdData, info] = predict_Daboia_russelii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
  
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total at birth
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total at puberty
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-length
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = f_tL * L_m;
  rT_B = TC_tL * k_M/ 3/ (1 + f_tL * ome); % 1/d, von Bert growth rate
  ELw_f = (L_i - (L_i - L_b) * exp( - rT_B * tL_f(:,1)))/ del_M; % cm, total length
  ELw_m = (L_i - (L_i - L_b) * exp( - rT_B * tL_m(:,1)))/ del_M; % cm, total length
  %
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f_tL * ome); % g, wet weight
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f_tL * ome); % g, wet weight

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;


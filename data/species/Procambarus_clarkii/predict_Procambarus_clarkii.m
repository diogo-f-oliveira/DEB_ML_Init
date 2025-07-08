function [prdData, info] = predict_Procambarus_clarkii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  pars_T =  [T_A, T_L,  T_AL]; 
  TC = tempcorr(temp.am, T_ref, pars_T); kT_M = k_M * TC;
  TC_tL = tempcorr(temp.tL, T_ref, pars_T);
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, pars_T);
  
 %% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth at f 
  a_b = t_0+tau_b/ k_M;             % d, age at birth at T_ref

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);      % g, wet weight at puberty 
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight 
   
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  
 %% uni-variate data
  
  % time-length 
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL; % cm, struc lengths
  rT_B = TC_tL * k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  ELw = (L_i - (L_i - L_b) * exp(-rT_B * tL(:,1)))/ del_M; % cm, total length
  
  % length-weight
  EWw = (LW(:,1)*del_M).^3 * (1 + f * ome); % g, wet weight

  % temperature-age at birth
  EaT_b = a_b ./ TC_ab; % d, age at birth
 
  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
  prdData.Tab = EaT_b;

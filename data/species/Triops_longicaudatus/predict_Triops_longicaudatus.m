function [prdData, info] = predict_Triops_longicaudatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL_7 = tempcorr(temp.tL_7, T_ref, T_A);
  TC_tL_1 = tempcorr(temp.tL_1, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
   
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M; Lw_bCL = L_b/ del_MC; % cm, total, carinal length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_pCL = L_p/ del_MC;             % cm, carinal length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lb_CL = Lw_bCL;
  prdData.Lp_CL = Lw_pCL;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  [t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tL);
  kT_M = k_M * TC_tL; rT_B = kT_M/ 3/ (1 + f_tL/ g);        
  ELw = (L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)))/ del_M; % cm, total length at time
  %
  parsT_R = [kap; kap_R; g; TC_tL_7*k_J; TC_tL_7*k_M; L_T; TC_tL_7*v; U_Hb/TC_tL_7; U_Hp/TC_tL_7]; % compose parameter vector at T
  [N, L] = cum_reprod(tL_7(:,1), f_7, parsT_R);
  N_7 = N(end); ELw_7 = L/ del_MC; % cm, carinal length  
  %
  [N, L] = cum_reprod(tL_1(:,1), f_1, parsT_R);
  N_1 = N(end); ELw_1 = L/ del_MC; % cm, carinal length
 
  % pack to output
  prdData.tL = ELw;
  prdData.tL_7 = ELw_7;
  prdData.tL_1 = ELw_1;
  prdData.N7 = N_7;
  prdData.N1 = N_1;
  
function [prdData, info] = predict_Nyctiphanes_australis(par, data, auxData)
    
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); %report_animal(par);
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ni = tempcorr(temp.Ni, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp; f];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  [U_E0, Lb, info] = initial_scaled_reserve(f, pars_UE0);
  E_0 = U_E0 * p_Am; % J, energy in egg at start 
  Wd_0 = E_0 * w_E/ mu_E; % g, dry weight at start
    
  % initial conditions
  L_b  = L_m * l_b;            % cm, structural length at birth at f
  Lw_b = L_b/del_M;            % cm, total length at birth at f
  aT_b = tau_b/ k_M/ TC_ab;    % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and 

  % ultimate
  L_i  = f * L_m - L_T;             % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, wet weight
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m  = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  a_m  = tau_m/ k_M;  % d, mean life span at T_ref and f
  aT_m = a_m/ TC_am;   % d, mean life span at T and f
   
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  N_i = cum_reprod(a_m * TC_Ni, f, pars_R);             % #, lifetime reproductive output at T

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;        
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Ni = N_i;
  prdData.Wd0 = Wd_0;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
    
  %Time- length on different diets
  %time-length tl_1 at f1
  rT_B = TC_ab * k_M/ 3/ (1 + f_tL1/ g); 
  L_i = L_m * f_tL1;
  ELw_1 = (L_i - (L_i - L_b) * exp( - rT_B * tL_1(:,1)))/ del_M; % cm, length at time
  
  %time-length tl_2 at f2
  rT_B = TC_ab * k_M/ 3/ (1 + f_tL2/ g);
  L_i = L_m * f_tL2;
  ELw_2 = (L_i - (L_i - L_b) * exp( - rT_B * tL_2(:,1)))/ del_M; % cm, length at time
  
  %time-length tl_3 at f2
  rT_B = TC_ab * k_M/ 3/ (1 + f_tL2/ g);
  L_i = L_m * f_tL2;
  ELw_3 = (L_i - (L_i - L_b) * exp( - rT_B * tL_3(:,1)))/ del_M; % cm, length
   
  %length - dry weight
  EWd_L = d_V * (LWd(:,1) * del_M).^3 * (1 + f * w); % g, dry weight
 
    %length - wet weight
  EWw_L = (LWw(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

% pack to output
  prdData.tL_1 = ELw_1;
  prdData.tL_2 = ELw_2;
  prdData.tL_3 = ELw_3;
  prdData.LWd = EWd_L;
  prdData.LWw = EWw_L;
  
end
  
  

function [prdData, info] = predict_Ceriodaphnia_dubia(par, data, auxData)
   % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
  % compute temperature correction factors
    TC_ab = tempcorr(temp.ab, T_ref, T_A);
    TC_am = tempcorr(temp.am, T_ref, T_A);
    TC_tp = tempcorr(temp.tp, T_ref, T_A);
    TC_Ni = tempcorr(temp.Ni, T_ref, T_A);
    TC_10 = tempcorr(temp.tL_10, T_ref, T_A);
    TC_15 = tempcorr(temp.tL_15, T_ref, T_A);
    TC_20 = tempcorr(temp.tL_20, T_ref, T_A);
    TC_25 = tempcorr(temp.tL_25, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp ];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
%    % initial
%   E_0 = p_Am * initial_scaled_reserve(f, [V_Hb; g; k_J; k_M; v]);
  
   % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b / del_M;               % cm, total length at birth at f
  Wd_b = L_b^3 * d_V *(1 + f * w) ; % g, dry weight at birth at f (remove d_V for wet weight)
  a_b = t_b / k_M;
  aT_b = a_b / TC_ab;               % d, age at birth at f and T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p / del_M;               % cm, total length at puberty at f  
  a_p = (t_p - t_b) / k_M;
  tT_p = a_p/ TC_tp;                % d, time since birth at puberty at f and T
    
  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)
   
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  a_m = t_m/ k_M;                       % d, mean life span 
  aT_m = a_m / TC_am;                   % d, mean life span at T
  
  % reproduction
%   pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
%   RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T
  
  kT_M = TC_Ni * k_M; 
  kT_J = TC_Ni * k_J; 
  vT = TC_Ni * v; 
  UT_Hb = U_Hb/ TC_Ni; 
  UT_Hp = U_Hp/ TC_Ni;
  
  pars_N = [kap; kap_R; g; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hp]; % compose parameter vector at T
  NT_i = cum_reprod(aT_m, f, pars_N);             % #, life time reproductive output
  

  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdi = Wd_i;
%   prdData.Ri = RT_i;
  prdData.Ni = NT_i;

  
  % uni-variate data

% time-length and temp 
% tL-T data
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  %
  ELw_10 = Lw_i - (Lw_i - Lw_b) * exp( - TC_10 * r_B * tL_10(:,1)); % cm, expected length at time
  ELw_15 = Lw_i - (Lw_i - Lw_b) * exp( - TC_15 * r_B * tL_15(:,1)); % cm, expected length at time
  ELw_20 = Lw_i - (Lw_i - Lw_b) * exp( - TC_20 * r_B * tL_20(:,1)); % cm, expected length at time
  ELw_25 = Lw_i - (Lw_i - Lw_b) * exp( - TC_25 * r_B * tL_25(:,1)); % cm, expected length at time

% temp - age at birth
  Ea_b = a_b ./ tempcorr(C2K(Tab(:,1)), T_ref, T_A);
% temp - time since birth at puberty data
  Et_p= a_p ./ tempcorr(C2K(Ttp(:,1)), T_ref, T_A);
% temp - age at death (lifespan)
  Et_m = a_m ./ tempcorr(C2K(Ttm(:,1)), T_ref, T_A);

 % tN-data
  pars_R = [kap; kap_R; g; TC_10 * k_J; TC_10 * k_M; L_T; TC_10 * v; U_Hb/ TC_10; U_Hp/ TC_10]; % compose parameter vector at T
  EN_10 = cum_reprod(tN_10(:,1), f, pars_R); % #/d, ultimate reproduction rate at T
  pars_R = [kap; kap_R; g; TC_15 * k_J; TC_15 * k_M; L_T; TC_15 * v; U_Hb/ TC_15; U_Hp/ TC_15]; % compose parameter vector at T
  EN_15 = cum_reprod(tN_15(:,1), f, pars_R); % #/d, ultimate reproduction rate at T
  pars_R = [kap; kap_R; g; TC_20 * k_J; TC_20 * k_M; L_T; TC_20 * v; U_Hb/ TC_20; U_Hp/ TC_20]; % compose parameter vector at T
  EN_20 = cum_reprod(tN_20(:,1), f, pars_R); % #/d, ultimate reproduction rate at T
  pars_R = [kap; kap_R; g; TC_25 * k_J; TC_25 * k_M; L_T; TC_25 * v; U_Hb/ TC_25; U_Hp/ TC_25]; % compose parameter vector at T
  EN_25 = cum_reprod(tN_25(:,1), f, pars_R); % #/d, ultimate reproduction rate at T
 
%   % pack to output
    prdData.tL_10 = ELw_10;
    prdData.tL_15 = ELw_15;
    prdData.tL_20 = ELw_20;
    prdData.tL_25 = ELw_25;
    prdData.Tab = Ea_b;
    prdData.Ttp = Et_p;
    prdData.Ttm = Et_m;
    prdData.tN_10 = EN_10;
    prdData.tN_10 = EN_10;
    prdData.tN_15 = EN_15;
    prdData.tN_20 = EN_20;
    prdData.tN_25 = EN_25;  
%     


function [prdData, info] = predict_Perna_canaliculus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
 filterChecks = f_tL1>1.2 || f_tL2 >1.2 || f_LWN > 1.5 ||...
     f2 > f5  || f2 > f4  || f2 > f3  || ...
     f3 > f5  || f3 > f4  || f4 > f5  ||...
     p_M > (24.311 + 2.278)  || 1/(1+ome) < 0.3 || kap_Pf3 < 0.24; 



 % d_V = 0.138;

             
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  % compute temperature correction factors
  pars_TC = [T_A T_L T_H T_AL T_AH];
  TC_ab = tempcorr(temp.ab, T_ref, pars_TC);
  TC_tj = tempcorr(temp.tj, T_ref, pars_TC);
  TC_tp = tempcorr(temp.tp, T_ref, pars_TC);
  TC_am = tempcorr(temp.am, T_ref, pars_TC);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_TC);
  TC_GSI=tempcorr(temp.GSI, T_ref, pars_TC);

  TC_tL0 = tempcorr(temp.tL0, T_ref, pars_TC);
  TC_tL2 = tempcorr(temp.tL2, T_ref, pars_TC);
  TC_tL1 = tempcorr(temp.tL1, T_ref, pars_TC);
  TC_LN_18 = tempcorr(temp.LN_18, T_ref, pars_TC);
  TC_LN_20 = tempcorr(temp.LN_20, T_ref, pars_TC);
  
  TC_exp = tempcorr(temp.WtdWt_f5, T_ref, pars_TC);   % all experimental treatments - temp=18
  
  % zero-variate data
  %=======================================================================================

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  % --> using the one calculated for repro rates!
%    pars_UE0 = [V_Hb; g; k_J ;k_M; v];
%    U_E0 = initial_scaled_reserve(f, pars_UE0); %d.cm2, initial scaled reserve. 
%    E0 = U_E0 * p_Am; % J, initial energy in egg
   
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Me;                % cm, total length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * ome); % g, ash free dry weight at birth at f 
  aT_b = tau_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis 
  L_j = L_m * l_j; s_M = L_j/ L_b;                   % -, acceleration factor at f = 1 --> used later for GSI!
  % metamorphosis -> data from tL0 experiment
  [tau_j, ~, ~, l_j, ~, ~, ~, rho_j, rho_B, info] = get_tj(pars_tj, f_tL0);
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_Me;                % cm, total length at metam at f
  Wd_j = L_j^3 * d_V * (1 + f_tL0 * ome); % g,ash free dry weight at metam
  tT_j = (tau_j-tau_b)/ k_M/ TC_tj;   % d, age at metam
%  s_M = L_j/ L_b; 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = L_p^3 * d_V2 * (1 + f * ome); % g, dry weight at puberty 
  tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Wd_i = L_i^3 * d_V2 * (1 + f * ome); % g, ultimate dry weight 
 
  % reproduction
  F = f; 
  GSI = (365 * TC_GSI * k_M * g/ F^3) / (F + kap * g * y_V_E);  % see eqn 2 LikaKooy2014: http://dx.doi.org/10.1016/j.seares.2013.12.012
  GSI = GSI * ((1 - kap) * F^3 - ...
  k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W, gonado-somatic index at fsub 
  
   pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdj = Wd_j;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.GSI = GSI;
  prdData.Ri = RT_i;


  % uni-variate data
  %======================================================================================= 

  % time-length larvae  
  tvel = get_tj(pars_tj, f_tL0, [0 f_tL0 0.01*del_M/L_m], tL0(:,1) * k_M * TC_tL0);
  ELw_0 = L_m * tvel(:,4)/ del_M; % cm, total length   
  
  % - Jeffrey Ren data -------------
  % time-length, dry weight, post metam with f_tL1
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL1);
  L_i = L_m * l_i;
  rT_B = TC_tL1 * rho_B * k_M;
  
  L_01 = L0.tL1 * del_M; time = tL1(:,1) - tL1(1,1); % simulate initial measurement as birth
  EL_1 = (L_i - (L_i - L_01) * exp( - rT_B * time )); % cm, structural length
  ELw_1 = EL_1/ del_M; % cm, shell length
  EWd_1 = d_V2 * EL_1.^3 * (1 + f_tL1 * ome); % g, dry weight (time vector is the same for L and W)
%   [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL1);
%   kT_M = k_M * TC_tL1; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M; 
%   L_j = L_m * l_j; L_i = L_m * l_i;
%   EL_1 = L_i - (L_i - L_j) * exp( - rT_B * (tL1(:,1) - tT_j)); ELw_1 = EL_1/ del_M; % cm, shell length
%   EWd_1 =  d_V2 *EL_1.^3 * (1 + f_tL1 * ome); % g, dry weight (time vector is the same for L and W)

  % time-length, dry weight, post metam with f_tL2
   [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL2);
  L_i = L_m * l_i;
  rT_B = TC_tL2 * rho_B * k_M;
  
  L_02 = L0.tL2 * del_M; time = tL2(:,1) - tL2(1,1); % simulate initial measurement as birth
  EL_2 = (L_i - (L_i - L_02) * exp( - rT_B * time )); % cm, structural length
  ELw_2 = EL_2/ del_M; % cm, shell length
  EWd_2 = d_V2 * EL_2.^3 * (1 + f_tL2 * ome); % g, dry weight (time vector is the same for L and W)
%   
%   [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL2);
%   kT_M = k_M * TC_tL2; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M; 
%   L_j = L_m * l_j; L_i = L_m * l_i;
%  EL_2 = L_i - (L_i - L_j) * exp( - rT_B * (tL2(:,1) - tT_j)); ELw_2 = EL_2/ del_M; % cm, shell length
%   %EWd_2 = d_V * (L_i - (L_i - L_j * del_M) * exp( - rT_B * tW2(:,1))).^3 * (1 + f_tL2 * ome); % g, dry weight
%   EWd_2 =  d_V2 * EL_2.^3 * (1 + f_tL2 * ome); % g, dry weight (time vector is the same for L and W)
%   
  
% --- MArtinData --------
% length - flesh wet weight (prior to spawning -- think about adding repro buffer!)
%   ELWw_fam =  (LWw_fam(:,1)*del_M).^3 * (1 + f_LWN  * ome); % g, wet weight
   
% length- live wet weight (prior to spawning -- think about adding repro buffer!)
  ELWt_18 =  (LWt_18(:,1)*del_M).^3 * (1 + f_LWN  * ome) / tw2fw_LWN; % g, wet weight
  ELWt_20 =  (LWt_20(:,1)*del_M).^3 * (1 + f_LWN * ome) / tw2fw_LWN; % g, wet weight
   
  % Shell length vs. fecundity
 [R, U_E0] = reprod_rate_j(LN_18(:,1) * del_M, f_LWN, pars_R);
  EN_18 = 365 * TC_LN_18 * R ;% #, number of offspring per year
  [R, U_E0] = reprod_rate_j(LN_20(:,1) * del_M, f_LWN, pars_R);
  EN_20 = 365 * TC_LN_20 * R ;% #, number of offspring per year
  
  E0 = U_E0 * p_Am; % J, initial energy in egg
  
%   E_ER = EN * (E0/kap_R); % J, energy in repro buffer just prior to spawning
%   ELW  = ELW + E_ER* w_E/ mu_E/(d_E*2); % g, add repro buffer, assumes no water in the reproduction buffer 
  
   % TREATMENT 5 
  %---------------------------------------------------------------------------------------
  
  %f5 = kfood *4; 
  f_treat = f5; TC = TC_exp; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_treat);
  L_i = L_m * l_i;
  rT_B = TC * rho_B * k_M;
  
  % LWw & LWd data 
  EWt_biometry_f5 = (LWt_f5(:,1) * del_M).^3 * (1 + ome * f_treat) / tw2fw;   % g, expected total wet weight
  EWafd_f5_E2 = (LWafd_f5_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V ;   % g, expected ash-free dry weight  
  EWt_f5_E2 = (LWt_f5_E2(:,1) * del_M).^3 * (1 + ome * f_treat) / tw2fw ;   % g, expected total wet weight  
  EWw_f5_E2 = (LWw_f5_E2(:,1) * del_M).^3 * (1 + ome * f_treat) ;   % g, expected flesh wet weight  
  EWd_f5_E2 = (LWd_f5_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V2 ;   % g, expected  dry weight  
  % L-energy 
  % energy(J) = [(1-ome) * afdw(g)/w_V(g/mol) *mu_V (J/mol)] + [(1-ome) * afdw(g)/w_E(g/mol) *mu_E (J/mol)] 
  EWafd_f5 = (LEn_f5_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V ;   % g, expected ash-free dry weight 
  EEn_f5_E2 = [(1-ome) * EWafd_f5 /w_V *mu_V] + [ome * EWafd_f5 /w_E *mu_E];
  
  % tL and tW data
  L_0_f5 = L0.tL_f5 * del_M;
  EL_f5 = (L_i - (L_i - L_0_f5) * exp( - rT_B * tL_f5(:,1) )); % cm, structural length
  ELw_f5 = EL_f5/ del_M; % cm, shell length
  EWt_f5 = EL_f5.^3 * (1 + f_treat * ome) / tw2fw; % g, wet total weight

  
  % WdW data
  L = (WtdWt_f5(:,1)*tw2fw / (1 + f_treat * ome)).^(1/3);    % cm, structural length
  dL = rT_B * (L_i - L);                          % cm/d, change in length after j
  EdWt_f5 = (1 + ome * f_treat) * 3 * L.^2 .* dL  ;    % g/d, change in wet weight after j
  EdWt_f5 =   EdWt_f5/tw2fw; % to total live mussel weight

  L = (WtdWt_f5_EXP2(:,1)*tw2fw / (1 + f_treat * ome)).^(1/3);    % cm, structural length
  dL = rT_B * (L_i - L);                          % cm/d, change in length after j
  EdWt_f5_EXP2 = (1 + ome * f_treat) * 3 * L.^2 .* dL  ;    % g/d, change in wet weight after j
  EdWt_f5_EXP2 =   EdWt_f5_EXP2/tw2fw; % to total live mussel weight


  % LdL data
  EdL_f5 = rT_B * (L_i/ del_M - LdL_f5(:,1));     % cm/d, growth in length after j
  EdL_f5_EXP2 = rT_B * (L_i/ del_M - LdL_f5_EXP2(:,1));     % cm/d, growth in length after j (EXP 2)    

 % WwJX data
       
  L = (WwJX_f5(:,1)/ (1 + f_treat * ome)).^(1/3);      % cm, structural length
  EJX_f5 =  TC * f_treat * s_M * p_Am/ kap_Xf5 * L.^2; % g/d, ingestion rate after j in wet weight
  
  % LJO data
  pT_ref = TC * p_Am * L_m^2;                         % J/d, max assimilation power at max size
  L =  LJO_f5(:,1) * del_M;                            % cm, structural length
  pACSJGRD = pT_ref * scaled_power_j(L, f_treat, pars_R, l_b, l_j, l_p);   % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end

  %-->  ingestion affecting mineral fluxes
  temp_y_E_X  = kap_Xf5 * mu_X/ mu_E;  % mol/mol, yield of reserve on food
  temp_y_X_E  = 1/ temp_y_E_X;            % mol/mol, yield of food on reserve
  temp_eta_XA = temp_y_X_E/ mu_E;          % mol/J, food-assim energy coupler
  temp_eta_O  = eta_O;
  temp_eta_O(1,1)=  -temp_eta_XA;
 
  temp_y_P_X  = kap_Pf5 * mu_X/ mu_P;  % mol/mol, yield of faeces on food 
  temp_y_P_E  = temp_y_P_X/ temp_y_E_X;          % mol/mol, yield of faeces on reserve
  temp_eta_PA = temp_y_P_E/mu_E;          % mol/J, faeces-assim energy coupler
%   temp_y_X_P  = 1/ temp_y_P_X;            % mol/mol, yield of food on faeces
  temp_eta_O(4,1)=  temp_eta_PA;
   
  J_M = - (n_M\n_O) * temp_eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJO_f5 = - J_M(3,:)' * 32e6/ 24/ 60;                % mug O2/min, specific O2 consumption
  
  %% TREATMENT 4 
  %---------------------------------------------------------------------------------------

  %f4 = kfood * 1; 
  f_treat = f4; TC = TC_exp; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_treat);
  L_i = L_m * l_i;
  rT_B = TC * rho_B * k_M;
  
  % LWw & LWd data 
  EWt_biometry_f4 = (LWt_f4(:,1) * del_M).^3 * (1 + ome * f_treat) / tw2fw;   % g, expected total wet weight
  EWafd_f4_E2 = (LWafd_f4_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V ;   % g, expected ash-free dry weight  
  EWt_f4_E2 = (LWt_f4_E2(:,1) * del_M).^3 * (1 + ome * f_treat) / tw2fw ;   % g, expected total wet weight  
  EWw_f4_E2 = (LWw_f4_E2(:,1) * del_M).^3 * (1 + ome * f_treat) ;   % g, expected flesh wet weight  
  EWd_f4_E2 = (LWd_f4_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V2 ;   % g, expected  dry weight  
 % L-energy
   EWafd_f4 = (LEn_f4_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V ;   % g, expected ash-free dry weight 
  EEn_f4_E2 = [(1-ome) * EWafd_f4 /w_V *mu_V] + [ome * EWafd_f4 /w_E *mu_E];
  
  % tL and tW data
  L_0_f4 = L0.tL_f4 * del_M;
  EL_f4 = (L_i - (L_i - L_0_f4) * exp( - rT_B * tL_f4(:,1) )); % cm, structural length
  ELw_f4 = EL_f4/ del_M; % cm, shell length
  EWt_f4 = EL_f4.^3 * (1 + f_treat * ome) / tw2fw; % g, wet total weight

  
  % WdW data
  L = (WtdWt_f4(:,1)*tw2fw / (1 + f_treat * ome)).^(1/3);    % cm, structural length
  dL = rT_B * (L_i - L);                          % cm/d, change in length after j
  EdWt_f4 = (1 + ome * f_treat) * 3 * L.^2 .* dL  ;    % g/d, change in wet weight after j
  EdWt_f4 =   EdWt_f4/tw2fw; % to total live mussel weight

  L = (WtdWt_f4_EXP2(:,1)*tw2fw / (1 + f_treat * ome)).^(1/3);    % cm, structural length
  dL = rT_B * (L_i - L);                          % cm/d, change in length after j
  EdWt_f4_EXP2 = (1 + ome * f_treat) * 3 * L.^2 .* dL  ;    % g/d, change in wet weight after j
  EdWt_f4_EXP2 =   EdWt_f4_EXP2/tw2fw; % to total live mussel weight

  % LdL data
  EdL_f4 = rT_B * (L_i/ del_M - LdL_f4(:,1));     % cm/d, growth in length after j
  EdL_f4_EXP2 = rT_B * (L_i/ del_M - LdL_f4_EXP2(:,1));     % cm/d, growth in length after j (EXP 2)    

  % WwJX data
  L = (WwJX_f4(:,1)/ (1 + f_treat * w)).^(1/3);      % cm, structural length
  EJX_f4 =  TC * f_treat * s_M * p_Am/ kap_Xf4 * L.^2; % g/d, ingestion rate after j in wet weight
  
  % LJO data
  pT_ref = TC * p_Am * L_m^2;                         % J/d, max assimilation power at max size
  L =  LJO_f4(:,1) * del_M;                            % cm, structural length
  pACSJGRD = pT_ref * scaled_power_j(L, f_treat, pars_R, l_b, l_j, l_p);   % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
 
  %-->  ingestion affecting mineral fluxes
     temp_y_E_X  = kap_Xf4 * mu_X/ mu_E;  % mol/mol, yield of reserve on food
  temp_y_X_E  = 1/ temp_y_E_X;            % mol/mol, yield of food on reserve
  temp_eta_XA = temp_y_X_E/ mu_E;          % mol/J, food-assim energy coupler
  temp_eta_O  = eta_O;
  temp_eta_O(1,1)=  -temp_eta_XA;
 
  temp_y_P_X  = kap_Pf4 * mu_X/ mu_P;  % mol/mol, yield of faeces on food 
  temp_y_P_E  = temp_y_P_X/ temp_y_E_X;          % mol/mol, yield of faeces on reserve
  temp_eta_PA = temp_y_P_E/mu_E;          % mol/J, faeces-assim energy coupler
%   temp_y_X_P  = 1/ temp_y_P_X;            % mol/mol, yield of food on faeces
  temp_eta_O(4,1)=  temp_eta_PA;
   
  J_M = - (n_M\n_O) * temp_eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJO_f4 = - J_M(3,:)' * 32e6/ 24/ 60;                % mug O2/min, specific O2 consumption

  
  %% TREATMENT 3 
  %---------------------------------------------------------------------------------------
  
  %f4 = kfood * 0.5; 
  f_treat = f3; TC = TC_exp; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_treat);
  L_i = L_m * l_i;
  rT_B = TC * rho_B * k_M;
  
  % LWw & LWd data 
  EWt_biometry_f3 = (LWt_f3(:,1) * del_M).^3 * (1 + ome * f_treat) / tw2fw;   % g, expected total wet weight
  EWafd_f3_E2 = (LWafd_f3_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V ;   % g, expected ash-free dry weight  
  EWt_f3_E2 = (LWt_f3_E2(:,1) * del_M).^3 * (1 + ome * f_treat) / tw2fw ;   % g, expected total wet weight  
  EWw_f3_E2 = (LWw_f3_E2(:,1) * del_M).^3 * (1 + ome * f_treat) ;   % g, expected flesh wet weight  
  EWd_f3_E2 = (LWd_f3_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V2 ;   % g, expected  dry weight  
  % L-energy
  EWafd_f3 = (LEn_f3_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V ;   % g, expected ash-free dry weight 
  EEn_f3_E2 = [(1-ome) * EWafd_f3 /w_V *mu_V] + [ome * EWafd_f3 /w_E *mu_E];
  

  % tL and tW data
  L_0_f3 = L0.tL_f3 * del_M;
  EL_f3 = (L_i - (L_i - L_0_f3) * exp( - rT_B * tL_f3(:,1) )); % cm, structural length
  ELw_f3 = EL_f3/ del_M; % cm, shell length
  EWt_f3 = EL_f3.^3 * (1 + f_treat * ome) / tw2fw; % g, wet total weight

  
  % WdW data
  L = (WtdWt_f3(:,1)*tw2fw / (1 + f_treat * ome)).^(1/3);    % cm, structural length
  dL = rT_B * (L_i - L);                          % cm/d, change in length after j
  EdWt_f3 = (1 + ome * f_treat) * 3 * L.^2 .* dL  ;    % g/d, change in wet weight after j
  EdWt_f3 =   EdWt_f3/tw2fw; % to total live mussel weight

  L = (WtdWt_f3_EXP2(:,1)*tw2fw / (1 + f_treat * ome)).^(1/3);    % cm, structural length
  dL = rT_B * (L_i - L);                          % cm/d, change in length after j
  EdWt_f3_EXP2 = (1 + ome * f_treat) * 3 * L.^2 .* dL  ;    % g/d, change in wet weight after j
  EdWt_f3_EXP2 =   EdWt_f3_EXP2/tw2fw; % to total live mussel weight

  % LdL data
  EdL_f3 = rT_B * (L_i/ del_M - LdL_f3(:,1));     % cm/d, growth in length after j
  EdL_f3_EXP2 = rT_B * (L_i/ del_M - LdL_f3_EXP2(:,1));     % cm/d, growth in length after j (EXP 2)    

  % WwJX data
  L = (WwJX_f3(:,1)/ (1 + f_treat * w)).^(1/3);      % cm, structural length
  EJX_f3 =  TC * f_treat * s_M * p_Am/ kap_Xf3 * L.^2; % g/d, ingestion rate after j in wet weight
  
  % LJO data
  pT_ref = TC * p_Am * L_m^2;                         % J/d, max assimilation power at max size
  L =  LJO_f3(:,1) * del_M;                            % cm, structural length
  pACSJGRD = pT_ref * scaled_power_j(L, f_treat, pars_R, l_b, l_j, l_p);   % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
 
  %-->  ingestion affecting mineral fluxes
  temp_y_E_X  = kap_Xf3 * mu_X/ mu_E;  % mol/mol, yield of reserve on food
  temp_y_X_E  = 1/ temp_y_E_X;            % mol/mol, yield of food on reserve
  temp_eta_XA = temp_y_X_E/ mu_E;          % mol/J, food-assim energy coupler
  temp_eta_O  = eta_O;
  temp_eta_O(1,1)=  -temp_eta_XA;
 
  temp_y_P_X  = kap_Pf3* mu_X/ mu_P;  % mol/mol, yield of faeces on food 
  temp_y_P_E  = temp_y_P_X/ temp_y_E_X;          % mol/mol, yield of faeces on reserve
  temp_eta_PA = temp_y_P_E/mu_E;          % mol/J, faeces-assim energy coupler
%   temp_y_X_P  = 1/ temp_y_P_X;            % mol/mol, yield of food on faeces
  temp_eta_O(4,1)=  temp_eta_PA;
   
  J_M = - (n_M\n_O) * temp_eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJO_f3 = - J_M(3,:)' * 32e6/ 24/ 60;                % mug O2/min, specific O2 consumption
  
  
  %% TREATMENT 2 
  %---------------------------------------------------------------------------------------

  %f2 = kfood * 0.15; 
  f_treat = f2; TC = TC_exp; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_treat);
  L_i = L_m * l_i;
  rT_B = TC * rho_B * k_M;
  
  % LWw & LWd data 
  EWt_biometry_f2 = (LWt_f2(:,1) * del_M).^3 * (1 + ome * f_treat) / tw2fw;   % g, expected total wet weight
  EWafd_f2_E2 = (LWafd_f2_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V ;   % g, expected ash-free dry weight  
  EWt_f2_E2 = (LWt_f2_E2(:,1) * del_M).^3 * (1 + ome * f_treat) / tw2fw ;   % g, expected total wet weight  
  EWw_f2_E2 = (LWw_f2_E2(:,1) * del_M).^3 * (1 + ome * f_treat) ;   % g, expected flesh wet weight  
  EWd_f2_E2 = (LWd_f2_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V2 ;   % g, expected  dry weight  
 % L-energy
  EWafd_f2 = (LEn_f2_E2(:,1) * del_M).^3 * (1 + ome * f_treat) * d_V ;   % g, expected ash-free dry weight 
  EEn_f2_E2 = [(1-ome) * EWafd_f2 /w_V *mu_V] + [ome * EWafd_f2 /w_E *mu_E];
  
  % tL and tW data
  L_0_f2 = L0.tL_f2 * del_M;
  EL_f2 = (L_i - (L_i - L_0_f2) * exp( - rT_B * tL_f2(:,1) )); % cm, structural length
  ELw_f2 = EL_f2/ del_M; % cm, shell length
  EWt_f2 = EL_f2.^3 * (1 + f_treat * ome) / tw2fw; % g, wet total weight

  % WdW data
  L = (WtdWt_f2(:,1)*tw2fw / (1 + f_treat * ome)).^(1/3);    % cm, structural length
  dL = rT_B * (L_i - L);                          % cm/d, change in length after j
  EdWt_f2 = (1 + ome * f_treat) * 3 * L.^2 .* dL  ;    % g/d, change in wet weight after j
  EdWt_f2 =   EdWt_f2/tw2fw; % to total live mussel weight

  L = (WtdWt_f2_EXP2(:,1)*tw2fw / (1 + f_treat * ome)).^(1/3);    % cm, structural length
  dL = rT_B * (L_i - L);                          % cm/d, change in length after j
  EdWt_f2_EXP2 = (1 + ome * f_treat) * 3 * L.^2 .* dL  ;    % g/d, change in wet weight after j
  EdWt_f2_EXP2 =   EdWt_f2_EXP2/tw2fw; % to total live mussel weight

  % LdL data
  EdL_f2 = rT_B * (L_i/ del_M - LdL_f2(:,1));     % cm/d, growth in length after j
  EdL_f2_EXP2 = rT_B * (L_i/ del_M - LdL_f2_EXP2(:,1));     % cm/d, growth in length after j (EXP 2)    

   % WwJX data
  L = (WwJX_f2(:,1)/ (1 + f_treat * w)).^(1/3);      % cm, structural length
  %L = WwJX_f2(:,1) * del_M;      % cm, structural length
  EJX_f2 =  TC * f_treat * s_M * p_Am/ kap_X * L.^2; % g/d, ingestion rate after j in wet weight

  % LJO data
  pT_ref = TC * p_Am * L_m^2;                         % J/d, max assimilation power at max size
  L =  LJO_f2(:,1) * del_M;                            % cm, structural length
  pACSJGRD = pT_ref * scaled_power_j(L, f_treat, pars_R, l_b, l_j, l_p);   % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJO_f2 = - J_M(3,:)' * 32e6/ 24/ 60;                % mug O2/min, specific O2 consumption
   
  
   %% pack to output
  prdData.tL0 = ELw_0;
  prdData.tWd1 = EWd_1;
  prdData.tWd2 = EWd_2;
  prdData.tL1 = ELw_1;
  prdData.tL2 = ELw_2;  
  
%   prdData.LWw_fam = ELWw_fam;  
  prdData.LWt_18 = ELWt_18;  
  prdData.LWt_20 = ELWt_20;  
  prdData.LN_18 = EN_18;
  prdData.LN_20 = EN_20;
  prdData.E0 = E0;
  % treatment 5:
  prdData.LWt_f5 = EWt_biometry_f5;
  prdData.LWafd_f5_E2 = EWafd_f5_E2;
  prdData.LWt_f5_E2 = EWt_f5_E2;
  prdData.LWw_f5_E2 = EWw_f5_E2;
  prdData.LWd_f5_E2 = EWd_f5_E2;
  prdData.LEn_f5_E2 = EEn_f5_E2;
  prdData.tL_f5 = ELw_f5;
  prdData.tWt_f5 = EWt_f5;
  prdData.WtdWt_f5 = EdWt_f5;
  prdData.WtdWt_f5_EXP2 = EdWt_f5_EXP2;
  prdData.LdL_f5 = EdL_f5;
  prdData.LdL_f5_EXP2 = EdL_f5_EXP2;
  prdData.WwJX_f5 = EJX_f5;
  prdData.LJO_f5 = EJO_f5;
  % treatment 4:
  prdData.LWt_f4 = EWt_biometry_f4;
  prdData.LWafd_f4_E2 = EWafd_f4_E2;
  prdData.LWt_f4_E2 = EWt_f4_E2;
  prdData.LWw_f4_E2 = EWw_f4_E2;
  prdData.LWd_f4_E2 = EWd_f4_E2;
  prdData.LEn_f4_E2 = EEn_f4_E2;
  prdData.tL_f4 = ELw_f4;
  prdData.tWt_f4 = EWt_f4;
  prdData.WtdWt_f4 = EdWt_f4;
  prdData.WtdWt_f4_EXP2 = EdWt_f4_EXP2;
  prdData.LdL_f4 = EdL_f4;
  prdData.LdL_f4_EXP2 = EdL_f4_EXP2;
  prdData.WwJX_f4 = EJX_f4;
  prdData.LJO_f4 = EJO_f4;  
  % treatment 3:
  prdData.LWt_f3 = EWt_biometry_f3;
  prdData.LWafd_f3_E2 = EWafd_f3_E2;
  prdData.LWt_f3_E2 = EWt_f3_E2;
  prdData.LWw_f3_E2 = EWw_f3_E2;
  prdData.LWd_f3_E2 = EWd_f3_E2;
  prdData.LEn_f3_E2 = EEn_f3_E2;
  prdData.tL_f3 = ELw_f3;
  prdData.tWt_f3 = EWt_f3;
  prdData.WtdWt_f3 = EdWt_f3;
  prdData.WtdWt_f3_EXP2 = EdWt_f3_EXP2;
  prdData.LdL_f3 = EdL_f3;
  prdData.LdL_f3_EXP2 = EdL_f3_EXP2;
  prdData.WwJX_f3 = EJX_f3;
  prdData.LJO_f3 = EJO_f3;
% treatment 2:
  prdData.LWt_f2 = EWt_biometry_f2;
  prdData.LWafd_f2_E2 = EWafd_f2_E2;
  prdData.LWt_f2_E2 = EWt_f2_E2;
  prdData.LWw_f2_E2 = EWw_f2_E2;
  prdData.LWd_f2_E2 = EWd_f2_E2;
  prdData.LEn_f2_E2 = EEn_f2_E2;
  prdData.tL_f2 = ELw_f2;
  prdData.tWt_f2 = EWt_f2;
  prdData.WtdWt_f2 = EdWt_f2;
  prdData.WtdWt_f2_EXP2 = EdWt_f2_EXP2;
  prdData.LdL_f2 = EdL_f2;
  prdData.LdL_f2_EXP2 = EdL_f2_EXP2;
  prdData.WwJX_f2 = EJX_f2;
  prdData.LJO_f2 = EJO_f2;
  

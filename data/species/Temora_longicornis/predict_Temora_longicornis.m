function [prdData, info] = predict_Temora_longicornis(par, data, auxData)
  
  % unpack par, data, auxData
  vars_pull(par);cPar = parscomp_st(par); vars_pull(cPar); 
  vars_pull(data); vars_pull(auxData);
  
%   % customized filters (additional filter also added in L_i calculation)
%   if kap_X + kap_P > 1  
%      disp("Sum of kap_X and kap_P is higher than 1")
%      info = 0; prdData = []; return;
%   end  

  % compute temperature correction factors
  pars_TC        = [T_A, T_L, T_H, T_AL, T_AH]; 
  TC_ab          = tempcorr(temp.ab, T_ref, pars_TC);
  TC_tp          = tempcorr(temp.tp, T_ref, pars_TC);
  TC_am          = tempcorr(temp.am, T_ref, pars_TC);
  TC_Ri          = tempcorr(temp.Ri, T_ref, pars_TC);
  TC_tW          = tempcorr(temp.tW1, T_ref, pars_TC);
  TC_tL_Klei1999 = tempcorr(temp.tL_Klei1999, T_ref, pars_TC);
  TC_tL_Pete1994 = tempcorr(temp.tL_Pete1994, T_ref, pars_TC);
  TC_tLX         = tempcorr(temp.tLX_2080, T_ref, pars_TC);
  TC_Xtp_05C     = tempcorr(temp.Xtp_05C, T_ref, pars_TC);
  TC_Xtp_10C     = tempcorr(temp.Xtp_10C, T_ref, pars_TC);
  TC_Xtp_15C     = tempcorr(temp.Xtp_15C, T_ref, pars_TC);
  TC_Xtp_20C     = tempcorr(temp.Xtp_20C, T_ref, pars_TC);
  TC_JXR         = tempcorr(temp.JXR, T_ref, pars_TC);
  TC_XR          = tempcorr(C2K([2 6 10 14 18]),T_ref, pars_TC);
  
  % zero-variate data
  % life cycle (for abp model)
  pars_tjj = [g k l_T v_Hb v_Hj v_Hj+1e-8];  
  [tau_j, ~, tau_b, l_j, ~, l_b, l_i_abj, ~, ~, info] = get_tj(pars_tjj, f); % only used to get l_i_abj
  pars_tjp = [g k l_T v_Hb v_Hp v_Hp+1e-8];  % v_Hp is here used to indicate end of acceleration
  [tau_p, ~, tau_b, l_p] = get_tj(pars_tjp, f);

  % birth (start of acceleration) DamLope2003
  L_b      = L_m * l_b;                        % TiteKior2003              % cm , structural length at birth at f
  Lw_b     = L_b/ del_M;                                                   % cm , total length at birth at f
  Wd_b     = 1e6 * L_b^3 * d_V * (1 + f * w);                              % mug, dry weight at birth
  aT_b     = tau_b/ k_M/ TC_ab;                % DamLope2003               % d  , age at birth at T

  % puberty (abp - end of acceleration and growth and kappa-rule)
  L_p      = L_m * l_p;                        % BakkRijs1987              % cm , structural length at puberty at f
  Lw_p     = L_p/ del_M;                                                   % cm , total length at puberty at f
  tT_p     = (tau_p - tau_b)/ k_M/ TC_tp;      % BakkRijs1976              % d  , time since birth at puberty at f and T
  Wd_p     = 1e6 * L_p^3 * d_V * (1 + f * w);  % BakkRijs1987              % mug, dry weight at puberty 
  s_M      = L_p/ L_b;                                                     % -  , acceleration factor

  % ultimate (same as puberty)
  Lw_i     = L_p/ del_M;                                                   % cm , ultimate total length at f
  Wd_i     = 1e6 * L_p^3 * d_V * (1 + f * w);                              % mug, ultimate dry weight 

  % Ultimate length abj (filter for large differences)
  L_i_abj  = L_m * l_i_abj;                                                % cm , ultimate structural length at f
  Lw_i_abj = L_i_abj/ del_M;                                               % cm , ultimate total length for abj at f
  del_Lip = Lw_i_abj / Lw_p;                                               % -, ratio of L_i of abj model of L_p of abp model

  % initial
  pars_UE0 = [V_Hb g k_J k_M v];                                           % compose parameter vector
  E_0      = p_Am * initial_scaled_reserve(f, pars_UE0);                   % J, initial reserve

  % reproduction (no kappa-rule) MapsRung2005  
  RT_i     = TC_Ri * kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate

  % life span
  h3_W     = f * h_a * v/ 6/ L_b;                                          % 1/d^3, cubed Weibull ageing rate
  a_m      = gamma(4/3)/ h3_W^(1/3);                                       % d, mean life span at T_ref
  aT_m     = a_m/ TC_am;                                                   % d, mean life span at T
     
  % pack to output
  prdData.ab      = aT_b;
  prdData.tp      = tT_p;
  prdData.am      = aT_m;
  prdData.Lp      = Lw_p;
  prdData.Li      = Lw_i;
  prdData.del_Lip = del_Lip;
  prdData.Wdb     = Wd_b;
  prdData.Wdp     = Wd_p;
  prdData.Wdi     = Wd_i;
  prdData.Ri      = RT_i;  
 
  % uni-variate data
  
  % time-length Klei1999
  [tvel, ~, ~, ~, ~, l_p]  = get_tj(pars_tjp, f_tL_Klei1999, [], tL_Klei1999(:,1) * k_M * TC_tL_Klei1999);
  ELw_Klei1999 = L_m * min(l_p, tvel(:,4))/ del_M;
  
  % time-length Pete1994
  [tvel, ~, ~, ~, ~, l_p]  = get_tj(pars_tjp, f_tL_Pete1994, [], tL_Pete1994(:,1) * k_M * TC_tL_Pete1994);
  ELw_Pete1994 = L_m * min(l_p, tvel(:,4))/ del_M;

  % time-Length - food level
  kT_M = k_M * TC_tLX;
  [tvel, ~, ~, ~, ~, l_p]  = get_tj(pars_tjp, f_tLX_2080, [], tLX_2080(:,1) * kT_M);
  ELw_2080 = L_m * min(l_p, tvel(:,4))/ del_M;
  %
  [tvel, ~, ~, ~, ~, l_p]  = get_tj(pars_tjp, f_tLX_1398, [], tLX_1398(:,1) * kT_M);
  ELw_1398 = L_m * min(l_p, tvel(:,4))/ del_M;
  %
  [tvel, ~, ~, ~, ~, l_p]  = get_tj(pars_tjp, f_tLX_0478, [], tLX_0478(:,1) * kT_M);
  ELw_0478 = L_m * min(l_p, tvel(:,4))/ del_M;
  %
  [tvel, ~, ~, ~, ~, l_p]  = get_tj(pars_tjp, f_tLX_0300, [], tLX_0300(:,1) * kT_M);
  ELw_0300 = L_m * min(l_p, tvel(:,4))/ del_M;
  %
  [tvel, ~, ~, ~, ~, l_p]  = get_tj(pars_tjp, f_tLX_0165, [], tLX_0165(:,1) * kT_M);
  ELw_0165 = L_m * min(l_p, tvel(:,4))/ del_M;
  %
  [tvel, ~, ~, ~, ~, l_p]  = get_tj(pars_tjp, f_tLX_0092, [], tLX_0092(:,1) * kT_M);
  ELw_0092 = L_m * min(l_p, tvel(:,4))/ del_M;
  %
  [tvel, ~, ~, ~, ~, l_p]  = get_tj(pars_tjp, f_tLX_0047, [], tLX_0047(:,1) * kT_M);
  ELw_0047 = L_m * min(l_p, tvel(:,4))/ del_M;
  %
  [tvel, ~, ~, ~, ~, l_p]  = get_tj(pars_tjp, f_tLX_0029, [], tLX_0029(:,1) * kT_M);
  ELw_0029 = L_m * min(l_p, tvel(:,4))/ del_M;
  
  % food-time since birth at puberty
  n = size(Xtp_05C,1); EtT_p_05 = NaN(n,1); EtT_p_10 = NaN(n,1); EtT_p_15 = NaN(n,1); EtT_p_20 = NaN(n,1); 
  for i=1:n
  EtT_p_05(i) = get_tj(pars_tjp, Xtp_05C(i,1) ./ (X_K + Xtp_05C(i,1)))/ k_M/ TC_Xtp_05C;
  EtT_p_10(i) = get_tj(pars_tjp, Xtp_10C(i,1) ./ (X_K + Xtp_10C(i,1)))/ k_M/ TC_Xtp_10C;
  EtT_p_15(i) = get_tj(pars_tjp, Xtp_15C(i,1) ./ (X_K + Xtp_15C(i,1)))/ k_M/ TC_Xtp_15C;
  EtT_p_20(i) = get_tj(pars_tjp, Xtp_20C(i,1) ./ (X_K + Xtp_20C(i,1)))/ k_M/ TC_Xtp_20C;
  end

  % time-weight
  [tvel, ~, ~, ~, ~, l_p] = get_tj(pars_tjp, f_200, [], tW1(:,1) * k_M * TC_tW);
  EWd_1 = 1e6 * (L_m * min(l_p,tvel(:,4))).^3 * d_V * (1 + f_200 * ome); % mug, dry weight 
  %
  [tvel, ~, ~, ~, ~, l_p] = get_tj(pars_tjp, f_100, [], tW2(:,1) * k_M * TC_tW);
  EWd_2 = 1e6 * (L_m * min(l_p,tvel(:,4))).^3 * d_V * (1 + f_200 * ome); % mug, dry weight 
  %
  [tvel, ~, ~, ~, ~, l_p] = get_tj(pars_tjp, f_050, [], tW3(:,1) * k_M * TC_tW);
  EWd_3 = 1e6 * (L_m * min(l_p,tvel(:,4))).^3 * d_V * (1 + f_200 * ome); % mug, dry weight 
  %
  [tvel, ~, ~, ~, ~, l_p] = get_tj(pars_tjp, f_025, [], tW4(:,1) * k_M * TC_tW);
  EWd_4 = 1e6 * (L_m * min(l_p,tvel(:,4))).^3 * d_V * (1 + f_200 * ome); % mug, dry weight 

  % length-weight
  EWd_L = 1e6 * (LW(:,1) * del_M).^3 * d_V * (1 + f_LW * w);           % mug, dry weight
   
  % ingestion rate-reproduction rate as C
  % first convert mug C/d to J/d, ingested energy to assimilated energy, subtract, convert back to mug C/d.
  [~, ~, ~, ~, l_p] = get_tj(pars_tjp, f_JXR);                        
  L_p   = L_m * l_p;                                                   % cm, structural length at puberty 
  ERT_C = (kap_XX * kap_X * (p_A0 + mu_X * JXR(:,1)/ 12e6) - TC_JXR * p_M * L_p^3 - TC_JXR * k_J * E_Hp) * kap_R/ mu_E * 12e6; % mug C/d, egg production
  % Filter: egg production cannot be negative 
  if any(ERT_C < 0)
    disp("Egg production estimate for JXR data is negative")
    %info = 0; prdData = []; return;
  end

  % food density-egg production as #/d
  f_XR = cell(1,5);
  f_XR{1} = XR_02C(:,1) ./ (X_K + XR_02C(:,1));                        % - , functional responses
  f_XR{2} = XR_06C(:,1) ./ (X_K + XR_06C(:,1));
  f_XR{3} = XR_10C(:,1) ./ (X_K + XR_10C(:,1));
  f_XR{4} = XR_14C(:,1) ./ (X_K + XR_14C(:,1));
  f_XR{5} = XR_18C(:,1) ./ (X_K + XR_18C(:,1));
  %
  % Initial conditions before experiment
  [~, ~, ~, l_p] = get_tj(pars_tjp, f_Ri, l_b);                        % overwrite l_p
  L_p = L_m * l_p;                                                     % cm, structural length at puberty 
  s_M = l_p/ l_b;                                                      % - , acceleration factor
  %
  R = cell(1,5);
  for i = 1:length(f_XR)
    n = length(f_XR{i}); R{i} = NaN(n,1);
    for k = 1:n
      R{i}(k) = TC_XR(i) * kap_R * (p_Am * s_M * L_p^2 * f_XR{i}(k) - p_M * L_p^3 - k_J * E_Hp)/ E_0; % #/ d, reproduction rate 
    end   
  end

  % pack to output
  prdData.tL_Klei1999 = ELw_Klei1999;
  prdData.tL_Pete1994 = ELw_Pete1994;
  prdData.tLX_2080    = ELw_2080;
  prdData.tLX_1398    = ELw_1398;
  prdData.tLX_0478    = ELw_0478;
  prdData.tLX_0300    = ELw_0300;
  prdData.tLX_0165    = ELw_0165; 
  prdData.tLX_0092    = ELw_0092;
  prdData.tLX_0047    = ELw_0047;
  prdData.tLX_0029    = ELw_0029;
  prdData.Xtp_05C     = EtT_p_05;
  prdData.Xtp_10C     = EtT_p_10;
  prdData.Xtp_15C     = EtT_p_15;
  prdData.Xtp_20C     = EtT_p_20;
  prdData.LW          = EWd_L;
  prdData.tW1         = EWd_1;
  prdData.tW2         = EWd_2;
  prdData.tW3         = EWd_3;
  prdData.tW4         = EWd_4;
  prdData.JXR         = ERT_C;
  prdData.XR_02C      = R{1};
  prdData.XR_06C      = R{2};
  prdData.XR_10C      = R{3};
  prdData.XR_14C      = R{4};
  prdData.XR_18C      = R{5};


function [prdData, info] = predict_Ctenophorus_ornatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_M1021 = tempcorr(temp.tW_M1021, T_ref, T_A);
  TC_M1032 = tempcorr(temp.tW_M1032, T_ref, T_A);
  TC_F1038 = tempcorr(temp.tW_F1038, T_ref, T_A);
  TC_F1024 = tempcorr(temp.tW_F1024, T_ref, T_A);
  TC_M1030 = tempcorr(temp.tW_M1030, T_ref, T_A);
  TC_F1043 = tempcorr(temp.tW_F1043, T_ref, T_A);
  TC_F1025 = tempcorr(temp.tW_F1025, T_ref, T_A);
  TC_F1035 = tempcorr(temp.tW_F1035, T_ref, T_A);
  TC_F1041 = tempcorr(temp.tW_F1041, T_ref, T_A);
  TC_M1026 = tempcorr(temp.tW_M1026, T_ref, T_A);
  TC_F1037 = tempcorr(temp.tW_F1037, T_ref, T_A);
  TC_F1040 = tempcorr(temp.tW_F1040, T_ref, T_A);
  TC_M1023 = tempcorr(temp.tW_M1023, T_ref, T_A);
  TC_M1029 = tempcorr(temp.tW_M1029, T_ref, T_A);
  TC_M1033 = tempcorr(temp.tW_M1033, T_ref, T_A);
  TC_M1042 = tempcorr(temp.tW_M1042, T_ref, T_A);

% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Ww_0 = w_E * U_E0 * p_Am/ mu_E/ d_E; % g, egg wet weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  a_b = t_b/ k_M; aT_b = a_b/ TC_ab;% d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
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
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % temp-age at birth
  prdData.Tab = a_b ./ TC_Tab;% d, age at birth at f and T
  
  % length-weight
  prdData.LW_M1021 = (LW_M1021(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_M1032 = (LW_M1032(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_F1038 = (LW_F1038(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_F1024 = (LW_F1024(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_M1030 = (LW_M1030(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_F1043 = (LW_F1043(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_F1025 = (LW_F1025(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_F1035 = (LW_F1035(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_F1041 = (LW_F1041(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_M1026 = (LW_M1026(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_F1037 = (LW_F1037(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_F1040 = (LW_F1040(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_M1023 = (LW_M1023(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_M1029 = (LW_M1029(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_M1033 = (LW_M1033(:,1) * del_M).^3 * (1 + f * w);
  prdData.LW_M1042 = (LW_M1042(:,1) * del_M).^3 * (1 + f * w);

  % time-weight  
  r_B = k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  prdData.tW_M1021 = (L_i - (L_i - L_b) * exp(- TC_M1021 * r_B * tW_M1021(:,1))).^3 * (1 + f * w);
  prdData.tW_M1032 = (L_i - (L_i - L_b) * exp(- TC_M1032 * r_B * tW_M1032(:,1))).^3 * (1 + f * w);
  prdData.tW_F1038 = (L_i - (L_i - L_b) * exp(- TC_F1038 * r_B * tW_F1038(:,1))).^3 * (1 + f * w);
  prdData.tW_F1024 = (L_i - (L_i - L_b) * exp(- TC_F1024 * r_B * tW_F1024(:,1))).^3 * (1 + f * w);
  prdData.tW_M1030 = (L_i - (L_i - L_b) * exp(- TC_M1030 * r_B * tW_M1030(:,1))).^3 * (1 + f * w);
  prdData.tW_F1043 = (L_i - (L_i - L_b) * exp(- TC_F1043 * r_B * tW_F1043(:,1))).^3 * (1 + f * w);
  prdData.tW_F1025 = (L_i - (L_i - L_b) * exp(- TC_F1025 * r_B * tW_F1025(:,1))).^3 * (1 + f * w);
  prdData.tW_F1035 = (L_i - (L_i - L_b) * exp(- TC_F1035 * r_B * tW_F1035(:,1))).^3 * (1 + f * w);
  prdData.tW_F1041 = (L_i - (L_i - L_b) * exp(- TC_F1041 * r_B * tW_F1041(:,1))).^3 * (1 + f * w);
  prdData.tW_M1026 = (L_i - (L_i - L_b) * exp(- TC_M1026 * r_B * tW_M1026(:,1))).^3 * (1 + f * w);
  prdData.tW_F1037 = (L_i - (L_i - L_b) * exp(- TC_F1037 * r_B * tW_F1037(:,1))).^3 * (1 + f * w);
  prdData.tW_F1040 = (L_i - (L_i - L_b) * exp(- TC_F1040 * r_B * tW_F1040(:,1))).^3 * (1 + f * w);
  prdData.tW_M1023 = (L_i - (L_i - L_b) * exp(- TC_M1023 * r_B * tW_M1023(:,1))).^3 * (1 + f * w);
  prdData.tW_M1029 = (L_i - (L_i - L_b) * exp(- TC_M1029 * r_B * tW_M1029(:,1))).^3 * (1 + f * w);
  prdData.tW_M1033 = (L_i - (L_i - L_b) * exp(- TC_M1033 * r_B * tW_M1033(:,1))).^3 * (1 + f * w);
  prdData.tW_M1042 = (L_i - (L_i - L_b) * exp(- TC_M1042 * r_B * tW_M1042(:,1))).^3 * (1 + f * w);

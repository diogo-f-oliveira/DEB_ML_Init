function [prdData, info] = predict_Takydromus_hsuehshanensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC_23 = tempcorr(temp.ab23, T_ref, T_A);
  TC_28 = tempcorr(temp.ab28, T_ref, T_A);
  TC_30 = tempcorr(temp.WwpT_f30, T_ref, T_A);
  TC_20 = tempcorr(temp.WwpT_f20, T_ref, T_A);
  TC_10 = tempcorr(temp.WwpT_f10, T_ref, T_A);
  TC_15 = tempcorr(temp.tW_fS15, T_ref, T_A);
  TC_5 = tempcorr(temp.tW_fS5, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  a_b = t_b/ k_M;                   % d, age at birth at f and T_ref
  aT_b23 = a_b/ TC_23; aT_b28 = a_b/ TC_28; % d, age at birth at f and T          

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_28;   % d, time since birth at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, SVL at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_28 * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_28;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m / E_G;        % mol/mol, reserve capacity
  w_m  = m_Em_m * w_E * d_V/ d_E/ w_V; % -, \omega, contribution of ash free dry mass of reserve to total ash free dry biomass
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  Ww_im = L_mm^3 * (1 + w_m);          % g, max wet weight

  % pack to output
  prdData.ab23 = aT_b23;
  prdData.ab28 = aT_b28;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwi_m = Ww_im;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time - SVL
  ir_B = 3/ k_M + 3 * L_i/ v; rT_B = TC_28/ ir_B; % d, 1/von Bert growth rate
  ELw = (L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)))/ del_M; % cm, SVL 
  
  % SLV - wet weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

  % time - weight during starvation
  EWw_fS15 = Ww_0S + 0 * tW_fS15(:,1);
  EWw_fS10 = Ww_0S + 0 * tW_fS10(:,1);
  EWw_fS5 = Ww_0S + 0 * tW_fS5(:,1);
  EWw_mS15 = Ww_0S + 0 * tW_mS15(:,1);
  EWw_mS10 = Ww_0S + 0 * tW_mS10(:,1);
  EWw_mS5 = Ww_0S + 0 * tW_mS5(:,1);

  % wet weight - standard metabolic rate
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  pars_power_m = [kap; kap_R; g_m; k_J; k_M; L_T; v; U_Hb; U_Hp];
  p_ref = p_Am * L_m^2;            % J/d, max assimilation power at max size for female
  p_ref_m = p_Am_m * L_mm^2;       % J/d, max assimilation power at max size for male
  % females at 30C
  pACSJGRD = p_ref * scaled_power((WwpT_f30(:,1)/ (1 + f * w)).^(1/3), f, pars_power, l_b, l_p);
  EpT_f30 = TC_30 * sum(pACSJGRD(:,[7 5]), 2)/ 24; % J/h, SMR: D + G 
  % females at 20C
  pACSJGRD = p_ref * scaled_power((WwpT_f20(:,1)/ (1 + f * w)).^(1/3), f, pars_power, l_b, l_p);
  EpT_f20 = TC_20 * sum(pACSJGRD(:,[7 5]), 2)/ 24; % J/h, SMR: D + G 
  % females at 10C
  pACSJGRD = p_ref * scaled_power((WwpT_f10(:,1)/ (1 + f * w)).^(1/3), f, pars_power, l_b, l_p);
  EpT_f10 = TC_10 * sum(pACSJGRD(:,[7 5]), 2)/ 24; % J/h, SMR: D + G 
  % males at 30C
  pACSJGRD = p_ref_m * scaled_power((WwpT_m30(:,1)/ (1 + f * w_m)).^(1/3), f, pars_power_m, l_b, l_p);
  EpT_m30 = TC_30 * sum(pACSJGRD(:,[7 5]), 2)/ 24; % J/h, SMR: D + G 
  % males at 20C
  pACSJGRD = p_ref_m * scaled_power((WwpT_m20(:,1)/ (1 + f * w_m)).^(1/3), f, pars_power_m, l_b, l_p);
  EpT_m20 = TC_20 * sum(pACSJGRD(:,[7 5]), 2)/ 24; % J/h, SMR: D + G 
  % males at 10C
  pACSJGRD = p_ref_m * scaled_power((WwpT_m10(:,1)/ (1 + f * w_m)).^(1/3), f, pars_power_m, l_b, l_p);
  EpT_m10 = TC_10 * sum(pACSJGRD(:,[7 5]), 2)/ 24; % J/h, SMR: D + G 

  
  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
  prdData.tW_fS15 = EWw_fS15;
  prdData.tW_fS10 = EWw_fS10;
  prdData.tW_fS5  = EWw_fS5;
  prdData.tW_mS15 = EWw_mS15;
  prdData.tW_mS10 = EWw_mS10;
  prdData.tW_mS5  = EWw_mS5;
  prdData.WwpT_f30 = EpT_f30;  
  prdData.WwpT_f20 = EpT_f20;  
  prdData.WwpT_f10 = EpT_f10;  
  prdData.WwpT_m30 = EpT_m30;  
  prdData.WwpT_m20 = EpT_m20;  
  prdData.WwpT_m10 = EpT_m10;  


function [prdData, info] = predict_Euphausia_pacifica(par, data, auxData)
    
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_8 = tempcorr(temp.tW_8, T_ref, T_A);
  TC_12 = tempcorr(temp.tW_12, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f*ome);     % g, wet weight at birth
  Wd_b = Ww_b * d_V * 1e6;          % mug, dry weight at birth
  WC_b = Wd_b * 12 * (1/w_V + ome*f/w_E); % mug, C weight at birth
  WN_b = Wd_b * 14 * (n_NV/w_V + ome*n_NE/w_E); % mug, N weight at birth
  

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  WC_p = 1e6 * L_p^3 * d_V * 12 * (1/w_V + ome * f/w_E); % mug C, C weight at puberty 
  tT_p = (tau_p - tau_b)/ k_M/ TC_8; % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  WC_i = 1e6 * L_i^3 * d_V * 12 * (1/w_V + ome * f/w_E); % mug C, ultimate C weight
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ k_M/ TC_8;              % d, mean life span at T
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_8 * reprod_rate(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

  % pack to output
  prdData.am = aT_m;
  prdData.WCb = WC_b;
  prdData.WNb = WN_b;
  prdData.Wwb = Ww_b;
  prdData.WCp = WC_p;
  prdData.WCi = WC_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-C weight-N weight 
  tvel = get_tp(pars_tp, f_tW, [], tW_8(:,1) * k_M * TC_8);
  L = L_m * tvel(:,4); EWC_8 = 1e6 * L.^3 * d_V * 12 .* (1/w_V + ome*tvel(:,3)/w_E); % mug C weight
  EWN_8 = 1e6 * L.^3 * d_V * 14 .* (n_NV/w_V + ome*tvel(:,3)*n_NE/w_E); % mug N weight
  %
  tvel = get_tp(pars_tp, f_tW, [], tW_12(:,1) * k_M * TC_12);
  L = L_m * tvel(:,4); EWC_12 = 1e6 * L.^3 * d_V * 12 .* (1/w_V + ome*tvel(:,3)/w_E); % mug C weight
  EWN_12 = 1e6 * L.^3 * d_V * 14 .* (n_NV/w_V + ome*tvel(:,3)*n_NE/w_E); % mug N weight

  % weight-change in weight
  [tau_p, tau_b, l_p, l_b] = get_tp(pars_tp, f_tW); 
  L_b = L_m * l_b; L_i = L_m * f_tW; rT_B = TC_8 * k_M/ 3/ (1 + f_tW/ g);
  L = (1e-6 * WdW_8(:,1)/ (d_V * 12 * (1/w_V + ome*f_tW/w_E))).^(1/3); % cm, struc length
  dL = rT_B * (L_i - L); EdW_8 = d_V * (1/w_V + ome*f_tW/w_E) * 12e6 * 3 * L.^2 .* dL; % mug C
  %
  rT_B = TC_12 * k_M/ 3/ (1 + f_tW/ g);
  L = (1e-6 * WdW_12(:,1)/ (d_V * 12 * (1/w_V + ome*f_tW/w_E))).^(1/3); % cm, struc length
  dL = rT_B * (L_i - L); EdW_12 = d_V * (1/w_V + ome*f_tW/w_E) * 12e6 * 3 * L.^2 .* dL; % mug C
  
  % weight-ingestion
  L = (1e-6 * WJX_8(:,1)/ (d_V * 12 * (1/w_V + ome*f_tW/w_E))).^(1/3); % cm, struc length
  EJX_8 = L.^2 * TC_8 * p_Am/ kap_X/ mu_X * 12e6; % mug C, ingestion rate
  %
  L = (1e-6 * WJX_12(:,1)/ (d_V * 12 * (1/w_V + ome*f_tW/w_E))).^(1/3); % cm, struc length
  EJX_12 = L.^2 * TC_12 * p_Am/ kap_X/ mu_X * 12e6; % mug C, ingestion rate
    
  % weight-respiration  
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  L = (1e-6 * WJC_8(:,1)/ (d_V * 12 * (1/w_V + ome*f_tW/w_E))).^(1/3); % cm, struc length
  pACSJGRD = L_m^2 * p_Am * scaled_power(L, f_tW, pars_R, l_b, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:,[1 7 5])')'; % mol/d, mineral fluxes
  EJC_8 = TC_8 * J_M(:,1) * 12e6; % mug/d, CO2 flux
  %
  L = (1e-6 * WJC_12(:,1)/ (d_V * 12 * (1/w_V + ome*f_tW/w_E))).^(1/3); % cm, struc length
  pACSJGRD = L_m^2 * p_Am * scaled_power(L, f_tW, pars_R, l_b, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:,[1 7 5])')'; % mol/d, mineral fluxes
  EJC_12 = TC_12 * J_M(:,1) * 12e6; % mug/d, CO2 flux

  % pack to output
  prdData.tW_8  = [EWC_8 EWN_8];
  prdData.tW_12 = [EWC_12 EWN_12];
  prdData.WdW_8 = EdW_8;
  prdData.WdW_12 = EdW_12;
  prdData.WJX_8  = EJX_8;
  prdData.WJX_12 = EJX_12;  
  prdData.WJC_8  = EJC_8;
  prdData.WJC_12 = EJC_12;
end


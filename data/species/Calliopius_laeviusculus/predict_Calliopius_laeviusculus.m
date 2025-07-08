function [prdData, info] = predict_Calliopius_laeviusculus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_8 = tempcorr(temp.tW8, T_ref, T_A); kT_M = TC_8 * k_M;
  TC_12 = tempcorr(temp.tW12, T_ref, T_A); 
  TC_15 = tempcorr(temp.tW15, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  WC_b = 12e6/w_V * d_V * L_b^3 * (1 + f * w); % mug, C weight at birth
  aT_b = (t_0 + tau_b/ kT_M);       % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  WC_p = 12e6/w_V * d_V * L_p^3 * (1 + f * w);  % mug, wet weight at puberty 
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  WC_i = 12e6/w_V * d_V * L_i^3 * (1 + f * w); % mug, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_8 * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_8;                % d, mean life span at T
  
%   % males
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, max struct length
%   pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
%   [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m]);
%   L_bm = L_mm * l_bm; L_im = l_i * L_mm;% cm, structural lengths
%   Ww_im = L_im^3 * (1 + f * ome_m); % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.WCb = WC_b;
  prdData.WCp = WC_p;
  prdData.WCi = WC_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  % time-weight
  tvel = get_tj(pars_tj, f_8, [], tW8(:,1)*k_M*TC_8); 
  EWw_8 = 12e6/w_V*d_V*(L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome); % mug, weight
  %
  tvel = get_tj(pars_tj, f_8, [], tW12(:,1)*k_M*TC_12); 
  EWw_12 = 12e6/w_V*d_V*(L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome); % mug, weight
  %
  tvel = get_tj(pars_tj, f_8, [], tW15(:,1)*k_M*TC_15); 
  EWw_15 = 12e6/w_V*d_V*(L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome); % mug, weight

  % weight-ingestion
  L = (WJX8(:,1)*w_V/d_V/12e6/(1+f_8*ome)).^(1/3); % cm, struc length
  EJX_8 = L.^2 * TC_8 * f_8 * p_Am/ kap_X/ mu_X * 12e6; % mug C/ d
  %
  L = (WJX12(:,1)*w_V/d_V/12e6/(1+f_12*ome)).^(1/3); % cm, struc length
  EJX_12 = L.^2 * TC_12 * f_12 * p_Am/ kap_X/ mu_X * 12e6; % mug C/ d
  %
  L = (WJX15(:,1)*w_V/d_V/12e6/(1+f_15*ome)).^(1/3); % cm, struc length
  EJX_15 = L.^2 * TC_15 * p_Am/ kap_X/ mu_X * 12e6; % mug C/ d

  % weight-CO2 production
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars for scaled_power_j
  L = (WJC8(:,1)*w_V/d_V/12e6/(1+f_8*ome)).^(1/3); % cm, struc length
  pACSJGRD = TC_8 * p_Am * L_m^2 * scaled_power_j(L, f_8, pars_p, l_b, l_j, l_p); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJC_8 = J_M(1, :)' * 12e6; % mug CO2/d, CO2 consumption 
  %
  L = (WJC12(:,1)*w_V/d_V/12e6/(1+f_12*ome)).^(1/3); % cm, struc length
  pACSJGRD = TC_12 * p_Am * L_m^2 * scaled_power_j(L, f_12, pars_p, l_b, l_j, l_p); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJC_12 = J_M(1, :)' * 12e6; % mug CO2/d, CO2 consumption 
  %
  L = (WJC15(:,1)*w_V/d_V/12e6/(1+f_15*ome)).^(1/3); % cm, struc length
  pACSJGRD = TC_15 * p_Am * L_m^2 * scaled_power_j(L, f_15, pars_p, l_b, l_j, l_p); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJC_15 = J_M(1, :)' * 12e6; % mug CO2/d, CO2 consumption 
 
  % pack to output
  prdData.tW8 = EWw_8;
  prdData.tW12 = EWw_12;
  prdData.tW15 = EWw_15;
  prdData.WJX8 = EJX_8;
  prdData.WJX12 = EJX_12;
  prdData.WJX15 = EJX_15;
  prdData.WJC8 = EJC_8;
  prdData.WJC12 = EJC_12;
  prdData.WJC15 = EJC_15;
  
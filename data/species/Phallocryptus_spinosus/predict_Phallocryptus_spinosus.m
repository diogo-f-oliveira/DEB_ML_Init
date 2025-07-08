function [prdData, info] = predict_Phallocryptus_spinosus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tL, T_ref, T_A); 
  TC_20 = tempcorr(temp.tp_20, T_ref, T_A);
  TC_25 = tempcorr(temp.tp_25, T_ref, T_A);
  TC_am = tempcorr(C2K(Tam(:,1)), T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_i, rho_rB, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, length at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  t_p = (tau_p - tau_b)/ k_M;       % d, time since birth at puberty at T_ref
  t20_p = t_p/TC_20; t25_p = t_p/TC_25; % d, tp at 20 and 25 C
  
  % ultimate
  L_i = L_m * l_i;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * ome); % g, ultimate dry weight
 
  % reprod
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  R_i = reprod_rate(L_i, f, pars_R); % #/d, max reprod rate at T_ref
  R20_i = R_i/ TC_20; R25_i = R_i/ TC_25; % #/d, R_i at 20 and 25 C

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);   % -, scaled mean life span at T_ref
  a_m = tau_m/ k_M;                    % d, mean life span at T_ref

%   % males
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, max struct length
%   pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
%   [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f);
%   aT_jm = t_j/ kT_M;                   % d, age at birth 
%   aT_pm = t_p/ kT_M;                   % d, age at puberty
%   L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M; % cm, total length at puberty
%   Ww_pm = L_pm.^3 * (1 + f * w_m);     % g, wet weight at puberty
%   L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
%   Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.tp_20 = t20_p;
  prdData.tp_25 = t25_p;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  prdData.Ri_20 = R20_i;
  prdData.Ri_25 = R25_i;
  
  % uni-variate data
  
  % time-length
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*k_M*TC(1));
  ELw_30 = L_m * tvel(:,4)/ del_M;  % cm, total length
  %
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*k_M*TC(2));
  ELw_25 = L_m * tvel(:,4)/ del_M;  % cm, total length
  %
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*k_M*TC(3));
  ELw_20 = L_m * tvel(:,4)/ del_M;  % cm, total length
  %
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*k_M*TC(4));
  ELw_15 = L_m * tvel(:,4)/ del_M;  % cm, total length
  
  % temperature-life span
  EaT_m = a_m ./ TC_am;

  % pack to output
  prdData.tL = [ELw_30 ELw_25 ELw_20 ELw_15];
  prdData.Tam = EaT_m;
end

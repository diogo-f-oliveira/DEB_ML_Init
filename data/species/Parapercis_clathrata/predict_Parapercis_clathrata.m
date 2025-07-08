function [prdData, info] = predict_Parapercis_clathrata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  
  % metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  L_j = l_j * L_m;                  % cm, structural length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max reproduction rate
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
%   % yellow males
%   p_Am_my = z_my * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_my = p_Am_my/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_my = E_G/ (kap* E_m_my);             % -, energy investment ratio
%   m_Em_my = y_E_V * E_m_my/ E_G;         % mol/mol, reserve capacity 
%   w_my = m_Em_my * w_E/ w_V;             % -, contribution of reserve to weight
%   L_mmy = v/ k_M/ g_my;                  % cm, max struct length
%   pars_tjmy = [g_my k l_T v_Hb v_Hj v_Hp];

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
   
  % time-length
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M;      % cm, length
  
  %% pack to output
  prdData.tL = ELw;


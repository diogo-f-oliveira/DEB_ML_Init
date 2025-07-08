function [prdData, info] = predict_Streptocephalus_vitreus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_i, rho_rB, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * ome); % g, dry weight at birth
  aT_b = t_0 + tau_b/ kT_M;         % d, age at birth at f and T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Wd_p = L_p^3*d_V*(1+f*ome);       % g, dry weight at puberty at f
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty
  
  % ultimate
  L_i = L_m * l_i;                    % cm, ultimate structural length at f
  Wd_i = L_i^3 * d_V * (1 + f * ome); % g, ultimate dry weight
 
  % reprod
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);   % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                  % d, mean life span at T

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
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-dry weight
  tf = [5 f_05; 10 f_10;30 f_30]; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tj(pars_tj, tf,[],tWd(:,1)*kT_M); 
  EWd = 1e6*(L_m*tvel(:,4)).^3*d_V.*(1+tvel(:,3)*ome); % mug, dry weight
  
  % pack to output
  prdData.tWd = EWd;
  
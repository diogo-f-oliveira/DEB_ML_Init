function [prdData, info] = predict_Synodus_foetens(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                     % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f

  % puberty 
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  
  % ultimate
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reprod rate
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(31*del_M, f, pars_R); % #/d, max reproduction rate at TL 31 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
%   % males
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_mm = p_Am_m/ v;                    % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_mm);              % -, energy investment ratio
%   L_mm = v/ k_M/ g_m;                  % cm, max struct length
%   m_Em_m = y_E_V * E_mm/ E_G;          % mol/mol, reserve capacity 
%   w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
%   pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
%   [t_j, t_p, t_b, l_j, l_p, l_b, l_i] = get_tj(pars_tjm, f);
%   tT_pm = (t_p - t_b)/ kT_M;           % d, time since birth at puberty
%   L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M; % cm, total length at puberty
%   L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
%   Ww_im = L_im^3 * (1 + f * w_m);  % g, wet weight 31 cm male

%% pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
    
%% univariate data

  % time-length
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M;   % cm, length
  
%% pack to output
  prdData.tL = ELw;


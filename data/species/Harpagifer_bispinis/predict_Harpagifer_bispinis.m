function [prdData, info] = predict_Harpagifer_bispinis(par, data, auxData)
  
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
  aT_b = t_b/ kT_M;                 % d, age at birth
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
   
  % GSI
  t1 = 365; % d, period of accumulaton of reprod buffer
  GSI = TC * (t1 * k_M * g/ f^3)/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3);

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
%   % males
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, max struct length
%   pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
%   [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
%   L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, total length at puberty
%   Ww_pm = L_pm.^3 * (1 + f * w_m);     % g, wet weight at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % length-weight
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w);
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w);
  
  % time-length
  tf = [500 f_PH0500; 1000 f_PH1000; 1500 f_PH1500; 3000 f_PH3000]; tf(:,1)=tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf, [], tL(:,1)*kT_M);
  ELw_PH = L_m * tvel(:,4)/ del_M;   % cm, length
  %
  tf = [1000 f_AH1000; 2000 f_AH2000]; tf(:,1)=tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf, [], tL(:,1)*kT_M);
  ELw_AH = L_m * tvel(:,4)/ del_M;   % cm, length
  
  %% pack to output
  prdData.tL = [ELw_PH ELw_AH];
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;


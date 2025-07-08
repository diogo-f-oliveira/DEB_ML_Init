function [prdData, info] = predict_Branchinella_kugenumaensis(par, data, auxData)
  
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
  Lw_b = L_b/ del_M;                % cm, length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  aT_b = tau_b/ kT_M;         % d, age at birth at f and T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty
  
  % ultimate
  L_i = L_m * l_i;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * ome); % g, ultimate dry weight
 
  % reprod
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T

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
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  prdData.sM = l_j/l_b;
  
  % uni-variate data
  
  % time-length
  tf = [4 fL1_04; 7 fL1_07; 10 fL1_10; 20 fL1_20; 20 fL1_20]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf,[],tL_L1(:,1)*kT_M); 
  ELw_L1 = L_m*tvel(:,4)/del_M;
  %
  tf = [4 fL2_04; 7 fL2_07; 10 fL2_10; 20 fL2_20]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf,[],tL_L2(:,1)*kT_M); 
  ELw_L2 = L_m*tvel(:,4)/del_M;
  %
  tf = [4 fS1_04; 7 fS1_07; 10 fS1_10; 15 fS1_15]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf,[],tL_S(:,1)*kT_M); 
  ELw_S1 = L_m*tvel(:,4)/del_M;
  %
  tf = [4 fS2_04; 7 fS2_07; 10 fS2_10; 15 fS2_15]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf,[],tL_S(:,1)*kT_M); 
  ELw_S2 = L_m*tvel(:,4)/del_M;
  %
  tf = [4 fS3_04; 7 fS3_07; 10 fS3_10; 15 fS3_15]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf,[],tL_S(:,1)*kT_M); 
  ELw_S3 = L_m*tvel(:,4)/del_M;
  %
  tf = [4 fS4_04; 7 fS4_07; 10 fS4_10; 15 fS4_15]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf,[],tL_S(:,1)*kT_M); 
  ELw_S4 = L_m*tvel(:,4)/del_M;
  %
  tf = [4 fS5_04; 7 fS5_07; 10 fS5_10; 15 fS5_15]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf,[],tL_S(:,1)*kT_M); 
  ELw_S5 = L_m*tvel(:,4)/del_M;

  % length-fecundity
  EN = TC * reprod_rate_j(LN(:,1)*del_M, f, pars_R); % #/d, max reprod rate

  % pack to output
  prdData.tL_L1 = ELw_L1;
  prdData.tL_L2 = ELw_L2;
  prdData.tL_S = [ELw_S1 ELw_S2 ELw_S3 ELw_S4 ELw_S5];
  prdData.LN = EN;

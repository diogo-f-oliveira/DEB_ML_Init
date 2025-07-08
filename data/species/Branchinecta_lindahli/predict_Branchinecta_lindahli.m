function [prdData, info] = predict_Branchinecta_lindahli(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  %if f_04>2; prdData = []; info = 0; return; end
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_i, rho_rB, info] = get_tj(pars_tj, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  aT_b = tau_b/ kT_M;               % d, age at birth at f and T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty
  
  % ultimate
  L_i = L_m * l_i;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                  % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * ome); % g, ultimate dry weight
 
  % reprod
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);   % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                  % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm, info] = get_tj(pars_tjm, f);
  if ~info; prdData = []; return; end
  aT_jm = tau_jm/ kT_M;                   % d, age at birth 
  aT_pm = tau_pm/ kT_M;                   % d, age at puberty
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, total length at puberty
  Ww_pm = L_pm.^3 * (1 + f * w_m);     % g, wet weight at puberty
  L_im = l_im * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  prdData.sM = l_j/l_b;
  
  % uni-variate data
  
  % time-length
  tf = [2 f_02; 4 f_04; 6 f_06; 8 f_08; 10 f_10]; tf(:,1) = tf(:,1)*kT_M;
  tvel = get_tj(pars_tj, tf,[],tL_fm(:,1)*kT_M); 
  ELw_f = L_m*tvel(:,4)/del_M;
  %
  tvel = get_tj(pars_tjm, tf,[0 1 l_b*z/z_m],tL_fm(:,1)*kT_M); 
  ELw_m = L_mm*tvel(:,4)/del_M;

  % pack to output
  prdData.tL_fm = [ELw_f ELw_m];


function [prdData, info] = predict_Colistium_nudipinnis(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  %% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                     % cm, structural, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f
  aT_b = tau_b/ k_M/ TC_ab;            % d, age at birth at f, temp corrected

  % metam
  tT_j = (tau_j - tau_b)/ kT_M;        % d, time since birth at metam
  s_M = l_j/ l_b;                      % -, acceleration factor

  % puberty and ultimate size
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);          % g, wet weight at puberty
  
  % ultimate size
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reproduction
  GSI = 365 * TC * k_M * g/ f^3/ (f + kap * g * y_V_E); %   that spawns once per year see (4.89) of DEB3
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^2); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [tau_jm tau_pm tau_bm l_jm l_pm l_bm l_im, ~, ~, info] = get_tj(pars_tjm, f);
  if ~info; prdData = []; return; end
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, total length at puberty

  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  %% uni-variate data

  % time-length
  tvel = get_tj(pars_tjm,f_tL,[],tL_f(:,1)*kT_M);
  ELw_f = L_m*tvel(:,4)/del_M;
  %
  tvel = get_tj(pars_tjm,f_tL,[],tL_m(:,1)*kT_M);
  ELw_m = L_mm*tvel(:,4)/del_M;
  
  
%% pack to output
  prdData.tL_f = ELw_f; 
  prdData.tL_m = ELw_m;
  

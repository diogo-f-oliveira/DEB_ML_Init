function [prdData, info] = predict_Lophiosilurus_alexandri(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_ab = tempcorr(temp.ab, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if ~info; prdData = []; return; end

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth            

  % metam
  s_M = l_j/l_b;                    % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * ome);     % g, wet weight at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight

  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ k_M/ TC;                  % d, mean life span at T

  % male
  p_Am_m = z * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f, []);
  tT_jm = (t_jm - t_bm)/ kT_M;         % d, time since birth at metam
  L_bm= L_mm * l_bm; L_pm = L_mm * l_pm; L_im = L_mm * l_im; % cm, structural lengths at f
  Lw_im = L_im/ del_M;                % cm, std length at death
  Lw_pm = L_pm/ del_M;                % cm, std length at puberty
  Ww_pm = L_pm^3*(1+f*ome_m);         % g, weight at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;

  %% uni-variate data
  
  % time-length
  tf = [0 f_00; 10 f_10; 20 f_20; 30 f_30]; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tj(pars_tj, tf, [], tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/del_Ml;
  %
  tvel = get_tj(pars_tj, f_fm, [], tL_fm(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/del_M;
  %
  tvel = get_tj(pars_tjm, f_fm, [], tL_fm(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/del_M;

  % time-weight
  tvel = get_tj(pars_tj, f_fm, [], tW_fm(:,1)*kT_M);
  EWw_f = (L_m * tvel(:,4)).^3*(1 + f_fm*ome);
  %
  tvel = get_tj(pars_tjm, f_fm, [], tW_fm(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3*(1 + f_fm*ome_m);
 
  % pack to output
  prdData.tL = ELw;
  prdData.tL_fm = [ELw_f ELw_m];
  prdData.tW_fm = [EWw_f EWw_m];

end
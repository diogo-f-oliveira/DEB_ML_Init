function [prdData, info] = predict_Orius_laevigatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if k_R0 < 0 || p_M > 9500; info = 0; prdData = []; return; end

  % compute temperature correction factors
  pars_T = [T_A T_H T_AH]; % temperature parameters
  TC_15 = tempcorr(C2K(15), T_ref, pars_T);
  TC_20 = tempcorr(C2K(20), T_ref, pars_T);
  TC_25 = tempcorr(C2K(25), T_ref, pars_T);
  TC_30 = tempcorr(C2K(30), T_ref, pars_T);
  TC_35 = tempcorr(C2K(35), T_ref, pars_T);
  TC_23 = tempcorr(C2K(23), T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  v_Rj = kap/ (1 - kap) * E_Rj/ E_G; pars_tj = [g k v_Hb v_Hp v_Rj];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f);
    
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial reserve

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth

  % puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Ww_p = L_p^3 * (1 + f * ome);     % g, wet weight at puberty
  s_M = l_p/l_b;                    % -, acceleration factor

  % emergence
  L_j = l_j * L_m;                      % cm, structural length at emergence
  tT_j = (tau_j - tau_b)/ k_M/ TC_20;   % d, time since birth at emergence
  Ww_j = L_j^3 * (1 + f * ome);      % g, weight of imago

  % ultimate
  L_i = L_m * l_i;               % cm, asymptotic length (hypothetic)
  Ww_i = L_i^3 * (1 + f * ome);  % g, asymptotic weight

  % life span as imago
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hp v_Hp+1e-3];
  pars_tmm = [g_m; l_T; h_a/ k_M^2; s_G]; 

  % total fecundity
  N_i = kap_R * E_Rj * L_j^3/ E_0;     % #, total fecundity

  % pack to output
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ni = N_i;
  
  % uni-variate data
  % temperature-age at birth/puberty 
  kT_M = k_M * tempcorr(C2K(Tab(:,1)), T_ref, pars_T);  
  %[tauSL_p, ~, tauSL_b, lSL_p, ~, lSL_b, lSL_i, rhoSL_j] = get_tj(pars_tj, f_SL);
  [tauSL_j, tauSL_p, tauSL_b, lSL_j, lSL_p, lSL_b, lSL_i, rhoSL_j, rhoSL_B] = get_tj_hep(pars_tj, f_SL);
  tSL_b = tauSL_b./kT_M; tSL_p = (tauSL_p - tauSL_b)./kT_M;
  %[tauAD_p, ~, tauAD_b, lAD_p, ~, lAD_b, lAD_i, rhoAD_j] = get_tj(pars_tj, f_AD);
  [tauAD_j, tauAD_p, tauAD_b, lAD_j, lAD_p, lAD_b, lAD_i, rhoAD_j, rhoAD_B] = get_tj_hep(pars_tj, f_AD);
  tAD_b = tauAD_b./kT_M; tAD_p = (tauAD_p - tauAD_b)./kT_M;
  %[tauCC_p, ~, tauCC_b, lCC_p, ~, lCC_b, lCC_i, rhoCC_j] = get_tj(pars_tj, f_CC);
  [tauCC_j, tauCC_p, tauCC_b, lCC_j, lCC_p, lCC_b, lCC_i, rhoCC_j, rhoCC_B] = get_tj_hep(pars_tj, f_CC);
  tCC_b = tauCC_b./kT_M; tCC_p = (tauCC_p - tauCC_b)./kT_M;
  Ea_b = [tSL_b tAD_b tCC_b]; Et_p = [tSL_p tAD_p tCC_p];
  
  % temperature-duration of instars
  TC = tempcorr(C2K(Ttp(:,1)), T_ref, pars_T); kT_M = k_M * TC;
  [tauSL_j, tauSL_p, tauSL_b] = get_tj_hep(pars_tj, f_SL);
  [~, tauSL_1, ~] = get_tj([g k 0 v_Hb v_H1 v_H1+1e-3], f_SL);
  [~, tauSL_2, ~] = get_tj([g k 0 v_Hb v_H2 v_H2+1e-3], f_SL);
  [~, tauSL_3, ~] = get_tj([g k 0 v_Hb v_H3 v_H3+1e-3], f_SL);
  [~, tauSL_4, ~] = get_tj([g k 0 v_Hb v_H4 v_H4+1e-3], f_SL);
  [~, tauSL_p, ~] = get_tj([g k 0 v_Hb v_Hp v_Hp+1e-3], f_SL);
  [tauAD_j, tauAD_p, tauAD_b] = get_tj_hep(pars_tj, f_AD);
  [~, tauAD_1, ~] = get_tj([g k 0 v_Hb v_H1 v_H1+1e-3], f_AD);
  [~, tauAD_2, ~] = get_tj([g k 0 v_Hb v_H2 v_H2+1e-3], f_AD);
  [~, tauAD_3, ~] = get_tj([g k 0 v_Hb v_H3 v_H3+1e-3], f_AD);
  [~, tauAD_4, ~] = get_tj([g k 0 v_Hb v_H4 v_H4+1e-3], f_AD);
  [~, tauAD_p, ~] = get_tj([g k 0 v_Hb v_Hp v_Hp+1e-3], f_AD);
  [tauCC_j, tauCC_p, tauCC_b] = get_tj_hep(pars_tj, f_CC);
  [~, tauCC_1, ~] = get_tj([g k 0 v_Hb v_H1 v_H1+1e-3], f_CC);
  [~, tauCC_2, ~] = get_tj([g k 0 v_Hb v_H2 v_H2+1e-3], f_CC);
  [~, tauCC_3, ~] = get_tj([g k 0 v_Hb v_H3 v_H3+1e-3], f_CC);
  [~, tauCC_4, ~] = get_tj([g k 0 v_Hb v_H4 v_H4+1e-3], f_CC);
  [~, tauCC_p, ~] = get_tj([g k 0 v_Hb v_Hp v_Hp+1e-3], f_CC);
  EI1 = [tauSL_1-tauSL_b tauAD_1-tauAD_b tauCC_1-tauCC_b]./kT_M;
  EI2 = [tauSL_2-tauSL_1 tauAD_2-tauAD_1 tauCC_2-tauCC_1]./kT_M;
  EI3 = [tauSL_3-tauSL_2 tauAD_3-tauAD_2 tauCC_3-tauCC_2]./kT_M;
  EI4 = [tauSL_4-tauSL_3 tauAD_4-tauAD_3 tauCC_4-tauCC_3]./kT_M;
  EI5 = [tauSL_p-tauSL_4 tauAD_p-tauAD_4 tauCC_p-tauCC_4]./kT_M;
  EI6 = (tauSL_j-tauSL_p)./kT_M;

  % temperature-duration of imago (female,male)
  kT_M = k_M * tempcorr(C2K(Tji_fm(:,1)), T_ref, pars_T);
  EI_f = [get_tm_s(pars_tm, f_SL, l_b) get_tm_s(pars_tm, f_SL, l_b)] ./ kT_M; 
  EI_m = [get_tm_s(pars_tmm, f_SL, l_b) get_tm_s(pars_tmm, f_SL, l_b)] ./ kT_M; 
  
  % temperature-total fecundity/reproduction rate
  E_0 = p_Am * initial_scaled_reserve(f_SL, pars_UE0); % d.cm^2, initial scaled reserve
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f_SL);
  EN_SL = E_Rj * (L_m * l_j).^3 * [kap15_R; kap_R; kap25_R; kap30_R; kap35_R]/ E_0; % #, total fecundity
  E_0 = p_Am * initial_scaled_reserve(f_AD, pars_UE0); % d.cm^2, initial scaled reserve
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f_AD);
  EN_AD = E_Rj * (L_m * l_j).^3 * [kap15_R; kap_R; kap25_R; kap30_R; kap35_R]/ E_0; % #, total fecundity

  % diet-male imago wet weight
  Ww0_pm = (L_mm * get_lj(pars_tjm, f_0))^3 * (1 + f_0 * ome_m); % wet weight of male imago
  Ww1_pm = (L_mm * get_lj(pars_tjm, f_1))^3 * (1 + f_1 * ome_m); % wet weight of male imago
  Ww2_pm = (L_mm * get_lj(pars_tjm, f_2))^3 * (1 + f_2 * ome_m); % wet weight of male imago
  Ww3_pm = (L_mm * get_lj(pars_tjm, f_3))^3 * (1 + f_3 * ome_m); % wet weight of male imago
  Ww4_pm = (L_mm * get_lj(pars_tjm, f_4))^3 * (1 + f_4 * ome_m); % wet weight of male imago
  EWw_im = [Ww0_pm; Ww1_pm; Ww2_pm; Ww3_pm; Ww4_pm]; % pack weights of male imagos

  % diet-female imago wet weight/duration of stages
  [tau_j, tau_p, tau_b, l_j0, l_p, l_b, l_i] = get_tj_hep(pars_tj, f_0);
  t0_bp = (tau_p - tau_b)/ k_M/ TC_23; % d, duration of instars 1-5
  Ww0_p = (L_m * l_j)^3 * (1 + f_0 * ome); % wet weight of imago
  t1_bp = (tau_p - tau_b)/ k_M/ TC_23; % d, duration of instars 1-5
  [tau_j, tau_p, tau_b, l_j1, l_p, l_b, l_i] = get_tj_hep(pars_tj, f_1);
  Ww1_p = (L_m * l_p)^3 * (1 + f_1 * ome); % wet weight of imago
  [tau_j, tau_p, tau_b, l_j2, l_p, l_b, l_i] = get_tj_hep(pars_tj, f_2);
  t2_bp = (tau_p - tau_b)/ k_M/ TC_23; % d, duration of instars 1-5
  Ww2_p = (L_m * l_p)^3 * (1 + f_2 * ome); % wet weight of imago
  [tau_j, tau_p, tau_b, l_j3, l_p, l_b, l_i] = get_tj_hep(pars_tj, f_3);
  t3_bp = (tau_p - tau_b)/ k_M/ TC_23; % d, duration of instars 1-5
  Ww3_p = (L_m * l_p)^3 * (1 + f_3 * ome); % wet weight of imago
  [tau_j, tau_p, tau_b, l_j4, l_p, l_b, l_i] = get_tj_hep(pars_tj, f_4);
  t4_bp = (tau_p - tau_b)/ k_M/ TC_23; % d, duration of instars 1-5
  Ww4_p = (L_m * l_p)^3 * (1 + f_4 * ome); % wet weight of imago
  EtX_bp = [t0_bp; t1_bp; t2_bp; t3_bp; t4_bp]; % pack instar durations
  EWw_if = [Ww0_p; Ww1_p; Ww2_p; Ww3_p; Ww4_p]; % pack weights of female imagos
  %
  t0_jif = get_tm_s(pars_tm, f_0, l_b)/ k_M/ TC_23; % d, mean life span as female imago
  t1_jif = get_tm_s(pars_tm, f_1, l_b)/ k_M/ TC_23; % d, mean life span as female imago
  t2_jif = get_tm_s(pars_tm, f_2, l_b)/ k_M/ TC_23; % d, mean life span as female imago
  t3_jif = get_tm_s(pars_tm, f_3, l_b)/ k_M/ TC_23; % d, mean life span as female imago
  t4_jif = get_tm_s(pars_tm, f_4, l_b)/ k_M/ TC_23; % d, mean life span as female imago
  Et_jif = [t0_jif; t1_jif; t2_jif; t3_jif; t4_jif]; % pack imago life spans

  % diet-total fecundity/reproduction rate
  E_0 = p_Am * initial_scaled_reserve(f_0, pars_UE0); % d.cm^2, initial scaled reserve
  N_0 = E_Rj * (L_m * l_j0)^3 * kap_R/ E_0; % #, total fecundity
  E_0 = p_Am * initial_scaled_reserve(f_1, pars_UE0); % d.cm^2, initial scaled reserve
  N_1 = E_Rj * (L_m * l_j1)^3 * kap_R/ E_0; % #, total fecundity
  E_0 = p_Am * initial_scaled_reserve(f_2, pars_UE0); % d.cm^2, initial scaled reserve
  N_2 = E_Rj * (L_m * l_j2)^3 * kap_R/ E_0; % #, total fecundity
  E_0 = p_Am * initial_scaled_reserve(f_3, pars_UE0); % d.cm^2, initial scaled reserve
  N_3 = E_Rj * (L_m * l_j3)^3 * kap_R/ E_0; % #, total fecundity
  E_0 = p_Am * initial_scaled_reserve(f_4, pars_UE0); % d.cm^2, initial scaled reserve
  N_4 = E_Rj * (L_m * l_j4)^3 * kap_R/ E_0; % #, total fecundity
  EN_X = [N_0; N_1; N_2; N_3; N_4]; % pack fecundities
  
  % time-cum reprod rate
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f_SL);
  E_0 = p_Am * initial_scaled_reserve(f_SL, pars_UE0); % J, initial reserve
  E_R0 = E_Rj * L_j^3; % J, reproduction buffer at emergence 
  [~, EN20] = ode45(@get_EN, tN20(:,1), [E_R0; 0], [], TC_20*k_R0, TC_20*k_Rm, TC_20*k_RE, E_0, kap_R); EN_20 = EN20(:,2);
  [~, EN25] = ode45(@get_EN, tN25(:,1), [E_R0; 0], [], TC_25*k_R0, TC_25*k_Rm, TC_25*k_RE, E_0, kap25_R); EN_25 = EN25(:,2);
  [~, EN30] = ode45(@get_EN, tN30(:,1), [E_R0; 0], [], TC_30*k_R0, TC_30*k_Rm, TC_30*k_RE, E_0, kap30_R); EN_30 = EN30(:,2);
  [~, EN35] = ode45(@get_EN, tN35(:,1), [E_R0; 0], [], TC_35*k_R0, TC_35*k_Rm, TC_35*k_RE, E_0, kap35_R); EN_35 = EN35(:,2);
 
  % time-survival
  h_W3 = tempcorr(C2K(20), T_ref, T_A)^3*h_a*f_SL*v*s_M/6/L_p; ES_20 = exp(-h_W3 * tS20(:,1).^3);
  h_W3 = tempcorr(C2K(25), T_ref, T_A)^3*h_a*f_SL*v*s_M/6/L_p; ES_25 = exp(-h_W3 * tS25(:,1).^3);
  h_W3 = tempcorr(C2K(30), T_ref, T_A)^3*h_a*f_SL*v*s_M/6/L_p; ES_30 = exp(-h_W3 * tS30(:,1).^3);
  h_W3 = tempcorr(C2K(35), T_ref, T_A)^3*h_a*f_SL*v*s_M/6/L_p; ES_35 = exp(-h_W3 * tS35(:,1).^3);

  % pack to output
  prdData.Tab = Ea_b;
  prdData.Ttp = Et_p;
  prdData.Tb1 = EI1;
  prdData.T12 = EI2;
  prdData.T23 = EI3;
  prdData.T34 = EI4;
  prdData.T45 = EI5;
  prdData.T56 = EI6;
  prdData.Tji_fm = [EI_f EI_m];
  prdData.TN  = [EN_SL EN_AD];
  prdData.XWi_fm = [EWw_if EWw_im];
  prdData.Xt_ji = [EtX_bp Et_jif];
  prdData.XN  = EN_X;
  prdData.tN20 = EN_20;
  prdData.tN25 = EN_25;
  prdData.tN30 = EN_30;
  prdData.tN35 = EN_35;
  prdData.tS20 = ES_20;
  prdData.tS25 = ES_25;
  prdData.tS30 = ES_30;
  prdData.tS35 = ES_35;

end

function dEN = get_EN(t, EN, k_R0, k_Rm, k_RE, E_0, kap_R)
  E_R = max(0,EN(1)); N = EN(2);
  if t < - log(1-k_R0/k_Rm)/k_RE
    k_R = 0;
  else
    k_R =  k_Rm * (1 - exp(-t*k_RE));
  end
  dE_R = - E_R * k_R;
  dN = E_R * k_R * kap_R/ E_0;
  dEN = [dE_R; dN];
end 

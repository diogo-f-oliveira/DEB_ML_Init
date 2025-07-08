function [prdData, info] = predict_Orius_albidipennis(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if k_R0 < 0; info = 0; prdData = []; return; end
  
  % compute temperature correction factors
  TC_20 = tempcorr(C2K(20), T_ref, T_A);
  TC_25 = tempcorr(C2K(25), T_ref, T_A);
  TC_30 = tempcorr(C2K(30), T_ref, T_A);
  TC_35 = tempcorr(C2K(35), T_ref, T_A);
  
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
  
%   % life span as imago
%   pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref

  % total fecundity
  N_i = kap_R * E_Rj * L_j^3/ E_0;     % #, total fecundity
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k v_Hb v_Hp v_Rj];
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj_hep(pars_tj, f);
  Ww_jm = (L_mm * l_jm).^3*(1+f*ome_m); % g, weight at puberty 

  % pack to output
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwjm = Ww_jm;
  prdData.Wwi = Ww_i;
  prdData.Ni = N_i;
 
  % uni-variate data
  % temperature-age at birth/puberty/emergence duration of imago (female,male)
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f);
  TC = tempcorr(C2K(Tt_apji(:,1)), T_ref, T_A); kT_M = k_M * TC;  
  Ea_b = tau_b./kT_M; % d, age at birth
  Et_p = (tau_p - tau_b)./kT_M; % d, time from birth at puberty
  Et_j = (tau_j - tau_b)./kT_M; % d, time from birth at emergence
  L_p = L_m * l_p; L_j = L_m * l_j; % cm, struc length at puberty/emergence
  s_M = l_p/ l_b;  % -, acceleration factor
  h_W = (h_a*f_SL*v*s_M/6/L_j).^(1/3); % 1/d, Weibull aging rate
  Epi_f = gamma(4/3)/h_W./TC; % d, female imago life span
  Epi_m = gamma(4/3)/h_W./TC; % d, male imago life span
  
  % time-cum reprod rate
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f_SL);
  E_0 = p_Am * initial_scaled_reserve(f_SL, pars_UE0); % J, initial reserve
  E_R0 = E_Rj * L_j^3; % J, reproduction buffer at emergence 
  [~, EN20] = ode45(@get_EN, tN20(:,1), [E_R0; 0], [], TC_20*k_R0, TC_20*k_Rm, TC_20*k_RE, E_0, kap_R); EN_20 = EN20(:,2);
  [~, EN25] = ode45(@get_EN, tN25(:,1), [E_R0; 0], [], TC_25*k_R0, TC_25*k_Rm, TC_25*k_RE, E_0, kap_R); EN_25 = EN25(:,2);
  [~, EN30] = ode45(@get_EN, tN30(:,1), [E_R0; 0], [], TC_30*k_R0, TC_30*k_Rm, TC_30*k_RE, E_0, kap_R); EN_30 = EN30(:,2);
  [~, EN35] = ode45(@get_EN, tN35(:,1), [E_R0; 0], [], TC_35*k_R0, TC_35*k_Rm, TC_35*k_RE, E_0, kap_R); EN_35 = EN35(:,2);
  
  % time-survival
  h_W3 = TC_20^3*h_a*f_SL*v*s_M/6/L_p; ES_20 = exp(-h_W3 * tS20(:,1).^3);
  h_W3 = TC_25^3*h_a*f_SL*v*s_M/6/L_p; ES_25 = exp(-h_W3 * tS25(:,1).^3);
  h_W3 = TC_30^3*h_a*f_SL*v*s_M/6/L_p; ES_30 = exp(-h_W3 * tS30(:,1).^3);
  h_W3 = TC_35^3*h_a*f_SL*v*s_M/6/L_p; ES_35 = exp(-h_W3 * tS35(:,1).^3);
 
  % pack to output
  prdData.Tt_apji = [Ea_b Et_p Et_j Epi_f Epi_m];
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

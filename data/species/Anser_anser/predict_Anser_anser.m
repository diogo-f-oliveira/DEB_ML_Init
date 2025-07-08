function [prdData, info] = predict_Anser_anser(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

if p_M > 9500; info = 0; prdData = []; return; end

% compute temperature correction factors
TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
TC_ab = tempcorr(temp.ab, T_ref, T_A); 
TC_JO = tempcorr(temp.tJOe, T_ref, T_A); 

% zero-variate data

% life cycle
pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
tau_x = get_tp(pars_tx, f); 
pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
[tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);  % -, scaled times & lengths
if ~info; prdData = []; return; end

% birth
L_b = L_m * l_b;                  % cm, structural length at birth at f
Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth at f
aT_b = t_0 + tau_b/ k_M/ TC_ab;   % d, age at birth at f and T

% fledging/puberty
tT_x = (tau_x - tau_b)/ kT_M;     % d, time since birth at fledging
tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

% ultimate
l_i = f - l_T;                    % -, scaled ultimate length
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = tau_m/ kT_M;                     % d, mean life span at T

% males
p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
L_mm = v/ k_M/ g_m;                  % cm, max struct length
L_im = f * L_mm;                     % cm, struct length
Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
L_bm = L_mm * get_lb([g_m; k; v_Hb;], f);  % cm, struc length at birth      
pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];% compose parameter vector

% pack to output
prdData.ab = aT_b;
prdData.tx = tT_x;
prdData.tp = tT_p;
prdData.tR = t_R;
prdData.am = aT_m;
prdData.Wwb = Ww_b;
prdData.Wwi = Ww_i;
prdData.Wwim = Ww_im;
prdData.Ri = RT_i;

% uni-variate data
  % time-weight
  tf = [50 f_tW_50; 99 f_tW_99]; tf(:,1) = tf(:,1)*kT_M;
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, tf, [], tW_f(:,1)*kT_M);
  EWw_f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  %
  tvel = get_tp(pars_tpm, tf, [0, 1, l_b*z/z_m], tW_m(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  tf = [50 f_tW2_050; 75 f_tW2_075; 200 f_tW2_200]; tf(:,1) = tf(:,1)*kT_M;
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, tf, [], tW_f2(:,1)*kT_M);
  EWw_f2 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  %
  tvel = get_tp(pars_tpm, tf, [0, 1, l_b*z/z_m], tW_m2(:,1)*kT_M);
  EWw_m2 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  tf = [50 f_tW3_050; 75 f_tW3_075; 200 f_tW3_200]; tf(:,1) = tf(:,1)*kT_M;
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, tf, [], tW_f3(:,1)*kT_M);
  EWw_f3 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  %
  tvel = get_tp(pars_tpm, tf, [0, 1, l_b*z/z_m], tW_m3(:,1)*kT_M);
  EWw_m3 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  tf = [50 f_tW4_050; 75 f_tW4_075; 200 f_tW4_200]; tf(:,1) = tf(:,1)*kT_M;
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, tf, [], tW_f4(:,1)*kT_M);
  EWw_f4 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  %
  tvel = get_tp(pars_tpm, tf, [0, 1, l_b*z/z_m], tW_m4(:,1)*kT_M);
  EWw_m4 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  tf = [50 f_tW5_050; 75 f_tW5_075; 200 f_tW5_200]; tf(:,1) = tf(:,1)*kT_M;
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, tf, [], tW_f5(:,1)*kT_M);
  EWw_f5 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  %
  tvel = get_tp(pars_tpm, tf, [0, 1, l_b*z/z_m], tW_m5(:,1)*kT_M);
  EWw_m5 = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  % embryo data 
  % time-respiration
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  UT_E0 = initial_scaled_reserve(f_JOe, pars_UE0)/ TC_JO; 
  vT = v * TC_JO; kT_J = k_J * TC_JO; pT_M = p_M * TC_JO; pT_Am = p_Am * TC_JO; 
  a = [0;tJOe(:,1) - t_0]; for i=2:length(a); if a(i)<=a(i-1); a(i)=a(i-1)+1e-8; end;end % d, ages 
  [a, LUH] = ode45(@dget_LUH,  a, [1e-10 UT_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); L3 = L .^3; 
  E = LUH(:,2) * pT_Am; ee = E./ L3/ E_m;
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); pC = (vT ./ L - r) .* E; 
  pM = pT_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJO_e = - J_M(:,3) * 24.4e3; % ml/d, O2 consumption
  % time-weight
  UT_E0 = initial_scaled_reserve(f_We, pars_UE0)/ TC_JO; 
  a = [0;tWe(:,1) - t_0]; for i=2:length(a); if a(i)<=a(i-1); a(i)=a(i-1)+1e-8; end;end % d, ages 
  [a, LUH] = ode45(@dget_LUH,  a, [1e-10 UT_E0 0], [], kap, vT, kT_J, g, L_m); 
  LUH(1,:) = []; L = LUH(:,1); L3 = L .^3; 
  EWw_e = L3 * (1+f_We*ome); % g, wet weight embryo

% pack to output
prdData.tW_f  = EWw_f;
prdData.tW_m  = EWw_m;
prdData.tW_f2 = EWw_f2;
prdData.tW_m2 = EWw_m2;
prdData.tW_f3 = EWw_f3;
prdData.tW_m3 = EWw_m3;
prdData.tW_f4 = EWw_f4;
prdData.tW_m4 = EWw_m4;
prdData.tW_f5 = EWw_f5;
prdData.tW_m5 = EWw_m5;
prdData.tWe   = EWw_e;
prdData.tJOe  = EJO_e;


function [prdData, info] = predict_Anas_platyrhynchos(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

if f_60 < 0; info = 0; prdData = []; return; end

% compute temperature correction factors
TC_ab = tempcorr(temp.ab, T_ref, T_A);
TC_tLe = tempcorr(temp.tLe, T_ref, T_A);
TC_tWwe = tempcorr(temp.tWwe, T_ref, T_A);
TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

% zero-variate data

  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
  tau_x = get_tp(pars_tx, f); 
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);  % -, scaled times & lengths
  if ~info; prdData = []; return; end

% initial
pars_UE0 = [V_Hb; g; k_J; k_M; v];
U_E0 = initial_scaled_reserve(f, pars_UE0);
E_0 = p_Am * U_E0;            % J, initial energy content
Ww_0 = w_E * E_0/ mu_E/ d_E;  % g, initial wet weight

% birth
L_b = L_m * l_b;                  % cm, structural length at birth at f
Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f
aT_b = tau_b/ k_M/ TC_ab;      % d, age at birth at f and T

% fledging
tT_x = (tau_x - tau_b)/ kT_M;         % d, time since birth at fledging

% puberty
tT_p = (tau_p - tau_b)/ kT_M;         % d, time since birth at puberty


% ultimate
l_i = f - l_T;                    % -, scaled ultimate length
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = tau_m/ kT_M;                     % d, mean life span at T

% males
p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
L_mm = v/ k_M/ g_m;                  % cm, max struct length
L_im = f * L_mm;                     % cm, struct ultimate length
Ww_im = L_im^3 * (1 + f * ome_m);      % g, ultimate wet weight
pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];  % compose parameter vector

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
prdData.Ww0 = Ww_0;

% uni-variate data

% time-weight
tf = [10 f_10; 30 f_30; 50 f_50; 60 f_60]; tf(:,1) = tf(:,1) * kT_M;
tvel = get_tp(pars_tp, tf, [], tW(:,1)*kT_M);
EWw = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight

% time-weight female/male
tf = [10 30 50 60; f1_10 f1_30 f1_50 f1_60]'; tf(:,1) = tf(:,1) * kT_M;
% female
[tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, tf, [], tW_fm(:,1)*kT_M);
EWw_f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
% male
tvel = get_tp(pars_tpm, tf, [t_b, z/z_m, l_b*z/z_m], tW_fm(:,1)*kT_M);
EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome_m); % g, weight

% t-Le for embryo
a = [0; tLe(:,1) - t_0]; n=length(a); for i=2:n; if a(i)<=a(i-1); a(i)=a(i-1)+1e-8; end; end
[a, LUH] = ode45(@dget_LUH, a, [1e-10 U_E0/TC_tLe 0], [], kap, v * TC_tLe, k_J * TC_tLe, g, L_m);
LUH(1,:) = []; ELe = LUH(:,1)/ del_M; % cm, structural length

% t-Wwe data for embryo
a = [0; tWwe(:,1) - t_0]; n=length(a); for i=2:n; if a(i)<=a(i-1); a(i)=a(i-1)+1e-8; end; end
[a, LUH] = ode45(@dget_LUH, a, [1e-10 U_E0/TC_tWwe 0], [], kap, v * TC_tWwe, k_J * TC_tWwe, g, L_m);
LUH(1,:) = []; EWwe = LUH(:,1).^3 * (1 + f * ome);            % g, wet weight

% start with length at puberty
% t-N data for adult
pars_cum_reprod = [kap; kap_R; g; k_J * TC; k_M * TC; L_T; v * TC; U_Hb/ TC; U_Hp/ TC];
EN = cum_reprod(tN(:,1), f_tN, pars_cum_reprod); % #, number of eggs

% pack to output
prdData.tW = EWw;
prdData.tW_fm = [EWw_f EWw_m];
prdData.tWwe = EWwe;
prdData.tLe = ELe;
prdData.tN = EN;
% prdData.tY = EWw;
% prdData.TO_m = EO_m;
% prdData.TO_f = EO_f;

end

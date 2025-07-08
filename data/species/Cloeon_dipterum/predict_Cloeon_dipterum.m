function [prdData, info] = predict_Cloeon_dipterum(par, data, auxData)

global tT_c tT_w tT_g

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

pars_T_c = [T_A; T_L; T_AL];

%% temperature correction factors
TC_ab = tempcorr(temp.ab, T_ref, pars_T_c);
TC_am = tempcorr(temp.am, T_ref, pars_T_c);
TC_tL = tempcorr(temp.tL, T_ref, pars_T_c);
TC_cian = tempcorr(temp.tL_f, T_ref, pars_T_c);
TC_tL_f1 = tempcorr(temp.tL_f1, T_ref, pars_T_c);
TC_tL_m1 = tempcorr(temp.tL_m1, T_ref, pars_T_c);

tTC_c  = [tT_c(:,1), tempcorr((tT_c(:,2)), T_ref, pars_T_c)]; % vector of T in time
tTC_w  = [tT_w(:,1), tempcorr((tT_w(:,2)), T_ref, pars_T_c)]; % vector of T in time
tTC_g  = [tT_g(:,1), tempcorr((tT_g(:,2)), T_ref, pars_T_c)]; % vector of T in time

TC_tj_26 = tempcorr(temp.tj_26, T_ref, pars_T_c);
TC_tj_22 = tempcorr(temp.tj_22, T_ref, pars_T_c);
TC_tj_18 = tempcorr(temp.tj_18, T_ref, pars_T_c);
TC_tj_13 = tempcorr(temp.tj_13, T_ref, pars_T_c);
TC_tL_h1 = tempcorr(temp.tL_h1, T_ref, pars_T_c);
TC_tL_h2 = tempcorr(temp.tL_h2, T_ref, pars_T_c);
TC_tL_h3 = tempcorr(temp.tL_h3, T_ref, pars_T_c);
TC_tL_h4 = tempcorr(temp.tL_h4, T_ref, pars_T_c);
TC_tL_h5 = tempcorr(temp.tL_h5, T_ref, pars_T_c);
TC_tS = tempcorr(temp.tS, T_ref, pars_T_c);


%% zero-variate data

% life cycle
v_Rj = kap/ (1 - kap) * E_Rj/ E_G;
pars_tj = [g k v_Hb v_Hp v_Rj];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f);

% initial
u_E0 = get_ue0([g k v_Hb], f, l_b);         % -, scaled initial reserve
E_0 = g * E_m * L_m^3 * u_E0;               % J, initial energy content
Wd_0 = 1e3 * w_E * E_0/ mu_E;               % mg, initial dry weight
Lw_0 = (E_0 * w_E/ mu_E/ d_E)^(1/3)/ del_Y; % cm, egg diameter

% birth
a_b = t_b/ k_M; aT_b = a_b/ TC_ab;         % d, age at birth at f and T3
L_b = L_m * l_b;                           % cm, structural length at birth at f
Lw_b = L_b / del_M;                        % cm, length at birth
Lh_b = L_b / del_Mh;                       % cm, head length at birth
Wd_b = 1e3 * L_b^3 * d_V * (1 + f * w);    % mg, dry weight birth (remove d_V for wet weight)

% puberty
L_p = L_m * l_p;                           % cm, structural length at puberty at f

% emergence (corresponds to ultimate)
L_j = l_j * L_m;                     % cm, structural length at emergence (imago)
Lw_j = L_j/ del_Mi;                  % cm, length (sub)imago at f
Ww_j = 1e3 * L_j^3 * (1 + f * w);    % mg, wet weight subimago (excluding eggs); reproduction buffer added below
Lw_jw = L_j / del_Mw;                % cm, ultimate wing length female imago

% time since birth at emergence for varying temperature (gaiac2019)
tT_j_26 = (t_j - t_b)/ k_M/ TC_tj_26;      % d, time since birth at emergence at 26 C
tT_j_22 = (t_j - t_b)/ k_M/ TC_tj_22;      % d, time since birth at emergence at 22 C
tT_j_18 = (t_j - t_b)/ k_M/ TC_tj_18;      % d, time since birth at emergence at 18 C
tT_j_13 = (t_j - t_b)/ k_M/ TC_tj_13;      % d, time since birth at emergence at 13 C

% ultimate (imago: different shape coefficient)
L_i = L_m * l_i;                  % cm, ultimate structural length at f

% reproduction
N_j = kap_R * (1 - kap) * v_Rj * l_j^3/ u_E0; % # of eggs at j
Ww_j = Ww_j + N_j * Wd_0/ d_E;                % mg, correct wet wet for eggs

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC_am;              % d, mean life span at T

% males
p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
g_m = E_G/ (kap * E_m_m);            % -, energy investment ratio
m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity
w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
L_mm = v/ k_M/ g_m;                  % cm, max struct length
pars_tjm = [g_m k v_Hb v_Hp v_Rj];   % pars for male
[t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj_hep(pars_tjm, f);
L_jm = l_jm * L_mm; Lw_jm = L_jm/ del_Mi;  % cm, length at emergence
N_jm = kap_R * (1 - kap) * v_Rj * l_jm^3/ u_E0; % # of eggs at j
Ww_jm = 1e3 * L_jm^3 * (1 + f * w_m) + N_jm * Wd_0/ d_E; % mg, ultimate wet weight
% (assuming that sperm contributes like eggs)

% body length per instar, cm
Lw_1 = Lw_b;
Lw_2 = Lw_1 * s_1^0.5;
Lw_3 = Lw_2 * s_2^0.5;
Lw_4 = Lw_3 * s_3^0.5;
Lw_5 = Lw_4 * s_4^0.5;
Lw_6 = Lw_5 * s_5^0.5;
Lw_7 = Lw_6 * s_6^0.5;
Lw_8 = Lw_7 * s_7^0.5;
Lw_9 = Lw_8 * s_8^0.5;


% dry weight per instar
% lengths
L_1 = Lw_1 * del_M; L_2 = Lw_2 * del_M; L_3 = Lw_3 * del_M;
L_4 = Lw_4 * del_M; L_5 = Lw_5 * del_M; L_6 = Lw_6 * del_M;
L_7 = Lw_7 * del_M; L_8 = Lw_8 * del_M; L_9 = Lw_9 * del_M;

% no. of eggs calculated from length
lN1_j = L_1 * del_M/ L_m;     N_j1 = kap_R * (1 - kap) * v_Rj * lN1_j.^3/ u_E0;
lN2_j = L_2 * del_M/ L_m;     N_j2 = kap_R * (1 - kap) * v_Rj * lN2_j.^3/ u_E0;
lN3_j = L_3 * del_M/ L_m;     N_j3 = kap_R * (1 - kap) * v_Rj * lN3_j.^3/ u_E0;
lN4_j = L_4 * del_M/ L_m;     N_j4 = kap_R * (1 - kap) * v_Rj * lN4_j.^3/ u_E0;
lN5_j = L_5 * del_M/ L_m;     N_j5 = kap_R * (1 - kap) * v_Rj * lN5_j.^3/ u_E0;
lN6_j = L_6 * del_M/ L_m;     N_j6 = kap_R * (1 - kap) * v_Rj * lN6_j.^3/ u_E0;
lN7_j = L_7 * del_M/ L_m;     N_j7 = kap_R * (1 - kap) * v_Rj * lN7_j.^3/ u_E0;
lN8_j = L_8 * del_M/ L_m;     N_j8 = kap_R * (1 - kap) * v_Rj * lN8_j.^3/ u_E0;
lN9_j = L_9 * del_M/ L_m;     N_j9 = kap_R * (1 - kap) * v_Rj * lN9_j.^3/ u_E0;

EWd_1 = L_1.^3 * d_V * (1 + f * w) * 1e3 + N_j1 * Wd_0/ d_E; % mg, dry weight  including the reproduction buffer
EWd_2 = L_2.^3 * d_V * (1 + f * w) * 1e3 + N_j2 * Wd_0/ d_E; % mg, dry weight  including the reproduction buffer
EWd_3 = L_3.^3 * d_V * (1 + f * w) * 1e3 + N_j3 * Wd_0/ d_E; % mg, dry weight  including the reproduction buffer
EWd_4 = L_4.^3 * d_V * (1 + f * w) * 1e3 + N_j4 * Wd_0/ d_E; % mg, dry weight  including the reproduction buffer
EWd_5 = L_5.^3 * d_V * (1 + f * w) * 1e3 + N_j5 * Wd_0/ d_E; % mg, dry weight  including the reproduction buffer
EWd_6 = L_6.^3 * d_V * (1 + f * w) * 1e3 + N_j6 * Wd_0/ d_E; % mg, dry weight  including the reproduction buffer
EWd_7 = L_7.^3 * d_V * (1 + f * w) * 1e3 + N_j7 * Wd_0/ d_E; % mg, dry weight  including the reproduction buffer
EWd_8 = L_8.^3 * d_V * (1 + f * w) * 1e3 + N_j8 * Wd_0/ d_E; % mg, dry weight  including the reproduction buffer
EWd_9 = L_9.^3 * d_V * (1 + f * w) * 1e3 + N_j9 * Wd_0/ d_E; % mg, dry weight  including the reproduction buffer

% head length per instar, cm
Lh_1 = Lh_b;
Lh_2 = Lh_1 * s_1^0.5;
Lh_3 = Lh_2 * s_2^0.5;
Lh_4 = Lh_3 * s_3^0.5;
Lh_5 = Lh_4 * s_4^0.5;
Lh_6 = Lh_5 * s_5^0.5;
Lh_7 = Lh_6 * s_6^0.5;
Lh_8 = Lh_7 * s_7^0.5;
Lh_9 = Lh_8 * s_8^0.5;

% pack to output
prdData.ab = aT_b;
prdData.L0 = Lw_0;
prdData.Lb = Lw_b;
prdData.tj_26 = tT_j_26;
prdData.tj_22 = tT_j_22;
prdData.tj_18 = tT_j_18;
prdData.tj_13 = tT_j_13;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Lj = Lw_j;
prdData.Lj_m = Lw_jm;
prdData.Wd0 = Wd_0;
prdData.Wwj = Ww_j;
prdData.Wwj_m = Ww_jm;
prdData.Wdb = Wd_b;
prdData.Lj_w = Lw_jw;

prdData.L1 = Lw_1;
prdData.L2 = Lw_2;
prdData.L3 = Lw_3;
prdData.L4 = Lw_4;
prdData.L5 = Lw_5;
prdData.L6 = Lw_6;
prdData.L7 = Lw_7;
prdData.L8 = Lw_8;
prdData.L9 = Lw_9;
prdData.Wd1 = EWd_1;
prdData.Wd2 = EWd_2;
prdData.Wd3 = EWd_3;
prdData.Wd4 = EWd_4;
prdData.Wd5 = EWd_5;
prdData.Wd6 = EWd_6;
prdData.Wd7 = EWd_7;
prdData.Wd8 = EWd_8;
prdData.Wd9 = EWd_9;
prdData.Lh1 = Lh_1;
prdData.Lh2 = Lh_2;
prdData.Lh3 = Lh_3;
prdData.Lh4 = Lh_4;
prdData.Lh5 = Lh_5;
prdData.Lh6 = Lh_6;
prdData.Lh7 = Lh_7;
prdData.Lh8 = Lh_8;
prdData.Lh9 = Lh_9;

%% uni-variate data ------------------------------------------------------

% time-length, weight
% GuptMich1993
pars_R = [kap; kap_R; g; TC_tL * k_J; TC_tL * k_M; 0; TC_tL * v; U_Hb/ TC_tL; U_Hp/ TC_tL; U_Hp/ TC_tL + 1e-8];
[N, L] = cum_reprod_j(tL(:,1), f_gup, pars_R);
ELw = L/ del_M;

% Cian1979, females
pars_R = [kap; kap_R; g; TC_cian * k_J; TC_cian * k_M; 0; TC_cian * v; U_Hb/ TC_cian; U_Hp/ TC_cian; U_Hp/ TC_cian + 1e-8];
[N, L] = cum_reprod_j(tL_f(:,1)+ t0_c, f_c, pars_R);
ELw_f = L/ del_M;  % cm, body length females
EWw_f = (1e3 * L.^3 * (1 + f_c * w) + N * Wd_0/ d_E).^(1/3); % mg, wet weight^1/3 females, including eggs

% Cian1979, males
pars_Rm = [kap; kap_R; g_m; TC_cian * k_J; TC_cian * k_M; 0; TC_cian * v; U_Hb/ TC_cian; U_Hp/ TC_cian; U_Hp/ TC_cian + 1e-8];
[N, L] = cum_reprod_j(tL_m(:,1)+ t0_c, f_c, pars_Rm);
ELw_m = L/ del_M;  % cm, body length males
EWw_m = (1e3 * L.^3 * (1 + f_c * w) + N * Wd_0/ d_E).^(1/3); % mg, wet weight^1/3 males (assuming that sperm contributes like eggs)

% weight-respiration
p_ref = TC_cian * p_Am * L_m^2;        % J/d, max assimilation power at max size
pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp; U_Hp + 1e-6];
p_ACSJGRD = p_ref * scaled_power_j((1e-3 * WJO_f(:,1)/ (1 + f_c * w)).^(1/3), f_c, pars_power, l_b, l_p, l_p);
X_gas = 1/ 24.4;       % M, mol of gas per litre at T_ref (= 20 C) and 1 bar
p_ADG = p_ACSJGRD(:,[1 7 5]); % J/d, assimilation, dissipation, growth powers
J_O = eta_O * p_ADG'; J_M = - (n_M\n_O) * J_O; % rows: CHON
EJO_f = - 1e6 * J_M(3,:)'/ X_gas/ 24; % mul/h, O2 consumption for females

p_ref = TC_cian * p_Am_m * L_mm^2;        % J/d, max assimilation power at max size
pars_power = [kap; kap_R; g_m; k_J; k_M; L_T; v; U_Hb; U_Hp; U_Hp + 1e-6];
p_ACSJGRD = p_ref * scaled_power_j((1e-3 * WJO_m(:,1)/ (1 + f_c * w_m)).^(1/3), f_c, pars_power, l_bm, l_pm, l_pm);
p_ADG = p_ACSJGRD(:,[1 7 5]); % J/d, assimilation, dissipation, growth powers
J_O = eta_O * p_ADG'; J_M = - (n_M\n_O) * J_O; % rows: CHON
EJO_m = - 1e6 * J_M(3,:)'/ X_gas/ 24; % mul/h, O2 consumption for males


% gaiac, females
pars_R_f1 = [kap; kap_R; g; TC_tL_f1 * k_J; TC_tL_f1 * k_M; 0; TC_tL_f1 * v; U_Hb/ TC_tL_f1; U_Hp/ TC_tL_f1; U_Hp/ TC_tL_f1 + 1e-8];
[N, L] = cum_reprod_j(tL_f1(:,1)+ t0_fm1, f_fm1, pars_R_f1);
ELw_f1 = L/ del_M;  % cm, body length females
% gaiac, males
pars_R_m1 = [kap; kap_R; g_m; TC_tL_m1 * k_J; TC_tL_m1 * k_M; 0; TC_tL_m1 * v; U_Hb/ TC_tL_m1; U_Hp/ TC_tL_m1; U_Hp/ TC_tL_m1 + 1e-8];
[N, L] = cum_reprod_j(tL_m1(:,1)+ t0_fm1, f_fm1, pars_R_m1);
ELw_m1 = L/ del_M;  % cm, body length males

% time-length data gaiac (varying temperature)
r_j = rho_j * k_M; r_B = rho_B * k_M; % 1/d, exponential, von Bert growth rate
L_0_c = L_ini_c * del_M;% cm, structural length
L_0_w = L_ini_w * del_M;% cm, structural length
L_0_g = L_ini_g * del_M;% cm, structural length

pars_tj = [g k v_Hb v_Hp v_Rj];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f_tL_c);
L_b = L_m * l_b; L_p = L_m * l_p; L_i = L_m * l_i;
[t LH] = ode45(@dget_LH, tL_c(:,1), [L_0_c; E_Hp], [], tTC_c, E_Hp, r_j, r_B, L_b, L_p, L_i, v, g, kap, k_J, E_m, f_tL_c);
ELw_c = LH(:,1)/ del_M; % body length in cm

pars_tj = [g k v_Hb v_Hp v_Rj];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f_tL_w);
L_b = L_m * l_b; L_p = L_m * l_p; L_i = L_m * l_i;
[t LH] = ode45(@dget_LH, tL_w(:,1), [L_0_w; E_Hp], [], tTC_w, E_Hp, r_j, r_B, L_b, L_p, L_i, v, g, kap, k_J, E_m, f_tL_w);
ELw_w = LH(:,1)/ del_M; % body length in cm

pars_tj = [g k v_Hb v_Hp v_Rj];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f_tL_g);
L_b = L_m * l_b; L_p = L_m * l_p; L_i = L_m * l_i;
[t LH] = ode45(@dget_LH, tL_g(:,1), [L_0_g; E_Hp], [], tTC_g, E_Hp, r_j, r_B, L_b, L_p, L_i, v, g, kap, k_J, E_m, f_tL_g);
ELw_g = LH(:,1)/ del_M; % body length in cm


% gaiac2019 - head width
pars_tj = [g k v_Hb v_Hp v_Rj];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f);
L_b = L_m * l_b; L_p = L_m * l_p; L_i = L_m * l_i;
% 26 C
pars_R = [kap; kap_R; g; TC_tL_h1 * k_J; TC_tL_h1 * k_M; 0; TC_tL_h1 * v; U_Hb/ TC_tL_h1; U_Hp/ TC_tL_h1; U_Hp/ TC_tL_h1 + 1e-8];
t_0_26 = t_0/TC_tL_h1;
[N, L] = cum_reprod_j(t_0_26 + tL_h1(:,1), f_g, pars_R);
EL_h1 = L/ del_Mh;

% 22 C
pars_R = [kap; kap_R; g; TC_tL_h2 * k_J; TC_tL_h2 * k_M; 0; TC_tL_h2 * v; U_Hb/ TC_tL_h2; U_Hp/ TC_tL_h2; U_Hp/ TC_tL_h2 + 1e-8];
t_0_22 = t_0/TC_tL_h2;
[N, L] = cum_reprod_j(t_0_22 + tL_h2(:,1), f_g, pars_R);
EL_h2 = L/ del_Mh;

% 18 C
pars_R = [kap; kap_R; g; TC_tL_h3 * k_J; TC_tL_h3 * k_M; 0; TC_tL_h3 * v; U_Hb/ TC_tL_h3; U_Hp/ TC_tL_h3; U_Hp/ TC_tL_h3 + 1e-8];
t_0_18 = t_0/TC_tL_h3;
[N, L] = cum_reprod_j(t_0_18 + tL_h3(:,1), f_g, pars_R);
EL_h3 = L/ del_Mh;

% 13 C
pars_R = [kap; kap_R; g; TC_tL_h4 * k_J; TC_tL_h4 * k_M; 0; TC_tL_h4 * v; U_Hb/ TC_tL_h4; U_Hp/ TC_tL_h4; U_Hp/ TC_tL_h4 + 1e-8];
t_0_13 = t_0/TC_tL_h4;
[N, L] = cum_reprod_j(t_0_13 + tL_h4(:,1), f_g, pars_R);
EL_h4 = L/ del_Mh;

% 8 C
pars_R = [kap; kap_R; g; TC_tL_h5 * k_J; TC_tL_h5 * k_M; 0; TC_tL_h5 * v; U_Hb/ TC_tL_h5; U_Hp/ TC_tL_h5; U_Hp/ TC_tL_h5 + 1e-8];
t_0_8 = t_0/TC_tL_h5;
[N, L] = cum_reprod_j(t_0_8 + tL_h5(:,1), f_g, pars_R);
EL_h5 = L/ del_Mh;


% Wing length - dry weight Lw-Wd (Swee2018)
L = Lw_Wd(:,1) * del_Mw; % cm, structural length
ELwWd  = L.^3 * (1 + f_S * w) * d_V * 1e3; % mg (-> 1e3), dry weight without reproduction buffer

% wing length - fecundity (number of hatchlings per female) (Swee2018)
L_w_N  = Lw_N(:,1);
lN_j = (L_w_N * del_Mw) / L_m;
EN   = kap_R * (1 - kap) * v_Rj * lN_j.^3/ u_E0;

% temperaure - time since birth at emergence (Swee2018)
TC_Ttj = tempcorr(C2K(Ttj(:,1)), T_ref, pars_T_c);
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f_S);
Etj = (t_j - t_b) /k_M ./ TC_Ttj;

% temperaure - time since birth at emergence (gaiac2019)
TC_Ttj_g = tempcorr(C2K(Ttj_g(:,1)), T_ref, pars_T_c);
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f_S);
Etj_g = (t_j - t_b) /k_M ./ TC_Ttj_g;


% Starvation t-S data (Wagenfuehr, 20 C)
L = L_ini_W * del_M; % mean measured body lenght
s_M  = L_p/ L_b; % -, acceleration factor
E = f_W * p_Am/ v;
[tt, LEHS] =  ode45(@dget_LEHS, tS(:,1), [L; E; E_Hb; 1; L; E_Hp] ,[],...
    p_Am*s_M*TC_tS, v*s_M*TC_tS, p_M*TC_tS, E_G, kap, kap_G, k_J*TC_tS, s_shrink, h_b, 0); % f = 0

% Control (f = 1)
[tt, LEHS_3] =  ode45(@dget_LEHS, tS_3(:,1), [L; E; E_Hb; 1; L; E_Hp] ,[],...
    p_Am*s_M*TC_tS, v*s_M*TC_tS, p_M*TC_tS, E_G, kap, kap_G, k_J*TC_tS, s_shrink, h_b, f_W); % f = 1


% pack to output
prdData.tL = ELw;
prdData.tL_f = ELw_f;
prdData.tL_m = ELw_m;
prdData.tW_f = EWw_f;
prdData.tW_m = EWw_m;
prdData.WJO_f = EJO_f;
prdData.WJO_m = EJO_m;
prdData.tL_f1 = ELw_f1;
prdData.tL_m1 = ELw_m1;
prdData.tL_c = ELw_c;
prdData.tL_w = ELw_w;
prdData.tL_g = ELw_g;
prdData.tL_h1 = EL_h1;
prdData.tL_h2 = EL_h2;
prdData.tL_h3 = EL_h3;
prdData.tL_h4 = EL_h4;
prdData.tL_h5 = EL_h5;
prdData.Lw_Wd = ELwWd;
prdData.Lw_N = EN;
prdData.Ttj = Etj;
prdData.Ttj_g = Etj_g;
prdData.tS = LEHS(:,4);
prdData.tS_2 = LEHS(:,4);
prdData.tS_3 = LEHS_3(:,4);

end

%% subfunctions:

function dLH = dget_LH(t, LH, tTC, E_Hp, r_j, r_B, L_b, L_p, L_i, v, g, kap, k_J, E_m, f)

L = LH(1); E_H = LH(2); % cm, J: structural length, maturity
s_M = min(L, L_p)/ L_b; % -, acceleration factor
r = v * s_M * (f/ L - 1/ L_i)/ (f + g); % 1/d, spec growth rate
p_C = L^3 * E_m * f * (s_M * v/ L - r); % J/d, mobilisation rate
dE_H = (1 - kap) * p_C - k_J * E_H; % change in maturity at T_ref
if E_H < E_Hp
    dL = L * r_j/3; % cm/d, change in length before metam at T_ref
else
    dL = r_B * (L_i - L); % cm/d, change in length after metam at T_ref
end
dLH = spline1(t, tTC) * [dL; dE_H]; % cm/d, J/d: changes at T

end


function dLEHS = dget_LEHS(t,LEHS,...
    p_Am, v, p_M, E_G, kap, kap_G, k_J,  s_shrink, h_b, f)

% the function will not handle re-growth

% unpack LEHRU
L   =  LEHS(1); % cm, volumetric structural length
E   =  LEHS(2); % J cm^{-3}, [E] reserve density
EH  =  LEHS(3); % J, E_H maturity
S   =  min(1,LEHS(4)); % survival probability
maxL = LEHS(5); % maximum length
maxEH = LEHS(6); % maximum maturity

L_m = kap * p_Am/ p_M; % cm, ultimate length
k_M = p_M/ E_G;  % 1/d, maturity maintenance rate coefficient
E_m = p_Am/ v;   % J/cm^3, max reserve density
l = L/ L_m; e = E/E_m;  % -, scaled structural length and scaled res. dens.

p_C = E * (E_G * v/ L + p_M)/ (kap * E + E_G );   % J/cm^3 (2.12, Kooy2010) specific mobilisation flux
dE =  (f * p_Am - E * v)/ L; % J day^{-1} cm^{-3} (2.10, Kooy2010)

% pp.42 comments DEB3 equ. 4.2
if e < l
    r = (E * v/ L - p_M/ kap)/ (E + E_G * kap_G/ kap);
else
    r = (E * v/ L - p_M/ kap)/ (E + E_G/ kap);
end
dL  = L * r/ 3;

dmaxL = max(0,dL); % cm, max stuctural length
dEH = (1 - kap) * p_C * L^3 - k_J * EH; % J/d

dmaxEH = max(0,dEH); % J, max maturity

h_sh = s_shrink * k_M * max(0, maxL - L)/maxL;

dS = - S * (h_sh + h_b); % 1/d, survival fraction

% pack state variables
dLEHS = [dL; dE; dEH; dS; dmaxL; dmaxEH];

end

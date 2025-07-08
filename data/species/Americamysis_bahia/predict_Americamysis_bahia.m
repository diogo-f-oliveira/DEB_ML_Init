function [prdData, info] = predict_Americamysis_bahia(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

% % customized filters to contrain additional parameter
% filterChecks =  f_Sca_m > 1 || f_Sca_m < 0.15 ||...
%                 f_data1  > 1 || f_data1 < 0.1 ||...
%                 f_data2  > 1 || f_data2 < 0.1 ||...
%                 f_data3  > 1 || f_data3 < 0.1 ||...
%                 f_data4  > 1 || f_data4 < 0.1 ||...
%                 f_MK1 > 1 || f_MK1 < 0 ||...
%                 f_MK2 > 1 || f_MK2 < 0 ||...
%                 f_MK3 > 1 || f_MK3 < 0 ||...
%                 f_MK4 > 1 || f_MK4 < 0 ||...
%                 E_Hb > E_Hj || E_Hj > E_Hp;         % f contrained to not be larger than 1
% 
% if filterChecks
%     info = 0;
%     prdData = {};
%     return;
% end

%f_data3 = f_data2; % Use same f for experiment from same lab
%f_data4 = f_data2; % Use same f for experiment from same lab

%% compute temperature correction factors
TC_ab_T16 = tempcorr(temp.ab_T16, T_ref, T_A);
TC_ab_T20 = tempcorr(temp.ab_T20, T_ref, T_A);
TC_ab_T21 = tempcorr(temp.ab_T21, T_ref, T_A);
TC_ab_T29 = tempcorr(temp.ab_T29, T_ref, T_A);
TC_tp = tempcorr(temp.tp, T_ref, T_A);
TC_am = tempcorr(temp.am, T_ref, T_A);
TC_N29 = tempcorr(temp.N29_f4, T_ref, T_A); % Same temperature for all N29_f data
TC_d1 = tempcorr(temp.L28_f_d1, T_ref, T_A); % Same temperature for all data1
TC_d2 = tempcorr(temp.N28_d2, T_ref, T_A); % Same temperature for data2
TC_d3 = tempcorr(temp.tN1_d3, T_ref, T_A); % Same temperature for data3
TC_d4 = tempcorr(temp.L28_f_d1, T_ref, T_A); % Same temperature for data4

TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
TC_tL_DL = tempcorr(temp.tL1, T_ref, T_A);
TC_tL_5 = tempcorr(temp.tL5, T_ref, T_A);

TC_tWd = tempcorr(temp.tWd_f1, T_ref, T_A);  % Same temperature for all tWd_f data
TC_tN1 = tempcorr(temp.tN1, T_ref, T_A); 
TC_WwJO = tempcorr(temp.WwJO, T_ref, T_A); 

%% zero-variate data  
% life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

% males
p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
L_mm = v/ k_M/ g_m;                  % cm, max struct length
pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];

% birth
L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
Lw_b = L_b/ del_M;                % cm, total length at birth
Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
aT16_b = t_b/ k_M/ TC_ab_T16 ;     % d, age at birth at f and T 16 C
aT20_b = t_b/ k_M/ TC_ab_T20 ;     % d, age at birth at f and T 20 C
aT21_b = t_b/ k_M/ TC_ab_T21 ;     % d, age at birth at f and T 21 C
aT29_b = t_b/ k_M/ TC_ab_T29 ;     % d, age at birth at f and T 29 C

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

% ultimate
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, female ultimate total length at f

% length and weight at day 28 data1
% female
[tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_data1, [], 28*k_M * TC_d1);
ELw_28_f_d1 = L_m * tvel(:,4)/ del_M;   % cm, length after V1-morph period at day 28
EWw_28_f_d1 = (L_m * tvel(:,4)).^3 * (1 + f_data1 * w);       % g, wet weight at day 28
EWd_28_f_d1 = EWw_28_f_d1 * d_V;       % g, dry weight at day 28
% male
tvel = get_tj(pars_tjm, f_data1, [t_b, f_data1*z/z_m, l_b*z/z_m], 28*k_M * TC_d1);
ELw_28_m_d1 = L_m * tvel(:,4)/ del_M;   % cm, length after V1-morph period at day 28
EWw_28_m_d1 = (L_m * tvel(:,4)).^3 * (1 + f_data1 * w_m);       % g, wet weight at day 28
EWd_28_m_d1 = EWw_28_m_d1 * d_V;       % g, dry weight at day 28

% length and weight at day 28 data2
% female
[tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_data2, [], 28*k_M * TC_d2);
ELw_28_f_d2 = L_m * tvel(:,4)/ del_M;   % cm, length after V1-morph period at day 28
EWd_28_f_d2 = (L_m * tvel(:,4)).^3 * (1 + f_data2 * w) * d_V;  % g, dry weight at day 28
% male
tvel = get_tj(pars_tjm, f_data2, [t_b, f_data2*z/z_m, l_b*z/z_m], 28*k_M * TC_d2);
ELw_28_m_d2 = L_m * tvel(:,4)/ del_M;   % cm, length after V1-morph period at day 28
EWd_28_m_d2 = (L_mm * tvel(:,4)).^3 * (1 + f_data2 * w_m) * d_V;  % g, dry weight at day 28

% length and weight at day 28 data3
% female
[tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_data3, [], 28*k_M * TC_d3);
ELw_28_f_d3 = L_m * tvel(:,4)/ del_M;   % cm, length after V1-morph period at day 28
EWd_28_f_d3 = (L_m * tvel(:,4)).^3 * (1 + f_data3 * w) * d_V;  % g, dry weight at day 28
% male
tvel = get_tj(pars_tjm, f_data3, [t_b, f_data3*z/z_m, l_b*z/z_m], 28*k_M * TC_d3);
ELw_28_m_d3 = L_m * tvel(:,4)/ del_M;   % cm, length after V1-morph period at day 28
EWd_28_m_d3 = (L_mm * tvel(:,4)).^3 * (1 + f_data3 * w_m) * d_V;  % g, dry weight at day 28

% length and weight at day 28 data4
% female
[tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_data4, [], 28*k_M * TC_d4);
ELw_28_f_d4 = L_m * tvel(:,4)/ del_M;   % cm, length after V1-morph period at day 28
EWd_28_f_d4 = (L_m * tvel(:,4)).^3 * (1 + f_data4 * w) * d_V;  % g, dry weight at day 28
% male
tvel = get_tj(pars_tjm, f_data4, [t_b, f_data4*z/z_m, l_b*z/z_m], 28*k_M * TC_d4);
ELw_28_m_d4 = L_m * tvel(:,4)/ del_M;   % cm, length after V1-morph period at day 28
EWd_28_m_d4 = (L_mm * tvel(:,4)).^3 * (1 + f_data4 * w_m) * d_V;  % g, dry weight at day 28

% cumulative reproduction at 28 days data2
pars_R = [kap; kap_R; g; k_J * TC_d2; k_M * TC_d2; L_T; v * TC_d2; U_Hb/ TC_d2; U_Hj/ TC_d2; U_Hp/ TC_d2];
EN_28_d2 = cum_reprod_j(28 , f_data2, pars_R); 

pars_R = [kap; kap_R; g; k_J * TC_N29; k_M * TC_N29; L_T; v * TC_N29; U_Hb/ TC_N29; U_Hj/ TC_N29; U_Hp/ TC_N29];
EN_29_f1 = cum_reprod_j(29 , f_MK1, pars_R);
EN_29_f2 = cum_reprod_j(29 , f_MK2, pars_R);
EN_29_f3 = cum_reprod_j(29 , f_MK3, pars_R);
EN_29_f4 = cum_reprod_j(29 , f_MK4, pars_R);

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC_am;              % d, mean life span at T

% pack to output
prdData.ab_T16 = aT16_b;
prdData.ab_T20 = aT20_b;
prdData.ab_T21 = aT21_b;
prdData.ab_T29 = aT29_b;
prdData.tp = tT_p;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Li = Lw_i;
prdData.Wwb = Ww_b;
prdData.N29_f1 = EN_29_f1;
prdData.N29_f2 = EN_29_f2;
prdData.N29_f3 = EN_29_f3;
prdData.N29_f4 = EN_29_f4;

prdData.L28_f_d1 = ELw_28_f_d1;
prdData.Ww28_f_d1 = EWw_28_f_d1;
prdData.Wd28_f_d1 = EWd_28_f_d1;
prdData.L28_m_d1 = ELw_28_m_d1;
prdData.Ww28_m_d1 = EWw_28_m_d1;
prdData.Wd28_m_d1 = EWd_28_m_d1;

prdData.L28_f_d2 = ELw_28_f_d2;
prdData.Wd28_f_d2 = EWd_28_f_d2;
prdData.L28_m_d2 = ELw_28_m_d2;
prdData.Wd28_m_d2 = EWd_28_m_d2;
prdData.N28_d2 = EN_28_d2;

prdData.L28_f_d3 = ELw_28_f_d3;
prdData.Wd28_f_d3 = EWd_28_f_d3;
prdData.L28_m_d3 = ELw_28_m_d3;
prdData.Wd28_m_d3 = EWd_28_m_d3;

prdData.L28_f_d4 = ELw_28_f_d4;
prdData.Wd28_f_d4 = EWd_28_f_d4;
prdData.L28_m_d4 = ELw_28_m_d4;
prdData.Wd28_m_d4 = EWd_28_m_d4;

%% uni-variate data

% time-length
% female
[tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_Sca_f, [], tL_f(:,1)*k_M*TC_tL);
ELw_f = L_m * tvel(:,4)/ del_M;   % cm, total mantle
% male
tvel = get_tj(pars_tjm, f_Sca_m, [t_b, f_Sca_m*z/z_m, l_b*z/z_m], tL_m(:,1)*k_M*TC_tL);
ELw_m = L_mm * tvel(:,4)/ del_M;  % cm, total mantle

% time-dry weight
% Feeding regime 1 
tvel = get_tj(pars_tj, f_MK1, [], tWd_f1(:,1)*k_M*TC_tWd);
EWd_1 = 1e3* (L_m * tvel(:,4)).^3 * d_V * (1 + f_MK1 * w); % mg, dry weight
% Feeding regime 2
tvel = get_tj(pars_tj, f_MK2, [], tWd_f2(:,1)*k_M*TC_tWd);
EWd_2 = 1e3* (L_m * tvel(:,4)).^3 * d_V * (1 + f_MK2 * w); % mg, dry weight
% Feeding regime 3
tvel = get_tj(pars_tj, f_MK3, [], tWd_f3(:,1)*k_M*TC_tWd);
EWd_3 = 1e3* (L_m * tvel(:,4)).^3 * d_V * (1 + f_MK3 * w); % mg, dry weight
% Feeding regime 4
tvel = get_tj(pars_tj, f_MK4, [], tWd_f4(:,1)*k_M*TC_tWd);
EWd_4 = 1e3* (L_m * tvel(:,4)).^3 * d_V * (1 + f_MK4 * w); % mg, dry weight

% time-cumulative reproduction
pars_R = [kap; kap_R; g; k_J * TC_tN1; k_M * TC_tN1; L_T; v * TC_tN1; U_Hb/ TC_tN1; U_Hj/ TC_tN1; U_Hp/ TC_tN1];
EN1 = cum_reprod_j(tN1(:,1), f_Kuh, pars_R);

% wet weight-oxygen consumption
pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];     % compose pars
p_ref  = p_Am * L_m^2;                                            % J/d, max assimilation power at max size
L      = (WwJO(:,1)/ (1 + w * f)).^(1/3);                         % cm, structural length
pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);   % J/d, powers
J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';   % mol/d: J_C, J_H, J_O, J_N in rows
EJT_O = - J_M(3, :)' * TC_WwJO * 24.4/ 24 / 1e-3;      % ml O2/h, spec O2 consumption (with 24.4 L O2/mol)

% time-cumulative reproduction data 1
pars_R = [kap; kap_R; g; k_J * TC_d1; k_M * TC_d1; L_T; v * TC_d1; U_Hb/ TC_d1; U_Hj/ TC_d1; U_Hp/ TC_d1];
EN_d1 = cum_reprod_j(tN1_d1(:,1), f_data1, pars_R);

% time-cumulative reproduction data 3
pars_R = [kap; kap_R; g; k_J * TC_d3; k_M * TC_d3; L_T; v * TC_d3; U_Hb/ TC_d3; U_Hj/ TC_d3; U_Hp/ TC_d3];
EN_d3 = cum_reprod_j(tN1_d3(:,1), f_data3, pars_R);

% time-cumulative reproduction data 4
pars_R = [kap; kap_R; g; k_J * TC_d4; k_M * TC_d4; L_T; v * TC_d4; U_Hb/ TC_d4; U_Hj/ TC_d4; U_Hp/ TC_d4];
EN_d4 = cum_reprod_j(tN1_d4(:,1), f_data4, pars_R);

% time-length for GreaGutj2011
pars_R = [kap; kap_R; g; k_J * TC_tL_DL; k_M * TC_tL_DL; L_T; v * TC_tL_DL; U_Hb/ TC_tL_DL; U_Hj/ TC_tL_DL; U_Hp/ TC_tL_DL];

% Trial 1 
tvel = get_tj(pars_tj, f_DL1, [], tL1(:,1) * k_M*TC_tL_DL);
ELw_1 = L_m * tvel(:,4)/ del_M_G; % cm, physical length

cumR14 = cum_reprod_j(14+2, f_DL1, pars_R); %information on the reproductive output until day day 14 of the experiment was not provided in the paper
EN_N1  = cum_reprod_j(tN_G1(:,1), f_DL1, pars_R)-cumR14;

% Trial 2 
tvel = get_tj(pars_tj, f_DL2, [], tL2(:,1) * k_M*TC_tL_DL);
ELw_2 = L_m * tvel(:,4)/ del_M_G; % cm, physical length

cumR14 = cum_reprod_j(14+2, f_DL2, pars_R); %information on the reproductive output until day day 14 of the experiment was not provided in the paper
EN_N2  = cum_reprod_j(tN_G2(:,1), f_DL2, pars_R)-cumR14;

% Trial 3 
tvel = get_tj(pars_tj, f_DL3, [], tL3(:,1) * k_M*TC_tL_DL);
ELw_3 = L_m * tvel(:,4)/ del_M_G; % cm, physical length

cumR14 = cum_reprod_j(14+2, f_DL3, pars_R); %information on the reproductive output until day day 14 of the experiment was not provided in the paper
EN_N3  = cum_reprod_j(tN_G3(:,1), f_DL3, pars_R)-cumR14;

% Trial 4 
tvel = get_tj(pars_tj, f_DL4, [], tL4(:,1) * k_M*TC_tL_DL);
ELw_4 = L_m * tvel(:,4)/ del_M_G; % cm, physical length

cumR14 = cum_reprod_j(14+2, f_DL4, pars_R); %information on the reproductive output until day day 14 of the experiment was not provided in the paper
EN_N4  = cum_reprod_j(tN_G4(:,1), f_DL4, pars_R)-cumR14;

% Trial 5 
tvel = get_tj(pars_tj, f_DL4, [], tL5(:,1) * k_M*TC_tL_5);
ELw_5 = L_m * tvel(:,4)/ del_M_G; % cm, physical length

% pack predictions:
prdData.tL_f = ELw_f;
prdData.tL_m = ELw_m;

prdData.tL1 = ELw_1;
prdData.tN_G1 = EN_N1;
prdData.tL2 = ELw_2;
prdData.tN_G2 = EN_N2;
prdData.tL3 = ELw_3;
prdData.tN_G3 = EN_N3;
prdData.tL4 = ELw_4;
prdData.tN_G4 = EN_N4;
prdData.tL5 = ELw_5;

prdData.tWd_f1 = EWd_1;
prdData.tWd_f2 = EWd_2;
prdData.tWd_f3 = EWd_3;
prdData.tWd_f4 = EWd_4;

prdData.tN1 = EN1;
prdData.tN1_d1 = EN_d1;
prdData.tN2_d1 = EN_d1;
prdData.tN1_d3 = EN_d3;
prdData.tN2_d3 = EN_d3;
prdData.tN1_d4 = EN_d4;
prdData.tN2_d4 = EN_d4;
prdData.WwJO = EJT_O;

end

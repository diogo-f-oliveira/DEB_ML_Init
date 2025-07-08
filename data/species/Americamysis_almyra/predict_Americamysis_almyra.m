function [prdData, info] = predict_Americamysis_almyra(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
TC_tp = tempcorr(temp.tp, T_ref, T_A);
TC_am = tempcorr(temp.am, T_ref, T_A);
TC_tL_DL = tempcorr(temp.tL1, T_ref, T_A);
TC_tL4 = tempcorr(temp.tL4, T_ref, T_A);
TC_tL5 = tempcorr(temp.tL5, T_ref, T_A);
TC_tL6 = tempcorr(temp.tL6, T_ref, T_A);

%% zero-variate data  
% life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

% birth
L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
Lw_b = L_b/ del_M;                % cm, total length at birth
Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
tT_p = (t_p - t_b)/ k_M/ TC_tp + (t_b/ k_M/ TC_tp);   % d, time since birth at release of first brood at f and T
Lw_p = L_p / del_M;                  % cm, measured length at puberty at f 

% ultimate
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, female ultimate total length at f
Wd_i = L_i^3 * d_V * (1 + f * w);      % g, ulimate dry weight 

% reproduction 
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T

RT_i = TC_tL5 * reprod_rate_j(L_i, f_L456, pars_R);                 % #/d, ultimate reproduction rate at T

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC_am;              % d, mean life span at T

% pack to output
prdData.tp = tT_p;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Li = Lw_i;
prdData.Ri = RT_i;
prdData.Wdi = Wd_i;

%% uni-variate data

% time-length for DomiLee1998
kT_M = TC_tL_DL * k_M;
% Trial 1 
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_DL1);
L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
L_bj = L_b * exp(tL1(tL1(:,1) < tT_j,1) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL1(tL1(:,1) >= tT_j,1) - tT_j));   % cm, length after V1-morph period
EWL_1 = [L_bj; L_jm]/ del_M; % cm, physical length

% Trial 2 
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_DL2);
L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
L_bj = L_b * exp(tL2(tL2(:,1) < tT_j,1) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL2(tL2(:,1) >= tT_j,1) - tT_j));   % cm, length after V1-morph period
EWL_2 = [L_bj; L_jm]/ del_M; % cm, physical length

% Trial 3 
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_DL3);
L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
L_bj = L_b * exp(tL3(tL3(:,1) < tT_j,1) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL3(tL3(:,1) >= tT_j,1) - tT_j));   % cm, length after V1-morph period
EWL_3 = [L_bj; L_jm]/ del_M; % cm, physical length


% time-length for DomiLee1999
kT_M = TC_tL4 * k_M;
f= f_L456; %change f
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
L_bj = L_b * exp(tL4(tL4(:,1) < tT_j,1) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL4(tL4(:,1) >= tT_j,1) - tT_j));   % cm, length after V1-morph period
EWL_4 = [L_bj; L_jm]/ del_M; % cm, physical length

kT_M = TC_tL5 * k_M;
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f); 
L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
L_bj = L_b * exp(tL5(tL5(:,1) < tT_j,1) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL5(tL5(:,1) >= tT_j,1) - tT_j));   % cm, length after V1-morph period
EWL_5 = [L_bj; L_jm]/ del_M; % cm, physical length

kT_M = TC_tL6 * k_M;
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f); 
L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
L_bj = L_b * exp(tL6(tL6(:,1) < tT_j,1) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL6(tL6(:,1) >= tT_j,1) - tT_j));   % cm, length after V1-morph period
EWL_6 = [L_bj; L_jm]/ del_M; % cm, physical length


% pack predictions:
prdData.tL1 = EWL_1;
prdData.tL2 = EWL_2;
prdData.tL3 = EWL_3;
prdData.tL4 = EWL_4;
prdData.tL5 = EWL_5;
prdData.tL6 = EWL_6;

end

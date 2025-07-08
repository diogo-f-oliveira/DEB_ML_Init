function [prdData, info] = predict_Cyprinodon_variegatus(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

% customized filters to contrain additional parameter
filterChecks =  f_ParrDyar1978  > 1 || f_ParrDyar1978  < 0 ||...         % f contrained to not be larger than 1
    f_CripHemm2009  > 1 || f_CripHemm2009  < 0|| ...
    f_CripHemm2009_bsf  > 1 || f_CripHemm2009_bsf  < 0 ||...
    f_CripHemm2009_ff  > 1 || f_CripHemm2009_ff  < 0 ||...
    f_CripHemm2009_bsff  > 1 || f_CripHemm2009_bsff  < 0 ;

if filterChecks
    info = 0;
    prdData = {};
    return;
end

%% compute temperature correction factors
TC_ab = tempcorr(temp.ab, T_ref, T_A);
TC_tj = tempcorr(temp.tj, T_ref, T_A);
TC_tp = tempcorr(temp.tp, T_ref, T_A);
TC_am = tempcorr(temp.am, T_ref, T_A);
TC_Ri = tempcorr(temp.Ri, T_ref, T_A);

TC_tLs1 = tempcorr(temp.tLs1, T_ref, T_A);
TC_tLs4 = tempcorr(temp.tLs4, T_ref, T_A);
TC_tLs5 = tempcorr(temp.tLs5, T_ref, T_A);
TC_tLs6 = tempcorr(temp.tLs6, T_ref, T_A);
TC_tLs7 = tempcorr(temp.tLs7, T_ref, T_A);
TC_tN = tempcorr(temp.tN1, T_ref, T_A);

%% zero-variate data   
% life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

% birth
L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
Lw_b = L_b/ del_M;                % cm, standard length at birth
Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at borth
aT_b = tau_b/ k_M/ TC_ab;           % d, age at birth at f and T

% metamorphosis
L_j = L_m * l_j;                  % cm, structural length at birth of foetus  at f = 1
Lw_j = L_j/ del_M;                % cm, standard length at birth
tT_j = (tau_j - tau_b)/ k_M/ TC_tj; % d, time since birth at metamorphosis at f and T

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, total length at puberty at f
tT_p = (tau_p - tau_b)/ k_M/ TC_tp; % d, time since birth at puberty at f and T

% ultimate
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_if = L_i/ del_M;                % cm, female ultimate total length at f

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

% pack to output
prdData.ab = aT_b;
prdData.tj = tT_j;
prdData.tp = tT_p;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Lj = Lw_j;
prdData.Lp = Lw_p;
prdData.Li = Lw_if; 
prdData.Wwb = Ww_b;
prdData.Ri = RT_i;

%% uni-variate data

% ParrDyar1978
[tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_ParrDyar1978);
kT_M  = k_M * TC_tLs1; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;
L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
t_bj = tLs1(tLs1(:,1)< tT_j,1); t_ji = tLs1(tLs1(:,1)>= tT_j,1);  % selects times before/after metamorphosis
L_bj = L_b * exp(t_bj * rT_j/ 3); % cm length and weight during V1-morph period
L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
ELw_ParrDyar1978_1 = [L_bj; L_ji]/ del_M; % cm, standard length
EWw_ParrDyar1978_1 = [L_bj; L_ji].^3 * (1 + f_ParrDyar1978 * w);% g, wet weight
%
t_bj = tLs2(tLs2(:,1)< tT_j,1); t_ji = tLs2(tLs2(:,1)>= tT_j,1);  % selects times before/after metamorphosis
L_bj  = L_b * exp(t_bj * rT_j/ 3); % cm length and weight during V1-morph period
L_ji  = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
ELw_ParrDyar1978_2  = [L_bj; L_ji]/ del_M; % cm, standard length 
EWw_ParrDyar1978_2 = [L_bj; L_ji].^3 * (1 + f_ParrDyar1978 * w);% g, wet weight
% 
t_bj = tLs3(tLs3(:,1)< tT_j,1); t_ji = tLs3(tLs3(:,1)>= tT_j,1);  % selects times before/after metamorphosis
L_bj = L_b * exp(t_bj * rT_j/ 3); % cm length and weight during V1-morph period
L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
ELw_ParrDyar1978_3 = [L_bj; L_ji]/ del_M; % cm, total length 
EWw_ParrDyar1978_3 = [L_bj; L_ji].^3 * (1 + f_ParrDyar1978 * w); % g, wet weight

% CripHemm2009
[tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_CripHemm2009);
kT_M  = k_M * TC_tLs4; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M; 
L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
t_bj = tLs4(tLs4(:,1)< tT_j,1); t_ji = tLs4(tLs4(:,1)>= tT_j,1);  % selects times before/after metamorphosis
L_bj = L_b * exp(t_bj * rT_j/ 3); % cm length and weight during V1-morph period
L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
ELw_CripHemm2009_4 = [L_bj; L_ji]/ del_M; % cm, standard length
% weight, female
t_bj = tWwf1(tWwf1(:,1)< tT_j,1); t_ji = tWwf1(tWwf1(:,1)>= tT_j,1);  % selects times before/after metamorphosis
L_bj = L_b * exp(t_bj * rT_j/ 3); % cm length and weight during V1-morph period
L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
EWw_CripHemm2009_1f = [L_bj; L_ji].^3 * (1 + f_CripHemm2009 * w); % g, wet weight (female)
% weight, male
t_bj = tWwm1(tWwm1(:,1)< tT_j,1); t_ji = tWwm1(tWwm1(:,1)>= tT_j,1);  % selects times before/after metamorphosis
L_bj = L_b * exp(t_bj * rT_j/ 3); % cm length and weight during V1-morph period
L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
EWw_CripHemm2009_1m = [L_bj; L_ji].^3 * (1 + w * f_CripHemm2009); % g, wet weight (male)
% tLs5 Brine shrimp food
[tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_CripHemm2009_bsf);
kT_M  = k_M * TC_tLs5; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;    
L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
t_bj = tLs5(tLs5(:,1)< tT_j,1); t_ji = tLs5(tLs5(:,1)>= tT_j,1);  % selects times before/after metamorphosis
L_bj = L_b * exp(t_bj * rT_j/ 3); % cm length and weight during V1-morph period
L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
ELw_CripHemm2009_5 = [L_bj; L_ji]/ del_M;  % cm, standard length
% tLs6 Flake food
[tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_CripHemm2009_ff);
kT_M  = k_M * TC_tLs6; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (tau_j - tau_b)/ kT_M;
L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
t_bj = tLs6(tLs6(:,1)< tT_j,1); t_ji = tLs6(tLs6(:,1)>= tT_j,1);  % selects times before/after metamorphosis
L_bj = L_b * exp(t_bj * rT_j/ 3); % cm length and weight during V1-morph period
L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
ELw_CripHemm2009_6 = [L_bj; L_ji]/ del_M; % cm, standard length
% tLs7 Combination Brine shrimp and Flake food
[tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_CripHemm2009_bsff);
kT_M  = k_M * TC_tLs7; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j  = (tau_j - tau_b)/ kT_M;  
L_b   = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
t_bj = tLs7(tLs7(:,1)< tT_j,1); t_ji = tLs7(tLs7(:,1)>= tT_j,1);  % selects times before/after metamorphosis
L_bj  = L_b * exp(t_bj * rT_j/ 3); % cm length and weight during V1-morph period
L_ji  = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
ELw_CripHemm2009_7  = [L_bj; L_ji]/ del_M; % cm, standard length

% length-weight data from RoseNola2004
ELW_w = (LWw(:,1) * del_M).^3 * (1 + w * f);

% time- Cumulative reproduction
pars_R = [kap; kap_R; g; k_J * TC_tN; k_M * TC_tN; L_T; v * TC_tN; U_Hb/ TC_tN; U_Hj/ TC_tN; U_Hp/ TC_tN];
EN1 = cum_reprod_j([70; tN1(:,1)], f_CripHemm2009, pars_R); EN1 = EN1 - EN1(1); EN1(1) = [];
% 
EN2 = cum_reprod_j([107; tN2(:,1)], f_CripHemm2009, pars_R); EN2 = EN2 - EN2(1); EN2(1) = [];

% pack predictions:
prdData.tLs1 = ELw_ParrDyar1978_1;
prdData.tWw1 = EWw_ParrDyar1978_1;
prdData.tLs2 = ELw_ParrDyar1978_2;
prdData.tWw2 = EWw_ParrDyar1978_2;
prdData.tLs3 = ELw_ParrDyar1978_3;
prdData.tWw3 = EWw_ParrDyar1978_3;
prdData.tLs4 = ELw_CripHemm2009_4;
prdData.tWwf1 = EWw_CripHemm2009_1f;
prdData.tWwm1 = EWw_CripHemm2009_1m;
prdData.tLs5 = ELw_CripHemm2009_5;
prdData.tLs6 = ELw_CripHemm2009_6;
prdData.tLs7 = ELw_CripHemm2009_7;
prdData.LWw = ELW_w;
prdData.tN1 = EN1;
prdData.tN2 = EN2;



end


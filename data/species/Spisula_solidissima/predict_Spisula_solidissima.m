function [prdData, info] = predict_Spisula_solidissima(par, data, auxData)

%% Unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par); vars_pull(cPar); vars_pull(data); vars_pull(auxData);

%% Compute temperature correction factors
Tpars  = [T_A T_L T_H T_AL T_AH];
TC_ab  = tempcorr(temp.ab, T_ref, Tpars);
TC_aj  = tempcorr(temp.aj, T_ref, Tpars);
TC_ap  = tempcorr(temp.ap, T_ref, Tpars);
TC_am  = tempcorr(temp.am, T_ref, Tpars);
TC_Ri  = tempcorr(temp.Ri, T_ref, Tpars);
TC_tL1 = tempcorr(temp.tL1, T_ref, Tpars);
TC_LN  = tempcorr(temp.LN, T_ref, Tpars);

%% Zero-variate data
 % Life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, ~, ~, info] = get_tj(pars_tj, f); % -, scaled times & lengths at f

 % Birth
L_b  = L_m * l_b;                 % cm, structural length at birth at f
Lw_b = L_b / del_Mb;              % cm, physical length at birth at f
Wd_b = L_b^3 * d_V * (1 + f * w); % g,  dry weight at birth at f (remove d_V for wet weight)
aT_b = t_b / k_M / TC_ab;         % d,  age at birth at f and T

 % Metamorphosis
L_j  = L_m * l_j;                 % cm, structural length at metamorphosis at f
Lw_j = L_j / del_Mb;             % cm, physical length at metamorphosis at f
Wd_j = L_j^3 * d_V * (1 + f * w); % g,  dry weight at metamorphosis at f (remove d_V for wet weight)
aT_j = t_j / k_M / TC_aj;         % d,  age at metamorphosis at f and T

 % Puberty
L_p  = L_m * l_p;                 % cm, structural length at puberty at f
Lw_p = L_p / del_M;               % cm, physical length at puberty at f
aT_p = t_p / k_M / TC_ap;         % d,  age at puberty at f and T

 % Ultimate
L_i  = L_m * l_i;                 % cm, ultimate structural length at f
Lw_i = L_i / del_M;               % cm, ultimate physical length at f

 % Reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
RT_i   = TC_Ri * reprod_rate_j(L_i, f, pars_R);               % #/d, ultimate reproduction rate at T

 % Life span
pars_tm = [g; l_T; h_a / k_M^2; s_G]; % compose parameter vector at T_ref
t_m     = get_tm_s(pars_tm, f, l_b);  % -, scaled mean life span at T_ref
aT_m    = t_m / k_M / TC_am;          % d, mean life span at T

 % Pack to output
prdData.ab  = aT_b;
prdData.aj  = aT_j;
prdData.ap  = aT_p;
prdData.am  = aT_m;
prdData.Lb  = Lw_b;
prdData.Lj  = Lw_j;
prdData.Lp  = Lw_p;
prdData.Li  = Lw_i;
prdData.Wdb = Wd_b;
prdData.Wdj = Wd_j;
prdData.Ri  = RT_i;

%% Uni-variate data
 % Time vs. shell length at 10 m deep in Newfoundland
f = f_tL1; TC = TC_tL1; tL = tL1;
[t_j, ~, t_b, l_j, ~, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
rT_j = TC * rho_j * k_M; rT_B = TC * rho_B * k_M;
L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
tT_j = (t_j - t_b) / k_M / TC;                                   % d,  time since birth at metamorphosis
t_bj = tL(tL(:,1) < tT_j,1);                                     % d,  select times before metamorphosis
L_bj = (L_b * exp(t_bj * rT_j / 3)) / del_Mb;                    % cm, physical length at exponential growth as V1-morph
t_ji = tL(tL(:,1) >= tT_j,1);                                    % d,  select times after metamorphosis
L_ji = (L_i - (L_i - L_j) * exp(-rT_B * (t_ji - tT_j))) / del_M; % cm, physical length at isomorphic growth
EL1  = [L_bj; L_ji];                                             % cm, expected physical length at time
L    = L_i - (L_i - L_j) * exp( - rT_B * (tWw(:,1) - tT_j));     % cm, structural length 
EWw  = L.^3 * (1 + w * f);                                       % g,  expected wet weight

 % Shell length vs. fecundity
f  = f_LN; TC = TC_LN;
EN = 365 * TC * reprod_rate_j(LN(:,1) * del_M, f, pars_R); % #, number of offspring per year

 % Pack to output
prdData.tL1 = EL1;
prdData.tWw = EWw;
prdData.LN  = EN;

end

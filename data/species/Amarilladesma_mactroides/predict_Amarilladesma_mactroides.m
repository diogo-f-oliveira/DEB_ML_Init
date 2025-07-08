function [prdData, info] = predict_Amarilladesma_mactroides(par, data, auxData)

%% Unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par); vars_pull(cPar); vars_pull(data); vars_pull(auxData);

%% Compute temperature correction factors
TC  = tempcorr(temp.am, T_ref, T_A);

%% Zero-variate data
 % Life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, ~, ~, info] = get_tj(pars_tj, f); % -, scaled times & lengths at f

% Birth
L_b  = L_m * l_b;                 % cm, structural length at birth at f
Ww_b = L_b^3 * (1 + f * w);       % g,  wet weight at birth at f (remove d_V for wet weight)

% Puberty
L_p  = L_m * l_p;                 % cm, structural length at puberty at f
Lw_p = L_p / del_M;               % cm, physical length at puberty at f

% Ultimate
L_i  = L_m * l_i;                 % cm, ultimate structural length at f
Lw_i = L_i / del_M;               % cm, ultimate shell length at f
Ww_i = L_i^3 * (1 + f * w);       % g, wet weight

 % Reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
RT_i   = TC * reprod_rate_j(L_i, f, pars_R);               % #/d, ultimate reproduction rate at T

 % Life span
pars_tm = [g; l_T; h_a / k_M^2; s_G]; % compose parameter vector at T_ref
t_m     = get_tm_s(pars_tm, f, l_b);  % -, scaled mean life span at T_ref
aT_m    = t_m / k_M / TC;             % d, mean life span at T

 % Pack to output
prdData.am  = aT_m;
prdData.Lp  = Lw_p;
prdData.Li  = Lw_i;
prdData.Wwb = Ww_b;
prdData.Wwi = Ww_i;
prdData.Ri  = RT_i;

%% Uni-variate data
 % time-length post metam
[t_j, ~, t_b, l_j, ~, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = TC * rho_B * k_M; tT_j = (t_j - t_b)/ kT_M; 
L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
L_bj = L_b * exp(tL(tL(:,1) < tT_j,1) * rT_j / 3);                      % cm, struc length
L_ji = L_i - (L_i - L_j) * exp(-rT_B * (tL(tL(:,1) >= tT_j,1) - tT_j)); % cm, struc length
ELw  = [L_bj; L_ji]/ del_M;                                             % cm, shell length

 % Pack to output
prdData.tL = ELw;

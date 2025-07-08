function [prdData, info] = predict_Placopecten_magellanicus(par, data, auxData)

% Unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par); vars_pull(cPar); vars_pull(data); vars_pull(auxData);

% if f_WJO > 1 || f_LWd > 1 || f_tL1 > 1 || f_tL2 > 1 || f_tL3 > 1
%   prdData = []; info = 0; return
% end

%% Compute temperature correction factors
Tpars    = [T_A T_L T_AL];
TC_ab    = tempcorr(temp.ab, T_ref, Tpars);
TC_aj    = tempcorr(temp.aj, T_ref, Tpars);
TC_ap    = tempcorr(temp.ap, T_ref, Tpars);
TC_am    = tempcorr(temp.am, T_ref, Tpars);
TC_Ri    = tempcorr(temp.Ri, T_ref, Tpars);
TC_tL1   = tempcorr(temp.tL1, T_ref, Tpars);
TC_tL2   = tempcorr(temp.tL2, T_ref, Tpars);
TC_tL3   = tempcorr(temp.tL3, T_ref, Tpars);
TC_LN    = tempcorr(temp.LN, T_ref, Tpars);
TC_WJO   = tempcorr(temp.WJO, T_ref, Tpars);
TC_WJO1  = tempcorr(temp.WJO1, T_ref, Tpars);
TC_WJO3  = tempcorr(temp.WJO3, T_ref, Tpars);
TC_WJO6  = tempcorr(temp.WJO6, T_ref, Tpars);
TC_WJO8  = tempcorr(temp.WJO8, T_ref, Tpars);
TC_WJO10 = tempcorr(temp.WJO10, T_ref, Tpars);
TC_WJO19 = tempcorr(temp.WJO19, T_ref, Tpars);
TC_TJO   = tempcorr(C2K(TJO(:,1)), T_ref, Tpars);

%% Zero-variate data
 % Life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, ~, ~, info] = get_tj(pars_tj, f); % -, scaled times & lengths at f
if ~info; prdData = []; return; end

 % Birth
L_b  = L_m * l_b;                 % cm, structural length at birth at f
Lw_b = L_b / del_Mb;             % cm, physical length at birth at f
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
Wd_p = L_p^3 * d_V * (1 + f * w); % g,  dry weight at puberty (remove d_V for wet weight)
aT_p = t_p / k_M / TC_ap;         % d,  age at puberty at f and T

 % Ultimate
L_i  = L_m * l_i;                 % cm, ultimate structural length at f
Lw_i = L_i / del_M;               % cm, ultimate physical length at f
Wd_i = L_i^3 * d_V * (1 + f * w); % g,  ultimate dry weight (remove d_V for wet weight)

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
prdData.Wdp = Wd_p;
prdData.Wdi = Wd_i;
prdData.Ri  = RT_i;

%% Uni-variate data
 % Time vs. shell length at 10 m deep in Newfoundland
f = f_tL1; TC = TC_tL1; tL = tL1;
[t_j, ~, t_b, l_j, ~, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
rT_j = TC * rho_j * k_M; rT_B = TC * rho_B * k_M;
L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
tT_j = (t_j - t_b) / k_M / TC;                                   % d,   time since birth at metamorphosis
t_bj = tL(tL(:,1) < tT_j,1);                                     % d,   select times before metamorphosis
L_bj = (L_b * exp(t_bj * rT_j / 3)) / del_Mb;                    % cm,  physical length at exponential growth as V1-morph
t_ji = tL(tL(:,1) >= tT_j,1);                                    % d,   select times after metamorphosis
L_ji = (L_i - (L_i - L_j) * exp(-rT_B * (t_ji - tT_j))) / del_M; % cm,  physical length at isomorphic growth
EL1  = [L_bj; L_ji];                                             % cm,  expected physical length at time
 % 31 m deep in Newfoundland
f = f_tL2; TC = TC_tL2; tL = tL2;
[t_j, ~, t_b, l_j, ~, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
rT_j = TC * rho_j * k_M; rT_B = TC * rho_B * k_M;
L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
tT_j = (t_j - t_b) / k_M / TC;                                   % d,   time since birth at metamorphosis
t_bj = tL(tL(:,1) < tT_j,1);                                     % d,   select times before metamorphosis
L_bj = (L_b * exp(t_bj * rT_j / 3)) / del_Mb;                    % cm,  physical length at exponential growth as V1-morph
t_ji = tL(tL(:,1) >= tT_j,1);                                    % d,   select times after metamorphosis
L_ji = (L_i - (L_i - L_j) * exp(-rT_B * (t_ji - tT_j))) / del_M; % cm,  physical length at isomorphic growth
EL2  = [L_bj; L_ji];                                             % cm,  expected physical length at time
 % 31 m deep in New Jersey
% f = f_tL3; TC = TC_tL3; tL = tL3;
% [t_j, ~, t_b, l_j, ~, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
% rT_j = TC * rho_j * k_M; rT_B = TC * rho_B * k_M;
% L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
% tT_j = (t_j - t_b) / k_M / TC;                                   % d,   time since birth at metamorphosis
% t_bj = tL(tL(:,1) < tT_j,1);                                     % d,   select times before metamorphosis
% L_bj = (L_b * exp(t_bj * rT_j / 3)) / del_Mb;                    % cm,  physical length at exponential growth as V1-morph
% t_ji = tL(tL(:,1) >= tT_j,1);                                    % d,   select times after metamorphosis
% L_ji = (L_i - (L_i - L_j) * exp(-rT_B * (t_ji - tT_j))) / del_M; % cm,  physical length at isomorphic growth
% EL3  = [L_bj; L_ji];                                             % cm,  expected physical length at time

 % Time vs. shell length at 10 m deep in the Gulf of Saint-Lawrence
f = f_tL3; TC = TC_tL3; tL = tL3;
[t_j, ~, t_b, l_j, ~, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
rT_j = TC * rho_j * k_M; rT_B = TC * rho_B * k_M;
L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
tT_j = (t_j - t_b) / k_M / TC;                                   % d,   time since birth at metamorphosis
t_bj = tL(tL(:,1) < tT_j,1);                                     % d,   select times before metamorphosis
L_bj = (L_b * exp(t_bj * rT_j / 3)) / del_Mb;                    % cm,  physical length at exponential growth as V1-morph
t_ji = tL(tL(:,1) >= tT_j,1);                                    % d,   select times after metamorphosis
L_ji = (L_i - (L_i - L_j) * exp(-rT_B * (t_ji - tT_j))) / del_M; % cm,  physical length at isomorphic growth
EL3  = [L_bj; L_ji];                                             % cm,  expected physical length at time

% Shell length vs. tissue dry weight
EWd = (LWd(:,1) * del_M).^3 * (1 + w * f_LWd) * d_V; % g, expected dry weight

 % Shell length vs. fecundity
EN = 365 * TC_LN * reprod_rate_j(LN(:,1) * del_M, f_LN, pars_R); % #, number of offspring per year

% Compute parameters for oxygen consumption rate predictions
p_ref  = p_Am * L_m^2; % J/d, max assimilation power at max size and T_ref
pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];

 % Dry weight vs. oxygen consumption rate
[l_j, l_p, l_b] = get_lj(pars_tj, f_WJO);
L        = (WJO(:,1) / d_V / (1 + f_WJO * w)).^(1/3);
pACSJGRD = TC_WJO * p_ref * scaled_power_j(L, f_WJO, pars_p, l_b, l_j, l_p);
if isempty(pACSJGRD); info = 0; prdData = []; return; end
pADG     = pACSJGRD(:,[1 7 5])';   % J/d,    assimilation, dissipation, growth power
J_O      = eta_O * pADG;           % mol/d,  fluxes of organics J_X, J_V, J_E, J_P in rows
J_M      = -n_M \ n_O * J_O;       % mol/d,  fluxes of minerals J_C, J_H, J_O, J_N in rows, A, D, G in cols
EWJO     = -32e3 / 24 * J_M(3,:)'; % mgO2/h, O2 consumption

% Dry weight vs. oxygen consumption rate at 1 C
[l_j, l_p, l_b] = get_lj(pars_tj, f_WJO1);
L        = (WJO1(:,1) / d_V / (1 + f_WJO1 * w)).^(1/3);
pACSJGRD = TC_WJO1 * p_ref * scaled_power_j(L, f_WJO1, pars_p, l_b, l_j, l_p);
if isempty(pACSJGRD); info = 0; prdData = []; return; end
pADG     = pACSJGRD(:,[1 7 5])';     % J/d,    assimilation, dissipation, growth power
J_O      = eta_O * pADG;             % mol/d,  fluxes of organics J_X, J_V, J_E, J_P in rows
J_M      = -n_M \ n_O * J_O;         % mol/d,  fluxes of minerals J_C, J_H, J_O, J_N in rows, A, D, G in cols
EJO1     = -24.4e3 / 24 * J_M(3,:)'; % mLO2/h, O2 consumption
 % 3 C
[l_j, l_p, l_b] = get_lj(pars_tj, f_WJO3);
L        = (WJO3(:,1) / d_V / (1 + f_WJO3 * w)).^(1/3);
pACSJGRD = TC_WJO3 * p_ref * scaled_power_j(L, f_WJO3, pars_p, l_b, l_j, l_p);
if isempty(pACSJGRD); info = 0; prdData = []; return; end
pADG     = pACSJGRD(:,[1 7 5])';     % J/d,    assimilation, dissipation, growth power
J_O      = eta_O * pADG;             % mol/d,  fluxes of organics J_X, J_V, J_E, J_P in rows
J_M      = -n_M \ n_O * J_O;         % mol/d,  fluxes of minerals J_C, J_H, J_O, J_N in rows, A, D, G in cols
EJO3     = -24.4e3 / 24 * J_M(3,:)'; % mLO2/h, O2-consumption
 % 6 C
[l_j, l_p, l_b] = get_lj(pars_tj, f_WJO6);
L        = (WJO6(:,1) / d_V / (1 + f_WJO6 * w)).^(1/3);
pACSJGRD = TC_WJO6 * p_ref * scaled_power_j(L, f_WJO6, pars_p, l_b, l_j, l_p);
if isempty(pACSJGRD); info = 0; prdData = []; return; end
pADG     = pACSJGRD(:,[1 7 5])';     % J/d,    assimilation, dissipation, growth power
J_O      = eta_O * pADG;             % mol/d,  fluxes of organics J_X, J_V, J_E, J_P in rows
J_M      = -n_M \ n_O * J_O;         % mol/d,  fluxes of minerals J_C, J_H, J_O, J_N in rows, A, D, G in cols
EJO6     = -24.4e3 / 24 * J_M(3,:)'; % mLO2/h, O2-consumption
 % 8 C
[l_j, l_p, l_b] = get_lj(pars_tj, f_WJO8);
L        = (WJO8(:,1) / d_V / (1 + f_WJO8 * w)).^(1/3);
pACSJGRD = TC_WJO8 * p_ref * scaled_power_j(L, f_WJO8, pars_p, l_b, l_j, l_p);
if isempty(pACSJGRD); info = 0; prdData = []; return; end
pADG     = pACSJGRD(:,[1 7 5])';     % J/d,    assimilation, dissipation, growth power
J_O      = eta_O * pADG;             % mol/d,  fluxes of organics J_X, J_V, J_E, J_P in rows
J_M      = -n_M \ n_O * J_O;         % mol/d,  fluxes of minerals J_C, J_H, J_O, J_N in rows, A, D, G in cols
EJO8     = -24.4e3 / 24 * J_M(3,:)'; % mLO2/h, O2-consumption
 % 10 C
[l_j, l_p, l_b] = get_lj(pars_tj, f_WJO10);
L        = (WJO10(:,1) / d_V / (1 + f_WJO10 * w)).^(1/3);
pACSJGRD = TC_WJO10 * p_ref * scaled_power_j(L, f_WJO10, pars_p, l_b, l_j, l_p);
if isempty(pACSJGRD); info = 0; prdData = []; return; end
pADG     = pACSJGRD(:,[1 7 5])';     % J/d,    assimilation, dissipation, growth power
J_O      = eta_O * pADG;             % mol/d,  fluxes of organics J_X, J_V, J_E, J_P in rows
J_M      = -n_M \ n_O * J_O;         % mol/d,  fluxes of minerals J_C, J_H, J_O, J_N in rows, A, D, G in cols
EJO10    = -24.4e3 / 24 * J_M(3,:)'; % mLO2/h, O2-consumption
 % 19 C
[l_j, l_p, l_b] = get_lj(pars_tj, f_WJO19);
L        = (WJO19(:,1)/ d_V / (1 + f_WJO19 * w)).^(1/3);
pACSJGRD = TC_WJO19 * p_ref * scaled_power_j(L, f_WJO19, pars_p, l_b, l_j, l_p);
if isempty(pACSJGRD); info = 0; prdData = []; return; end
pADG     = pACSJGRD(:,[1 7 5])';     % J/d,    assimilation, dissipation, growth power
J_O      = eta_O * pADG;             % mol/d,  fluxes of organics J_X, J_V, J_E, J_P in rows
J_M      = -n_M \ n_O * J_O;         % mol/d,  fluxes of minerals J_C, J_H, J_O, J_N in rows, A, D, G in cols
EJO19    = -24.4e3 / 24 * J_M(3,:)'; % mLO2/h, O2-consumption

 % Temperature vs. oxygen consumption rate
[l_j, l_p, l_b] = get_lj(pars_tj, f_TJO);
L        = (Wd0 / d_V / (1 + f_TJO * w)).^(1/3);
pACSJGRD = p_ref * scaled_power_j(L, f_TJO, pars_p, l_b, l_j, l_p);
if isempty(pACSJGRD); info = 0; prdData = []; return; end
pADG     = pACSJGRD(:,[1 7 5])';                     % J/d,    assimilation, dissipation, growth power
J_O      = eta_O * pADG;                             % mol/d,  fluxes of organics J_X, J_V, J_E, J_P in rows
J_M      = -n_M \ n_O * J_O;                         % mol/d,  fluxes of minerals J_C, J_H, J_O, J_N in rows, A, D, G in cols
ETJO     = -24.4e3 / 24 * J_M(3,:)' .* TC_TJO / Wd0; % mLO2/h, O2-consumption

 % Pack to output
prdData.tL1   = EL1;
prdData.tL2   = EL2;
prdData.tL3   = EL3;
prdData.LWd   = EWd;
prdData.LN    = EN;
prdData.WJO   = EWJO;
prdData.WJO1  = EJO1;
prdData.WJO3  = EJO3;
prdData.WJO6  = EJO6;
prdData.WJO8  = EJO8;
prdData.WJO10 = EJO10;
prdData.WJO19 = EJO19;
prdData.TJO   = ETJO;

end

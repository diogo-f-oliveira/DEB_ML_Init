function [prdData, info] = predict_Rattus_norvegicus_Wistar(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
%
filterChecks =  E_Hb >= E_Hx ||...       % maturity at weaning, birth
    E_Hx >= E_Hp ||...           % maturity at weaning, puberty
    z > z_m  ||...              % males are larger than females
    kap > 0.99;                 % this makes problems in parameter estimation, because weaning is not reached; also not biologically realistic

if filterChecks
    info = 0;
    prdData = {};
    return;
end

% compute temperature correction factors
TC = tempcorr(temp.tg, T_ref, T_A);

% zero-variate data

% life cycle
pars_tx = [g k l_T v_Hb v_Hx v_Hp]; info = 1;
[tau_p, tau_x, tau_b, l_p, l_x, l_b] = get_tx(pars_tx, f);

% birth
L_b = L_m * l_b;                  % cm, structural length at birth at f
Lw_b = L_b/ del_Me;               % cm, total length at birth
Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth at f
aT_g = t_0 + tau_b/k_M/ TC;       % d, gestation time at f and T; t_0 at T_typical

% weaning
L_x = L_m * l_x;                  % cm, structural length at weaning
Lw_x = L_x/ del_M;                % cm, total length at weaning
Ww_x = L_x^3 *(1 + f * ome);      % g, wet weight at weaning
tT_x = (tau_x - tau_b)/ k_M/ TC;  % d, time since birth at weaning at f and T

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Ww_p = L_p^3 *(1 + f * ome);      % g, wet weight at puberty
tT_p = (tau_p - tau_b)/ k_M/ TC;  % d, time since birth at puberty at f and T

% ultimate
l_i = f - l_T;                    % -, scaled ultimate length
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

% males
p_Am_m = z_m * p_M/ kap;              % J/d.cm^2, {p_Am} spec assimilation flux
E_m_m = p_Am_m/ v;                    % J/cm^3, reserve capacity [E_m]
g_m = E_G/ (kap* E_m_m);              % -, energy investment ratio
m_Em_m = y_E_V * E_m_m/ E_G;          % mol/mol, reserve capacity
ome_m = m_Em_m * w_E/ w_V;            % -, contribution of reserve to weight
L_mm = v/ k_M/ g_m;                   % cm, max struct length
pars_tx = [g_m k l_T v_Hb v_Hx v_Hpm];
[tau_pm, tau_x, tau_bm, l_pm, l_x, l_bm] = get_tx(pars_tx, f);
L_bm = l_bm * L_mm;                   % cm, structural length at birth at f for males
L_pm = l_pm * L_mm;                   % cm, structural length at puberty at f for males
tT_pm = (tau_pm - tau_bm)/ k_M/ TC;   % d, time since birth at puberty at f for Baye2005 and T  --> in prev.version there is a dedicated function for this! (see end of this file)
L_im = f * L_mm;                      % cm, ultimate structural length
Ww_im = L_im^3 * (1 + f * ome_m);     % g, ultimate wet weight
p_Xm_m   = p_Am_m/ kap_X;             % J/d.cm^2, max spec feeding power

% pack to output
prdData.tp = tT_p;      % time at puberty
prdData.tp_m = tT_pm;   % time at puberty males
prdData.am = aT_m;
prdData.Li = Lw_i;
prdData.Wwp = Ww_p;
prdData.Wwi = Ww_i;
prdData.Wwi_m = Ww_im;
prdData.Ri = RT_i;

% age, length, weight at birth and weaning using the standard DEB functions
% (if you prefer the ODE results from uni-var data, you can comment these out)
prdData.tg = aT_g;
prdData.tx = tT_x;
prdData.Lb = Lw_b;
prdData.Lx = Lw_x;
prdData.Wwb = Ww_b;
prdData.Wwx = Ww_x;

%% uni-variate data

% length-weight DonaHata1911 females
EWw_fL = (LWw_f(:,1) * del_M).^3 * (1 + f_LW * ome);       % g, female wet weight

% time-length GhezCamb2012
[tau_p, tau_x, tau_b, l_p, l_x, l_b] = get_tx(pars_tx, f_tL);
L_b = L_m * l_b;  L_i = L_m * f_tL;

ir_B = 3/ k_M + 3 * f_tL * L_m/ v; rT_B = TC/ ir_B;     % d, 1/von Bert growth rate
L = L_i - (L_i - L_b) * exp( - rT_B * (tL(:,1) ));      % cm, total length at time
ELw = L / del_M;                                        %  total length

% time-weight RoeLee1995 data
[tau_p, tau_x, tau_b, l_p, l_x, l_b] = get_tx(pars_tx, f_W);
L_b = L_m * l_b;  L_i = L_m * f_W;

ir_B = 3/ k_M + 3 * f_W * L_m/ v; rT_B = TC/ ir_B;     % d, 1/von Bert growth rate
L = L_i - (L_i - L_b) * exp( - rT_B * tWw(:,1));       % cm, structural length at time
EWw_W = L.^3 * (1 + f_W * ome);                        % g, wet weight

% OECD Data
% time-weight control data FEMALES
% NEW : v 2019 06 22
% temp-correct female pars (same values for all experiments!)
pT_Am = p_Am * TC; vT = v * TC; pT_M = p_M * TC; kT_J = k_J * TC;
pT_FAm = TC * p_FAm; vT_F = TC * v_F; % foetus-specific pars
tT_0 = t_0; % t_0 is expressed at T_typical (otherwise, we would need to correct to 37C by  dividing by TC)

% OECD Data
Npups = N.tWw_C;       % number of foetuses
S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups
t_start = tWw_C(1,1);  t_mating = t_mt.tWw_C;  time_Ww = tWw_C(:,1);
tspan = linspace(t_start, time_Ww(end)+10, 1000); % integrate for longer to get tT_x while estimating
V_start = Ww0.tWw_C/(1 + f_C * ome) ;
EVH_AF_0 = [f_C * E_m * V_start, V_start, 0, f_C * E_m * 1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty %dh
options = odeset('Events', @event_bx);
upreg = 1; % upregulation of feeding observed
pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_C, t_mating, upreg]; % temp-correct and pack pars for dget_EVR_AF
[time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg);

%dh filter for parameter estimation procedure
if length(te)<2
    info = 0;
    prdData = {};
    return;
end

%   if length(te)>1   % weaning might not happen in that timespan with certain parameters; then te will have only age at birth and next line is skipped
% birth
aT_g(1) = te(1)- t_mating;         % d, gestation time at f and T
% weaning
tT_x(1) = te(2)- te(1);            % d, time since birth at weaning at f and T, and Npups
%   else
%    aT_g(1) = prdData.tg;
%    tT_x(1) = prdData.tx;
%    fprintf('would be error, OECD ; kappa = %0.4f \n', par.kap)
%   end

% univariate
% time-weight
EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
EWw_foetpup = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
EWw = EWw_mother + (time < t_mating + aT_g(1)).* EWw_foetpup * Npups; % g, mother plus foetus, while gestation
EWw_C = interp1(time, EWw, time_Ww, 'spline'); % g, wet weight of mother plus foetus, interpolated at time_Ww

% time-weight control data
Npups = N.tWw_C41;       % number of foetuses
S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups
t_start = tWw_C41(1,1);  t_mating = t_mt.tWw_C41;  time_Ww = tWw_C41(:,1);  % <-- same for all females in this batch; assumed mating time!
tspan = linspace(t_start, time_Ww(end)+10, 1000); % integrate for longer to get tT_x while estimating

% FEMALE NO 41
V_start = Ww0.tWw_C41/(1 + f_C41 * ome) ;
%EVH_AF_0 = [f_C41 * E_m * V_start, V_start, 0, 0, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty
EVH_AF_0 = [f_C41 * E_m * V_start, V_start, 0, f_C41 * E_m * 1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty
options = odeset('Events', @event_bx);
pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_C41, t_mating]; % temp-correct and pack pars for dget_EVR_AF
[time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg);

%dh filter for parameter estimation procedure
if length(te)<2
    info = 0;
    prdData = {};
    return;
end

% univariate
% time-weight
EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
EWw_foetpup = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
EWw = EWw_mother + (time < t_mating + aT_g(1)).* EWw_foetpup * Npups; % g, mother plus foetus, while gestation (assume same gestation as before)
EWw_C41 = interp1(time, EWw, time_Ww, 'spline'); % g, wet weight of mother plus foetus, interpolated at time_Ww

% time-weight control data FEMALE NO 44
Npups = N.tWw_C44;       % number of foetuses
S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups

V_start = Ww0.tWw_C44/(1 + f_C44 * ome) ;
%EVH_AF_0 = [f_C44 * E_m * V_start, V_start, 0, 0, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty
EVH_AF_0 = [f_C44 * E_m * V_start, V_start, 0, f_C44 * E_m * 1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty
options = odeset('Events', @event_bx);
pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_C44, t_mating]; % temp-correct and pack pars for dget_EVR_AF

%'female 44'

[time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg);
%dh filter for parameter estimation procedure
if length(te)<2
    info = 0;
    prdData = {};
    return;
end

% univariate
% time-weight
EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
EWw_foetpup = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
EWw = EWw_mother + (time < t_mating + aT_g(1)).* EWw_foetpup * Npups; % g, mother plus foetus, while gestation (assume same gestation as before)
EWw_C44 = interp1(time, EWw, time_Ww, 'spline'); % g, wet weight of mother plus foetus, interpolated at time_Ww

% time-weight control data FEMALE NO 46
Npups = N.tWw_C46;       % number of foetuses
S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups

%'female 46'

V_start = Ww0.tWw_C46/(1 + f_C46 * ome) ;
EVH_AF_0 = [f_C46 * E_m * V_start, V_start, 0, f_C46 * E_m *1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty %dh
options = odeset('Events', @event_bx);
pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_C46, t_mating]; % temp-correct and pack pars for dget_EVR_AF
[time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg);

%dh filter for parameter estimation procedure
if length(te)<2
    info = 0;
    prdData = {};
    return;
end

% univariate
% time-weight
EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
EWw_foetpup = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
EWw = EWw_mother + (time < t_mating + aT_g(1)).* EWw_foetpup * Npups; % g, mother plus foetus, while gestation (assume same gestation as before)
EWw_C46 = interp1(time, EWw, time_Ww, 'spline'); % g, wet weight of mother plus foetus, interpolated at time_Ww

% time-weight control data FEMALE NO 47
Npups = N.tWw_C47;       % number of foetuses
S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups

%'female 47'

V_start = Ww0.tWw_C47/(1 + f_C47 * ome) ;
%EVH_AF_0 = [f_C47 * E_m * V_start, V_start, 0, 0, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty
EVH_AF_0 = [f_C47 * E_m * V_start, V_start, 0, f_C47 * E_m *1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty  % dh
options = odeset('Events', @event_bx);
pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_C47, t_mating]; % temp-correct and pack pars for dget_EVR_AF
[time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg);

%dh filter for parameter estimation procedure
if length(te)<2
    info = 0;
    prdData = {};
    return;
end

% univariate
% time-weight
EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
EWw_foetpup = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
EWw = EWw_mother + (time < t_mating + aT_g(1)).* EWw_foetpup * Npups; % g, mother plus foetus, while gestation (assume same gestation as before)
EWw_C47 = interp1(time, EWw, time_Ww, 'spline'); % g, wet weight of mother plus foetus, interpolated at time_Ww

% time-weight control data FEMALE NO 49
Npups = N.tWw_C49;       % number of foetuses
S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups

%'female 49'

V_start = Ww0.tWw_C49/(1 + f_C49 * ome) ;
%EVH_AF_0 = [f_C49 * E_m * V_start, V_start, 0, 0, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty
EVH_AF_0 = [f_C49 * E_m * V_start, V_start, 0, f_C49 * E_m *1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty % dh
options = odeset('Events', @event_bx);
pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_C49, t_mating]; % temp-correct and pack pars for dget_EVR_AF
[time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg);

%dh filter for parameter estimation procedure
if length(te)<2
    info = 0;
    prdData = {};
    return;
end

% univariate
% time-weight
EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
EWw_foetpup = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
EWw = EWw_mother + (time < t_mating + aT_g(1)).* EWw_foetpup * Npups; % g, mother plus foetus, while gestation (assume same gestation as before)
EWw_C49 = interp1(time, EWw, time_Ww, 'spline'); % g, wet weight of mother plus foetus, interpolated at time_Ww

% time-weight control data FEMALE Baye2005 study
[tau_p, tau_x, tau_b, l_p, l_x, l_b] = get_tx(pars_tx, f_05study);
L_b = L_m * l_b;  L_i = L_m * f_05study;

ir_B = 3/ k_M + 3 * f_05study * L_m/ v; rT_B = TC/ ir_B;     % d, 1/von Bert growth rate
L = L_i - (L_i - L_b) * exp( - rT_B * tWw_05study_f(:,1));      % cm, structural length at time
EWw_study_f = L.^3 * (1 + f_05study * ome);               % g, wet weight

% time-weight control data FEMALE NO 50
Npups = N.tWw_C50;       % number of foetuses
S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups

%'female 50'

V_start = Ww0.tWw_C50/(1 + f_C50 * ome) ;
EVH_AF_0 = [f_C50 * E_m * V_start, V_start, 0, f_C50 * E_m *1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty
options = odeset('Events', @event_bx);
pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_C50, t_mating]; % temp-correct and pack pars for dget_EVR_AF
[time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg);

%dh filter for parameter estimation procedure
if length(te)<2
    info = 0;
    prdData = {};
    return;
end

% univariate
% time-weight
EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
EWw_foetpup = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
EWw = EWw_mother + (time < t_mating + aT_g(1)).* EWw_foetpup * Npups; % g, mother plus foetus, while gestation (assume same gestation as before)
EWw_C50 = interp1(time, EWw, time_Ww, 'spline'); % g, wet weight of mother plus foetus, interpolated at time_Ww

%% ---------------------------------------------------------------------------------------------------------
%      MALES
% ----------------------------------------------------------------------------------------------------------
% time-weight data MALE controls in Baye2005 study -> from entry version 2018/06/18
pars_lb = [g_m; k; v_Hb];
f1 =f;
f2 =f_05study;
L_bm = get_lb(pars_lb, f1) * L_mm;
time = [tWw_05study_m(:,1)]; step=1;
[t eLH] = ode45(@dget_eL2, time , [1; L_bm; E_Hb ; 0], [], v * TC/step, g_m, L_mm, f, f1, f2, kap, k_J* TC/step, E_Hpm, E_m_m);
EWw_study_m = eLH(:,2).^3 .* (1 + eLH(:,1) * ome);

%% NEW : v 2019 06 22
% time-weight control data MALES Baye2004
pT_Am_m = p_Am_m * TC; vT = v * TC; pT_M = p_M * TC; kT_J = k_J * TC;
pars_EVR = [pT_Am_m, vT, pT_M, kT_J, E_Hpm, E_G, kap]; % temp-correct and pack pars for dget_EVR
pT_Xm = TC * p_Xm_m ;

%males study 2598
time_Ww = tWw_m2598(:,1); % <-- same for all males in that batch; we assume they are adults at start of exp.
time_JX = tJX_m2598(:,1);
V_start = Ww0.tWw_m2598/(1 + f_m2598 * ome);
EVR_0 = [f_m2598 * E_m_m * V_start, V_start, 0]; % initial conditions [E, V, E_R], assume res reserve density of e=f
[t, EVR] = ode23s(@dget_EVR, time_Ww, EVR_0,[], pars_EVR, f_m2598);
% time-wet weight
EWw_m2598 = EVR(:, 2)  + (EVR(:,1)+ EVR(:,3))* w_E/d_V/mu_E;    % g, wet weight at time
% weight-ingestion rate
L2_adj = interp1(t, EVR(:,2).^(2/3), time_JX, 'spline');        % to go from timesteps in t_Ww to timesteps in t_JX, L2 is squared struct area
EJX_m2598 = (pT_Xm * w_X/ mu_X/ d_X) * f_m2598 * L2_adj ;       % g/d, wet weight of food

% males study 0392
time_Ww = tWw_m0392(:,1);
time_JX = tJX_m0392(:,1);
V_start = Ww0.tWw_m0392/(1 + f_m0392 * ome);
EVR_0 = [f_m0392 * E_m_m * V_start, V_start, 0]; % initial conditions [E, V, E_R], assume res reserve density of e=f
[t, EVR] = ode23s(@dget_EVR, time_Ww, EVR_0,[], pars_EVR, f_m0392);
% time-wet weight
EWw_m0392 = EVR(:, 2)  + (EVR(:,1)+ EVR(:,3))* w_E/d_V/mu_E;    % g, wet weight at time
% weight-ingestion rate
L2_adj = interp1(t, EVR(:,2).^(2/3), time_JX, 'spline'); % to go from timesteps in t_Ww to timesteps in t_JX, L2 is squared struct area
EJX = (pT_Xm * w_X/ mu_X/ d_X) * f_m0392 * L2_adj ;      % g/d, wet weight of food
EJX_m0392 = EJX ;

%% ------------------------------------------------
%       NON-PREGNANT  FEMALES
% --------------------------------------------------
% time-weight control data *non-pregnant* FEMALE Baye2005
Npups = 0; % number of foetus = 0, for non pregnant females
S_eff = 0; % effective placenta surface area coefficient = 0, for non pregnant females

%'study  2598-F0'

% study  2598-F0
time_Ww = tWw_f_np2598(:,1);
time_JX = tJX_f_np2598(:,1);
V_start = Ww0.tWw_f_np2598/(1 + f_f2598 * ome) ;
EVH_AF_0 = [f_f2598 * E_m * V_start, V_start, 0, 0, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty
% dh: do not change initial reserve because females are not pregnant

t_start = tWw_f_np2598(1,1);  % <-- same for all females in that batch
t_mating = t_mt.tWw_f_np2598;      % <-- same for all females in that batch
tspan = linspace(t_start, time_Ww(end), 1000); %  normal feeding up to 0.6 * BEFORE mating!
options = odeset('Events', @event_bx);
pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_f2598, t_mating]; % temp-correct and pack pars for dget_EVR_AF
[time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg); % solve with Npups=0 & S_efff=0


% time-wet weight
EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;    % g, mother without foetus, expected wet weight at time
EWw_f_np2598 = interp1(time, EWw_mother, time_Ww, 'spline');
% feeding
pT_Xm = TC * p_Xm ;
L2_mother = EVH_AF(:,2).^(2/3);
L2_mother_adj = interp1(time, L2_mother, time_JX, 'spline'); % to go from timesteps in t_Ww to timesteps in t_JX
EJX_f_np2598 = (pT_Xm * w_X/ mu_X/ d_X) * f_f2598 * L2_mother_adj; % g/d, wet weight of food

%'2598-F1'

% study  2598-F1
time_Ww = tWw_f1_np2598(:,1);
time_JX = tJX_f1_np2598(:,1);
V_start = Ww0.tWw_f1_np2598/(1 + f_f2598 * ome) ;
EVH_AF_0 = [f_f2598 * E_m * V_start, V_start, 0, 0, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty

t_start = tWw_f1_np2598(1,1);  % <-- same for all females in that batch
t_mating = t_mt.tWw_f1_np2598;      % <-- same for all females in that batch
tspan = linspace(t_start, time_Ww(end), 1000); %  normal feeding up to 0.6 * BEFORE mating!
options = odeset('Events', @event_bx);
pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_f2598, t_mating]; % temp-correct and pack pars for dget_EVR_AF
[time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg); % solve with Npups=0 & S_efff=0


%   [time, AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, f_fem_np2598, t_mating, Npups); % solve
% time-wet weight
EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;     % g, mother without foetus, expected wet weight at time
EWw_f1_np2598 = interp1(time, EWw_mother, time_Ww, 'spline'); % g, wet weight of mother plus foetus, interpolated at time_Ww
% feeding
L2_mother = EVH_AF(:,2).^(2/3);
L2_mother_adj = interp1(time, L2_mother, time_JX, 'spline'); % checked -- this is the same curve as when solving the ode for time_JX !
EJX_f1_np2598 = (pT_Xm * w_X/ mu_X/ d_X) * f_f2598 * L2_mother_adj; % g/d, wet weight of food

%% ---------------------------------------------------------------------------------------------------------
%      PREGNANT FEMALES and pups
% ----------------------------------------------------------------------------------------------------------
% pregnant females, study 2598, f0

Npups = N.tWw_f0_2598;       % number of foetuses
S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups

%'females study 2598'

t_start = tWw_f0_2598(1,1);  % <-- same for all females in that batch
t_mating = t_mt.tWw_f0_2598; % <-- same for all females in that batch
time_Ww = tWw_f0_2598(:,1);  % <-- same for all females in that batch; we assume they are adult at start of exp
time_JX = tJX_f0_2598(:,1);  % <-- same for all females in that batch
tspan = linspace(t_start, time_Ww(end)+10, 1000); % integrate for longer to get tT_x while estimating
V_start = Ww0.tWw_f0_2598/(1 + f_f2598 * ome) ;
%EVH_AF_0 = [f_f2598 * E_m * V_start, V_start, 0, 0, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F],assume res reserve density of e=f, and repro buffer empty
EVH_AF_0 = [f_f2598 * E_m * V_start, V_start, 0, f_f2598 * E_m*1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F],assume res reserve density of e=f, and repro buffer empty
options = odeset('Events', @event_bx);
pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_f2598 t_mating]; % temp-correct and pack pars for dget_EVR_AF
[time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg); % solve with Npups=0 & S_efff=0

%dh filter for parameter estimation procedure
if length(te)<2
    info = 0;
    prdData = {};
    return;
end

%   if length(te)>1
% birth
aT_g(1) = te(1)- t_mating;         % d, gestation time at f and T
% weaning
tT_x(1) = te(2)- te(1);            % d, time since birth at weaning at f and T, and Npups
% --> if zero-var data are used from standard model (see above in zero-var data section), these can be commented out -->
ELw_b(1) = ye(1,5)^(1/3)/del_Me;   % cm, foetus, expected length at birth
EWw_b(1) = ye(1,5) + ye(1,4)* w_E/d_V/mu_E;    % g, foetus, expected wet weight at birth
ELw_x(1) = ye(2,5)^(1/3)/del_M;                % cm, foetus, expected length at weaning
EWw_x(1) = ye(2,5) + ye(2,4)* w_E/d_V/mu_E;    % g, foetus, expected wet weight at weaning
% <--- comment out until here

% univariate
% time-weight
EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
EWw_foetpup = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
EWw = EWw_mother + (time < t_mating + aT_g(1)).* EWw_foetpup * Npups; % g, mother plus foetus, while gestation
EWw_f0_2598 = interp1(time, EWw, time_Ww, 'spline'); % g, wet weight of mother plus foetus, interpolated at time_Ww

% --> if a classical demand growth equation is used, these can be commented out -->
index_foetpup = find(time >= t_mating & time < t_mating + aT_g(1) +tT_x(1)); % iindices for gestation & lactation period
t_aux2 = time(index_foetpup); t_fp = t_aux2 - t_aux2(1); % extract time and start at 0
Ww_foetpup = EWw_foetpup(index_foetpup);
Lw_foetpup = EVH_AF(index_foetpup,5).^(1/3)/del_Me;
EWw_e(:, 1) = interp1(t_fp, Ww_foetpup, max(0, tWwe(:,1) ),'spline' ); % g, wet weight Angu1932
EWd_e(:, 1) = interp1(t_fp, d_V*Ww_foetpup, max(0, tWde(:,1) ),'spline' ); % g, wet weight Angu1932
ELw_e1(:,1) = interp1(t_fp, Lw_foetpup, max(0, tLe1(:,1) ),'spline' ); % cm, length Angu1932
ELw_e2(:,1) = interp1(t_fp, Lw_foetpup, max(0, tLe2(:,1) ),'spline' ); % cm, length NaraFox1971
% <--- comment out until here, and use instead:
% % foetal development: fast
%   vT = TC * v;
%   EWw_e = (1 + f_Wwe * w) * (vT * max(0, tWwe(:,1) - tT_0)/ 3) .^ 3; % wet weight Angu1932
%   EWd_e = d_V * (1 + f_Wwe * w) * (vT * max(0, tWde(:,1) - tT_0)/ 3) .^ 3; % dry weight Angu1932
%   ELw_e = vT * max(0, tLe1(:,1) - tT_0)/ 3/ del_Me;  % length Angu1932
%   ELw_e2 = vT * max(0, tLe2(:,1) - tT_0)/ 3/ del_Me;  % length NaraFox1971

% feeding (mothers)
L2_mother = EVH_AF(:,2).^(2/3); L2_foetus = EVH_AF(:,5).^(2/3);
L2_mother_adj = interp1(time, L2_mother, time_JX, 'spline');
L2_foetus_adj = interp1(time, L2_foetus, time_JX, 'spline');
upreg_period = (time_JX > t_mating & time_JX < t_mating + aT_g(1) + tT_x(1));
EJX_f0_2598 = (pT_Xm * w_X/ mu_X/ d_X) * f_f2598 * (L2_mother_adj + upreg_period * Npups * S_eff .* L2_foetus_adj) ; % g/d, wet weight of food

% t-Ww of pups
time_pup = tWw_F0p_2598(:,1);
index_pup =find((time >= t_mating + aT_g(1)) & (time < t_mating + aT_g(1) + tT_x(1) + 10)); % indices for lactation period + 10 just to get a wider time span
t_aux = time(index_pup); t_pup = t_aux-t_aux(1); % extract time and start at 0
Ww_pup = EWw_foetpup(index_pup);
EWw_F0p_2598 = interp1(t_pup, Ww_pup, time_pup,'spline' ); % g, pups growth for that litter size

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%dh Elli1980 fasting for pregnant females, based on study 2598, f0
% this study contains very short fasting intervals

Npups = N.tWw_f0_fast;       % dh number of foetuses, use those of the Elli1980 study 
S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups

%dh initialize percent weight loss output structure 
tWw_f0_fast_perc = [ [0.25 ; 0.5; 1; 1.5] , NaN(4,1) ] ; % duration of fasting [d] , percent weight loss [%]

for i = 1:size(tWw_f0_fast_perc , 1) % dh go over different fasting durations
    t_start = tWw_f0_2598(1,1);  % <-- same for all females in that batch
    t_mating = t_mt.tWw_f0_2598; % <-- same for all females in that batch
    time_Ww = tWw_f0_2598(:,1);  % <-- same for all females in that batch; we assume they are adult at start of exp
    time_JX = tJX_f0_2598(:,1);  % <-- same for all females in that batch
    tspan = linspace(t_start, time_Ww(end)+10, 1000); % integrate for longer to get tT_x while estimating
    fast_dur = tWw_f0_fast_perc(i,1) ; % dh duration of fasting [d]
    
    fast_start = t_0 + t_mating ; % time at which fasting starts [d]
    
    f_fast = 0; % dh: no food available during fasting
    % dh include timepoints at which fasting starts and ends into span:
    tspan = [ tspan( tspan < fast_start) , ...
        fast_start , ...
        tspan( (tspan > fast_start) & (tspan < fast_start + fast_dur) ) , ...
        fast_start + fast_dur , ...
        tspan( tspan > fast_start + fast_dur ) ...
        ] ;
    V_start = Ww0.tWw_f0_2598/(1 + f_f2598 * ome) ;
    EVH_AF_0 = [f_f2598 * E_m * V_start, V_start, 0, f_f2598 * E_m*1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F],assume res reserve density of e=f, and repro buffer empty
    options = odeset('Events', @event_bx );
    pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_elli_ctrl, t_mating]; % temp-correct and pack pars for dget_EVR_AF
    [time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg , fast_dur, fast_start, f_fast ); % solve with Npups=0 & S_efff=0

    %dh filter for parameter estimation procedure
    if length(te)<2
        info = 0;
        prdData = {};
        return;
    end

    %   if length(te)>1
    % birth
    aT_g(1) = te(1)- t_mating;         % d, gestation time at f and T
    % weaning
    tT_x(1) = te(2)- te(1);            % d, time since birth at weaning at f and T, and Npups
    % --> if zero-var data are used from standard model (see above in zero-var data section), these can be commented out -->
    ELw_b(1) = ye(1,5)^(1/3)/del_Me;   % cm, foetus, expected length at birth
    EWw_b(1) = ye(1,5) + ye(1,4)* w_E/d_V/mu_E;    % g, foetus, expected wet weight at birth
    ELw_x(1) = ye(2,5)^(1/3)/del_M;                % cm, foetus, expected length at weaning
    EWw_x(1) = ye(2,5) + ye(2,4)* w_E/d_V/mu_E;    % g, foetus, expected wet weight at weaning
    % <--- comment out until here

    % univariate
    % time-weight
    EWw_mother_fast = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
    EWw_foetpup_fast = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
    EWw_fast = EWw_mother_fast + (time < t_mating + aT_g(1)).* EWw_foetpup_fast * Npups; % g, mother plus foetus, while gestation
    
    % dh calculate predicted weight loss in percent
    perc_loss = 100 * (EWw_fast( time == fast_start) - EWw_fast( time == fast_start + fast_dur) ) / EWw_fast( time == fast_start);
    tWw_f0_fast_perc(i,2) = perc_loss ; % duration of fasting[d] and parental weight loss in [%]
    
        % --> if a classical demand growth equation is used, these can be commented out -->
    index_foetpup_fast = find(time >= t_mating & time < t_mating + aT_g(1) +tT_x(1)); % iindices for gestation & lactation period
    t_aux2 = time(index_foetpup_fast); t_fp = t_aux2 - t_aux2(1); % extract time and start at 0
    Ww_foetpup_fast = EWw_foetpup_fast(index_foetpup_fast);
    Lw_foetpup_fast = EVH_AF(index_foetpup_fast,5).^(1/3)/del_Me;
    EWw_e_fast(:, 1) = interp1(t_fp, Ww_foetpup_fast, max(0, tWwe(:,1) ),'spline' ); % g, wet weight Angu1932
    EWd_e_fast(:, 1) = interp1(t_fp, d_V*Ww_foetpup_fast, max(0, tWde(:,1) ),'spline' ); % g, wet weight Angu1932
    ELw_e1_fast(:,1) = interp1(t_fp, Lw_foetpup_fast, max(0, tLe1(:,1) ),'spline' ); % cm, length Angu1932
    ELw_e2_fast(:,1) = interp1(t_fp, Lw_foetpup_fast, max(0, tLe2(:,1) ),'spline' ); % cm, length NaraFox1971        
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%dh embryos of fasting for pregnant females, predict Elli1980 based on study 2598

% "Pregnant rats were fasted for 36, 24, 12, 6 or 0 h before 10.5 days, and 
% were then given food ad libitum until they were killed at 15.5 days
% (14:00 h)"

%'Elli1980 f1'

Npups = N.tLe_f1_fast;       % dh number of foetuses
S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups

%'embryos of fasting females study 2598'

%dh init percent weight loss output structure (need to hard-code the durations)
tLe_f1_fast_res = [ tLe_f1_fast(:,1) , NaN(5,1) ] ; % duration of fasting [d] , percent weight loss [%]

for i = 1:size(tLe_f1_fast_res , 1) % dh go over different fasting durations
    t_start = tWw_f0_2598(1,1);  % <-- same for all females in that batch
    t_mating = t_mt.tWw_f0_2598; % <-- same for all females in that batch
    time_Ww = tWw_f0_2598(:,1);  % <-- same for all females in that batch; we assume they are adult at start of exp
    time_JX = tJX_f0_2598(:,1);  % <-- same for all females in that batch
    tspan = linspace(t_start, time_Ww(end)+10, 1000); % integrate for longer to get tT_x while estimating
    fast_dur = tLe_f1_fast_res(i,1) ; % dh duration of fasting [d]
    
    fast_start = t_mating  + 15.5 - fast_dur ; % time at which fasting starts [d]
    fast_end = t_mating + 15.5; % also end of the experiment
    
    f_fast = 0 ; %dh: no food available during fasting
    % dh include timepoints at which fasting starts and ends into span:
    if fast_dur > 0
        tspan = [ tspan( tspan < fast_start) , ...
            fast_start , ...
            tspan( (tspan > fast_start) & (tspan < fast_end) ) , ...
            fast_end , ...
            tspan( tspan > fast_end ) ...
            ] ;
    else % handle control case
        tspan = [ tspan( tspan < fast_start) , ...
            fast_start , ...          
            tspan( tspan > fast_end ) ...
            ] ;
    end
    V_start = Ww0.tWw_f0_2598/(1 + f_f2598 * ome) ;  
    EVH_AF_0 = [f_f2598 * E_m * V_start, V_start, 0, f_f2598 * E_m*1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F],assume res reserve density of e=f, and repro buffer empty
    options = odeset('Events', @event_bx );
    pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_elli_ctrl , t_mating]; % temp-correct and pack pars for dget_EVR_AF
    [time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg , fast_dur, fast_start, f_fast); % solve with Npups=0 & S_efff=0

    %dh filter for parameter estimation procedure
    if length(te)<2
        info = 0;
        prdData = {};
        return;
    end
    
    % birth
    aT_g(1) = te(1)- t_mating;         % d, gestation time at f and T
    % weaning
    tT_x(1) = te(2)- te(1);            % d, time since birth at weaning at f and T, and Npups
    % --> if zero-var data are used from standard model (see above in zero-var data section), these can be commented out -->
    ELw_b(1) = ye(1,5)^(1/3)/del_Me;   % cm, foetus, expected length at birth
    EWw_b(1) = ye(1,5) + ye(1,4)* w_E/d_V/mu_E;    % g, foetus, expected wet weight at birth
    ELw_x(1) = ye(2,5)^(1/3)/del_M;                % cm, foetus, expected length at weaning
    EWw_x(1) = ye(2,5) + ye(2,4)* w_E/d_V/mu_E;    % g, foetus, expected wet weight at weaning
    % <--- comment out until here

    % univariate
    % time-weight
    EWw_mother_fast = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
    EWw_foetpup_fast = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
    EWw_fast = EWw_mother_fast + (time < t_mating + aT_g(1)).* EWw_foetpup_fast * Npups; % g, mother plus foetus, while gestation
    
    tLe_f1_fast_res(i,2) = EVH_AF(time == fast_end,5).^(1/3)/del_Me; 
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%dh 50% fasting for pregnant females, predict Zhang 2010 based on study 2598, f0

% use same (baseline) f for ctrl and FR50 treatment

S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups

%'fasting females Zhang 2010'


% set fasting duration to 60d, study fasted until end of lactation (=35d), but
% this can be longer in the model
tWw_f0_zhang_perc = [ [0 ; 60] ,[1 ; 0.5], [N.tWw_f0_zhang_ctrl;N.tWw_f0_zhang_FR50]  ] ; % duration of fasting [d] , fraction of control food received [-],  number of pups [#]

% defining output structure

tWw_f0_zhang_pred  = [ tWw_f0_zhang_ctrl(:,1) , NaN(size(tWw_f0_zhang_ctrl,1),1) ,NaN(size(tWw_f0_zhang_ctrl,1),1) ];
tWwE_f1_zhang_pred = [ tWwE_f1_zhang_ctrl(:,1) , NaN(size(tWwE_f1_zhang_ctrl,1),1) ,NaN(size(tWwE_f1_zhang_ctrl,1),1) ];

for i = 1:size(tWw_f0_zhang_perc , 1) % dh go over different fasting durations
    t_start = 14*7 +4.5 ;  % 14 weeks old and 4-5 days of mating 
    t_mating = t_start; % 
    time_Ww = [tWw_f0_zhang_ctrl(:,1) ; tWw_f0_zhang_ctrl(4,1)+tWwE_f1_zhang_ctrl(:,1) ];  % <-- same for all females in that batch; we assume they are adult at start of exp    
    tspan = linspace(t_start, t_start+time_Ww(end)+30, 1000); % integrate for longer to get tT_x while estimating    
    fast_dur = tWw_f0_zhang_perc(i,1) ; % dh duration of fasting [d]
    
    fast_start = t_mating + 7 ; % time at which fasting starts [d]
    fast_end = fast_start + fast_dur;    
    Npups = tWw_f0_zhang_perc(i,3); %dh use Npups specific per treatment
    f_zhan = f_zhan_ctrl; %dh f per treatment
    
    % dh include timepoints at which fasting starts and ends into span:
    if fast_dur > 0
        tspan = [ tspan( tspan < fast_start) , ...
            fast_start , ...
            tspan( (tspan > fast_start) & (tspan < fast_end) ) , ...
            fast_end , ...
            tspan( tspan > fast_end ) ...
            ] ;
        V_start = Ww0.tWw_f0_zhang_FR50/(1 + f_zhan * ome) ; 
    else % handle control case
        tspan = [ tspan( tspan < fast_start) , ...
            fast_start , ...          
            tspan( tspan > fast_end ) ...
            ] ;
        V_start = Ww0.tWw_f0_zhang_ctrl/(1 + f_zhan * ome) ; 
    end
    
    EVH_AF_0 = [f_zhan * E_m * V_start, V_start, 0, f_zhan * E_m*1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F],assume res reserve density of e=f, and repro buffer empty
    options = odeset('Events', @event_bx , 'RelTol',1e-4,'AbsTol',1e-6 );
    pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_zhan , t_mating]; % temp-correct and pack pars for dget_EVR_AF
    [time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg , fast_dur, fast_start , f_zhan_FR50); % solve with Npups=0 & S_efff=0

    %dh filter for parameter estimation procedure
    if length(te)<2
        'te shorter than 2'
        info = 0;
        prdData = {};
        return;
    end

    %   if length(te)>1
    % birth
    aT_g(1) = te(1)- t_mating;         % d, gestation time at f and T
    % weaning
    tT_x(1) = te(2)- te(1);            % d, time since birth at weaning at f and T, and Npups
    % --> if zero-var data are used from standard model (see above in zero-var data section), these can be commented out -->
    ELw_b(1) = ye(1,5)^(1/3)/del_Me;   % cm, foetus, expected length at birth
    EWw_b(1) = ye(1,5) + ye(1,4)* w_E/d_V/mu_E;    % g, foetus, expected wet weight at birth
    ELw_x(1) = ye(2,5)^(1/3)/del_M;                % cm, foetus, expected length at weaning
    EWw_x(1) = ye(2,5) + ye(2,4)* w_E/d_V/mu_E;    % g, foetus, expected wet weight at weaning
    % <--- comment out until here

    % univariate
    % time-weight
    EWw_mother_zhan = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
    EWw_foetpup_zhan = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
    EWw_zhan = EWw_mother_zhan + (time < t_mating + aT_g(1)).* EWw_foetpup_zhan * Npups; % g, mother plus foetus, while gestation
    
    %write mother weights to output structure:
    tWw_f0_zhang_pred(:,i+1)= interp1(time, EWw_zhan, tWw_f0_zhang_pred(:,1) + t_start, 'spline' );
    % write fetus and pup output
    tWwE_f1_zhang_pred(:,i+1)= interp1(time, EWw_foetpup_zhan, tWwE_f1_zhang_pred(:,1) + te(1)-1, 'spline' );
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%dh 30% fasting for pregnant females, predict Woodall 1999 , f0

%'fasting females Woodall 1996'

S_eff = del_upreg./(K_del + N.tWw_f0_wood_ctrl); % effective placenta surface area coefficient, decreases with Npups, dh note that Npups is the same for both treatments in this study

% set fasting duration 
tWw_f0_wood_perc = [ [0 ; 25.9] ,[1 ; 0.3], [N.tWw_f0_wood_ctrl;N.tWw_f0_wood_ctrl]  ] ; % duration of fasting [d] , fraction of control food received [-]

% cont here by defining output structure

%tWw_f0_wood_pred  = [ tWw_f0_wood_ctrl(:,1) , NaN(size(tWw_f0_wood_ctrl,1),1) ,NaN(size(tWw_f0_wood_ctrl,1),1) ];
tWw_f1_wood_f_pred = [ tWw_f1_wood_f_ctrl(:,1) , NaN(size(tWw_f1_wood_f_ctrl,1),1) ,NaN(size(tWw_f1_wood_f_ctrl,1),1) ];

for i = 1:size(tWw_f0_wood_perc , 1) % dh go over different fasting durations
    t_start = 85 ;  % (age range 70-100 d)
    t_mating = t_start; % 
    time_Ww = [tWw_f0_wood_ctrl(1,1)+t_start ; tWw_f1_wood_f_ctrl(:,1)+ t_start + tWw_f0_wood_ctrl(2,1) ];  
    tspan = linspace(t_start, time_Ww(end)+30, 1000); % integrate for longer to get tT_x while estimating    
    fast_dur = tWw_f0_wood_perc(i,1) ; % dh duration of fasting [d]
    
    fast_start = t_mating ; % time at which fasting starts [d]
    fast_end = fast_start + fast_dur;
    Npups = tWw_f0_wood_perc(i,3); %dh use Npups specific per treatment    
    f_wood = f_wood_ctrl;
    fast_f_wood = f_wood_30perc; %dh, one f 
    
    % dh include timepoints at which fasting starts and ends into span:
    if fast_dur > 0
        tspan = [ tspan( tspan < fast_start) , ...
            fast_start , ...
            tspan( (tspan > fast_start) & (tspan < fast_end) ) , ...
            fast_end , ...
            tspan( tspan > fast_end ) ...
            ] ;
        V_start = Ww0.tWw_f0_wood_30perc/(1 + f_wood * ome) ; 
    else % handle control case
        tspan = [ tspan( tspan < fast_start) , ...
            fast_start , ...          
            tspan( tspan > fast_end ) ...
            ] ;
        V_start = Ww0.tWw_f0_wood_ctrl/(1 + f_wood * ome) ; 
    end
    
        EVH_AF_0 = [f_wood * E_m * V_start, V_start, 0, f_wood * E_m*1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F],assume res reserve density of e=f, and repro buffer empty
    options = odeset('Events', @event_bx );
    pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_wood , t_mating]; % temp-correct and pack pars for dget_EVR_AF
    [time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg , fast_dur, fast_start , fast_f_wood ); % solve with Npups=0 & S_efff=0

    %dh filter for parameter estimation procedure
    if length(te)<2
        'te shorter than 2'
        info = 0;
        prdData = {};
        return;
    end

    %   if length(te)>1
    % birth
    aT_g(1) = te(1)- t_mating;         % d, gestation time at f and T
    % weaning
    tT_x(1) = te(2)- te(1);            % d, time since birth at weaning at f and T, and Npups
    % --> if zero-var data are used from standard model (see above in zero-var data section), these can be commented out -->
    ELw_b(1) = ye(1,5)^(1/3)/del_Me;   % cm, foetus, expected length at birth
    EWw_b(1) = ye(1,5) + ye(1,4)* w_E/d_V/mu_E;    % g, foetus, expected wet weight at birth
    ELw_x(1) = ye(2,5)^(1/3)/del_M;                % cm, foetus, expected length at weaning
    EWw_x(1) = ye(2,5) + ye(2,4)* w_E/d_V/mu_E;    % g, foetus, expected wet weight at weaning
    % <--- comment out until here

    % univariate
    % time-weight
    EWw_mother_wood = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
    EWw_foetpup_wood = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time
    EWw_wood = EWw_mother_wood + (time < t_mating + aT_g(1)).* EWw_foetpup_wood * Npups; % g, mother plus foetus, while gestation
    
    %write mother weights to output structure:
    if i==1 % dh need to distinguish because treatments have different length for F0 data
        tWw_f0_wood_pred_ctrl = interp1(time, EWw_wood, tWw_f0_wood_ctrl(:,1) + t_start, 'spline' );
        birthweight_ctrl = interp1(time, EWw_foetpup_wood, te(1), 'spline' );        
    else
        tWw_f0_wood_pred_30perc = interp1(time, EWw_wood, tWw_f0_wood_30perc(:,1) + t_start, 'spline' );
        birthweight_30_perc = interp1(time, EWw_foetpup_wood, te(1), 'spline' );        
    end
        
    % write fetus and pup output
    
    tWw_f1_wood_f_pred(:,i+1) = interp1(time, EWw_foetpup_wood, tWw_f1_wood_f_pred(:,1) + te(1)-1, 'spline' );
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------ pregnant females, study 0392  --------------

  Npups = N.tWw_f0_0392;       % number of foetuses
  S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups
  pars_AF = [pT_Am, vT, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff]; % temp-correct and pack pars for dget_EVR_AF

  t_start = tWw_f0_0392(1,1);  % <-- same for all females in that batch
  t_mating = t_mt.tWw_f0_0392;     % <-- same for all females in that batch
  time_Ww = tWw_f0_0392(:,1);  % <-- same for all females in that batch;
  time_JX = tJX_f0_0392(:,1); % <-- same for all females in that batch
  tspan = linspace(t_start, time_Ww(end)+10, 1000); % integrate for longer to get tT_X while estimating
  V_start = Ww0.tWw_f0_0392/(1 + f_f0392 * ome) ;  %e_f0392 is a free parameter  
  %EVH_AF_0 = [f_f0392 * E_m * V_start, V_start, 0, 0, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty
  EVH_AF_0 = [f_f0392 * E_m * V_start, V_start, 0, f_f0392 * E_m *1e-8, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f, and repro buffer empty
  options = odeset('Events', @event_bx);
  pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, Npups, f_f0392, t_mating]; % temp-correct and pack pars for dget_EVR_AF
  [time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg); 
  
      %dh filter for parameter estimation procedure
    if length(te)<2
        info = 0;
        prdData = {};
        return;
    end

  
%    if length(te)>1
  % birth
  aT_g(2) = te(1)- t_mating;         % d, gestation time at f and T
  % weaning
   tT_x(2) = te(2)- te(1);            % d, time since birth at weaning at f and T, and Npups
    % --> if zero-var data are used from standard model (see above in zero-var data section), these can be commented out -->
  ELw_b(2) = ye(1,5)^(1/3)/del_Me;   % cm, foetus, expected length at birth
  EWw_b(2) = ye(1,5) + ye(1,4)* w_E/d_V/mu_E;  % g, foetus, expected wet weight at birth
   ELw_x(2) = ye(2,5)^(1/3)/del_M;                % cm, foetus, expected length at weaning
  EWw_x(2) = ye(2,5) + ye(2,4)* w_E/d_V/mu_E;    % g, foetus, expected wet weight at weaning
      % <--- comment out until here
  
  % univariate
  % time-weight (mothers)
  EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;  % g, mother without foetus, expected wet weight at time
  EWw_foetpup = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                % g, foetus and later pup, expected wet weight at time  
  EWw = EWw_mother + (time < t_mating + aT_g(2)).* EWw_foetpup * Npups; % g, mother plus foetus, while gestation
  EWw_f0_0392 = interp1(time, EWw, time_Ww, 'spline'); % g, wet weight of mother plus foetus, interpolated at time_Ww

  % --> if foetal growth calculated via demand equation (see Line356-361), these can be commented out -->
  index_foetpup = find(time >= t_mating & time < t_mating + aT_g(2) +tT_x(2)); % iindices for gestation & lactation period
  t_aux2 = time(index_foetpup); t_fp = t_aux2 - t_aux2(1); % extract time and start at 0
  Ww_foetpup = EWw_foetpup(index_foetpup);
  Lw_foetpup = EVH_AF(index_foetpup,5).^(1/3)/del_Me;
  EWw_e(:, 2) = interp1(t_fp, Ww_foetpup, max(0, tWwe(:,1) ),'spline' ); % g, wet weight Angu1932
  EWd_e(:, 2) = interp1(t_fp, d_V*Ww_foetpup, max(0, tWde(:,1) ),'spline' ); % g, wet weight Angu1932
  ELw_e1(:,2) = interp1(t_fp, Lw_foetpup, max(0, tLe1(:,1) ),'spline' ); % cm, length Angu1932 
  ELw_e2(:,2) = interp1(t_fp, Lw_foetpup, max(0, tLe2(:,1) ),'spline' ); % cm, length NaraFox1971
    % <--- comment out until here; foetal growth already calculated above 
 
  % feeding (mothers)
  L2_mother = EVH_AF(:,2).^(2/3); L2_foetus = EVH_AF(:,5).^(2/3);
  L2_mother_adj = interp1(time, L2_mother, time_JX, 'spline'); 
  L2_foetus_adj = interp1(time, L2_foetus, time_JX, 'spline'); 
  upreg_period = (time_JX > t_mating & time_JX < t_mating + aT_g(2) + tT_x(2));
  EJX_f0_0392 = (pT_Xm * w_X/ mu_X/ d_X) * f_f0392 * (L2_mother_adj + upreg_period * Npups * S_eff .* L2_foetus_adj); % g/d, wet weight of foo  
  
  % t-Ww of pups 
  time_pup = tWw_F0p_0392(:,1);
  index_pup =find((time >= t_mating + aT_g(1)) & (time < t_mating + aT_g(2) + tT_x(2) + 10)); % indices for lactation period + 10 just to get a wider time span
  t_aux = time(index_pup); t_pup = t_aux-t_aux(1); % extract time and start at 0
  Ww_pup = EWw_foetpup(index_pup);
  EWw_F0p_0392 = interp1(t_pup, Ww_pup, time_pup,'spline' ); % g, pups growth for that litter size  
 
%% wet weight at becoming pregnant -> number of pups
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  L_struct = ( WwN_2598(:,1)/ (1 + f_f2598 * ome) ).^(1/3) ;
  [R, UE0, ~, ~] = reprod_rate_foetus (L_struct, f_f2598, pars_R) ; 
  EN_2598 = TC * R * 365/5; % to go from "per day" to repro events roughly 5 times per year (less than assumed for max!)--> does not include costs of lactation or input from upregulation
  
  L_struct = ( WwN_0392(:,1)/ (1 + f_f0392 * ome) ).^(1/3) ;
  [R, UE0, ~, ~] = reprod_rate_foetus (L_struct, f_f0392, pars_R) ; 
  EN_0392 = TC * R * 365/5; % to go from "per day" to repro events roughly 5 times per year (less than assumed for max!)--> does not include costs of lactation or input from upregulation


%% ---------------------------------
%    pack to output
% ------------------------------------
% if we want to over-write the zero variate predictions!
%   prdData.tg = mean(aT_g);
%   prdData.tx = mean(tT_x);
%   prdData.Lb = mean(ELw_b);
%   prdData.Lx = mean(ELw_x);
%   prdData.Wwb = mean(EWw_b);
%   prdData.Wwx = mean(EWw_x);
%
prdData.tWwe = mean(EWw_e,2); % because we don't know how many babies in a litter
prdData.tWde = mean(EWd_e,2);
prdData.tLe1 = mean(ELw_e1,2);
prdData.tLe2 = mean(ELw_e2,2);
prdData.LWw_f = EWw_fL;
prdData.tL = ELw;

prdData.tWw = EWw_W;
prdData.tWw_C = EWw_C;
prdData.tWw_C41 = EWw_C41;
prdData.tWw_C44 = EWw_C44;
prdData.tWw_C46 = EWw_C46;
prdData.tWw_C47 = EWw_C47;
prdData.tWw_C49 = EWw_C49;
prdData.tWw_C50 = EWw_C50;
prdData.tWw_05study_f = EWw_study_f;
prdData.tWw_05study_m = EWw_study_m;

% males
prdData.tWw_m2598 = EWw_m2598;
prdData.tWw_m0392 = EWw_m0392;
prdData.tJX_m2598 = EJX_m2598;
prdData.tJX_m0392 = EJX_m0392;
% non pregnant females
prdData.tWw_f_np2598 = EWw_f_np2598;
prdData.tJX_f_np2598 = EJX_f_np2598;
prdData.tWw_f1_np2598 = EWw_f1_np2598;
prdData.tJX_f1_np2598 = EJX_f1_np2598;
% pregnant females
prdData.tWw_f0_2598 = EWw_f0_2598;
prdData.tJX_f0_2598 = EJX_f0_2598;
prdData.tWw_F0p_2598 = EWw_F0p_2598;
prdData.tWw_f0_0392 = EWw_f0_0392;
prdData.tJX_f0_0392 = EJX_f0_0392;
prdData.tWw_F0p_0392 = EWw_F0p_0392;

prdData.WwN_2598 = EN_2598;
prdData.WwN_0392 = EN_0392;

%dh fasting
prdData.tWw_f0_fast = tWw_f0_fast_perc(:,2); 
prdData.tLe_f1_fast = tLe_f1_fast_res(:,2);
prdData.tWw_f0_zhang_ctrl = tWw_f0_zhang_pred(:,2);
prdData.tWw_f0_zhang_FR50 = tWw_f0_zhang_pred(:,3);
prdData.tWwE_f1_zhang_ctrl = tWwE_f1_zhang_pred(:,2) ;
prdData.tWwE_f1_zhang_FR50 = tWwE_f1_zhang_pred(:,3) ;

prdData.tWw_f0_wood_ctrl = tWw_f0_wood_pred_ctrl;
prdData.tWw_f0_wood_30perc = tWw_f0_wood_pred_30perc;
prdData.tWw_f1_wood_f_ctrl = tWw_f1_wood_f_pred(:,2) ;
prdData.tWw_f1_wood_f_30perc = tWw_f1_wood_f_pred(:,3);
end
%%
function dEVR = dget_EVR(t, EVH, pars_EVR, f)  % for non-pregnant adults only!
% change in state variables
% t: time

% unpack state variables
E  = EVH(1); V  = EVH(2);
E_R  = EVH(3);  % individual
L = V^(1/3);

% unpack par   , cpar, data
pT_Am = pars_EVR(1);
vT = pars_EVR(2);
pT_M = pars_EVR(3);
kT_J = pars_EVR(4);
E_Hp = pars_EVR(5);
E_G = pars_EVR(6);
kap = pars_EVR(7);

% Fluxes (mother)
pA = pT_Am * f * L^2; % assimilation
pS = pT_M * V;        % somatic maintenance
pJ = kT_J * E_Hp;     % maturity maintenance
pC = E * (E_G * vT * L^2 + pS) / (kap * E + E_G * V); % mobilization rate
pG = kap* pC - pS;        % growth
pR = (1 - kap) * pC - pJ; % allocation to reproduction

% Differential equations
dE = pA - pC; % dE/dt
dV = pG / E_G;% dV/dt
dE_R = pR; % dR/dt to reproduction

% pack derivatives
dEVR = [dE; dV; dE_R];
end

function [value,isterminal,direction] = event_bx(t, EVH_AF, pars_AF, varargin) % dh added varargin
% AF: 6-vector
E_Hb = pars_AF(11); E_Hx = pars_AF(12);
value = [E_Hb; E_Hx] - EVH_AF(6);
isterminal = [0; 0]; % modified to NOT stop at weaning!
direction = [0; 0];
end

%% -------------------------
% from prev.version of rat ([2018 06 18])
% -------------------------
% time since birth at puberty data MALE controls
% step=100;
% time = [0:60*step];
% [t eLH] = ode45(@dget_eL2, time , [1; L_bm; E_Hb ; 0], [], v * TC/step, g_m, L_mm, f, f1, f2, kap, k_J* TC/step, E_Hpm, E_m_m);
% tT_pm0 = max(eLH(:,4))/step ;

function deL2 = dget_eL2 (t, eL, v, g_m, L_mm, f, f1, f2, kap, k_J, E_Hpm, E_m_m) %function for males
if t < 22 %lactation period in study
    f = f1;
else
    f = f2;
end

e = eL(1); L = eL(2); E_H = eL(3); etpm = 0 ; %initials
r = v * (e/ L - 1/ L_mm)/ (e + g_m);  % growth rate
p_C = L^3 * E_m_m * e * (v/ L - r); % mobilisation rate

if E_H < E_Hpm
    dE_H = (1 - kap) * p_C - k_J * E_H; % change in maturity
    detpm= etpm+1; % record time
else
    dE_H =0;   %no increase in maturity
    detpm = 0; % not record time
end

deL2 =  [(f - e) * v/ L; r * L/ 3; dE_H;   detpm];

end

function dAF = dget_EVH_AF(t, EVH_AF, p, varargin)
%dh: varargin contains upreg and (optionally)fast_dur, fast_start, fast_f
% ode specification for get_EVH_AF

% created by Dina Lika & Nina Marn 2019/06/11, modified 2019/10/14
% Acknowledgment: This development was financially supported by Bayer AG

% unpack state variables
E  = EVH_AF(1); V  = EVH_AF(2); E_R  = EVH_AF(3);       % mother, energy in reserve, structural volume, energy in reproductive reserve
E_F  = EVH_AF(4); V_F  = EVH_AF(5); EH_F  = EVH_AF(6);  % foetus, energy in reserve, structural volume, energy invested to maturation

% unpack p
p_Am = p(1);       % J/d.cm^2, max surface-spec assimilation flux
p_FAm = p(2);      % J/d.cm^2, foetal-specific assimilation parameter
v = p(3);          % cm/d, energy conductance
v_F = p(4);        % cm/d, foetal energy conductance
kap = p(5);        % -, allocation fraction to soma
kap_R = p(6);      % -, reproduction efficiency of the mother, and repro reserve assimilation efficiency of the foetus
kap_RL = p(7);     % -, milk production efficiency of the mother, and milk assimilation efficiency of the foetus
p_M = p(8);        % J/d.cm^3, vol-spec somatic maint
k_J = p(9);        % 1/d, maturity maint rate coefficient
E_G = p(10);       % J/cm^3, spec cost for structure
E_Hb = p(11);      % J, maturity at birth
E_Hx = p(12);      % J, maturity at weaning
E_Hp = p(13);      % J, maturity at puberty
E_m = p(14);       % J/cm^3, reserve capacity
t_0 = p(15);       % d, time at start development (since mating)
S_eff = p(16);     % -, effective placenta surface area coefficient
Npups = p(17);     % -, number of foetuses

t_mate = p(19) ;   % d, age of mother at mating

%dh allow for fasting parameters to be passed via varargin:
if size(varargin,2) ==1 %orginal case ( no fasting)
    f = p(18);         % -, scaled functional response
else
    fast_dur = varargin{2};
    fast_start = varargin{3};
    fast_f= varargin{4}; %f during fasting
    if t >= fast_start & t <= fast_start + fast_dur & fast_dur>0
        f = fast_f ;           
    else
        f = p(18); 
    end
end
upreg = varargin{1};


% upreg = 1 or 0,  -, (logical) whether or not upregulation of feeding is observed

L = V^(1/3);     % cm, structural length
L_F = V_F^(1/3); % cm, structural length of foetus
e_R = E_R/V/E_m; % -, scaled reserve density, e_R = [E_R] / [E_m]


% Fluxes (mother)
pA = p_Am * f * L^2; % J/d, assimilation
if upreg
    pAR = (t > t_0 + t_mate & EH_F <= E_Hx) * S_eff * Npups * p_Am * f * L_F^2; % upregulated assimilation
else
    pAR = 0;
end
pS = p_M * V;                                        % J/d, somatic maintenance
pJ = k_J * E_Hp;                                     % J/d, maturity maintenance for adults
pC = E * (E_G * v * L^2 + pS) / (kap * E + E_G * V); % J/d, mobilization
pG = kap * pC - pS;                                  % J/d, growth
pR = (1 - kap) * pC - pJ + pAR;                      % J/d, allocation to reproduction

if EH_F < E_Hb  % gestation
    pFL = (t > t_0 + t_mate)* S_eff * e_R * p_FAm * L_F^2/kap_R;  % from mother allocation to each foetus    
    pA_F = kap_R * pFL;                                             % foetal assimilation
    %pC_F = (p_M * V_F + E_G * v_F * V_F^(2/3)) / kap;               % demand dynamics, foetus mobilization rate
    pC_F = E_F * (E_G * v_F * L_F^2 + p_M * V_F) / (kap * E_F + E_G * V_F);  %dh supply dynamics, foetus mobilization rate, assume same E_G, kappa as in mother,
elseif  EH_F >= E_Hb && EH_F < E_Hx  % lactation
    pFL = S_eff * e_R * p_FAm * L_F^2/kap_RL;                       % from mother allocation to each foetus
    pA_F = kap_RL * pFL;                                            % foetal assimilation
    %pC_F = (p_M * V_F + E_G * v * V_F^(2/3)) / kap;                 % demand dynamics, but with mother's v
    pC_F = E_F * (E_G * v * L_F^2 + p_M * V_F) / (kap * E_F + E_G * V_F);  %dh supply dynamics, foetus mobilization rate, assume same E_G, kappa, AND v as in mother,
else
    pFL = 0;
    pA_F = p_Am * f * L_F^2; % assimilation;
    pC_F = E_F * (E_G * v * L_F^2 + p_M * V_F) / (kap * E_F + E_G * V_F); % v of the mother
end

pS_F = (t > t_0 + t_mate)*p_M * V_F;                                        %dh J/d, somatic maintenance of fetus, assumes same p_M as mother
pG_F = kap * pC_F - pS_F;                                 %dh J/d, growth of fetus, assume same kappa as mother


% Differential equations for the adults
dE = pA - pC;        % J/d, dE/dt
dV = pG / E_G;       % cm^3/d, dV/dt
dR = (pR - Npups * pFL); % J/d, dE_R/dt

% Differential equations for foetus/newborn
if EH_F < E_Hb
    dE_F = (t> t_0 + t_mate) * (pA_F - pC_F);
    %dV_F = (t> t_0 + t_mate) * v_F * V_F^(2/3);
    dV_F = (t> t_0 + t_mate) * pG_F / E_G;       %dh cm^3/d, dV/dt, assume same spec cost for structure as mother
    dH_F = (t> t_0 + t_mate) * ((1 - kap) * pC_F - k_J * EH_F);
elseif EH_F >=E_Hb && EH_F < E_Hx
    dE_F = pA_F - pC_F;
    %dV_F = v* V_F^(2/3); % exponential growth; v of the mother
    dV_F = pG_F / E_G;       %dh cm^3/d, dV/dt, assume same spec cost for structure as mother
    dH_F = (1 - kap) * pC_F - k_J * EH_F;
else
    dE_F = pA_F - pC_F;
    dV_F = kap * pC_F - p_M * V_F; % von B growth!
    dH_F = (1 - kap) * pC_F - k_J * EH_F;
end

% pack derivatives
dAF = [dE; dV; dR; dE_F; dV_F; dH_F];
end

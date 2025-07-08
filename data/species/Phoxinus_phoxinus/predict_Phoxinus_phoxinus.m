function [prdData, info] = predict_Phoxinus_phoxinus(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


% customized filters for allowable parameters of the standard DEB model (std)
% for other models consult the appropriate filter function.

filterChecks =       f_Frost1943_larvae>1 || f_Frost1943_larvae <0 || ...
    f_Frost1943_adults>1 || f_Frost1943_adults <0 || ...
    f_Kill2014>1  || f_Kill2014 <0  || ...
    f_Hees1984>1  || f_Hees1984 <0  || ...
    f_MillElor1985>1 || f_MillElor1985 <0 || ...
    f_SchoSchw2000>1 || f_SchoSchw2000 <0 || ...
    f_MuseBorg2002>1 || f_MuseBorg2002 <0 ;
 
if filterChecks
    info = 0;
    prdData = {};
    return;
end

%% compute temperature correction factors
% Zero variate
TC_ah_T1 = tempcorr(temp.ah_T1, T_ref, T_A);
TC_ah_T2 = tempcorr(temp.ah_T2, T_ref, T_A);
TC_ah_T3 = tempcorr(temp.ah_T3, T_ref, T_A);
TC_ah_T4 = tempcorr(temp.ah_T4, T_ref, T_A);
TC_ah_T5 = tempcorr(temp.ah_T5, T_ref, T_A);
TC_ah_T6 = tempcorr(temp.ah_T6, T_ref, T_A);
TC_tj   = tempcorr(temp.tj, T_ref, T_A);
TC_tp   = tempcorr(temp.tp, T_ref, T_A);
TC_am   = tempcorr(temp.am, T_ref, T_A);
TC_JOw  = tempcorr(temp.JOw, T_ref, T_A);
TC_Ri   = tempcorr(temp.Ri, T_ref, T_A);

% Frost1943
TC_tLf1   = tempcorr(temp.tLf1, T_ref, T_A);
% TC_tLf2   = tempcorr(temp.tLf2, T_ref, T_A);
TC_LfWw1   = tempcorr(temp.LfWw1, T_ref, T_A);
% TC_LfWw2   = tempcorr(temp.LfWw2, T_ref, T_A);
% Killen 2014
TC_tWw1   = tempcorr(temp.tWw1, T_ref, T_A);
% TC_tLs1   = tempcorr(temp.tLs1, T_ref, T_A);
% Heese 1984
TC_tWw2   = tempcorr(temp.tWw2, T_ref, T_A);
% TC_tLs2   = tempcorr(temp.tLs2, T_ref, T_A);
% TC_LsWw   = tempcorr(temp.LsWw, T_ref, T_A);
% MillElor1985
TC_tLf3   = tempcorr(temp.tLf3, T_ref, T_A);
TC_LN   = tempcorr(temp.LN, T_ref, T_A);
% PlatSarb2013
TC_WwJO   = tempcorr(temp.WwJO, T_ref, T_A);
% % StalKest1991
% TC_LtWw   = tempcorr(temp.LtWw, T_ref, T_A);
% SchoSchw2000
TC_tWw3   = tempcorr(temp.tWw3, T_ref, T_A);
TC_tWw4   = tempcorr(temp.tWw4, T_ref, T_A);
% MuseBorg2002
TC_tLt1   = tempcorr(temp.tLt1, T_ref, T_A);
% TC_tLt2   = tempcorr(temp.tLt2, T_ref, T_A);
% TC_tLt3   = tempcorr(temp.tLt3, T_ref, T_A);
% TC_tLt4   = tempcorr(temp.tLt4, T_ref, T_A);


%% zero-variate data   
% life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

% initial
pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
E_0 = U_E0 * p_Am;     % J, initial reserve
V_egg = E_0 * w_E/ (mu_E * d_E)/ del_Y^3; % cm^3, volume of egg, Augustine, Litvak & Kooijman 2011
Lw_0= V_egg^(1/3);                 % cm, diameter of egg
Wd_0 = E_0 * w_E/ mu_E ; % g, egg dry weight
Ww_0 = E_0 * w_E/ mu_E/ d_E ; % g, egg wet weight

% birth (coincides with hatch)
L_b = L_m * l_b;                  % cm, structural length at birth at f
Lw_b = L_b/ del_Mf;                % cm, fork length at birth
Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth 1
% Ww_h2 = L_b^3 * (1 + f * w);       % g, wet weight at birth 1
aT1_h = t_b/ k_M/ TC_ah_T1;           % d, age at birth at f and T
aT2_h = t_b/ k_M/ TC_ah_T2;              % d, age at birth at f and T
aT3_h = t_b/ k_M/ TC_ah_T3;              % d, age at birth at f and T
aT4_h = t_b/ k_M/ TC_ah_T4;              % d, age at birth at f and T
aT5_h = t_b/ k_M/ TC_ah_T5;              % d, age at birth at f and T
aT6_h = t_b/ k_M/ TC_ah_T6;              % d, age at birth at f and T

% metamorphosis
L_j = L_m * l_j;                  % cm, structural length at metamorphosis at f
Lw_j = L_j/ del_Mf;                % cm, fork length at metamorphosis at f
tT_j = (t_j - t_b)/ k_M/ TC_tj;     % d, time since birth at metamorphosis at f and T

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_Mf;                % cm, fork length at puberty at f
% Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
tT_p = (t_p - t_b)/ k_M/ TC_tp;     % d, time since birth at puberty at f and T

% ultimate
L_i  = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_Mt;                % cm, ultimate total length at f
Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M / TC_am;               % d, mean life span at T

% O2 consumption per gram
pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];     % compose pars
p_ref = p_Am * L_m^2;                                             % J/d, max assimilation power at max size
L = L0.JOw * del_Ms;                                               % cm, structural length from standard length
pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);   % J/d, powers
J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';              % mol/d: J_C, J_H, J_O, J_N in rows
EJT_O = - J_M(3, :)' * TC_JOw * 24.4/ 24 / 1e-3  ./ W0.JOw;      % ml O2/h.g, spec O2 consumption (with 24.4 L O2/mol)

% length-weight data from Puig1999
Ls_Ww = (L0.LsWw * del_Ms).^3 * (1 + f * w); % g, wet weight at standard length
Lt_Ww = (L0.LtWw * del_Mt).^3 * (1 + f * w); % g, wet weight at total length

% pack to output
% prdData.Ww0 = Ww_0;
prdData.Lo = Lw_0;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Li = Lw_i;
prdData.ah_T1 = aT1_h;
prdData.ah_T2 = aT2_h;
prdData.ah_T3 = aT3_h;
prdData.ah_T4 = aT4_h;
prdData.ah_T5 = aT5_h;
prdData.ah_T6 = aT6_h;
prdData.Ww0 = Ww_0;
prdData.Wwb = Ww_b;
prdData.Wwi = Ww_i;
prdData.tj = tT_j;
prdData.Lj = Lw_j;
prdData.tp = tT_p;
prdData.am = aT_m;
prdData.JOw = EJT_O;
prdData.Ri = RT_i;
prdData.LsWw = Ls_Ww;
prdData.LtWw = Lt_Ww;
% 

%% uni-variate data

% StalKest1991
ELtWw = (LtWw(:,1) * del_Mt).^3 * (1 + f * w); % g: Wet weight at standard length
% pack predictions:
prdData.LtWw = ELtWw;

% PlatSarb2013
pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];     % compose pars
p_ref  = p_Am * L_m^2;                                            % J/d, max assimilation power at max size
L      = (WwJO(:,1)/ (1 + w * f)).^(1/3);                         % cm, structural length
pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);   % J/d, powers
J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';   % mol/d: J_C, J_H, J_O, J_N in rows
EJT_O = - J_M(3, :)' * TC_WwJO * 24.4/ 24 / 1e-3;      % ml O2/h, spec O2 consumption (with 24.4 L O2/mol)
% pack predictions:
prdData.WwJO = EJT_O;

% Frost1943
TC = TC_tLf1; % -, temperature correction factor

% larvae
f  = f_Frost1943_larvae; % -, scaled func. res. 
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
kT_M  = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
L_b   = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
tT_j  = (t_j - t_b)/ kT_M;    % d, time since birth at metamorphosis at T
t    = tLf1(:,1); t_bj = t( t < tT_j,1);  t_ji = t(t >= tT_j,1); 
L_bj = L_b * exp((t_bj) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
ELw1 = [L_bj; L_jm]/ del_Mf; % cm, fork length

% adults
f  = f_Frost1943_adults; % -, scaled func. res.
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
kT_M  = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
L_b   = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
t    = tLf2(:,1); t_bj = t( t < tT_j,1);  t_ji = t(t >= tT_j,1); 
L_bj = L_b * exp((t_bj) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
ELw2 = [L_bj; L_jm]/ del_Mf; % cm, fork length

% fork length as function of weight LfWw1 (gonad full)
pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp]; % Parameters to calculate repro rate.
ELfWw1G = (LfWw1(:,1) * del_Mf).^3 * (1 + f * w); % g: Wet weight at fork length
ELfWw1R = 365 * TC_LfWw1 * reprod_rate_j(LfWw1(:,1), f, pars_R) *  Wd_0; % g: Wet weight of gonad with 1 year accumulation and assuming no water in the gonad because usually water comes in the last stages of ripening. Repro rate corrected by temperature
ELfWw1 = ELfWw1G + ELfWw1R ;
% fork length as function of weight LfWw1 (gonad empty)
ELfWw2 = (LfWw2(:,1) * del_Mf).^3 * (1 + f * w); % g: Wet weight at fork length

% pack predictions:
prdData.tLf1 = ELw1;
prdData.tLf2 = ELw2;
prdData.LfWw1 = ELfWw1;
prdData.LfWw2 = ELfWw2;

% Killen 2014
f  = f_Kill2014; % -, scaled func. res. 
TC = TC_tWw1;    % -, temperature correction factor
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
kT_M  = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
L_init = (W0.tWw1/ (1 + w * f))^(1/3); % cm, structural length at start (organisms are past metamorphosis)
t    = tWw1(:,1); % d, time since start
L_jm = L_i - (L_i - L_init) * exp( - rT_B * t);   % cm, length after V1-morph period
ELw = [L_bj; L_jm]/ del_Ms; % cm, standard length
EWw = [L_bj; L_jm].^3 * (1 + w * f); % g, wet weight

% pack predictions:
prdData.tLs1 = ELw;
prdData.tWw1 = EWw;


% Heese 1984
f  = f_Hees1984; % -, scaled func. res.
TC = TC_tWw2;    % -, temperature correction factor

[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
kT_M  = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
L_b   = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
tT_j  = (t_j - t_b)/ kT_M;    % d, time since birth at metamorphosis at T
t     = tLs2(:,1); t_bj = t( t < tT_j,1);  t_ji = t(t >= tT_j,1); 
L_bj  = L_b * exp((t_bj) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm  = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
L     = [L_bj; L_jm]; % cm, structural length
ELw   = L / del_Ms;  % cm, standard length
EWw   = L.^3 * (1 + w * f); % g, wet weight
ELsWw = (LsWw(:,1) * del_Ms).^3 * (1 + f * w); % g, wet weight at standard length

% pack predictions:
prdData.tLs2 = ELw;
prdData.tWw2 = EWw;
prdData.LsWw = ELsWw;

% MillElor1985
f  = f_MillElor1985; % -, scaled func. res.
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
kT_M  = k_M * TC_tLf3; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
L_b   = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
tT_j  = (t_j - t_b)/ kT_M;    % d, time since birth at metamorphosis at T
t     = tLf3(:,1); t_bj = t( t < tT_j,1);  t_ji = t(t >= tT_j,1); 
L_bj  = L_b * exp((t_bj) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm  = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
L     = [L_bj; L_jm]; % cm, structural length
ELw   = L / del_Mf;  % cm, fork length
%
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];      % compose parameter vector
EN_L = TC_LN * 365 * reprod_rate_j(LN(:,1) * del_Mf, f, pars_R);   % #, fecundity
% pack predictions:
prdData.tLf3 = ELw;
prdData.LN = EN_L;

% SchoSchw2000
f  = f_SchoSchw2000; % -, scaled func. res.
TC = TC_tWw3; % 
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
L_b   = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
%
kT_M  = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
tT_j  = (t_j - t_b)/ kT_M;    % d, time since birth at metamorphosis at T
t     = tWw3(:,1); t_bj = t( t < tT_j,1);  t_ji = t(t >= tT_j,1); 
L_bj  = L_b * exp((t_bj) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm  = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
L     = [L_bj; L_jm]; % cm, structural length
EWw1  =  L.^3 * (1 + w * f); % g, wet weight
% Dataset at 15 °C
TC = TC_tWw4; % 
kT_M  = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
tT_j  = (t_j - t_b)/ kT_M;    % d, time since birth at metamorphosis at T
t     = tWw4(:,1); t_bj = t( t < tT_j,1);  t_ji = t(t >= tT_j,1); 
L_bj  = L_b * exp((t_bj) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm  = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
L     = [L_bj; L_jm]; % cm, structural length
EWw2  =  L.^3 * (1 + w * f); % g, wet weight
% pack predictions:
prdData.tWw3 = EWw1;
prdData.tWw4 = EWw2;

% MuseBorg2002
f = f_MuseBorg2002; % -, scaled func. res.
TC = TC_tLt1; % -, temperature correction factor
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
L_b   = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;     % cm, length at birth, metamorphosis, ultimate
%
kT_M  = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
tT_j  = (t_j - t_b)/ kT_M;    % d, time since birth at metamorphosis at T
t     = tLt1(:,1); t_bj = t( t < tT_j,1);  t_ji = t(t >= tT_j,1); 
L_bj  = L_b * exp((t_bj) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm  = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
ELw     = [L_bj; L_jm]/ del_Mt;  % cm, total length
% pack predictions:
prdData.tLt1 = ELw;
prdData.tLt2 = ELw;
prdData.tLt3 = ELw;
prdData.tLt4 = ELw;

 % time-length/weight post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; L_j = L_m * l_j; L_i = L_m * l_i;
  tT_j  = (t_j - t_b)/ kT_M;    % d, time since birth at metamorphosis at T
t     = tL(:,1); t_bj = t( t < tT_j,1);  t_ji = t(t >= tT_j,1); 
L_bj  = L_b * exp((t_bj) * rT_j/ 3); % cm length and weight during V1-morph period
L_jm  = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j));   % cm, length after V1-morph period
ELw     = [L_bj; L_jm]/ del_Mt;  % cm, total length
%   L = L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j)); % cm, structural length
%   ELw = L/ del_Mt; % cm, total length

  prdData.tL = ELw;
  
end


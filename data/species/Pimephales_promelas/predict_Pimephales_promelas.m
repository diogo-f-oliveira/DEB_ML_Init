function [prdData, info] = predict_Pimephales_promelas(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


% customized filters for allowable parameters of the standard DEB model (std)
% for other models consult the appropriate filter function.

% customized filters to contrain additional parameter
filterChecks =  f_ParrBala2017  > 1 || f_ParrBala2017  < 0 ||...         % f contrained to not be larger than 1
    f_Aerl2004  > 1 || f_Aerl2004  < 0|| ...
    f_Boro  > 1 || f_Boro  < 0 ||...
    f_soho  > 1 || f_soho  < 0 ||...
    f_soho_init  > 1 || f_soho_init  < 0 ||...
    f_u5  > 1 || f_u5  < 0 ;

if filterChecks
    info = 0;
    prdData = {};
    return;
end


%% compute temperature correction factors
TC_ab = tempcorr(temp.ab, T_ref, T_A);
TC_ab_B = tempcorr(temp.ab_B, T_ref, T_A);
TC_ap = tempcorr(temp.ap, T_ref, T_A);
TC_am = tempcorr(temp.am, T_ref, T_A);
TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
TC_tL = tempcorr(temp.tL, T_ref, T_A); % ParrBala
TC_tLm = tempcorr(temp.tLm, T_ref, T_A); % Soho
TC_tL_Boro = tempcorr(temp.tL_Boro, T_ref, T_A);

TC_tLf = tempcorr(temp.tLf, T_ref, T_A);
TC_u5 = tempcorr(temp.u5_tL1, T_ref, T_A);

% life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
pars_tj_m = [g k l_T v_Hb v_Hj v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

% egg
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve  
  E_0 = U_E0 * p_Am;     % J, initial reserve
  Wd0 = E_0 * w_E/ mu_E ; % g, egg dry weight 
  Ww0 = E_0 * w_E/ mu_E/ d_V ; % g, egg wet weight 

% birth
L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
Lw_b = L_b/ del_M;                % cm, total length at birth
Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
aT_b = t_b/ k_M/ TC_ab;           % d, age at birth of foetus at f and T
aT_b_B = t_b/ k_M/ TC_ab_B;           % d, age at birth of foetus at f and T


% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, total length at puberty at f
Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

% ultimate
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_if = L_i/ del_M;                % cm, female ultimate total length at f
Lw_im = (z_m/z) * L_i / del_M;     % cm, male ultimate total length at f
Ww_if = L_i^3 * (1 + f * w);       % g, ultimate wet weight female
Ww_im = ((z_m/z) * L_i)^3 * (1 + f * w);       % g, ultimate wet weight male

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

% pack to output
prdData.Wd0 = Wd0;
prdData.Ww0 = Ww0;
prdData.ab = aT_b;
prdData.ab_B = aT_b_B;
prdData.ap = aT_p;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Li_m = Lw_im;
prdData.Li_f = Lw_if;
prdData.Wwb = Ww_b;
prdData.Wwp = Ww_p;
prdData.Wwi_f = Ww_if;
prdData.Wwi_m = Ww_im;
prdData.Ri = RT_i;


%% calculations
pars_JO = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars

% temperature correction
pT_M = TC_tLf * p_M; % maintenance rate constant, J / d.cm^3
vT = TC_tLf * v;     % energy conductance, cm / d
kT_J = TC_tLf * k_J;  % maturity maintenance rate, d-1
pT_Am = p_Am * TC_tLf;  % surface-area specific maximum assimilation rate, J / d.cm^2


%% soho
TC = TC_tLm;

pT_M = TC * p_M; % maintenance rate constant, J / d.cm^3
vT = TC * v;     % energy conductance, cm / d
kT_J = TC * k_J;  % maturity maintenance rate, d-1
pT_Am = p_Am * TC;  % surface-area specific maximum assimilation rate, J / d.cm^2

% costs for an egg
pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
E_0 = U_E0 * pT_Am;     % J, initial reserve

% initial conditions:
LEHR_0 = [0.0000001, E_0, 0, 0]; % % pack initial conditions

% Soho: fish came at different sizes (male / female) from culture
% -> use information
[tj, tp, tb, lj , lp, lb ] = get_tj(pars_tj, f_soho);
s_M = lj/lb;

% female
t = tLf((tLf(:,1)<163.1),1);
[t1, LEHR] = ode45(@ODE_DEB3, [t; t(end) + 1e-4], LEHR_0, [], ...
    f_soho_init, pT_Am, kap, kap_R, vT, kT_J, pT_M, E_G, E_Hp, E_0, kap_G, s_M);
if length(t1) == 2
    LEHR = [LEHR(1,:); LEHR(end,:)];
end
L1      = LEHR(:,1); Lw1 = L1/ del_M; Lw1(end) = [];% cm, fork length
E1      = LEHR(:,2); Ww1   =  L1.^3 + w_E/ mu_E/ d_E * E1; Ww1(end) = [];
R1      = LEHR(:,4);
% afterwards different food:
t2 = tLf((tLf(:,1)>=163.1),1);
[t1, LEHR] = ode45(@ODE_DEB3, [t(end)+ 1e-4;t2; t2(end) + 1e-4], LEHR(end,:), [], ...
    f_soho, pT_Am, kap, kap_R, vT, kT_J, pT_M, E_G, E_Hp, E_0, kap_G, s_M);
LEHR([1,end],:) = []; % remove the dummy time used to have smooth trajectory
if length(t1) == 2
    LEHR = [LEHR(1,:); LEHR(end,:)];
end
L2 = LEHR(:,1); Lw2 = L2 / del_M;  % cm, fork length
E2 = LEHR(:,2); Ww2 =  L2.^3 + w_E/ mu_E/ d_E * E2; % g, wet weight
R2 = LEHR(:,4);
% pack predictions:


ee = [E1(1:end-1); E2] ./ [L1(1:end-1); L2].^3/ E_m;  % -, scaled reserve density
eR =[R1(1:end-1); R2] ./ [L1(1:end-1); L2].^3/ E_m;  % -, scaled reserve density of reproduction buffer

WR = [L1(1:end-1); L2].^3 .* eR* w; % weight of buffer/gonads
prdData.tBG = WR; %g gonad weight
prdData.tWwf  = [Ww1; Ww2]+WR;
prdData.tLf  = [Lw1; Lw2];
% MALE
t = tLf((tLf(:,1)<163.1),1);
[t1, LEHR] = ode45(@ODE_DEB3, [t; t(end) + 1e-4], LEHR_0, [], ...
    f_soho_init, pT_Am * z_m/z, kap, kap_R, vT, kT_J, pT_M, E_G, E_Hp, E_0, kap_G, s_M);
if length(t1) == 2
    LEHR = [LEHR(1,:); LEHR(end,:)];
end
L1      = LEHR(:,1); Lw1 = L1/ del_M; Lw1(end) = [];% cm, fork length
E1      = LEHR(:,2); Ww1   =  L1.^3 + w_E/ mu_E/ d_E * E1; Ww1(end) = [];

% afterwards different food:
t2 = tLf((tLf(:,1)>=163.1),1);
[t1, LEHR] = ode45(@ODE_DEB3, [t(end)+ 1e-4;t2; t2(end) + 1e-4], LEHR(end,:), [], ...
    f_soho, pT_Am * z_m/z, kap, kap_R, vT, kT_J, pT_M, E_G, E_Hp, E_0, kap_G, s_M);
LEHR([1,end],:) = []; % remove the dummy time used to have smooth trajectory
if length(t1) == 2
    LEHR = [LEHR(1,:); LEHR(end,:)];
end
L2 = LEHR(:,1); Lw2 = L2 / del_M;  % cm, fork length
E2 = LEHR(:,2); Ww2 =  L2.^3 + w_E/ mu_E/ d_E * E2; % g, wet weight

% pack predictions:
prdData.tWwm  = [Ww1; Ww2];
prdData.tLm  = [Lw1; Lw2];


%% ParrBala2017
TC = TC_tL;

pT_M = TC * p_M; % maintenance rate constant, J / d.cm^3
vT = TC * v;     % energy conductance, cm / d
kT_J = TC * k_J;  % maturity maintenance rate, d-1
pT_Am = p_Am * TC;  % surface-area specific maximum assimilation rate, J / d.cm^2

% calculate initial conditions:
L01 = L0.tL  * del_M; % cm, initial structural length
E0  = (W0.tW - L01^3) * mu_E * d_E / w_E; % J, initial energy reserve

Initial_Conditions = [L01, E0, E_Hb, 0]; %
% lenght and weight
[t1, LEHR] = ode45(@ODE_DEB3, tL(:,1), Initial_Conditions, [], ...
    f_ParrBala2017, pT_Am, kap, kap_R, vT, kT_J, pT_M, E_G, E_Hp, E_0, kap_G, s_M);
L = LEHR(:,1); ELw = L / del_M;  % cm, fork length
E = LEHR(:,2); EWw =  L.^3 + w_E/ mu_E/ d_E * E; % g, wet weight

% reproduction
[t1, LEHR] = ode45(@ODE_DEB3, tN(:,1), Initial_Conditions, [], ...
    f_ParrBala2017, pT_Am, kap, kap_R, vT, kT_J, pT_M, E_G, E_Hp, E_0, kap_G, s_M);
R = LEHR(:,4);

%% BoroTaly2015
TC = TC_tL_Boro;

pT_M = TC * p_M; % maintenance rate constant, J / d.cm^3
vT = TC * v;     % energy conductance, cm / d
kT_J = TC * k_J;  % maturity maintenance rate, d-1
pT_Am = p_Am * TC;  % surface-area specific maximum assimilation rate, J / d.cm^2

% calculate initial conditions:
L01 = L0.tL_Boro  * del_M; % cm, initial structural length
E0  = L01^3 * E_m;     % assuming f = 1

Initial_Conditions = [L01, E0, E_Hb, 0]; %
% lenght and weight
[t1, LEHR] = ode45(@ODE_DEB3, tL_Boro(:,1), Initial_Conditions, [], ...
    f_Boro, pT_Am, kap, kap_R, vT, kT_J, pT_M, E_G, E_Hp, E_0, kap_G, s_M);
L = LEHR(:,1); ELw_Boro = L / del_M;  % cm, fork length


%% Aerl2004
% lenth-weight data from Aerl2004
LW_wf1 = (LWwf1(:,1) * del_M).^3 * (1 + f_Aerl2004 * w);

% lenth-weight data from Aerl2004
LW_wm1 = (LWwm1(:,1) * del_M).^3 * (1 + f_Aerl2004 * w);


prdData.tN = R;
prdData.tL = ELw;
prdData.tW = EWw;
prdData.LWwf1 = LW_wf1;
prdData.LWwm1 = LW_wm1;
prdData.tL_Boro = ELw_Boro;


%% starvation - univar5
% CONTROL
% initial conditions:
L01 = L0.u5_tL1  * del_M; % cm, initial structural length
E0 = (W0.u5_tL1  - L01^3) *mu_E * d_E / w_E; % J, initial energy reserve
ee = E0 / L01^3 / E_m;  % ee = 1.17
H0 = E_Hj *1.1; % J initial maturity is higher than metamorphosis
Initial_Conditions = [L01, E0, H0, 0]; %

% temp correction
pT_Am = p_Am * TC_u5;
vT = v * TC_u5;
kT_J = k_J * TC_u5;
pT_M = p_M * TC_u5;

f = 1; % we dont know what happens before, so we calculate s_M beforehand with f = 1 --> does it make sense?
[tj, tp, tb, lj , lp, lb ] = get_tj(pars_tj, f);
s_M = lj/lb; % USE SM AS AN INPUT IN THE ODE: OTHERWISE THEY MAY SHRINK TOO MUCH

f = f_u5; %
t = u5_tL1(:,1);
[t1 LEHR] = ode45(@ODE_DEB3, t, Initial_Conditions, [], ...
    f, pT_Am, kap, kap_R, vT, kT_J, pT_M, E_G, E_Hp, E0, kap_G, s_M);

L1      = LEHR(:,1); Lw1 = L1/ del_M;
E1      = LEHR(:,2); N1   = LEHR(:,4);
Ww1   =  L1.^3 + w_E/ mu_E/ d_E * E1;

% condition factor
CF = Ww1 .* 100000 .* (Lw1.*10).^(-3);
prdData.u5_tL1 = Lw1;
prdData.u5_tCF1 = CF;


% STARVED

% initial conditions:
L01 = L0.u5_tL2  * del_M; % cm, initial structural length
E0 = (W0.u5_tL2  - L01^3) *mu_E * d_E / w_E; % J, initial energy reserve
ee = E0 / L01^3 / E_m;  % ee = 1.17
H0 = E_Hj *1.1; % J initial maturity is higher than metamorphosis
Initial_Conditions = [L01, E0, H0, 0]; %

f = 0; % maybe a seperate one needed?

t = u5_tL2(:,1);
[t1 LEHR] = ode45(@ODE_DEB3, t, Initial_Conditions, [], ...
    f, pT_Am, kap, kap_R, vT, kT_J, pT_M, E_G, E_Hp, E_0, kap_G, s_M);

L1      = LEHR(:,1); Lw1 = L1/ del_M;
E1      = LEHR(:,2); N1   = LEHR(:,4);
Ww1   =  L1.^3 + w_E/ mu_E/ d_E * E1;
% condition factor
CF = Ww1 .* 100000 .* (Lw1.*10).^(-3);
prdData.u5_tL2 = Lw1;
prdData.u5_tCF2 = CF;


%     prdData.u10_tL1_A = Lw1;


end

%%  ODE_DEB3
%  starrlight, 29 jan 2013; last modified: 06/10/17

%% Syntax
%  [t LEHN] = ode45(@dget_LEH, time, initial_contitions, [], f, lb, lj, p_Am, kap, kap_R, v, k_J, p_M, E_G, E_Hp, E0)
%  dLEH  = dget_LEH(time, LEH, f, lb, lj, p_Am, kap, kap_R, v, k_J, p_M, E_G, E_Hp, E0)
%
%  Inputs:
%
% * time: n-1 matrix with time
% * LEH: 4-n vector with (L, E, E_H, N) of juvenile and adult
% * parameters: f, lb, lj, p_Am, kap, kap_R, v, k_J, p_M, E_G, E_Hp, E0
%
%  Outputs:
%
% * t: n-1 matrix with time
% * dLEH: n-4 matrix with (dL/dt, dE/dt, dH/dt, dN/dt)


%% Description
%  Standard DEB model with V1 morphic stage between birth and
%  metamorphosis if lb < lj. Otherwise organism is isomorphic throughout
%  its lifecycle. The cost for an egg, E0 is taken to be constant in
%  order to reduce computation time.
%  length at metamorphosis and length at birth must be evaluated before
%  hand so food level, f must remain constant.


%% Code

function dLEH = ODE_DEB3(t, LEH, f, p_Am, kap, kap_R, v, k_J, p_M, E_G, E_Hp, E0, kap_G, s_M) %#ok<INUSL>


L = LEH(1);     % cm, structural length
E = LEH(2);     % J, reserve E
E_H = LEH(3);   % J, maturity E_H
%N = LEH(4); % #/d, cum reproductive output

L_M = kap * p_Am/ p_M;  l = L/ L_M; % -, scaled structural length


%%
%  Shape correction function applies to surface-area specific
%  assimilation and energy conductance:
%
pA        = f * p_Am * s_M * L^2; % J/cm^2/d, maximum surface area-specific assimilation rate
v_new   = v * s_M;                     % cm/d, conductance

%%
% Growth rate and mobilization rate:
%
L2    = L * L; L3 = L2 * L; L4 = L3 * L;
pC = E/L3 * (E_G * v_new/ L  + p_M)/ (kap * E/ L3 + E_G );   % [p_C], J/cm^3 (2.12, Kooijman 2010)

if kap * pC < p_M
    r = (E * v_new/ L4  - p_M/ kap)/ (E/ L3 + E_G * kap_G/ kap); % 1/d, specific growth rate
else
    r = (E * v_new/ L4 - p_M/ kap)/ (E/ L3 + E_G/ kap); % 1/d, specific growth rate
end

%%
% generate dH/da, dE/da, dL/da:
%

dE_H  = ((1 - kap) * pC * L3 - k_J * E_H)   * (E_H<E_Hp);
dE_R =  ((1 - kap) * pC * L3 - k_J * E_Hp) * (E_H>=E_Hp);
dN     = kap_R * dE_R/ E0; % #/d, cum reproductive output
dE     = pA - pC * L3;
dL     = L * r/ 3;

%%
% Pack output
%
dLEH = [dL; dE; dE_H; dN];

end

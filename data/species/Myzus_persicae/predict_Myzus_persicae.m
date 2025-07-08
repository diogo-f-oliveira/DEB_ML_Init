function [prdData, info] = predict_Myzus_persicae(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

filterChecks = T_H < T_ref || T_AH < 0;

if filterChecks
    prdData = []; info = 0; return
end

% compute temperature correction factors
pars_T = [T_A; T_H; T_AH];
TC_20 = tempcorr(C2K(20), T_ref, pars_T);
TC_18 = tempcorr(C2K(18), T_ref, pars_T);
TC_22 = tempcorr(C2K(22), T_ref, pars_T);
TC_25 = tempcorr(C2K(25), T_ref, pars_T);

% zero-variate data

% life cycle
pars_tj = [g k v_Hb v_He s_j kap kap_V];
[tau_j, ~, tau_b, l_j, ~, l_b, rho_j, v_Rj, ~, info] = get_tj_hex(pars_tj, f);
% life cycle at f_1 (DaviRadc2007 - cultivar Red La Soda)
[tau_jf1, ~, tau_bf1, l_jf1, ~, l_bf1, rho_jf1, ~, ~, infof1] = get_tj_hex(pars_tj, f_1);
% life cycle at f_2 (CutlRama2009 - potato leaf discs)
[tau_jf2, ~, tau_bf2, l_jf2, ~, l_bf2, rho_jf2, ~, ~, infof2] = get_tj_hex(pars_tj, f_2);
% life cycle at f_3 (SataKers2008 - pepper leaves)
[tau_jf3, ~, tau_bf3, l_jf3, ~, l_bf3, rho_jf3, ~, ~, infof3] = get_tj_hex(pars_tj, f_3);
% life cycle at f_4 (DaviRadc2006 - Chinese cabbage)
[tau_jf4, ~, tau_bf4, l_jf4, ~, l_bf4, rho_jf4, ~, ~, infof4] = get_tj_hex(pars_tj, f_4);
% life cycle at f_5 (Weed1927 - spinach leaves)
[tau_jf5, ~, tau_bf5, l_jf5, ~, l_bf5, rho_jf5, ~, ~, infof5] = get_tj_hex(pars_tj, f_5);
% life cycle at f_6 (Fenj1945 - beet leaves)
[tau_jf6, ~, tau_bf6, l_jf6, ~, l_bf6, rho_jf6, ~, ~, infof6] = get_tj_hex(pars_tj, f_6);

if ~(info * infof1 * infof2 * infof3 * infof4 * infof5 * infof6)
    prdData = []; return
end

% initial
pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve at f

% birth
L_b = L_m * l_b;                  % cm, structural length at birth
Lw_b = L_b/ del_M;                % cm, body length at birth
Ww_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
p_J = k_J * E_Hb; % J/d, maturity maint rate is constant after birth

% larval instars length
Lw_1 = Lw_b;           % cm, struc length at start 1st inst
Lw_2 = Lw_1 * s_1^0.5; % cm, struc length at start 2nd inst
Lw_3 = Lw_2 * s_2^0.5; % cm, struc length at start 3rd inst
Lw_4 = Lw_3 * s_3^0.5; % cm, struc length at start 4th inst

% 9 day old at 22 degC
E_Rj = v_Rj * (1 - kap) * g * E_m; % J/cm^3, repro buffer density when reaching adult stage
ELEN_0 = [f * E_m * L_b^3; L_b; 0; 0]; % initial state vector
[t, ELEN] = ode45(@dget_ELEN, [0 9], ELEN_0, [], f, TC_22 * p_M, TC_22 * k_M, TC_22 * v/ L_b, TC_22 * p_J, TC_22 * p_Am/ L_b, E_m, g, kap, E_Rj);
Ww_9d = (ELEN(end,2).^3 + sum(ELEN(end,[1 3]), 2)/ mu_E * w_E/ d_E); % g, wet weight

% adult
L_j = L_m * l_j;                       % cm, structural length of adult
Lw_j = L_j/ del_M;                     % cm, body length of adult
t_j = (tau_jf1 - tau_bf1)/ k_M/ TC_20; % d, time from 1st inst to adult at f_1

% larval instars development at f_6 (Fenj1945 - beet leaves)
r_j = TC_18 * g * k_M * (f_6/ l_bf6 - 1)/ (f_6 + g); % 1/d, specific growth rate at 18 degC
t_1 = log(s_1^0.5) * 3/ r_j; % d, time from 1st to 2nd inst at 18 degC
t_2 = log(s_2^0.5) * 3/ r_j; % d, time from 2nd to 3rd inst at 18 degC
t_3 = log(s_3^0.5) * 3/ r_j; % d, time from 3rd to 4th inst at 18 degC
l_4f6 = l_bf6 * (s_1 * s_2 * s_3)^0.5; % scaled length at start 4th inst at f_6
t_4 = log(l_jf6/ l_4f6) * 3/ r_j; % d, time from 4th inst to adu at 18 degC

% reproduction (no kappa-rule; no maternal effects rule)
s_M = l_jf1/ l_bf1; % -, acceleration factor during adult stage
R_i20 = TC_20 * kap_R * (f_1 * p_Am * s_M * L_j^2 - p_M * L_j^3 - k_J * E_Hb)/ E_0; % #/d, ultimate reproduction rate at T
s_M = l_jf2/ l_bf2; % -, acceleration factor during adult stage
R_i25 = TC_25 * kap_R * (f_2 * p_Am * s_M * L_j^2 - p_M * L_j^3 - k_J * E_Hb)/ E_0; % #/d, ultimate reproduction rate at T

% life span at f_2 (CutlRama2009 - potato leaf discs)
% adapted from get_tm_mod for abp model but with emergence induced by v_Rj instead of puberty induced by v_Hp; age counted from embryo
options = odeset('Events', @dead_for_sure, 'NonNegative', ones(4,1), 'AbsTol', 1e-7, 'RelTol', 1e-7);  
[S_b, q_b, h_Ab, tau_b] = get_Sb([g k v_Hb (h_a/ k_M^2) s_G], f_2);
qhSt_b = [max(0,q_b); max(0,h_Ab); S_b; tau_b]; % initial state vars
[tau, qhSt] = ode45(@dget_qhSt_abp, [0; tau_jf2 - tau_bf2; 1e8], qhSt_b, options, f_2, tau_jf2 - tau_bf2, l_bf2, l_jf2, rho_jf2, g, s_G, (h_a/ k_M^2));
tau_mf2 = qhSt(end,4);
tau_jmf2 = tau_mf2 - (tau_jf2 - tau_bf2) - tau_b;
a_jm = tau_jmf2/ k_M/ TC_25;

% pack to output
prdData.tj = t_j;
prdData.t1 = t_1;
prdData.t2 = t_2;
prdData.t3 = t_3;
prdData.t4 = t_4;
prdData.am = a_jm;
prdData.Lb = Lw_b;
prdData.L2 = Lw_2;
prdData.L3 = Lw_3;
prdData.L4 = Lw_4;
prdData.Lj = Lw_j;
prdData.Wwb = Ww_b;
prdData.Ww9d = Ww_9d;
prdData.Ri20 = R_i20;
prdData.Ri25 = R_i25;

% uni-variate data

% temperature - time since birth when reaching adult stage

% SataKers2008 - pepper leaves (f_3)
T_tj_1 = (tau_jf3 - tau_bf3) / k_M ./ tempcorr(C2K(data.Ttj_1(:,1)), T_ref, pars_T); % d, time since birth at adult stage
% Weed1927 - spinach leaves (f_5)
T_tj_2 = (tau_jf5 - tau_bf5) / k_M ./ tempcorr(C2K(data.Ttj_2(:,1)), T_ref, pars_T); % d, time since birth at adult stage
% Fenj1945 - beet leaves (f_6)
T_tj_3 = (tau_jf6 - tau_bf6) / k_M ./ tempcorr(C2K(data.Ttj_3(:,1)), T_ref, pars_T); % d, time since birth at adult stage

% temperature - development time of instars

TC_T2 = tempcorr(C2K(data.Ttj_2(:,1)), T_ref, pars_T);

% larval instars development
rT_j = TC_T2 * g * k_M * (f_5/ l_bf5 - 1)/ (f_5 + g); % 1/d, specific growth rate
tT_1 = log(s_1^0.5) * 3./ rT_j; % time from 1st to 2nd inst
tT_2 = log(s_2^0.5) * 3./ rT_j; % time from 2nd to 3rd inst
tT_3 = log(s_3^0.5) * 3./ rT_j; % time from 3rd to 4th inst
l_4f5 = l_bf5 * (s_1 * s_2 * s_3)^0.5; % scaled length at start 4th inst at f_5
tT_4 = log(l_jf5/ l_4f5) * 3./ rT_j; % time from 4th inst to adu at f_5

% temperature - preoviposition period (assuming independence of f for simplicity)

% Weed1927 - spinach leaves
T_t0R1 = t_0R ./ tempcorr(C2K(data.Tt0R1(:,1)), T_ref, pars_T);

% Fenj1945 - beet leaves
T_t0R2 = t_0R ./ tempcorr(C2K(data.Tt0R2(:,1)), T_ref, pars_T);

% temperature - average life span

% SataKers2008 - pepper leaves (f_3)
[S_b, q_b, h_Ab, tau_b] = get_Sb([g k v_Hb (h_a/ k_M^2) s_G], f_3);
qhSt_b = [max(0,q_b); max(0,h_Ab); S_b; tau_b]; % initial state vars
[tau, qhSt] = ode45(@dget_qhSt_abp, [0; tau_jf3 - tau_bf3; 1e8], qhSt_b, options, f_3, tau_jf3 - tau_bf3, l_bf3, l_jf3, rho_jf3, g, s_G, (h_a/ k_M^2));
tau_mf3 = qhSt(end,4);
T_am1 = (tau_mf3 - tau_b)/ k_M ./ tempcorr(C2K(data.Tam1(:,1)), T_ref, pars_T);

% DaviRadc2006 - Chinese cabbage (f_4)
[S_b, q_b, h_Ab, tau_b] = get_Sb([g k v_Hb (h_a/ k_M^2) s_G], f_4);
qhSt_b = [max(0,q_b); max(0,h_Ab); S_b; tau_b]; % initial state vars
[tau, qhSt] = ode45(@dget_qhSt_abp, [0; tau_jf4 - tau_bf4; 1e8], qhSt_b, options, f_4, tau_jf4 - tau_bf4, l_bf4, l_jf4, rho_jf4, g, s_G, (h_a/ k_M^2));
tau_mf4 = qhSt(end,4);
T_am2 = (tau_mf4 - tau_b)/ k_M ./ tempcorr(C2K(data.Tam2(:,1)), T_ref, pars_T);

% Weed1927 - spinach leaves (f_5)
[S_b, q_b, h_Ab, tau_b] = get_Sb([g k v_Hb (h_a/ k_M^2) s_G], f_5);
qhSt_b = [max(0,q_b); max(0,h_Ab); S_b; tau_b]; % initial state vars
[tau, qhSt] = ode45(@dget_qhSt_abp, [0; tau_jf5 - tau_bf5; 1e8], qhSt_b, options, f_5, tau_jf5 - tau_bf5, l_bf5, l_jf5, rho_jf5, g, s_G, (h_a/ k_M^2));
tau_mf5 = qhSt(end,4);
T_am3 = (tau_mf5 - tau_b)/ k_M ./ tempcorr(C2K(data.Tam3(:,1)), T_ref, pars_T);

% Fenj1945 - beet leaves (f_6)
[S_b, q_b, h_Ab, tau_b] = get_Sb([g k v_Hb (h_a/ k_M^2) s_G], f_6);
qhSt_b = [max(0,q_b); max(0,h_Ab); S_b; tau_b]; % initial state vars
[tau, qhSt] = ode45(@dget_qhSt_abp, [0; tau_jf6 - tau_bf6; 1e8], qhSt_b, options, f_6, tau_jf6 - tau_bf6, l_bf6, l_jf6, rho_jf6, g, s_G, (h_a/ k_M^2));
tau_mf6 = qhSt(end,4);
T_am4 = (tau_mf6 - tau_b)/ k_M ./ tempcorr(C2K(data.Tam4(:,1)), T_ref, pars_T);

% temperature - maximum reproduction rate (no kappa-rule; no maternal effects rule)

% SataKers2008 - pepper leaves (f_3)
TC = tempcorr(C2K(data.TRi1(:,1)), T_ref, pars_T);
L_jf3 = L_m * l_jf3; % cm, structural length of adult at f_3
s_M = l_jf3/ l_bf3; % -, acceleration factor
TR_i1 = TC * kap_R * (f_3 * p_Am * s_M * L_jf3^2 - p_M * L_jf3^3 - k_J * E_Hb)/ E_0; % #/d, ultimate reproduction rate at T

% DaviRadc2006 - Chinese cabbage (f_4)
TC = tempcorr(C2K(data.TRi2(:,1)), T_ref, pars_T);
L_jf4 = L_m * l_jf4; % cm, structural length of adult at f_4
s_M = l_jf4/ l_bf4; % -, acceleration factor
TR_i2 = TC * kap_R * (f_4 * p_Am * s_M * L_jf4^2 - p_M * L_jf4^3 - k_J * E_Hb)/ E_0; % #/d, ultimate reproduction rate at T

% Weed1927 - spinach leaves (f_5)
TC = tempcorr(C2K(data.TRi3(:,1)), T_ref, pars_T);
L_jf5 = L_m * l_jf5; % cm, structural length of adult at f_5
s_M = l_jf5/ l_bf5; % -, acceleration factor
TR_i3 = TC * kap_R * (f_5 * p_Am * s_M * L_jf5^2 - p_M * L_jf5^3 - k_J * E_Hb)/ E_0; % #/d, ultimate reproduction rate at T

% Fenj1945 - beet leaves (f_6)
TC = tempcorr(C2K(data.TRi4(:,1)), T_ref, pars_T);
L_jf6 = L_m * l_jf6; % cm, structural length of adult at f_6
s_M = l_jf6/ l_bf6; % -, acceleration factor
TR_i4 = TC * kap_R * (f_6 * p_Am * s_M * L_jf6^2 - p_M * L_jf6^3 - k_J * E_Hb)/ E_0; % #/d, ultimate reproduction rate at T

% time - gained wet weight
ELEN_0 = [f * E_m * L_b^3; L_b; 0; 0]; % initial state vector
[t, ELEN] = ode45(@dget_ELEN, [0 max(tWw(:,1))], ELEN_0, [], f, TC_20 * p_M, TC_20 * k_M, TC_20 * v/ L_b, TC_20 * p_J, TC_20 * p_Am/ L_b, E_m, g, kap, E_Rj);
Ww = (ELEN(:,2).^3 + sum(ELEN(:,[1 3]), 2)/ mu_E * w_E/ d_E); % g, wet weight
Ww_0 = Ww(1);
t_Ww = (interp1(t(:), Ww(:), tWw(:,1))); % g, wet weight over time
t_Ww = t_Ww - Ww_0; % g, wet weight over time gained since birth

% pack to output
prdData.Ttj_1 = T_tj_1;
prdData.Ttj_2 = T_tj_2;
prdData.Ttj_3 = T_tj_3;
prdData.Tt0R1 = T_t0R1;
prdData.Tt0R2 = T_t0R2;
prdData.Tt1 = tT_1;
prdData.Tt2 = tT_2;
prdData.Tt3 = tT_3;
prdData.Tt4 = tT_4;
prdData.Tam1 = T_am1;
prdData.Tam2 = T_am2;
prdData.Tam3 = T_am3;
prdData.Tam4 = T_am4;
prdData.TRi1 = TR_i1;
prdData.TRi2 = TR_i2;
prdData.TRi3 = TR_i3;
prdData.TRi4 = TR_i4;
prdData.tWw = t_Ww;

end

%% subfunctions

% ODE system for hex model without pupa phase and with adults still feeding and investing in reproduction
% release rate of offspring is assumed to match the reproduction investment of the adult (so d_ER is net zero)
% preoviposition period not implemented yet, but may be added as a temperature-dependet time-based trigger after reaching E_Rj
function dELEN = dget_ELEN(t, ELEN, f, p_M, k_M, k_E, p_J, p_Am, E_m, g, kap, E_Rj)
% t: time since birth

% unpack variables
E   = ELEN(1); % J, reserve
L   = ELEN(2); % cm, structural length
E_R = ELEN(3); % J, reproduction buffer
N   = ELEN(4); % J, cumulative energy lost through the release of offspring

V = L^3;                          % cm^3, structural volume
e = E/ V/ E_m;                    % -, scaled reserve density
r = (e * k_E - g * k_M)/ (e + g); % 1/d, specific growth rate
p_C = E * (k_E - r);              % J/d, mobilisation rate

dE = f * p_Am * V - p_C;          % J/d, change in reserve
dL = r * L/ 3;                    % cm/d, change in length
dE_R = (1 - kap) * p_C - p_J;     % J/d, change in reprod buffer
dN = 0;                           % J/d, change in embryo investment

if ((E_R/ V) >= E_Rj)
p_C = E * k_E;                    % J/d, mobilisation rate
dE = f * p_Am * V - p_C;          % J/d, change in reserve
dL = 0;                           % cm/d, change in length
dE_R = 0;                         % J/d, change in reprod buffer
dN = p_C - p_M * V - p_J;         % J/d, change in cumulative energy lost through the release of offspring
end

dELEN = [dE; dL; dE_R; dN];
end

% event dead_for_sure
% adapted from DEBtool function get_tm_mod
function [value,isterminal,direction] = dead_for_sure(~, qhSt, varargin)
%   value = qhSt(3) > 1e-6;  % trigger (newer MATLAB versions)
  value = qhSt(3) - 1e-6;  % trigger (older MATLAB versions)
  isterminal = 1;  % terminate after the last event
  direction  = [];  % get all the zeros
end

% simplified aging for abp model, no thinning, no h_B
% adapted from DEBtool function get_tm_mod for abp model
function dqhSt = dget_qhSt_abp(tau, qhSt, f, tau_p, l_b, l_p, rho_j, g, s_G, h_a)
  % tau: scaled time since birth
  q   = qhSt(1); % -, scaled aging acceleration
  h_A = qhSt(2); % -, scaled hazard rate due to aging
  S   = qhSt(3); % -, survival prob
  %t  = qhSt(4); % -, scaled cumulative survival
  
  if tau < tau_p
    l = l_b * exp(tau * rho_j/3);
    r = rho_j;
    s_M = l/l_b;
  else % adult
    l = l_p;
    r = 0;
    s_M = l_p/l_b;
  end
  
  dq = f * (q * l^3 * s_G + h_a) * (g * s_M/ l - r) - r * q;
  dh_A = q - r * h_A;
  h = h_A; 
  dS = - h * S;
  dt = S;
  
  dqhSt = [dq; dh_A; dS; dt]; 
end

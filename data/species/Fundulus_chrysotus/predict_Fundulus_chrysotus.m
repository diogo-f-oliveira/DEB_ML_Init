function [prdData, info] = predict_Fundulus_chrysotus(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

%% zero-variate data   
% life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);


% birth
L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

% metam
L_j = L_m * l_j;                  % cm, structural length at metam
tT_j = (tau_j - tau_b)/ kT_M;     % d, time since birth at metam

% puberty
tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at metam

% ultimate
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate total length at f
Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
RT_i = TC * reprod_rate_j(L_i, f, pars_R);  % reproduction rate at TL 5 cm

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

% length at 91 d
Lw_91 = (L_i - (L_i - L_j) * exp(-kT_M * rho_B * (91- tT_j)))/ del_M; % cm, TL at 91 d

% pack to output
prdData.tp = tT_p;
prdData.am = aT_m;
prdData.L91 = Lw_91;
prdData.Li = Lw_i; 
prdData.Wwb = Ww_b;
prdData.Wwi = Ww_i;
prdData.Ri = RT_i;


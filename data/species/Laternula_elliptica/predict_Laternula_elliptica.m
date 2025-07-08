function [prdData, info] = predict_Laternula_elliptica(par, data, auxData)

% Unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par); vars_pull(cPar); vars_pull(data); vars_pull(auxData);

%% Compute temperature correction factors
TC       = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

%% Zero-variate data
 % Life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, ~, ~, info] = get_tj(pars_tj, f); % -, scaled times & lengths at f

% Birth
L_b  = L_m * l_b;                 % cm, structural length at birth at f
Lw_b = L_b / del_M;               % cm, physical length at birth at f
Ww_b = L_b^3 * (1 + f * w);       % g,  wet weight at birth at f 

% Metamorphosis
L_j  = L_m * l_j;                 % cm, structural length at metamorphosis at f
Lw_j = L_j / del_M;               % cm, physical length at metamorphosis at f
s_M = l_j/ l_b;                   % -, acceleration factor
 
% Puberty
tT_p = (t_p - t_b) / k_M / TC;    % d,  time since birth at puberty at f and T

% Ultimate
L_i  = L_m * l_i;                 % cm, ultimate structural length at f
Lw_i = L_i / del_M;               % cm, ultimate physical length at f

% reproduction
% max gonado-somatic index of fully grown individual 
%   that spawns once per year see (4.89) of DEB3
GSI = 365 * TC * k_M * g/ f^3/ (f + kap * g * y_V_E);
GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^2); % mol E_R/ mol W

% Life span
pars_tm = [g; l_T; h_a / k_M^2; s_G]; % compose parameter vector at T_ref
t_m     = get_tm_s(pars_tm, f, l_b);  % -, scaled mean life span at T_ref
aT_m    = t_m / k_M / TC;             % d, mean life span at T

 % Pack to output
prdData.tp  = tT_p;
prdData.am  = aT_m;
prdData.Lj  = Lw_j;
prdData.Li  = Lw_i;
prdData.Wwb = Ww_b;
prdData.GSI = GSI;

%% Uni-variate data
% inshore
% time-length, post metam
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
L_j = l_j * L_m; L_i = l_i * L_m;
L = L_i - (L_i - L_j) * exp(-rT_B * (tL(:,1) - tT_j)); % cm, struc length
ELw  = L/ del_M;                                      % g, shell-free wet weight

% length-weight
EWw  = (LWw(:,1)*del_M).^3 * (1 + f * w);              % g, shell-free wet weight

% Pack to output
prdData.tL   = ELw;
prdData.LWw  = EWw;

end

function [prdData, info] = predict_Zygochlamys_patagonica(par, data, auxData)

% Unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par); vars_pull(cPar); vars_pull(data); vars_pull(auxData);

%% Compute temperature correction factors
TC       = tempcorr(temp.am, T_ref, T_A);
TC_Bea   = tempcorr(temp.tL1, T_ref, T_A);
TC_Uru   = tempcorr(temp.tL2, T_ref, T_A);

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
 
% Puberty
tT_p = (t_p - t_b) / k_M / TC;    % d,  time since birth at puberty at f and T

% Ultimate
L_i  = L_m * l_i;                 % cm, ultimate structural length at f
Lw_i = L_i / del_M;               % cm, ultimate physical length at f

% Reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T

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

%% Uni-variate data
% Beagle
% time-length, post metam
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_Bea);
kT_M = k_M * TC_Bea; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
L_j = l_j * L_m; L_i = l_i * L_m;
L = L_i - (L_i - L_j) * exp(-rT_B * (tL1(:,1) - tT_j)); % cm, struc length
ELw_1  = L/ del_M;                                      % cm, shell height
% time-weight
EWw_1  = L.^3 * (1 + f_Bea * w);                        % g, shell-free wet weight
% time-gonadal weight
EWw_R1 = TC_Bea * Ww_b * 365 * reprod_rate_j(L, f_Bea, pars_R); % g, gonadal weight
%
% Uruguay
% time-length, post metam
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_Uru);
kT_M = k_M * TC_Uru; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
L_j = l_j * L_m; L_i = l_i * L_m;
L = L_i - (L_i - L_j) * exp(-rT_B * (tL2(:,1) - tT_j)); % cm, struc length
ELw_2  = L/ del_M;                                      % cm, shell height
% time-weight
EWw_2  = L.^3 * (1 + f_Bea * w);                        % g, shell-free wet weight
% time-gonadal weight
EWw_R2 = TC_Uru * Ww_b * 365 * reprod_rate_j(L, f_Uru, pars_R); % g, gonadal weight

% Pack to output
prdData.tL1   = ELw_1;
prdData.tL2   = ELw_2;
prdData.tW1   = EWw_1;
prdData.tW2   = EWw_2;
prdData.tWR1  = EWw_R1;
prdData.tWR2  = EWw_R2;

end

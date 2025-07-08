function [prdData, info] = predict_Crassostrea_virginica(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par); vars_pull(cPar); vars_pull(data); vars_pull(auxData);

% compute temperature correction factors
TC_ab           = tempcorr(temp.ab, T_ref, T_A);
TC_aj           = tempcorr(temp.aj, T_ref, T_A);
TC_ap           = tempcorr(temp.ap, T_ref, T_A);
TC_am           = tempcorr(temp.am, T_ref, T_A);
TC_Ri           = tempcorr(temp.Ri, T_ref, T_A);
TC_HopkMack1953 = tempcorr(temp.tL_HopkMack1953, T_ref, T_A);
TC_MannSout2009 = tempcorr(temp.tL_MannSout2009, T_ref, T_A);
TC_PaynPoli2010 = tempcorr(temp.tL_PaynPoli2010, T_ref, T_A);
TC_10           = tempcorr(temp.WdJO_10, T_ref, T_A);
TC_20           = tempcorr(temp.WdJO_20, T_ref, T_A);
TC_30           = tempcorr(temp.WdJO_30, T_ref, T_A);
TC_XJX          = tempcorr(temp.XJX, T_ref, T_A);

%% Zero-variate data
% Life cycle
pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, ~, ~, info] = get_tj(pars_tj, f); % -, scaled times & lengths at f

% Birth
L_b  = L_m * l_b;                 % cm, structural length at birth at f
Lw_b = L_b / del_Mb;              % cm, physical length at birth at f
Wd_b = L_b^3 * d_V * (1 + f * w); % g,  dry weight at birth at f
aT_b = t_b / k_M / TC_ab;         % d,  age at birth at f and T

% Metamorphosis
L_j  = L_m * l_j;                 % cm, structural length at metamorphosis at f
Lw_j = L_j / del_Mb;              % cm, physical length at metamorphosis at f
Wd_j = L_j^3 * d_V * (1 + f * w); % g,  dry weight at metamorphosis at f
aT_j = t_j / k_M / TC_aj;         % d,  age at metamorphosis at f and T
s_M  = l_j / l_b;                 % -,  acceleration factor for v and {p_Am} at f

% Puberty 
L_p  = L_m * l_p;                 % cm, structural length at puberty at f
Lw_p = L_p / del_Mj;              % cm, physical length at puberty at f
Wd_p = L_p^3 * d_V * (1 + f * w); % g,  dry weight at puberty at f
aT_p = t_p / k_M / TC_ap;         % d,  age at puberty at f and T

% Ultimate
L_i  = L_m * l_i;                 % cm, ultimate structural length at f
Lw_i = L_i / del_Mj;              % cm, ultimate physical length at f
Wd_i = L_i^3 * d_V * (1 + f * w); % g,  ultimate dry weight

% Reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
RT_i   = TC_Ri * reprod_rate_j(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

% Life span
pars_tm = [g; l_T; h_a / k_M^2; s_G];
t_m     = get_tm_s(pars_tm, f, l_b); % -, scaled mean life span at T_ref
aT_m    = t_m / k_M / TC_am;         % d, mean life span at T

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
% tL data from HopkMack1953
f = f_HopkMack1953; TC = TC_HopkMack1953; tL = tL_HopkMack1953;
[t_j, ~, t_b, l_j, ~, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
rT_j = TC * rho_j * k_M; rT_B = TC * rho_B * k_M;
L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
tT_j = (t_j - t_b) / k_M / TC;                                    % d,  time since birth at metamorphosis
t_bj = tL(tL(:,1) < tT_j,1);                                      % d,  select times before metamorphosis
L_bj = (L_b * exp(t_bj * rT_j / 3)) / del_Mb;                     % cm, physical length at exponential growth as V1-morph
t_ji = tL(tL(:,1) >= tT_j,1);                                     % d,  select times after metamorphosis
L_ji = (L_i - (L_i - L_j) * exp(-rT_B * (t_ji - tT_j))) / del_Mj; % cm, physical length at isomorphic growth
EL_HopkMack1953 = [L_bj; L_ji];                                   % cm,  expected physical length at time

% tL data from MannSout2009
f = f_MannSout2009; TC = TC_MannSout2009; tL = tL_MannSout2009;
[t_j, ~, t_b, l_j, ~, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
rT_j = TC * rho_j * k_M; rT_B = TC * rho_B * k_M;
L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
tT_j = (t_j - t_b) / k_M / TC;                                    % d,  time since birth at metamorphosis
t_bj = tL(tL(:,1) < tT_j,1);                                      % d,  select times before metamorphosis
L_bj = (L_b * exp(t_bj * rT_j / 3)) / del_Mb;                     % cm, physical length at exponential growth as V1-morph
t_ji = tL(tL(:,1) >= tT_j,1);                                     % d,  select times after metamorphosis
L_ji = (L_i - (L_i - L_j) * exp(-rT_B * (t_ji - tT_j))) / del_Mj; % cm, physical length at isomorphic growth
EL_MannSout2009 = [L_bj; L_ji];                                   % cm,  expected physical length at time

% tL data from PaynPoli2010
f = f_PaynPoli2010; TC = TC_PaynPoli2010; tL = tL_PaynPoli2010;
[t_j, ~, t_b, l_j, ~, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
rT_j = TC * rho_j * k_M; rT_B = TC * rho_B * k_M;
L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
tT_j = (t_j - t_b) / k_M / TC;                                    % d,  time since birth at metamorphosis
t_bj = tL(tL(:,1) < tT_j,1);                                      % d,  select times before metamorphosis
L_bj = (L_b * exp(t_bj * rT_j / 3)) / del_Mb;                     % cm, physical length at exponential growth as V1-morph
t_ji = tL(tL(:,1) >= tT_j,1);                                     % d,  select times after metamorphosis
L_ji = (L_i - (L_i - L_j) * exp(-rT_B * (t_ji - tT_j))) / del_Mj; % cm, physical length at isomorphic growth
EL_PaynPoli2010 = [L_bj; L_ji];                                   % cm,  expected physical length at time

% LWw data from CasaLape2011
f   = f_CasaLape2011;
EWw = (LWw(:,1) * del_Mj).^3 * (1 + w * f); % g, expected wet weight

% Respiration data from Dame1972
p_ref  = p_Am * L_m^2; % J/d, max assimilation power at max size and T_ref
pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
% at T = 10 C
f      = 1;
e      = 1;                                                         % -,     scaled reserve density e = f at f = 1
TC     = TC_10;                                                     % -,     temperature correction factor
L      = (WdJO_10(:,1) / (1 + f * w) / d_V).^(1/3);                 % cm,    structural length
l      = L / L_m;                                                   % -,     scaled length
p_ref  = TC * (p_Am * s_M) * L_m^2;                                 % J/d,   reference power after metamorphosis
p_A    = f * l.^2;                                                  % -,     scaled assimilation power (page 78 DEB book)
p_D    = kap * l.^3  + (1 - kap) * e .* l.^2 .* (g + l) ./ (g + e); % -,     scaled dissapating power (page 77 DEB book)
p_G    = kap * l.^2 .* (e - l - l_T) / (1 + e / g);                 % -,     scaled growth power (page 78 DEB book)
p_ADG  = p_ref * [p_A, p_D, p_G];                                   % J/d,   basic powers
J_M    = -(n_M \ n_O) * eta_O * p_ADG';                             % mol/d, mineral fluxes
J_O    = -24.4e9 / 24 * J_M(3,:)';                                  % nL/h,  O2-consumption (from predict_Crassostrea_gigas)
EJO_10 = J_O / 1000;                                                % µL/h,  O2-consumption
% at T = 20 C
TC     = TC_20;                                                     % -,     temperature correction factor
L      = (WdJO_20(:,1) / (1 + f * w) / d_V).^(1/3);                 % cm,    structural length
l      = L / L_m;                                                   % -,     scaled length
p_ref  = TC * (p_Am * s_M) * L_m^2;                                 % J/d,   reference power after metamorphosis
p_A    = f * l.^2;                                                  % -,     scaled assimilation power (page 78 DEB book)
p_D    = kap * l.^3  + (1 - kap) * e .* l.^2 .* (g + l) ./ (g + e); % -,     scaled dissapating power (page 77 DEB book)
p_G    = kap * l.^2 .* (e - l - l_T) / (1 + e / g);                 % -,     scaled growth power (page 78 DEB book)
p_ADG  = p_ref * [p_A, p_D, p_G];                                   % J/d,   basic powers
J_M    = -(n_M \ n_O) * eta_O * p_ADG';                             % mol/d, mineral fluxes
J_O    = -24.4e9 / 24 * J_M(3,:)';                                  % nL/h,  O2-consumption (from predict_Crassostrea_gigas)
EJO_20 = J_O / 1000;                                                % µL/h,  O2-consumption
% at T = 30 C
TC     = TC_30;                                                     % -,     temperature correction factor
L      = (WdJO_30(:,1) / (1 + f * w) / d_V).^(1/3);                 % cm,    structural length
l      = L / L_m;                                                   % -,     scaled length
p_ref  = TC * (p_Am * s_M) * L_m^2;                                 % J/d,   reference power after metamorphosis
p_A    = f * l.^2;                                                  % -,     scaled assimilation power (page 78 DEB book)
p_D    = kap * l.^3  + (1 - kap) * e .* l.^2 .* (g + l) ./ (g + e); % -,     scaled dissapating power (page 77 DEB book)
p_G    = kap * l.^2 .* (e - l - l_T) / (1 + e / g);                 % -,     scaled growth power (page 78 DEB book)
p_ADG  = p_ref * [p_A, p_D, p_G];                                   % J/d,   basic powers
J_M    = -(n_M \ n_O) * eta_O * p_ADG';                             % mol/d, mineral fluxes
J_O    = -24.4e9 / 24 * J_M(3,:)';                                  % nL/h,  O2-consumption (from predict_Crassostrea_gigas)
EJO_30 = J_O / 1000;                                                % µL/h,  O2-consumption

% Ingestion data from CasaLava(in prep)
TC  = TC_XJX;
V   = (L0 * del_Mj).^3;                               % cm^3,    structural volume for L0 = 7 cm
X   = XJX(:,1);                                       % C-mol/L, food concentration
CR  = F_m * TC ./ (1 + X * F_m / J_XFm) * V^(2/3);    % L/d,     clearance rate
EJX = CR/ 24;                                         % L/h,     expected clearance rate

% Pack to output
prdData.tL_HopkMack1953 = EL_HopkMack1953;
prdData.tL_MannSout2009 = EL_MannSout2009;
prdData.tL_PaynPoli2010 = EL_PaynPoli2010;
prdData.LWw             = EWw;
prdData.WdJO_10         = EJO_10;
prdData.WdJO_20         = EJO_20;
prdData.WdJO_30         = EJO_30;
prdData.XJX             = EJX;


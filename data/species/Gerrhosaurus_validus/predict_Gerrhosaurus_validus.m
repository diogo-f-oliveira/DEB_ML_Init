function [prdData, info] = predict_Gerrhosaurus_validus(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
TC = tempcorr(temp.am, T_ref, T_A);

%% zero-variate data

% life cycle
pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
[t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

% birth
L_b = L_m * l_b;                  % cm, structural length at birth at f
Lw_b = L_b/ del_M;                % cm, SVL at birth at f
Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, SVL at puberty at f

% ultimate
l_i = f - l_T;                    % -, scaled ultimate length at f
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate SVL at f
Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

%% pack to output
prdData.ab = aT_b;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Li = Lw_i;
prdData.Wwb = Ww_b;
prdData.Wwi = Ww_i;
prdData.Ri = RT_i;

%% uni-variate data

% length-weight
LWw = (LW(:,1) * del_M).^3 * (1 + f * w);       % g, wet weight

% time-length/weight
rT_B = TC * k_M/ 3/ (1 + f_tL * w);             % 1/d, von Bert growth rate
L_i = f_tL * L_m; L_b = get_lb([g; k; v_Hb], f_tL) * L_m; 
ELw = (L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)))/ del_M; % cm, SVL
EWw = (L_i - (L_i - L_b) * exp( - rT_B * tL1(:,1))).^3 * (1 + f_tL * w); % g, wet weight
%
rT_B = TC * k_M/ 3/ (1 + f_tL1 * w);             % 1/d, von Bert growth rate
L_i = f_tL1 * L_m; L_b = get_lb([g; k; v_Hb], f_tL1) * L_m; 
ELw_1 = (L_i - (L_i - L_b) * exp( - rT_B * tW(:,1)))/ del_M; % cm, SVL
EWw_1 = (L_i - (L_i - L_b) * exp( - rT_B * tW1(:,1))).^3 * (1 + f_tL * w); % g, wet weight

%% pack to output
% the names of the fields in the structure must be the same as the data names in the mydata file
prdData.LW = LWw;
prdData.tL = ELw;
prdData.tL1 = ELw_1;
prdData.tW = EWw;
prdData.tW1 = EWw_1;

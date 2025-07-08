function [prdData, info] = predict_Christinus_marmoratus(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
TC_ab = tempcorr(temp.ab, T_ref, T_A);
TC = tempcorr(temp.am, T_ref, T_A);

%% zero-variate data

% life cycle
pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
[t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

% initial
pars_UE0 = [V_Hb; g; k_J ;k_M; v];
U_E0 = initial_scaled_reserve(f, pars_UE0); %d.cm2, initial scaled reserve. Fraction des réserves restantes at birth
Ww_0 = U_E0 * p_Am * w_E/ mu_E/ d_V; % g, initial wet weight

% birth
L_b = L_m * l_b;                  % cm, structural length at birth at f
Lw_b = L_b/ del_M;                % cm, physical length at birth at f
Ww_b = L_b^3 * (1 + f * w); % g, dry weight at birth at f (remove d_V for wet weight)
aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
Ww_p = L_p^3 * (1 + f * w); % g, dry weight at puberty (remove d_V for wet weight)

% ultimate
l_i = f - l_T;                    % -, scaled ultimate length at f
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
Ww_i = L_i^3 * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

% pack to output
prdData.ab = aT_b;
prdData.am = aT_m;
prdData.Lp = Lw_p;
prdData.Li = Lw_i;
prdData.Ww0 = Ww_0;
prdData.Wwb = Ww_b;
prdData.Ri = RT_i;

%% uni-variate data

% age - dry weight
par_UE0 = [V_Hb; g; k_J; k_M; v]; U_E0 = initial_scaled_reserve(1, par_UE0)/ TC_ab;
[t, LUH] = ode45(@dget_LUH, tW(:,1), [1e-10; U_E0; 1e-10], [], kap, TC_ab * v, TC_ab * k_J, g, L_m);
EWd = 1e3 * LUH(:,1).^3 * (1 + f_tW * w) * d_V; % mg, dry weight 

% age - respiration
[t, LUH] = ode45(@dget_LUH, tJO(:,1), [1e-10; U_E0; 1e-10], [], kap, TC_ab * v, TC_ab * k_J, g, L_m); 
p_ref = p_Am * L_m^2; % max assimilation power at max size
O2M = (- n_M\n_O)';   % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
pACSJGRD = p_ref * scaled_power(LUH(:,1), f, pars_pow, l_b, l_p);
pADG = pACSJGRD(:, [1 7 5]); 
JO = pADG * eta_O';        % organic fluxes
JM = JO * O2M;             % mineral fluxes
X_gas  = 1/ 24.4;          % mol/L, mol of gas per litre at 20 C and 1 bar
EJO = - 1e6 * JM(:,3) .* TC_ab/ 24/ X_gas;  % muL/h, dioxygen consumption rate at temp T

% length-weight
EWw = (LW(:,1) * del_M).^3 * (1 + f * w);

%% pack to output
prdData.tW = EWd;
prdData.tJO = EJO;
prdData.LW = EWw;

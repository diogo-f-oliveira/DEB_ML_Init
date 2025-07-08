function [prdData, info] = predict_Sceloporus_graciosus(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par); 
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
TC_ab = tempcorr(temp.ab, T_ref, T_A);
TC = tempcorr(temp.am, T_ref, T_A);
TC_LdL = tempcorr(temp.LdL, T_ref, T_A);

%% zero-variate data

% life cycle
pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
[t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

% birth
L_b = L_m * l_b;                  % cm, structural length at birth at f
Lw_b = L_b/ del_M;                % cm, physical length at birth at f
Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
tT_p = (t_p-t_b)/ k_M/ TC;        % d, age at puberty at f and T

% ultimate
l_i = f - l_T;                    % -, scaled ultimate length at f
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
Ww_i = L_i^3 * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

% males
p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
L_mm = v/ k_M/ g_m;                  % cm, max struct length
L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
Lw_im = L_im/ del_M;                 % cm, SVL

%% pack to output
% the names of the fields in the structure must be the same as the data names in the mydata file
prdData.ab = aT_b;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Li = Lw_i;
prdData.Lim = Lw_im;
prdData.Wwb = Ww_b;
prdData.Wwi = Ww_i;
prdData.Wwim = Ww_im;

%% uni-variate data

% length-change in length/weight 
Lw_i = L_m * f_LdL/ del_M; rT_B = TC_LdL * k_M/ 3/ (1 + f_LdL * w);
ELw = Lw_i - (Lw_i - LdL(:,1)) .* exp(-rT_B * growth.LdL); % cm, SVL
EWw = (ELw*del_M).^3 * (1 + f_LdL * ome); % g, weight

% length-weight
EWw_L = (LW(:,1) * del_M).^3 * (1 + f_LdL * ome); % g, wet weight

% length-secondity
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
EN = 365 * TC * reprod_rate(LN(:,1)*del_M, f, pars_R);% #, yearly fecundity

% uni-variate data
% pack output
prdData.LdL = ELw;
prdData.WdW = EWw;
prdData.LW = EWw_L;
prdData.LN = EN;

end

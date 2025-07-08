function [prdData, info] = predict_Sceloporus_orcutti(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par); 
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
pars_T = [T_A; T_L; T_H; T_AL; T_AH];  
TC_ab = tempcorr(temp.ab, T_ref, pars_T);
TC = tempcorr(temp.am, T_ref, pars_T);

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

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

%% pack to output
% the names of the fields in the structure must be the same as the data names in the mydata file
prdData.ab = aT_b;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Li = Lw_i;
prdData.Wwi = Ww_i;
prdData.Ri = RT_i;

%% uni-variate data

  % univariate data
  % time-length
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL;
  r_B = k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  %[t, L] = ode45(@get_L, [0;tL(:,1)], L_b, [], T_ref, pars_T, t_0, L_i, r_B); L(1)=[]; 
  L = L_i - (L_i - L_b) * exp(- TC * r_B * tL(:,1)); % cm, struct length
  ELw = L/ del_M; % cm, SVL

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, weight
  
  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;

end

function dL = get_L(t, L, T_ref, pars_T, t_0, L_i, r_B)
  TC = tempcorr(C2K(25*sin(2*pi*(t+t_0)/365)), T_ref, pars_T); % -, TC at t
  dL = TC * r_B * (L_i - L); % cm/d, change in structural length d/dt L
end
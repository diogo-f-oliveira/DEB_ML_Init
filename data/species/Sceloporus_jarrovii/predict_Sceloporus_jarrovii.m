function [prdData, info] = predict_Sceloporus_jarrovii(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par); 
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

% if T_L >= T_ref || T_L >= T_ref || T_L < 274 || T_LH < 274
%   info = 0; prdData = []; return
% end

%% compute temperature correction factors
pars_T = [T_A; T_L; T_H; T_AL; T_AH];    % for low-altitude pop
pars_TH = [T_AA; T_L; T_H; T_AL; T_AH];  % for high-altitude pop
TC_ab = tempcorr(temp.ab, T_ref, pars_T);
TC_am = tempcorr(temp.am, T_ref, pars_T);
TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
TC_H = tempcorr(temp.tL_H, T_ref, pars_TH);
TC_L = tempcorr(temp.tL_L, T_ref, pars_T);

%% zero-variate data

% life cycle
pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
[t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

% birth
L_b = L_m * l_b;                  % cm, structural length at birth at f
Lw_b = L_b/ del_M;                % cm, physical length at birth at f
Ww_b = L_b^3 * (1 + f * w); % g, dry weight at birth at f (remove d_V for wet weight)
aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
Ww_p = L_p^3 * (1 + f * w); % g, dry weight at puberty (remove d_V for wet weight)
%aT_p = t_p/ k_M/ TC_ap;              % d, age at puberty at f and T

% ultimate
l_i = f - l_T;                    % -, scaled ultimate length at f
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
Ww_i = L_i^3 * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC_am;                  % d, mean life span at T

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

% time-length 

tf = [0 140; f_000 f_140]';
[t, EL] = ode45(@get_EL, [0;tL_H(:,1)], [E_m, L_b], [], T_ref, pars_TH, tf, v, g, E_m, L_m, p_Am); % EL: {J/cm^3, cm}, with {[E], L}
EL(1,:)=[]; ELw_H = EL(:,2)/del_M; % cm, SVL
%
[t, EL] = ode45(@get_EL, [0;tL_L(:,1)], [E_m, L_b], [], T_ref, pars_T, tf, v, g, E_m, L_m, p_Am); % EL: {J/cm^3, cm}, with {[E], L}
EL(1,:)=[]; ELw_L = EL(:,2)/del_M; % cm, SVL

% length - yearly fecundity
EN_H = 365 * TC_H * reprod_rate(LN_H*del_M, f_H, pars_R);   % #, yearly fecundity
EN_L = 365 * TC_L * reprod_rate(LN_L*del_M, f_L, pars_R);   % #, yearly fecundity

% uni-variate data
% pack output
prdData.tL_H = ELw_H;
prdData.tL_L = ELw_L;
prdData.LN_H = EN_H;
prdData.LN_L = EN_L;

end

function dEL = get_EL(t, EL, T_ref, pars_T, tf, v, g, E_m, L_m, p_Am)
  E = EL(1); % J/cm^3, reserve density [E}
  L = EL(2); % cm, structural length
  
  TC = tempcorr(C2K(4+25*sin(2*pi*(t+50)/365)), T_ref, pars_T); % -, TC at t
  f = spline1(t, tf);                    % -, scaled functional response at t
  
  dE = TC*(f * p_Am - E * v)/ L;            % J/d.cm^3, change in reserve density d/dt [E]
  e = E/ E_m;                            % -, scaled reserve density
  r = TC*v * (e/ L - 1/ L_m)/ (e + g);      % 1/d, specific growth rate
  dL = L * r/ 3;                         % cm/d, change in structural length d/dt L
  
  dEL = [dE; dL]; % catenate for output
end
  

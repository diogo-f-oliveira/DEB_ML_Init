function [prdData, info] = predict_Liopholis_guthega(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par); 
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

if f_K > 1
  info = 0; prdData = []; return
end

%% compute temperature correction factors
pars_T = [T_A; T_L; T_H; T_AL; T_AH];  
TC_ab = tempcorr(temp.ab, T_ref, pars_T);
TC_am = tempcorr(temp.am, T_ref, pars_T);
TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
TC_tLB = tempcorr(temp.tL_B, T_ref, pars_T);
TC_tLK = tempcorr(temp.tL_K, T_ref, pars_T);

%% zero-variate data

% life cycle
pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
[t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

% birth
L_b = L_m * l_b;                  % cm, structural length at birth at f
Lw_b = L_b/ del_M;                % cm, SVL at birth at f
Ww_b = L_b^3 * (1 + f * w); % g, dry weight at birth at f (remove d_V for wet weight)
aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, SVL at puberty at f
Ww_p = L_p^3 * (1 + f * w); % g, dry weight at puberty (remove d_V for wet weight)
%aT_p = t_p/ k_M/ TC_ap;              % d, age at puberty at f and T

% ultimate
l_i = f - l_T;                    % -, scaled ultimate length at f
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate SVL at f
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
L_b =  L_m * get_lb([g; k; v_Hb], f_B); L_i = L_m * f_B;   % cm, struct length
rT_B = TC_tLB * k_M/ 3/ (1 + f_B/ g); % 1/d, von Bert growth rate
ELw_B = (L_i - (L_i - L_b) * exp( - rT_B * tL_B(:,1)))/ del_M; % cm, SVL
%
L_b =  L_m * get_lb([g; k; v_Hb], f_K); L_i = L_m * f_K;   % cm, struct length
rT_B = TC_tLK * k_M/ 3/ (1 + f_K/ g); % 1/d, von Bert growth rate
ELw_K = (L_i - (L_i - L_b) * exp( - rT_B * tL_K(:,1)))/ del_M; % cm, SVL

% pack output
prdData.tL_B = ELw_B;
prdData.tL_K = ELw_K;

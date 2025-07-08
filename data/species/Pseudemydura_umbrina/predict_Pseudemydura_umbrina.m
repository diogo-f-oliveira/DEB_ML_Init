function [prdData, info] = predict_Pseudemydura_umbrina(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
pars_T = [T_A; T_L; T_H; T_AL; T_AH];
TC_ab = tempcorr(temp.ab, T_ref, pars_T);
TC_am = tempcorr(temp.am, T_ref, pars_T);

%% zero-variate data

% life cycle
pars_tp = [g; k; l_T; v_Hb; v_Hp];       % compose parameter vector 
[t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

% birth
L_b = L_m * l_b;                  % cm, structural length at birth at f
Lw_b = L_b/ del_M;                % cm, physical length at birth at f
Ww_b = L_b^3 * (1 + f * w); % g, dry weight at birth at f (remove d_V for wet weight)
aT_b = t_b/ (k_M * s_Megg) / TC_ab;           % d, age at birth at f and T (note s_M factor applied - egg in depression)

pars_tp = [g ; k; l_T; v_Hb; v_Hp];               % compose parameter vector
[t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

%TC = 0.5;

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
Ww_p = L_p^3 * (1 + f * w); % g, dry weight at puberty (remove d_V for wet weight)
%aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

% ultimate
l_i = f - l_T;                    % -, scaled ultimate length at f
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
Ww_i = L_i^3 * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)

% reproduction
%pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
%RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

% code to simulate growth under field fluctuating temperature and food (pond duration)
% from this, extract the univariate estimates of age at puberty and
% reproduction rate
years=50; % years to simulate
days=sort(repmat(1:182:364*years,1,2)); % set up pond durations of 182 days, and dry periods of the same length (one day short of year!)
act=repmat([1 1 0 0 ],[1,years]); % activity states
tf=vertcat(days,act)'; % vector of hydroperiods/dry periods lasting 182 days
tR=1:365:years*365; % intervals to get reproduction output
TC_f=0.56;%1.016942;%0.25;%0.2779; % temp correction factor when in water
TC_0=0.98;%83355;%0.65;%1.1317; % temp correction factor when on land
t=1:(365*years); % vector of days to simulate
eLHR0 = [f; L_b; g * u_Hb/ l_b^3; 0]; % initial scaled reserve, length, scaled maturity density and reproduction buffer (birth)
pars_UE0 = [V_Hb; g; k_J; k_M; v]; % parameters for initial scaled reserve calc
U_E0 = initial_scaled_reserve(0.8, pars_UE0); % get initial scaled reserve
E_0 = p_Am * TC_ab * U_E0;       % energy of egg, J
e_0 = E_0 / (E_m * L_m^3);  % scaled energy of egg

options=odeset('Events', @repro_event); % terminates simulation at first repro event
[t eLHR] = ode45(@dget_eLHR, t, eLHR0, options, s_M, kap, u_Hp, k_J, v, g, L_m, f, TC_f, TC_0, tf, e_0); % simulate energy budget 
e = eLHR(:,1); % retrieve scaled reserve density
L = eLHR(:,2); % retrieve structural length
H = eLHR(:,3); % retrieve scaled maturity density
eR = eLHR(:,4); % retrieve scaled reproduction buffer
t_cur = t(end);
t_cur0 = round(t_cur);
cumrepro=horzcat(t_cur0,5);
count=0;
while t_cur0 < 365*years-1
count=count+1;
e0 = eLHR(end,1); % retrieve scaled reserve density
L0 = eLHR(end,2); % retrieve structural length
H0 = eLHR(end,3); % retrieve scaled maturity density
eLHR0 = [e0; L0; H0; 0]; % initial scaled reserve, length, scaled maturity density and reproduction buffer (birth)
t=t_cur:(365*years); % vector of days to simulate
[t eLHR] = ode45(@dget_eLHR, t, eLHR0, options, s_M, kap, u_Hp, k_J, v, g, L_m, f, TC_f, TC_0, tf, e_0); % simulate energy budget 
e = vertcat(e, eLHR(:,1)); % retrieve scaled reserve density
L = vertcat(L, eLHR(:,2)); % retrieve structural length
H = vertcat(H, eLHR(:,3)); % retrieve scaled maturity density
eR = vertcat(eR, eLHR(:,4)); % retrieve scaled reproduction buffer
if count > 1
cumrepro=vertcat(cumrepro,horzcat(t_cur0,5));
end
t_cur = t(end);
t_cur0 = round(t_cur);
end

%[t eLHR] = ode45(@dget_eLHR, t, eLHR0, [], s_M, kap, u_Hp, k_J, v, g, L_m, f, TC_f, TC_0, tf, e_0); % simulate energy budget
EW = L .^ 3 .* (1 + (e + eR) * w); % wet mass including repro buffer, g
ER = eR .* (E_m * L_m^3); % reproduction buffer, J            
%EW2 = L .^ 3 .* (1 + (e) * w);  % non-reproductive wet mass, g
R_pub=eR(1:find(eR > 0,1),:);   % get vector up to puberty - first occurence of allocation to repro 
aT_p=length(R_pub);           % d, age at puberty at f and T
L_pub=L(1:find(eR > 0,1),:);   % get vector up to puberty - first occurence of allocation to repro 
L_p=L_pub(end,:);           % get last values of vector up to puberty
%L_p = pubeLHR(1,2) * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
Ww_p = L_p^3 * (1 + f * w); % g, dry weight at puberty (remove d_V for wet weight)
if count > 1
 if count <= 4
   RT_i = sum(cumrepro(end-1:end,2))/(cumrepro(end,1)-cumrepro(end-1,1)); % #/d, ultimate reproduction rate at T over last four reproductive events
 else    
  RT_i = sum(cumrepro(end-4:end,2))/(cumrepro(end,1)-cumrepro(end-4,1)); % #/d, ultimate reproduction rate at T over last four reproductive events
 end
else
 RT_i = 0;
end
%RT_i = (ER(length(ER)-10)-ER(length(ER)-375))/365/E_0; % #/d, ultimate reproduction rate at T over last year of simulation (divide by energy of egg)

% ultimate
% l_i = f - l_T;                    % -, scaled ultimate length at f
 %L_i = max(L);%L_m * l_i;                  % cm, ultimate structural length at f
 %Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 %Ww_i = L_i^3 * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC_am;                  % d, mean life span at T

%% pack to output
% the names of the fields in the structure must be the same as the data names in the mydata file
prdData.ab = aT_b;
prdData.ap = aT_p;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Li = Lw_i;
prdData.Wwb = Ww_b;
prdData.Wwp = Ww_p;
prdData.Wwi = Ww_i;
prdData.Ri = RT_i;

%% uni-variate data

% code to simulate growth under zoo fluctuating temperature and food (pond duration)

years=18; % years to simulate
days=sort(repmat(1:182:364*years,1,2)); % set up pond durations of 182 days, and dry periods of the same length (one day short of year!)
act=repmat([1 1 0 0 ],[1,years]); % activity states
tf=vertcat(days,act)'; % vector of hydroperiods/dry periods lasting 182 days
tR=1:365:years*365; % intervals to get reproduction output
zoopond = readtable('zoopond.csv','TreatAsEmpty',{'NA'});
tf = cat(2,table2array(zoopond(:,2)),table2array(zoopond(:,3)));
%TC_f=1.59;%0.2779; % temp correction factor when in water
%TC_0=1.71;%1.1317; % temp correction factor when on land
t=1:(365*years); % vector of days to simulate
% eLHR0 = [f; L_b; g * u_Hb/ l_b^3; 0]; % initial scaled reserve, length, scaled maturity density and reproduction buffer (birth)
% [t, eLHR] = ode45(@dget_eLHR, t, eLHR0, [], s_M, kap, u_Hp, k_J, v, g, L_m, f, TC_f, TC_0, tf, e_0); % simulate energy budget
% e = eLHR(:,1); % retrieve scaled reserve density
% L = eLHR(:,2); % retrieve structural length
eLHR0 = [f; L_b; g * u_Hb/ l_b^3; 0]; % initial scaled reserve, length, scaled maturity density and reproduction buffer (birth)
options=odeset('Events', @repro_event);
[t eLHR] = ode45(@dget_eLHR, t, eLHR0, options, s_M, kap, u_Hp, k_J, v, g, L_m, f, TC_f, TC_0, tf, e_0); % simulate energy budget 
e = eLHR(:,1); % retrieve scaled reserve density
L = eLHR(:,2); % retrieve structural length
H = eLHR(:,3); % retrieve scaled maturity density
eR = eLHR(:,4); % retrieve scaled reproduction buffer
t_cur = t(end);
t_cur0 = round(t_cur);
cumrepro=horzcat(t_cur0,5);
count=0;
while t_cur0 < 365*years-1
count=count+1;
e0 = eLHR(end,1); % retrieve scaled reserve density
L0 = eLHR(end,2); % retrieve structural length
H0 = eLHR(end,3); % retrieve scaled maturity density
eLHR0 = [e0; L0; H0; 0]; % initial scaled reserve, length, scaled maturity density and reproduction buffer (birth)
t=t_cur:(365*years); % vector of days to simulate
[t eLHR] = ode45(@dget_eLHR, t, eLHR0, options, s_M, kap, u_Hp, k_J, v, g, L_m, f, TC_f, TC_0, tf, e_0); % simulate energy budget 
e = vertcat(e, eLHR(:,1)); % retrieve scaled reserve density
L = vertcat(L, eLHR(:,2)); % retrieve structural length
H = vertcat(H, eLHR(:,3)); % retrieve scaled maturity density
eR = vertcat(eR, eLHR(:,4)); % retrieve scaled reproduction buffer
if count > 1
cumrepro=vertcat(cumrepro,horzcat(t_cur0,5));
end
t_cur = t(end);
t_cur0 = round(t_cur);
end
% get times at which weights observed
if size(tW,2)==2
    tWeight = tW(:,1);
else
    tWeight = round(tW);
end
t=1:(365*years); % vector of days to simulate
[j i] = ismember(tWeight, t); % extract predictions for times weights are observed
EW = L(i) .^ 3 .* (1 + (e(i)) * w); % calculate predicted wet weight for those times
%EW = L(i) .^ 3 .* (1 + (e(i) + eR(i)) * w); % wet mass, g
if size(tL,2)==2
    tLength = tL(:,1);
else
    tLength = round(tL);
end
[j i] = ismember(tLength, t); % extract predictions for times lengths are observed
EL = L(i)/ del_M; % get predicted carapace lengths for those times

% length-weight
EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, expected wet for each observed length

% O2 consumption rate in ml/min.g
o2Ww=302.325; % mean wet weight of experimental animals
O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
p_ref = p_Am * L_m^2;               % J/d, max assimilation power at max size
pars_power = [kap; kap_R; g; k_J*s_MO2; k_M*s_MO2; L_T; v*s_MO2; U_Hb; U_Hp];
L = (o2Ww / (1 + f * w)).^(1/3); % cm, structural length, given experimental wet mass
pACSJGRD = p_ref * scaled_power(L, f, pars_power, l_b, l_p);
pADG = pACSJGRD(:, [1 7 5]);  pADG(:,1) = 0; % exclude assim contribution
JM = pADG * eta_O' * O2M;                     % mol/d, mineral fluxes
X_gas = 24.06;  % gas correction factor, L/mol
%X_gas = C2K(TO(:,1))/293.15*24.06;  % gas correction factor, L/mol if not at STP
EO = (- 1 * (JM(:,3) * X_gas) .* tempcorr(C2K(TO(:,1)), T_ref, pars_T))/24*1000/o2Ww; % L/day to ml/g/h
  
% pack output
prdData.TO = EO;
prdData.tL = EL;
prdData.LW = EWw;
prdData.tW = EW;

    function [value,isterminal,direction] = repro_event(T,Y, s_M, kap, u_Hp, k_J, v, g, L_m, f, TC_f, TC_0, tf, e_0)
    eR= Y(4); 
    value = eR-e_0*5;  % new triger 
    isterminal = 1;    % terminate after the first event
    direction  = 0;    % get all the zeros


function deLHR = dget_eLHR (t, eLHR, sM, kap, uHp, kJ, v, g, L_m, f_zoo, TC_f, TC_0, tf, e_0)
e = eLHR(1); L = eLHR(2); eH = eLHR(3); eR = eLHR(4); eHp = uHp * g * L_m^3/ L^3;
if spline0(t,tf) % active
    TC = TC_f; f = f_zoo; 
    v2 = v;
    kJ2 = kJ;
else % torpor
    TC = TC_0; f = 0; 
    v2 = v * sM; % correct for low maint during torpor
    kJ2 = kJ * sM;
end
de = TC * v2 * (f - e)/ L;              % 1/d, change in scaled reserve density
r = TC * v2 * (e/ L - 1/ L_m)/ (e + g); % 1/d, spec growth rate
dL = L * r/ 3;                         % cm/d, change in length
if eH < eHp %|| t < 3000
    deH = TC * max(0,(1 - kap) * e * (v2/ L - r) - eH * (kJ2 + r)); % 1/d, change in scaled maturity
    deR = 0;
else
    deH = 0;
    deR = TC * max(0, (1 - kap) * e * (v2/ L - r) - eHp * kJ2 - r * eR); % 1/d, change in scaled reprod buffer
end
deLHR = [de; dL; deH; deR];

function f = spline0(t,tf)
f = tf(sum(t>=tf(:,1)),2);

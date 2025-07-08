function [prdData, info] = predict_Danio_rerio(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
      
  % customized filter  
  filterChecks =   E_R_init_DrewRodn2008 < 0 || E_R_init_DrewRodn2008 > 2000 || ...
                     f_DrewRodn2008 > 1 || ~reach_birth(g, k, v_Hb, f_DrewRodn2008) ; %|| ...
  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end 
  
%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_egg = tempcorr(temp.tMC, T_ref, T_A);
  TC_Schi2002 = tempcorr(temp.tL_Schi2002, T_ref, T_A);
  TC_EatoFarl1974 = tempcorr(temp.tL_EatoFarl1974, T_ref, T_A);
  TC_BagaPels2001 = tempcorr(temp.tL_BagaPels2001, T_ref, T_A);
  TC_tS = tempcorr(temp.tS, T_ref, T_A);
  TC_BestAdat2010 = tempcorr(temp.tL_BestAdat2010, T_ref, T_A);
  TC_LawrEber2002 = tempcorr(temp.tL_LawrEber2002_high, T_ref, T_A);
  
  

  TC_starv = tempcorr(temp.tW, T_ref, T_A); 
  
  TC_tL = tempcorr(temp.tLf1, T_ref, T_A); % juvenile growth trials
  TC_tN = tempcorr(temp.tN, T_ref, T_A); % for the reproduction trials in BeauGous2015
    TC_tSstarv = tempcorr(temp.tS_starv, T_ref, T_A);

 % standard length is 80% of the total length:
 del_Ms = del_Mt * 1.25; % -, 

 %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  pars_lj = [g; k; l_T; v_Hb; v_Hj];
  
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = U_E0 * p_Am ;          % J, energy in egg
  Wd_0 = E_0 * w_E/ mu_E;      % g, egg dry weight 
  V0 = Wd_0/ d_E;             % cm^3, egg volume 
  Lw_0 = (6 * V0/ pi)^(1/3);  % cm, egg diameter

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mt;                % cm, total length at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth 

  % metamorphosis
  L_j = l_j * L_m;                  % cm, structural length at metam at f               
  Lw_j= L_j/ del_Mt;                 % cm, total length at metam at f
  s_M = L_j/ L_b;                   % -, acceleration factor
  aT_j = t_j/ k_M/ TC_aj;           % d, age at metam

  % puberty is here at end of 0-variate data because of deviating f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_Mt;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate
  t_R  = 3; % d, period of accumulaton of reprod buffer at T
  GSIT = (t_R * TC_GSI * k_M * g/ f^3)/ (f + kap * g * y_V_E);
  GSIT = GSIT * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^3);    % -, GSI

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % puberty at f_EatoFarl1974b
  F = f_EatoFarl1974;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, F);
  L_p = L_m * l_p;                  % cm, structural length at puberty at F
  Lw_p = L_p/ del_Mt;                % cm, total length at puberty at F
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at F and T

  % pack to output
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.L0 = Lw_0;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wd0 = Wd_0;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.GSI = GSIT;

  %% uni-variate data
  
% L-Ww

prdData.LWw = (LWw(:,1) * del_Mt).^3 * (1 + w * f); % g, wet weight


% survival at f

  % t-S data for larvae post hatch
  % assumption: birth is hatch; no metabolic acceleration during starvation
 
  % temperature correct parameters:
  pT_Am = p_Am *  TC_tSstarv; vT = v * TC_tSstarv; pT_M = p_M * TC_tSstarv;
  kT_J  = k_J * TC_tSstarv; kT_J1 = kT_J;
  % solve ODEs:
  [tt, LEHS] =  ode45(@dget_LEHS, tS_starv(:,1), [L_b; E_m; E_Hb; 1; L_b; E_Hb] ,[],...
    pT_Am, vT, pT_M, E_G, kap, kap_G, kT_J, kT_J1, s_rejuv, s_shrink, del_X, 0); 
  
  prdData.tS_starv = LEHS(:,4); 

  % tS of GerhKauf2002 
  a     = tS(:,1); % d, time since birth
  TC    = TC_tS;      % -, temp corr factor
  s_M   = l_j/ l_b;             % -, acceleration factor
  L_i   = l_i * L_m;            % cm, assumption that no more growth occurs
  h3_W  = TC^3 * h_a * F * v * s_M/ (6 * L_i);
  h_G   = TC * s_G * F^4 * v * s_M/ L_i;
  prdData.tS = exp(6 * h3_W /h_G^3 * (1 - exp(h_G * a) + h_G * a + h_G^2 * a.^2 /2));

% BangGron2004: tMC and tMN, T = 25 �C 
  a = [0; tMC(:,1)]; pT_Am = p_Am * TC_egg; vT = v * TC_egg; kT_J = k_J * TC_egg; 
  UT_E0 = E_0/ pT_Am; 
  p = [vT; g; L_m; kT_J; kap];
  [A, ULH] = ode45(@dget_ulh_modified, a, [UT_E0; 1e-8; 0],[],p);
  ULH(1,:)  = [];
  MV      = ULH(:,2).^3 * M_V;
  ME      = pT_Am * ULH(:,1)/ mu_E;
  prdData.tMC = 1e6 * (MV + ME); % mumol, carbon mass
  prdData.tMN = 1e6 * (n_O(4,2) * MV + n_O(4,3) * ME); % mumol, nitroen mass
    
% comilation of litterature growth curves (see previous version and AuguGagn2011 for more discussion on this):
 
 % initial conditions at start:
 init_cond = [1e-10; E_0; 0]; % hardly any structure, initial enegy of the egg (J), no a maturiaty at start

 % BeauGous2015
 TC = TC_tL;
 % --------- high food level:
 F = f_BeauGous2015;  a = [0; tLf1(:,1)];
 L_j = get_lj(pars_lj, F) * L_m; % cm, structural length at metamorphosis at F
 [t_sort, it, it_sort] = unique(a,'sorted'); % returns the unique values in t in sorted order
 [tt, LEH] = ode45(@ode_LEH, t_sort, init_cond, [], par, F, TC, L_b, L_j);
  L    = LEH(:,1); % cm, structural length
  Lw   = L/ del_Ms; % cm, standard length
  Lw   = Lw(it_sort); % reconstruct L
  ELw1 = Lw(2:end) * 10; % mm, standard length
 % ----------- medium food level:
  F = f_BeauGous2015 * 0.9;  a = [0; tLf2(:,1)];
  L_j = get_lj(pars_lj, F) * L_m; % cm, structural length at metamorphosis at F
  [t_sort, it, it_sort] = unique(a,'sorted'); % returns the unique values in t in sorted order
  [tt, LEH] = ode45(@ode_LEH, t_sort, init_cond, [], par, F, TC, L_b, L_j);
  L    = LEH(:,1); % cm, structural length
  Lw   = L/ del_Ms; % cm, standard length
  Lw   = Lw(it_sort); % reconstruct L
  ELw2 = Lw(2:end) * 10; % mm, standard length
% --------------- low food level:
  F = f_BeauGous2015 * 0.8;  a = [0; tLf3(:,1)];
  L_j = get_lj(pars_lj, F) * L_m; % cm, structural length at metamorphosis at F
  [t_sort, it, it_sort] = unique(a,'sorted'); % returns the unique values in t in sorted order
  [tt, LEH] = ode45(@ode_LEH, t_sort, [1e-5; E_0; 0], [], par, F, TC, L_b, L_j);
  L = LEH(:,1);  % cm, structural length
  Lw = L/ del_Ms; % cm, standard length
  Lw = Lw(it_sort); % reconstruct L
  ELw3= Lw(2:end) * 10; % mm, standard length

% tL_LawrEber2002 at low and high
  TC = TC_LawrEber2002;
  % Low: 
  F = f_LawrEber2002_low;  a = [0; tL_LawrEber2002_low(:,1)];
  [t_sort, it, it_sort] = unique(a,'sorted'); % returns the unique values in t in sorted order
  L_j = get_lj(pars_lj, F) * L_m; % cm, structural length at metamorphosis at F
  [tt, LEH] = ode45(@ode_LEH, t_sort, init_cond, [], par, F, TC, L_b, L_j);
  L = LEH(:,1); % cm, structural length
  Lw = L/ del_Mt; Lw = Lw(it_sort); % reconstruct L
  ELw_LawrEber2002_low = Lw(2:end); % cm, total length
  % High:
  F = f_LawrEber2002_high; a = [0; tL_LawrEber2002_high(:,1)];
  [t_sort, it, it_sort] = unique(a,'sorted'); % returns the unique values in t in sorted order
  L_j = get_lj(pars_lj, F) * L_m; % cm, structural length at metamorphosis at F
  [tt, LEH] = ode45(@ode_LEH, t_sort, init_cond, [], par, F, TC, L_b, L_j);
  L = LEH(:,1); % cm, structural length
  Lw = L/ del_Mt; Lw = Lw(it_sort); % reconstruct L
  ELw_LawrEber2002_high = Lw(2:end); % cm, total length

  % tL_BestAdat2010:
  TC = TC_BestAdat2010;  F = f_BestAdat2010; a = [0; tL_BestAdat2010(:,1)];
  L_j = get_lj(pars_lj, F) * L_m; % cm, structural length at metamorphosis at F
  [t_sort, it, it_sort] = unique(a,'sorted'); % returns the unique values in t in sorted order
  [tt, LEH] = ode45(@ode_LEH, t_sort, init_cond, [], par, F, TC, L_b, L_j);
  L    = LEH(:,1); % cm, structural length
  Lw   = L/ del_Mt; Lw   = Lw(it_sort); % reconstruct L
  ELw_BestAdat2010 = Lw(2:end); % cm, total length
  
  % tL of Schi2002
  TC = TC_Schi2002; F = f_Schi2002; a = [0; tL_Schi2002(:,1)];
  L_j = get_lj(pars_lj, F) * L_m; % cm, structural length at metamorphosis at F
  [t_sort, it, it_sort] = unique(a,'sorted'); % returns the unique values in t in sorted order
  [tt, LEH] = ode45(@ode_LEH, t_sort, init_cond, [], par, F, TC, L_b, L_j);
  L    = LEH(:,1); % cm, structural length
  Lw   = L/ del_Mt; Lw   = Lw(it_sort); % reconstruct L
  ELw_Schi2002 = Lw(2:end); % cm, standard length
  
  % tL of EatoFarl1974
  TC = TC_EatoFarl1974; F = f_EatoFarl1974; a = [0; tL_EatoFarl1974(:,1)];
  L_j = get_lj(pars_lj, F) * L_m; % cm, structural length at metamorphosis at F
  [t_sort, it, it_sort] = unique(a,'sorted'); % returns the unique values in t in sorted order
  [tt, LEH] = ode45(@ode_LEH, t_sort, init_cond, [], par, F, TC, L_b, L_j);
  L    = LEH(:,1); % cm, structural length
  Lw   = L/ del_Ms; Lw   = Lw(it_sort); % reconstruct L
  ELw_EatoFarl1974 = Lw(2:end); % cm, standard length
    
  % tL, tWw and tWd of BagaPels2001
  F = f_BagaPels2001; TC = TC_BagaPels2001; 
  a = [0; tL_BagaPels2001(:,1)];
  l_j = get_lj(pars_lj, F);  L_j = l_j * L_m;
  [tt, LEH] = ode45(@ode_LEH, a, init_cond, [], par, F, TC, L_b, L_j);
  LEH(1,:) = []; L    = LEH(:,1);  E    = LEH(:,2); % cm, stuct length; J, energy in resrve
  prdData.tWw_BagaPels2001  = L.^3 + w_E/ mu_E/ d_E * E; % g, wet weight
  prdData.tWd_BagaPels2001  = d_V * L.^3 + w_E/ mu_E * E; % g, dry weight
  prdData.tL_BagaPels2001   = L/ del_Mt; % cm, total length
  
% reproduction trials with individual females BeauGous2015
% for all females we assume that there is nothing in the ripe buffer because the females
% spawned before hand:
TC = TC_tN; 
% standard lengths of each female at start of the trials used to get
% initial structure
L_init =  max(Lw_p,36/10); % cm, standard length
time = tN(:,1); % d, experiment time
L_init   = L_init * del_Ms;               % cm, structural length at start
E_init   = f * E_m * L_init^3;                  % J, inital energy in reserve
InitCond = [L_init; E_init; E_Hp; E_R_init_BeauGous2015]; % concatenate initial conditions
% 
[tt, LEHR]  = ode45(@ode_LEHR, time, InitCond, [], par, cPar, f, s_M, TC);
E_R = LEHR(:,4); % J, energy in the reproduction buffer
L = LEHR(:,1); % cm, structural length
E = LEHR(:,2); % J, energy in reserve
prdData.tN  = kap_R * E_R/ E_0; % #, cum number of eggs (reproduction overheads are taken in the step from rip to unrip buffer in the ODE's)
prdData.tL1  = [L(1); L(end)]/ del_Ms; % cm, initial and final standard length
% reminder: the final wet weight is treated as zero-variate data
prdData.Wwt = L(end)^3 + w_E/ mu_E/ d_E * E(end); % g, final wet weight


% Starvation data: adults
TC = TC_starv; f = f_DrewRodn2008;
% initial conditions for the ODE simulations
L_init  = 2.49 * del_Ms; % cm, structural length at start
E_init = f * E_m * L_init^3; % J, inital energy in reserve
InitCond = [L_init; E_init; E_Hp; E_R_init_DrewRodn2008]; % concatenate initial conditions

% growth during the first 11 days in the fed condition: 
t = tW(:,1);
[tt, LEHR] = ode45(@ode_LEHR, [t(t<=11); 12], InitCond,[], par, cPar, f, s_M, TC);
LEHR(end,:) = [];
% unpack vars and calculate output:
L   = LEHR(:,1); % cm,structural length
E   = LEHR(:,2); % J, energy in reserve
E_R = LEHR(:,4); % J,  reproduction buffer
EWw1 = w_E/ mu_E/ d_E * (E + E_R) + L.^3; % g, total wet weight
ELw  = [L(1); L(end)]/ del_Ms * 10;             % mm, standard length
% growth after day 11 in the fed condition:
[tt, LEHR] = ode45(@ode_LEHR, t(t>11), LEHR(end,:), [], par, cPar, f*0.7, s_M, TC);
% unpack pars and calculate output: 
L   = LEHR(:,1); % cm,structural length
E   = LEHR(:,2); % J, energy in reserve
E_R = LEHR(:,4); % J,  reproduction buffer
EWw2 = L.^3 + w_E/ mu_E/ d_E * (E + E_R); % g, total wet weight
EWw = [EWw1; EWw2]; % g, concatenate total wet weight over full experiment
% growth during the first 11 when individual were fed: 
t = tWs(:,1); % d, time
[tt, LEHR] = ode45(@ode_LEHR, [t(t<=11);12], InitCond,[], par, cPar, f, s_M, TC);
LEHR(end,:) = []; % remove the last dummy time
% unpack vars:
L    = LEHR(:,1); % cm,structural length
E    = LEHR(:,2); % J, energy in reserve
E_R  = LEHR(:,4); % J,  unripe buffer
EWw1 = L.^3 + w_E/mu_E/ d_E * (E + E_R); % g, total wet weight
[tt, LEHR] = ode45(@ode_LEHR, t(t>11), LEHR(end,:),[], par, cPar, 0, s_M, TC);
L   = LEHR(:,1); % cm,structural length
E   = LEHR(:,2); % J, energy in reserve
E_R = LEHR(:,4); % J,  unripe buffer
EWw2 = L.^3 + w_E/ mu_E/ d_E * (E + E_R); % g, total wet weight
EWws = [EWw1; EWw2]; % g, concatenate total wet weight over full experiment
 
 % pack to output
  prdData.tL = ELw;  
  prdData.tW = EWw;
  prdData.tWs = EWws;
  
  
  
  % pack to output
  prdData.tLf1 = ELw1;
  prdData.tLf2 = ELw2;
  prdData.tLf3 = ELw3;
  
  
  prdData.tL_Schi2002 = ELw_Schi2002;
  prdData.tL_EatoFarl1974 = ELw_EatoFarl1974;
  prdData.tL_BestAdat2010 = ELw_BestAdat2010;
  prdData.tL_LawrEber2002_high = ELw_LawrEber2002_high;
  prdData.tL_LawrEber2002_low = ELw_LawrEber2002_low;
 
%      
end

%% SUBFUNCTIONS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function dULH = dget_ulh_modified(t,ULH,p)
  % change in state variables during embryo stage
  % parameter vector : [v ;g; Lm ;kJ; kap]
  v = p(1); g = p(2); Lm = p(3); kJ = p(4); kap = p(5);
  % unpack state variables
  U = ULH(1); % U = M_E/{J_{EAm}}
  L = ULH(2); % structural length
  H = ULH(3); % H = M_H/{J_{EAm}}
  %
  eL3 = U * v; % eL3 = L^3 * m_E/ m_Em
  gL3 = g * L^3;
  SC = L^2 * (1 + L/(g * Lm)) * g * eL3/ (gL3 + eL3); % J_EC/{J_EAm}
  dU = - SC;
  dL = v * (eL3 - L^4/ Lm)/ (3 * (eL3 + gL3));
  dH = (1 - kap) * SC - kJ * H;
  % pack derivatives
  dULH = [dU; dL; dH];
end



% used for growth:
function dLEH = ode_LEH(t, LEH, p, f, TC, L_b, L_j)
% Input: 
% p: structure 'par' 
% c: structure 'Cpar' obtained by cPar = parscomp_st(par)
% f: scaled, scaled functional response, 
% s_M: scalar, -, acceleration factor post metamorphosis
% TC, scalar, -, temperature correction factor
% L_b, scaler, cm, structural length at birth at f
% L_j, scaler, cm, structural length at metamorphosis at f


% --------------- unpack LEHR ------------------------------------------
L   =  max(0,LEH(1)); % cm, volumetric structural length
E   =  max(0,LEH(2)); % J,   energy in reserve 
EH  =  max(0,LEH(3)); % J, E_H maturity

% shape correction function:
if EH < p.E_Hb
    s_M = 1;
elseif EH >= p.E_Hb && EH < p.E_Hj
    s_M = L/L_b;
else
    s_M = L_j/L_b;
end
% Temperature and shape correct the relevant paramters
vT    = s_M * p.v * TC; 
pT_Am = s_M * p.z * p.p_M/ p.kap * TC;
pT_M  = p.p_M * TC; 
kT_J  = p.k_J * TC; 
%
pA  = f * pT_Am * L^2 * (EH >= p.E_Hb);           % J/d, assimilation
r   = (E * vT/ L - pT_M * L^3/ p.kap)/ (E + p.E_G * L^3/ p.kap);
pC  = E * (vT/ L - r); % J/d, mobilisation 
dE  = pA - pC;               % J/d, change in energy in reserve
dL  = r/ 3 * L;              % cm/d, change in structural length
dEH = ((1 - p.kap) * pC - kT_J * EH) * (EH < p.E_Hp);    % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).

% pack dLEHR
dLEH = [dL; dE; dEH];    
end

% --------------------------------------------------
% ODE only with unripe buffer
% --------------------------------------------------
function dLEHR = ode_LEHR(t, LEHR, p, c, f, s_M, TC)
%
% Input: 
% p: structure 'par' 
% c: structure 'Cpar' obtained by cPar = parscomp_st(par)
% f: scaled, scaled functional response, 
% s_M: scalar, -, acceleration factor post metamorphosis
% TC, scalar, -, temperature correction factor

% --------------- unpack LEHR ------------------------------------------
L   =  max(0,LEHR(1)); % cm, volumetric structural length
E   =  max(0,LEHR(2)); % J,   energy in reserve 
EH  =  min(p.E_Hp,LEHR(3)); % J, E_H maturity
ER  =  max(0,LEHR(4)); % J, E_R reproduction buffer

% Temperature correct the relevant paramters
vT = p.v * TC * s_M; pT_M = p.p_M * TC; kT_J = p.k_J * TC; pT_Am = c.p_Am * TC * s_M;
%
pA   = f * pT_Am * L^2 * (EH >= p.E_Hb);           % J/d, assimilation
%
if EH < p.E_Hp % juveniles cannot cover somatic maintenance with the buffer   
    r  = (E * vT/ L - pT_M * L^3/ p.kap)/ (E + p.E_G * L^3/ p.kap) * ...
        (E >= pT_M * L^4/ (p.kap * vT * s_M)) + ...
         (E * vT/ L - pT_M * L^3/ p.kap)/ (E + c.kap_G * p.E_G * L^3/ p.kap) ...
         * (E < pT_M * L^4/ (p.kap * vT * s_M));
pC   = E * (vT/ L - r); % J/d, mobilisation
dE   = pA - pC;                                          % J/d, change in energy in reserve
dL   = r/ 3 * L;                                         % cm/d, change in structural length
dEH  = max(0, (1 - p.kap) * pC - kT_J * EH) * (EH < p.E_Hp);    % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
dER  = 0; 
else % EH = EHp: adults     
 pC = E * (p.E_G * vT * L^2 + pT_M * L^3)/ (p.kap * E + p.E_G * L^3);    
    if p.kap * pC >= pT_M * L^3   % enough energy in reserve to cover somatic maintenance and enough to make a batch   
        r    = (E * vT/ L^4 - pT_M/ p.kap)/ (E/ L^3 + p.E_G/ p.kap); % d^-1, specific growth rate  
        dE   = pA - pC;                                          % J/d, change in energy in reserve
        dL   = r/ 3 * L;                                         % cm/d, change in structural length
        dEH  = 0;    % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
        dER  = ((1 - p.kap) * pC - kT_J * p.E_Hp) ;       % J, change in cumulated energy invested in the unripe reproduction buffer  
    else  % not enough energy in reserve to cover somatic maintenance
        if ER > 0
            r = 0;
        else
             r    =  (E * vT/ L - pT_M * L^3/ p.kap)/ ...
            (E + c.kap_G * p.E_G  * L^3/ p.kap); % d^-1, specific growth rate
        end      
        dE   = pA - pC;                                         % J/d, change in energy in reserve
        dL   = r/ 3 * L;                                        % cm/d, change in structural length
        dEH  = 0;                                               % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
        dER  = (1 - p.kap) * pC - kT_J * p.E_Hp;
        dER  = (dER  - (pT_M * L^3 - p.kap * pC)) * (ER > 0) ;
    end    
end
% pack dLEHR
dLEHR = [dL; dE; dEH; dER];    
end

% --------------------------------------------------
% ODE with ripe and unripe buffer (adult reproduction trials):
% --------------------------------------------------
function dLEHRB = ode_LEHRB(t, LEHRB, p, c, f, s_M, TC)
% Input: 
% p: structure 'par' 
% c: structure 'Cpar' obtained by cPar = parscomp_st(par)
% f: scaled, scaled functional response, 
% s_M: scalar, -, acceleration factor post metamorphosis
% TC, scalar, -, temperature correction factor

% --------------- unpack LEHR ------------------------------------------
L   =  max(0,LEHRB(1)); % cm, volumetric structural length
E   =  max(0,LEHRB(2)); % J,   energy in reserve 
% EH  =  min(p.E_Hp,LEHRB(3)); % J, E_H maturity
ER0  =  max(0,LEHRB(4)); % J, E_R0 unripe reproduction buffer
% ER1  =  max(0,LEHRB(5)); % J, E_R1 ripe reproduction buffer

% Temperature correct the relevant paramters
vT = p.v * TC; pT_M = p.p_M * TC; kT_J = p.k_J * TC; pT_Am = c.p_Am * TC;
% Energy fluxes:
pA   = f * pT_Am * L^2 * s_M;   % J/d, assimilation   
pC   = E * (p.E_G * vT * s_M * L^2 + pT_M * L^3)/ (p.kap * E + p.E_G * L^3);  % J/d, mobilisation flux  
pCm  = c.E_m * (p.E_G * vT * L^2 + pT_M * L^3)/ (p.kap * c.E_m + p.E_G);    % J/d, mobilisation flux at f=1 for an individual of lenth L
 
    if p.kap * pC >= pT_M * L^3   % enough energy in reserve to cover somatic maintenance and enough to make a batch   
        r    = (E * vT * s_M/ L^4 - pT_M/ p.kap)/ (E/ L^3 + p.E_G/ p.kap); % d^-1, specific growth rate  
        dE   = pA - pC;                                          % J/d, change in energy in reserve
        dL   = r/ 3 * L;                                         % cm/d, change in structural length
        dEH  = 0;    % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
        % Buffer handling rules:
        dER1 = p.kap_R *((1 - p.kap) * pCm - kT_J * p.E_Hp); % J/d, change in energy in ripe buffer
        dER0  = ((1 - p.kap) * pC - kT_J * p.E_Hp)  - dER1;       % J, change in cumulated energy invested in the unripe reproduction buffer
    else  % not enough energy in reserve to cover somatic maintenance
        if ER0 > 0
            r = 0;
        else
             r    =  (E * vT * s_M/ L - pT_M * L^3/ p.kap)/ ...
            (E + c.kap_G * p.E_G  * L^3/ p.kap); % d^-1, specific growth rate
        end
        dE   = pA - pC;                                         % J/d, change in energy in reserve
        dL   = r/ 3 * L;                                        % cm/d, change in structural length
        dEH  = 0;                                               % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
        dER0  = (1 - p.kap) * pC - kT_J * p.E_Hp;
        dER0  = (dER0  - (pT_M * L^3 - p.kap * pC)) * (ER0 > 0) ;
        dER1 = 0;   
    end    
% pack dLEHR
dLEHRB = [dL; dE; dEH; dER0; dER1];    

end

 
function dLEHS = dget_LEHS(t,LEHS,...
    p_Am, v, p_M, E_G, kap, kap_G, k_J, k_J1, s_rejuv, s_shrink, del_X, f) 

% assumption: no metabolic acceleration
% the function will not handle re-growth

% unpack LEHRU
L   =  LEHS(1); % cm, volumetric structural length
E   =  LEHS(2); % J cm^{-3}, [E] reserve density
EH  =  LEHS(3); % J, E_H maturity
S   =  min(1,LEHS(4)); % survival probability
maxL = LEHS(5); % maximum length
maxEH = LEHS(6); % maximum maturity

L_m = kap * p_Am/ p_M; % cm, ultimate length
k_M = p_M/ E_G;  % 1/d, maturity maintenance rate coefficient
E_m = p_Am/ v;   % J/cm^3, max reserve density
l = L/ L_m; e = E/E_m;  % -, scaled structural length and scaled res. dens.

p_C = E * (E_G * v/ L + p_M)/ (kap * E + E_G );   % J/cm^3 (2.12, Kooy2010) specific mobilisation flux
dE =  (f * p_Am - E * v)/ L; % J day^{-1} cm^{-3} (2.10, Kooy2010)

% pp.42 comments DEB3 equ. 4.2
if e < l 
   r = (E * v/ L - p_M/ kap)/ (E + E_G * kap_G/ kap);
else
  r = (E * v/ L - p_M/ kap)/ (E + E_G/ kap);
end
dL  = L * r/ 3;

dmaxL = max(0,dL); % cm, max stuctural length
dEH = (1 - kap) * p_C * L^3 - k_J * EH; % J/d

if dEH < 0 % rejuvination  
dEH = -k_J1 * (EH - (1- kap) * p_C * L^3/ k_J);   % J/d, 
end 

dmaxEH = max(0,dEH); % J, max maturity

h_J  =  k_M * s_rejuv * kap/ (1 - kap)/ (E_G * L_m^3) * (maxEH - EH); % 1/d, hazard from rejuvenation
h_sh = s_shrink * k_M * max(0, maxL - L)/maxL * (L < del_X * maxL);

dS = - S * (h_J + h_sh); % 1/d, survival fraction

% pack state variables
dLEHS = [dL; dE; dEH; dS; dmaxL; dmaxEH];

end







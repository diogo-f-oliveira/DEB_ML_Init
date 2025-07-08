 function [prdData, info] = predict_Oryzias_latipes(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
    filterChecks =   f1>1 || f1 <0 || ...
                     f2>1 || f2 <0 || ...
                     f3>1 || f3 <0 || ...
                     s_shrink < 0 || s_shrink > 1e6 || ...
                     L_init < 0 || L_init > L_m * 43 || L_init^3 > 0.9 * 0.35 || ...
                     E_R_init < 0 || w_E/ mu_E/ d_E * E_R_init > 0.8 * 0.35; 
  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  
  % compute temperature correction factors
  TC_ab   = tempcorr(temp.ab, T_ref, T_A);
  TC_tj   = tempcorr(temp.tj, T_ref, T_A);
  TC_ap   = tempcorr(temp.ap, T_ref, T_A);
  TC_am   = tempcorr(temp.am, T_ref, T_A);
  TC_Ri   = tempcorr(temp.Ri, T_ref, T_A);
  TC_tW_f = tempcorr(temp.tW_f, T_ref, T_A);
  TC_tW   = tempcorr(temp.tW, T_ref, T_A);
  TC_tW2  = tempcorr(temp.tW2, T_ref, T_A);
  TC_tN   = tempcorr(temp.tN1, T_ref, T_A);
  TC_tS   = tempcorr(temp.tS, T_ref, T_A);
  
  
  % life cycle abj
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
% zero-variate data  
 % start
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0); % cm d^-1, initial scaled reserve
  E_0  = U_E0 * p_Am; % J, energy in egg
  Wd_0 = w_E/ mu_E * E_0; % g,  dry weight at start
 
  % birth
  L_b   = L_m * l_b;                 % cm, structural length at birth at f
  Lw_bt = L_b/ del_M;                % cm, total length at birth at f
  aT_b  = t_b/ k_M/ TC_ab;           % d, age at birth at f and T
  Ww_b  = L_b^3 * (1 + f * w);       % g, wet weight at birth 
  Wd_b  = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth - remove d_V for wet weight 
  
  % metamorphosis
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_jt = L_j/ del_M;                % cm, total length at metam at f
%   Ww_j = L_j^3 *(1 + f * w);        % g, wet weight at metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since hatch at metam
  
  % puberty 
  L_p   = L_m * l_p;               % cm, structural length at puberty at f
  Lw_pt = L_p/ del_M;              % cm, total length at puberty at f
  aT_p  = (t_p - t_b)/ k_M/ TC_ap; % d, time since hatch at puberty at f and T
  Ww_p  = L_p^3 * (1 + f * w);     % g, wet weight at puberty 

  % ultimate
  L_i   = L_m * l_i;               % cm, ultimate structural length at f
  Lw_it = L_i/ del_M;              % cm, ultimate total length at f
  Ww_i  = L_i^3 * (1 + f * w);     % g, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T
 
  % pack to output  
  prdData.ab  = aT_b;
  prdData.tj  = tT_j;
  prdData.ap  = aT_p;
  prdData.am  = aT_m;
  prdData.Lb  = Lw_bt;
  prdData.Lj  = Lw_jt;
  prdData.Lp  = Lw_pt;
  prdData.Li  = Lw_it;
  prdData.Wd0 = Wd_0;
  prdData.Wwb = Ww_b;
  prdData.Wdb = Wd_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri  = RT_i;
  
  % uni-variate data
  
 % t-S data for larvae post hatch
  % assumption: birth is hatch; no metabolic acceleration during starvation
 
  % temperature correct parameters:
  pT_Am = p_Am *  TC_tS; vT = v * TC_tS; pT_M = p_M * TC_tS;
  kT_J  = k_J * TC_tS; kT_J1 = kT_J;
  % solve ODEs:
  [tt, LEHS] =  ode45(@dget_LEHS, tS(:,1), [L_b; E_m; E_Hb; 1; L_b; E_Hb] ,[],...
    pT_Am, vT, pT_M, E_G, kap, kap_G, kT_J, kT_J1, s_rejuv, s_shrink, 0); 
  
  % ------------------- SpenHuss2006  --------------------------------------
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; 
kT_M = k_M * TC_tW;   rT_j = rho_j * kT_M;   rT_B = rho_B * kT_M;    
tT_j = (t_j - t_b)/ kT_M ;     % d, time since birth at metam

% time-weight 
  L_bj = L_b * exp(tW((tW(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tW((tW(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  EWw = [L_bj; L_jm].^3 * (1 + f * w);  % g, wet weight      
  
 %  time-length       
  t_bj = tL(tL(:,1) <= tT_j,1);  % select times between birth & metamorphosis
  L_bj = (L_b * exp(t_bj * rT_j/3))/ del_M; % exponential growth as V1-morph
  t_ji = tL(tL(:,1) > tT_j,1); % selects times after metamorphosis
  L_ji = (L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j)))/del_M; % cm, expected length at time
  ELw = [L_bj; L_ji]; % cm, physical length
  
%  --------------  GonzCarb2016 ------------------------------------------

  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f2);
  rT_B = TC_tW2 * rho_B * k_M; rT_j = TC_tW2 * rho_j * k_M;    % 1/d, von Bert, exponential growth rate
  aT_b = t_b/ k_M/ TC_tW2; aT_j = t_j/ k_M/ TC_tW2;
  tT_j = aT_j - aT_b; % time since birth at metamorphosis
  L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;

  %  time-length  
  time = tL2(:,1) + 5.5; % d, time since birth
  t_bj = time(time <= tT_j,1); % select times between birth & metamorphosis
  L_bj = (L_b * exp(t_bj * rT_j/3))/del_M; % exponential growth as V1-morph
  t_ji = time(time > tT_j,1); % selects times after metamorphosis
  L_ji = (L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tT_j)))/del_M; % cm, expected length at time
  ELw2 = [L_bj; L_ji]; % catenate lengths
  
  % time-weight 
  time = tW2(:,1) + 5.5; % d, time since birth
  L_bj = L_b * exp(time((time <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (time(time > tT_j,1) - tT_j)); % cm, expected length at time
  EWw2 = [L_bj; L_jm].^3 * (1 + f2 * w);  % g, wet weight     
  
% ------------------ TehHint1998 -----------------------------------------

 [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f3);
  kT_M = k_M * TC_tW_f; rT_j = rho_j * kT_M;  rT_B = rho_B * kT_M;        
  tT_j = (t_j - t_b)/ kT_M ;     % d, time since birth at metam
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; 
  
 % time-weight  FEMALES
 time = tW_f(:,1) + 25;
  L_bj = L_b * exp(time((time <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (time((time > tT_j),1) - tT_j)); % cm, expected length at time
  EWw_f = [L_bj; L_jm].^3 * (1 + f3 * w);  % g, wet weight    
  
% time-weight MALES 
time = tW_m(:,1) + 25;
  L_bj = L_b * exp(time((time <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (time((time > tT_j),1) - tT_j)); % cm, expected length at time
  EWw_m = [L_bj; L_jm].^3 * (1 + f3 * w);  % g, wet weight      
  
  % t-N data for females
  f       = f1;
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0); % cm d^-1, initial scaled reserve
  E_0  = U_E0 * p_Am; % J, energy in egg

  E_init    = f * E_m * L_init^3; % J, initial energy in the body

  InitCond = [L_init; E_init; E_Hp; E_R_init; 0]; % concatenate initial conditions
  
  s_M  = L_j/ L_b; % -, acceleration factor
  TC = TC_tN;
  time = tN1(:,1); % d, time
  
[t, LEHR] = ode45(@ode_LEHR, time, InitCond,[], par, cPar, f, s_M, TC);
  % unpack vars:
  L    = LEHR(:,1);
  E    = LEHR(:,2);
  E_R  = LEHR(:,4);
  E_R1 = LEHR(:,5);
  % output
  EN1   = E_R1/ E_0; % # cum nb eggs
  EWw1  = L.^3 + w_E/ mu_E/ d_E * (E + E_R); % g, total wet weight
 
  
  % first two days, no fasting:
  [t, LEHR] = ode45(@ode_LEHR, [time(time<3);3+1e-5], InitCond,[], par, cPar, f, s_M, TC);
  L    = LEHR(1:end-1,1);
  E    = LEHR(1:end-1,2);
  E_R  = LEHR(1:end-1,4);
  E_R1 = LEHR(1:end-1,5);
  
  EN_1    = E_R1/ E_0; % # cum nb eggs
  EWw_1   = L.^3 + w_E/ mu_E/ d_E * (E + E_R); % g, total wet weight
 
   % rest of the time fasting:
  [t, LEHR] = ode45(@ode_LEHR, [3+1e-5;time(time>=3)], LEHR(end,:),[], par, cPar, 0, s_M, TC);  
  LEHR(1,:) = []; % remove dummy time  
  % unpack vars:  
  L    = LEHR(:,1);
  E    = LEHR(:,2);
  E_R  = LEHR(:,4);
  E_R1 = LEHR(:,5);
  
  EN_2   = E_R1/ E_0; % # cum nb eggs
  EWw_2  = L.^3 + w_E/ mu_E/ d_E * (E + E_R); % g, total wet weight  
   EN0    = [EN_1; EN_2]; % #, cum number of eggs
   EWw0   = [EWw_1; EWw_2]; % #, wet weight at beginning and end of the experiment

% ----------------- pack output ---------------------------
  
   prdData.tS = LEHS(:,4); 
   prdData.tL = ELw; 
   prdData.tW = EWw;
   prdData.tL2 = ELw2;
   prdData.tW2 = EWw2;
   prdData.tW_f = EWw_f;
   prdData.tW_m = EWw_m; 
   prdData.tN1 = EN1;
   prdData.tW1 = [EWw1(1); EWw1(end)];
   prdData.tN0 = EN0;
   prdData.tW0 = [EWw0(1); EWw0(end)] ;

 end
 
% subfunctions:
 
function dLEHS = dget_LEHS(t,LEHS,...
    p_Am, v, p_M, E_G, kap, kap_G, k_J, k_J1, s_rejuv, s_shrink, f) 

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
h_sh = s_shrink * k_M * max(0, maxL - L)/maxL;

dS = - S * (h_J + h_sh); % 1/d, survival fraction

% pack state variables
dLEHS = [dL; dE; dEH; dS; dmaxL; dmaxEH];

end

function dLEHR = ode_LEHR(t, LEHR, p, c, f, s_M, TC)

%
% Input: 
% p: structure 'par' 
% c: structure 'Cpar' obtained by cPar = parscomp_st(par)
% f: scaled, scaled functional response, 
% s_M: scalar, -, acceleration factor post metamorphosis
% TC, scalar, -, temperature correction factor
% E0, scalar, J, energy in egg

% --------------- unpack LEHR ------------------------------------------
L   =  max(0,LEHR(1)); % cm, volumetric structural length
E   =  max(0,LEHR(2)); % J,   energy in reserve 
EH  =  min(p.E_Hp,LEHR(3)); % J, E_H maturity
ER  =  max(0,LEHR(4)); % J, E_R reproduction buffer
ER1  =  max(0,LEHR(5)); % J, E_R reproduction buffer

% Temperature correct the relevant paramters
vT = p.v * TC; pT_M = p.p_M * TC; kT_J = p.k_J * TC; pT_Am = c.p_Am * TC;
pA   = f * pT_Am * L^2 * s_M * (EH >= p.E_Hb);           % J/d, assimilation

if EH < p.E_Hp % juveniles cannot cover somatic maintenance with the buffer   
    r  = (E * vT * s_M/ L - pT_M * L^3/ p.kap)/ (E + p.E_G * L^3/ p.kap) * ...
        (E >= pT_M * L^4/ (p.kap * vT * s_M)) + ...
         (E * vT * s_M/ L - pT_M * L^3/ p.kap)/ (E + c.kap_G * p.E_G * L^3/ p.kap) ...
         * (E < pT_M * L^4/ (p.kap * vT * s_M));

pC   = E * (vT * s_M/ L - r); % J/d, mobilisation
dE   = pA - pC;                                          % J/d, change in energy in reserve
dL   = r/ 3 * L;                                         % cm/d, change in structural length
dEH  = max(0, (1 - p.kap) * pC - kT_J * EH) * (EH < p.E_Hp);    % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
dER  = 0; 
dER1 = 0;
    
else % EH = EHp: adults  
    
 pC = E * (p.E_G * vT * s_M * L^2 + pT_M * L^3)/ (p.kap * E + p.E_G * L^3);    
 pCm  = c.E_m * (p.E_G * vT * L^2 + pT_M * L^3)/ (p.kap * c.E_m + p.E_G);
   
 
    if p.kap * pC >= pT_M * L^3   % enough energy in reserve to cover somatic maintenance and enough to make a batch   
        r    = (E * vT * s_M/ L^4 - pT_M/ p.kap)/ (E/ L^3 + p.E_G/ p.kap); % d^-1, specific growth rate  
        dE   = pA - pC;                                          % J/d, change in energy in reserve
        dL   = r/ 3 * L;                                         % cm/d, change in structural length
        dEH  = 0;    % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
        
        % Buffer handling rules:
        dER1 = p.kap_R *((1 - p.kap) * pCm - kT_J * p.E_Hp); % J/d, change in energy in ripe buffer
        dER1 = max(0, dER1);
        dER  = ((1 - p.kap) * pC - kT_J * p.E_Hp)  - dER1;       % J, change in cumulated energy invested in the unripe reproduction buffer
%         dER  = dER * (ER > 0);
   
    else  % not enough energy in reserve to cover somatic maintenance

        if ER > 0
            r = 0;
        else
             r    =  (E * vT * s_M/ L - pT_M * L^3/ p.kap)/ ...
            (E + c.kap_G * p.E_G  * L^3/ p.kap); % d^-1, specific growth rate
   
        end
        dE   = pA - pC;                                         % J/d, change in energy in reserve
        dL   = r/ 3 * L;                                        % cm/d, change in structural length
        dEH  = 0;                                               % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).
        dER  = (1 - p.kap) * pC - kT_J * p.E_Hp;
        dER  = dER  - max(0,pT_M * L^3 - p.kap * pC) * (ER > 0) ;
        dER1 = 0;
    
    end
     
end
 

% pack dLEHR
dLEHR = [dL; dE; dEH; dER; dER1];    

end
    
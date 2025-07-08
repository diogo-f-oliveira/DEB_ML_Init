function [prdData, info] = predict_Aporrectodea_caliginosa(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
pars_T = [T_A; T_H; T_AH];
TC_am = tempcorr(temp.am, T_ref, pars_T);
TC_tp = tempcorr(temp.tp, T_ref, pars_T);
TC_TP = tempcorr(C2K(TP(:,1)), T_ref, pars_T);
TC_15 = tempcorr(temp.m_R1, T_ref, pars_T);
TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, pars_T);

%% zero-variate data

% life cycle
pars_tp = [g k l_T v_Hb v_Hp];
[t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
 
% birth
L_b = L_m * l_b;                    % cm, structural length at birth at f
Lw_b = L_b/ del_M;                  % cm, physical length at birth at f
Ww_b = L_b^3 * (1 + f * w);         % g, wet weight at birth at f
  
% puberty
L_p = L_m * l_p;                    % cm, structural length at puberty at fLw_p = L_p/ del_M;                  % cm, physical length at puberty at f
Ww_p = L_p^3 *(1 + f * w);          % g, wet weight at puberty
tT_p = (t_p - t_b)/ k_M/ TC_tp;     % d, time since birth at puberty at f and T

% ultimate
l_i = f - l_T;                      % -, scaled ultimate length
L_i = L_m * l_i;                    % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                  % cm, ultimate physical length at f
Ww_i = L_i^3 * (1 + f * w);         % g, ultimate wet weight

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

% pack to output
prdData.tp = tT_p;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Li = Lw_i;
prdData.Wwb = Ww_b;
prdData.Wwp = Ww_p;
prdData.Wwi = Ww_i;

%% uni-variate data
  f_3 = f_Bart_high;
  f_2 = f_Bart_medium;
  f_1 = f_Bart_low; 

  pT_M = TC_15 * p_M; % J/d.cm^3, spec som maintenance
  vT = TC_15 * v;     % cm/d, energy conductance, 
  kT_J = TC_15 * k_J;  % 1/d, maturity maintenance rate coeff
  kT_M = TC_15 * k_M;  % 1/d, somatic maintenance rate coeff
  pT_Am = p_Am * TC_15; % J/d.cm^2, surface-area specific maximum assimilation rate, 
  E0 = f * p_Am/v * (L_b)^3; % J, initial reserve
  ER0 = 0; % J, initial reproduction buffer 
  pars_UE0 = [V_Hb; g; kT_J; kT_M ; vT]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
   
  % time - wet weight: Bart et al. 2019 - 3g horse dung indviduals
  t = tW11(:,1);
  par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G, f_3, E_Hp, kap_R]; % pack parameters 
  LEHRCS_0 = [L_b; E0; E_Hb; ER0]; % pack initial conditions  
  [t, LEHR] = ode45(@get_LEHR, t, LEHRCS_0, [], par_LEHR);
  EWw11 = LEHR(:,1).^3 * (1 + f_3 * w); % g, wet mass
   
  % time - wet weight: Bart et al. 2019 - 1.5g horse dung individuals
  t = tW13(:,1);
  E0 = f * p_Am/v * (L_b)^3; % J, initial reserve
  par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G, f_2, E_Hp, kap_R]; % pack parameters 
  LEHRCS_0 = [L_b; E0; E_Hb; ER0]; % pack initial conditions  
  [t, LEHR] = ode45(@get_LEHR, t, LEHRCS_0, [], par_LEHR);
  EWw13 = LEHR(:,1).^3 * (1 + f_2 * w); % g, wet mass

  % time - wet weight: Bart et al. 2019 - 1g horse dung individuals
  t = tW12(:,1);
  par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G, f_1, E_Hp, kap_R]; % pack parameters 
  LEHRCS_0 = [L_b; E0; E_Hp; ER0]; % pack initial conditions
  [t, LEHR] = ode45(@get_LEHR, t, LEHRCS_0, [], par_LEHR);
  EWw12 = LEHR(:,1).^3 * (1 + f_1 * w); % g, wet mass 
   
  % time - wet weight: Bart et al. 2019 - 3g horse dung grouped worms
  f_b=f_Bart_high_b;
  t = tW11b(:,1); f_t = f_3*ones(length(t),1); f_t(t>98) = f_b;
  par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G, f_3, E_Hp, kap_R]; % pack parameters 
  LEHR_0 = [L_b; E0; E_Hp; ER0]; % pack initial conditions 
  [t, LEHR] = ode45(@get_LEHR, t, LEHR_0, [], par_LEHR, f_b);  
  EWw11b  = LEHR(:,1).^3 .* (1 + f_t * w);
 
  % time - cum offspring: Bart et al. 2019 - 3g horse dung
  t = tN2(:,1);
  par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G, f_3, E_Hp, kap_R]; % pack parameters 
  LEHR_0 = [L_b; E0; E_Hb; ER0]; % pack initial conditions
  [t, LEHR] = ode45(@get_LEHR, t, LEHR_0, [], par_LEHR, f_b);
  EN2 = LEHR(:,4)/(U_E0 * pT_Am); % g, wet mass 
   
  % time - wet weight: Bart et al. 2019 - 1g horse dung grouped worms
  f_b = f_Bart_low_b;
  t = tW12b(:,1); f_t = f_1*ones(length(t),1); f_t(t>98) = f_b;
  par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G, f_1, E_Hp, kap_R]; % pack parameters 
  LEHR_0 = [L_b; E0; E_Hp; ER0]; % pack initial conditions 
  [t, LEHR] = ode45(@get_LEHR, t, LEHR_0, [], par_LEHR, f_b);  
  EWw12b  = LEHR(:,1).^3 .* (1 + f_t * w);
   
  % time - cum offspring: Bart et al. 2019 - 1g horse dung
  t = tN3(:,1);
  par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G, f_1, E_Hp, kap_R]; % pack parameters 
  LEHR_0 = [L_b; E0; E_Hb; ER0]; % pack initial conditions
  [t, LEHR] = ode45(@get_LEHR, t, LEHR_0, [], par_LEHR, f_b);   
  EN3 = LEHR(:,4)/(U_E0 * pT_Am); % g, wet mass   
   
  % Temperature - age at birth (Bart et al. 2018)
  ETab = (t_0 + t_b/ k_M) ./ TC_Tab;   % d, age at birth

%% Movement vs. environmental factors...............................

  % functional response / half saturation coefficient / relative burrow length as function of OM content
  J_Am = p_Am/kap_X; 
  k = J_Am/F_m;
  Exf = xf(:,1).*mu_OM./(k + xf(:,1).*mu_OM);

  % temperature - cast production
  OM = 4; %OM
  f_c = OM * mu_OM/(k + OM * mu_OM);
  L = (0.419/(1 + f_c * w))^(1/3) ; % mean worm wet weight in experiment 0.419 g
  ETP = f_c* L^2 *p_Am /kap_X / mu_OM .* TC_TP; % g/d, Cast production; assuming that ingestion rate = egestion rate
  
  % burrow length - moisture
  Exf_m = r_mb*L^2 *(xf_m(:,1) - m_0); %cm/d, burrow rate 
  Exf_m(Exf_m < 0) = 0;
  Exf_m(Exf_m > max_r_mb*L^2) = max_r_mb*L^2;
  
  % diapause - moisture (soil matric potential)
  bTw = bw * TC_15;  
  H = bTw*(m_diap (:,1) - m_0); % diapause hazard
  H(H < 0) = 0;
  Em_D = exp(-H)*100; %population spread; diapause/immobility probability
  
  % cocoon production and adult body weight - moisture % - data set 1..... 
   L_0= L0;   
   OM = 4;       
   f_OM = OM * mu_OM/(k + OM * mu_OM);
   E0 = f_OM * pT_Am/vT * (L_0)^3; % J, initial reserve
   Ww0 = L0^3 * (1 + f_OM * w );
   Ww0 = Ww0 + Wwg; 
   ER0 = 0; % J, initial reproduction buffer   
   Em_R = []; %initialize
   Em_Ww = [];%initialize 

  for i = 1:length(m_R1)  
  % calculate f from moisture related burrow rate 
    rT_b = min(max_r_mb * L_0^2 * TC_15  ,   r_mb*L_0^2 * TC_15 * max (0, m_R1(i,1) - m_0)); %cm/d, burrow rate    
    f_m = rT_b/ (max_r_mb*L_0^2 * TC_15)  * f_OM; 

    %weight after 14 days 
    t = [1 14];
    %t = tW11(1:2,1);
    par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G, f_OM, E_Hp, kap_R]; % pack parameters 
    LEHRCS_0 = [L_0; E0; E_Hp; ER0]; % pack initial conditions  
    [t, LEHR] = ode45(@get_LEHR, t, LEHRCS_0, [], par_LEHR);
    L = LEHR(end,1);                          
    Ww = (L.^3 * (1 + f_m * w + (f_OM - f_m) * wV) + Wwg)  /Ww0 ;  %adult weight relative to initial 
                      
    %reproduction rate after 14 days
    E = f_m * pT_Am/vT * L^3;
    r = ((E * vT / L^4) - (pT_M / kap)) / ((E / L^3) + (E_G / kap)); % 1/d, specific growth rate
    pC = E * (vT / L_0 -  r);       % J/d, mobilization
    pJ = E_Hp * kT_J;               % J/d; energy invested in maturity     
    RT = kap_R * max(0, (1 - kap) * pC - pJ )/ (U_E0 * pT_Am)*7; %reproduction per week
   
    % pack to output                                 
    Em_Ww = [Em_Ww Ww];
    Em_R = [Em_R RT];
    
  end
  Em_R1  = transpose(Em_R);
  Em_Ww1  = transpose(Em_Ww);

  % cocoon production and adult body weight - moisture % - data set 1.....
   %Byghom 3 OM%
   OM = 3;       
   f_OM = OM * mu_OM/(k + OM * mu_OM); 
   E0 = f_OM * pT_Am/vT * (L_0)^3; % J, initial reserve
   Ww0 = L0^3 * (1 + f_OM * w );
   Ww0 = Ww0 + Wwg; 
   ER0 = 0; % J, initial reproduction buffer  
   Em_R = []; %initialize
   Em_Ww = [];%initialize 

  for i = 1:length(m_R2)  
  % calculate f from moisture related burrow rate 
    rT_b = min(max_r_mb*L_0^2 * TC_15  ,   r_mb *L_0^2 * TC_15 * max (0, m_R2(i,1) - m_0)); %cm/d, burrow rate    
    f_m = rT_b/ (max_r_mb *L_0^2* TC_15)  * f_OM; 

    %weight after 14 days
    t = [1 14];
    par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G, f_OM, E_Hp, kap_R]; % pack parameters 
    LEHRCS_0 = [L_0; E0; E_Hp; ER0]; % pack initial conditions  
    [t, LEHR] = ode45(@get_LEHR, t, LEHRCS_0, [], par_LEHR);
    L = LEHR(end,1);     
    
    Ww = (L.^3 * (1 + f_m * w + (f_OM- f_m) * wV) + Wwg)  /Ww0 ;    %adult weight relative to initial                          
                          
    %reprodcution rate after 14 days
    E = f_m * pT_Am/vT * L^3;
    r = ((E * vT / L^4) - (pT_M / kap)) / ((E / L^3) + (E_G / kap)); % 1/d, specific growth rate
    pC = E * (vT / L_0 -  r);       % J/d, mobilization
    pJ = E_Hp * kT_J;               % J/d; energy invested in maturity  
    %RT = kap_R * max(0, (1 - kap) * pC - pJ )/ (U_E0/kT_J); % J/d investment in reproduction  
    RT = kap_R * max(0, (1 - kap) * pC - pJ )/(U_E0 * pT_Am)*7; %reproduction per week
    
    % pack to output                                 
    Em_Ww = [Em_Ww Ww];
    Em_R = [Em_R RT]; 
    
  end
  Em_R2  = transpose(Em_R);
  Em_Ww2  = transpose(Em_Ww);

  %moisture  - juvenile weight 
  %Foulum = 4% OM = data set 1
   OM = 4;       
   f_OM = OM * mu_OM/(k + OM * mu_OM);
   L_0 = (0.048 / (1 + f_OM * w))^(1/3); %cm, initial structural length
   E0 = f_OM * pT_Am/vT * (L_0)^3; % J, initial reserve
   ER0 = 0; % J, initial reproduction buffer   
   Em_R = []; %initialize
   Em_Ww = [];%initialize 
   Em_Wd = [];%initialize 
  for i = 1:length(m_Wwj1)  
  % calculate f from moisture related burrow rate 
    rT_b = min(max_r_mb*L_0^2 * TC_15  ,   r_mb*L_0^2 * TC_15 * max (0, m_Wwj1(i,1) - m_0)); %cm/d, burrow rate    
    f_m = rT_b/ (max_r_mb *L_0^2* TC_15)  * f_OM; 

    %weight after 28 days 
    t = [1 28];
    par_LEHR = [pT_M, vT, kT_J, pT_Am, kap, E_G, f_OM, E_Hp, kap_R]; % pack parameters 
    LEHRCS_0 = [L_0; E0; E_Hp; ER0]; % pack initial conditions  
    [t, LEHR] = ode45(@get_LEHR, t, LEHRCS_0, [], par_LEHR);
    L = LEHR(end,1);
    Ww = L.^3 * (1 + f_m * w + (f_OM - f_m) * wV); % g, wet mass
    Wd = L.^3 * d_V * (1 + f_m * w);
    % pack to output                                 
    Em_Ww = [Em_Ww Ww];
    Em_Wd = [Em_Wd Wd];
  end
  Em_Wwj1  = transpose(Em_Ww);
  Em_Wdj  = transpose(Em_Wd);
  
  %% pack to output
  prdData.tW11 = EWw11;
  prdData.tW11b = EWw11b;
  prdData.tW12 = EWw12;
  prdData.tW12b = EWw12b;
  prdData.tW13 = EWw13;
  prdData.tN2 = EN2;
  prdData.tN3 = EN3;
  prdData.TP = ETP;
  prdData.Tab = ETab;
  prdData.xf = Exf;
  prdData.xf_m = Exf_m;
  prdData.m_diap = Em_D;
  prdData.m_R1 = Em_R1;
  prdData.m_Ww1 = Em_Ww1;
  prdData.m_R2 = Em_R2;
  prdData.m_Ww2 = Em_Ww2;
  prdData.m_Wwj1 = Em_Wwj1;
  prdData.m_Wdj = Em_Wdj;
end

function [dLEHR] = get_LEHR(t, LEHR, par_LEHR, f_b)
    %% function to calculate L, E, H, R  dynamically over time
    p_M     = par_LEHR(1); % J/d.cm^3, vol-spec somatic maint
    v       = par_LEHR(2); % cm/d, energy conductance
    k_J     = par_LEHR(3); % 1/d, maturity maint rate coefficient
    p_Am    = par_LEHR(4); % J / d.cm^2, surface-area specific maximum assimilation rate
    kap     = par_LEHR(5); % -, allocation fraction to soma
    E_G     = par_LEHR(6); % J/cm^3, spec cost for structure
    f       = par_LEHR(7); % -, scaled functional response 
    E_Hp    = par_LEHR(8); % J, maturity at puberty
    kap_R   = par_LEHR(9); % -, reproduction efficiency    

    % initialize output parameters
    L       = LEHR(1); % cm, state 1 is the structural length at previous time point
    E       = LEHR(2); % J, state 2 is the energy reserve
    H       = LEHR(3); % J, state 3 is energy invested in maturity
    R       = LEHR(4); % J, state 4 is the reproduction buffer
          
    if exist('f_b','var') && t>98 
      f = f_b;
    end
    
    % growth rate
    r = ((E * v / L^4) - (p_M / kap)) / ((E / L^3) + (E_G / kap)); % 1/d, specific growth rate

    % fluxes
    pC = E * (v / L -  r);            % J/d, mobilization
    pA = f * p_Am * L^2;              % J/d, assimilation
    pJ = H * k_J;                     % J/d; energy invested in maturity  
    
    % calculate changes in state variables
    dL = L * r / 3;                   % cm/d growth
    dE = pA - pC;                     % J/d reserve dynamics
    dH = (H < E_Hp) * max(0, (1 - kap) * pC - pJ);          % J/d increase in maturation     
    dR = (H >= E_Hp) * kap_R * max(0, (1 - kap) * pC - pJ ); % J/d investment in reproduction
    
    dLEHR = [dL; dE; dH; dR]; % collect derivatives 
    
end


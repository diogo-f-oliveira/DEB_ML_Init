function [prdData, info] = predict_Chelonia_mydas(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  filterChecks = k * v_Hp >= f^3 || ...         % constraint required for reaching puberty with f
                 ~reach_birth(g, k, v_Hb, f) ||... ;% constraint required for reaching birth with f
                fB > 1 ||... ;
                fB < 0.6 ||... ;
                fF > 1 ||... ;
                fF < 0.6 ||... ;
                fH > 1 ||... ;
                fH < 0.6 ||... ;
                fX > 1 ||... ;
                fX < 0.6 ||... ;
                k > 1 ||... ; 
            E_Hh >= E_Hb;

  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  


  % compute temperature correction factors

  %%%%%%% using 3-parameter Arrhenius function (with upper boundary defined)
  pars_T = [T_A; T_H; T_AH];
  TC_ah = tempcorr(temp.ah, T_ref, pars_T);
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_ap = tempcorr(temp.ap, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  TC_L0Lt = tempcorr(temp.L0Lt, T_ref, pars_T);
TC_Tah = tempcorr(C2K(Tah(:,1)), T_ref, pars_T);

TC_27BS  = tempcorr(temp.tWwe_T27B, T_ref, pars_T);
TC_27BR  = tempcorr(temp.tJOe_T27B, T_ref, pars_T);
TC_27FS  = tempcorr(temp.tWwe_T27F, T_ref, pars_T);
TC_27FR  = tempcorr(temp.tJOe_T27F, T_ref, pars_T);
TC_27HS  = tempcorr(temp.tWwe_T27H, T_ref, pars_T);
TC_27HR  = tempcorr(temp.tJOe_T27H, T_ref, pars_T);
TC_27XS  = tempcorr(temp.tWwe_T27X, T_ref, pars_T);
TC_27XR  = tempcorr(temp.tJOe_T27X, T_ref, pars_T);

TC_31BS  = tempcorr(temp.tWwe_T31B, T_ref, pars_T);
TC_31BR  = tempcorr(temp.tJOe_T31B, T_ref, pars_T);
TC_31FS  = tempcorr(temp.tWwe_T31F, T_ref, pars_T);
TC_31FR  = tempcorr(temp.tJOe_T31F, T_ref, pars_T);
TC_31HS  = tempcorr(temp.tWwe_T31H, T_ref, pars_T);
TC_31HR  = tempcorr(temp.tJOe_T31H, T_ref, pars_T);
TC_31XS  = tempcorr(temp.tWwe_T31X, T_ref, pars_T);
TC_31XR  = tempcorr(temp.tJOe_T31X, T_ref, pars_T);

%       
% zero-variate data

pars_tp = [g k l_T v_Hb v_Hp];
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
    
  U_E0 = initial_scaled_reserve(fN, pars_UE0); % d.cm^2, initial scaled reserve for Ningaloo population
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); %%% reference food level (i.e. f=1) - used to calculate Li_ref
  [t_pN, t_bN, l_pN, l_bN, info] = get_tp(pars_tp, fN); % Ningaloo population

  % start 
  Ww_0 = w_E/ mu_E * U_E0 * p_Am/ d_E; % g, wet weight of egg
  E_0  =  U_E0 * p_Am; % J, initial energy in the egg
  
  %hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h  = aUL(2,1);    % d, age at hatch
  aT_h = (t_0 + a_h)/ TC_ah; % d, age at hatch at T
  L_h  = aUL(2,3);    % cm, structural length at hatch
  Lw_h = L_h/ del_MS; % cm, SCL at hatch
  E_h  = aUL(2,2) * p_Am;  % J, energy in reserve at hatch
  Ww_h = L_h^3 + w_E * E_h/ mu_E/ d_E; % g, wet weight at hatch

  % birth
aT_b =  (t_0 + t_bN/ k_M)/ TC_ab;


  % puberty 
  L_p = L_m * l_pN;                  % cm, structural length at puberty at fN
  Lw_p = L_p/ del_MC;         % cm, physical length at puberty at fN
  Ww_p = L_p^3 *(1 + fN * w);        % g, wet weight at puberty 
  aT_p = t_pN/ k_M/ TC_ap;           % d, age at puberty at fN and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i_ref = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i_ref = L_i_ref/ del_MC;                % cm, ultimate physical length at f
    
  l_iN = fN - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_iN;                  % cm, ultimate structural length at fN
  Lw_i = L_i/ del_MC;                % cm, ultimate physical length at fN
  Ww_i = L_i^3 * (1 + fN * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, fN, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, fN, l_bN);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Li_ref = Lw_i_ref;
  prdData.Wwh = Ww_h;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.E0 = E_0;
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% UNI-VARIATE DATA%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% e_b = f; % this is because of the maternal effect rule -

%    1 mol oxygen = 22.4 L
%    1 umol = 22.4 uL (u = micro) or 0.044643 umol = 1 uL

  %%% age at hatch
 
  Eah = (t_0 + a_h) ./ TC_Tah;           % d, age at birth at f and T
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% 27 DEGREES %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% CLUTCH B %%%%%%%
%%% yolk mass
e_b = fB;
t_0_27BS = t_0/TC_27BS;
U_E0_B = initial_scaled_reserve(fB, pars_UE0); % d.cm^2, initial scaled reserve
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_Y_T27B, par, cPar, TC_27BS, U_E0_B, e_b, t_0_27BS);
EWwe_Y_T27B = EWw_Y;
%%%% yolk-free embryo mass
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_T27B, par, cPar, TC_27BS, U_E0_B, e_b, t_0_27BS); 
EWwe_T27B = EWw_e; % predicted wet structure in g  
%%% respiration
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tJOe_T27B, par, cPar, TC_27BR, U_E0_B, e_b, t_0_27BS);
EJO_T27B = EJT_O; % O2 flux in ml/h
EJC_T27B = EJT_C; % CO2 flux in ml/h

%%%%%% CLUTCH F %%%%%%%
%%%% yolk mass
e_b = fF;
t_0_27FS = t_0/TC_27FS;
U_E0_F = initial_scaled_reserve(fF, pars_UE0); % d.cm^2, initial scaled reserve
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_Y_T27F, par, cPar, TC_27FS, U_E0_F, e_b, t_0_27FS);
EWwe_Y_T27F = EWw_Y;
%%%% yolk-free embryo mass
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_T27F, par, cPar, TC_27FS, U_E0_F, e_b, t_0_27FS); 
EWwe_T27F = EWw_e; % predicted wet structure in g 
% %%% respiration
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tJOe_T27F, par, cPar, TC_27FR, U_E0_F, e_b, t_0_27FS);
EJO_T27F = EJT_O; % O2 flux in ml/h
EJC_T27F = EJT_C; % CO2 flux in ml/h

%%%%%% CLUTCH H %%%%%%%
%%%% yolk mass
e_b = fH;
t_0_27HS = t_0/TC_27HS;
U_E0_H = initial_scaled_reserve(fH, pars_UE0); % d.cm^2, initial scaled reserve
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_Y_T27H, par, cPar, TC_27HS, U_E0_H, e_b, t_0_27HS);
EWwe_Y_T27H = EWw_Y;
%%%% yolk-free embryo mass
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_T27H, par, cPar, TC_27HS, U_E0_H, e_b, t_0_27HS); 
EWwe_T27H = EWw_e; % predicted wet structure in g  
%%% respiration
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tJOe_T27H, par, cPar, TC_27HR, U_E0_H, e_b, t_0_27HS);
EJO_T27H = EJT_O; % O2 flux in ml/h
EJC_T27H = EJT_C; % CO2 flux in ml/h

%%%%%% CLUTCH X %%%%%%%
%%%% yolk mass
e_b = fX;
t_0_27XS = t_0/TC_27XS;
U_E0_X = initial_scaled_reserve(fX, pars_UE0); % d.cm^2, initial scaled reserve
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_Y_T27X, par, cPar, TC_27XS, U_E0_X, e_b, t_0_27XS);
EWwe_Y_T27X = EWw_Y;
%%%% yolk-free embryo mass
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_T27X, par, cPar, TC_27XS, U_E0_X, e_b, t_0_27XS); 
EWwe_T27X = EWw_e; % predicted wet structure in g    
%%% respiration
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tJOe_T27X, par, cPar, TC_27XR, U_E0_X, e_b, t_0_27XS);
EJO_T27X = EJT_O; % O2 flux in ml/h
EJC_T27X = EJT_C; % CO2 flux in ml/h
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% 31 DEGREES %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%% CLUTCH B %%%%%%%
%%%% yolk mass
e_b = fB;
t_0_31BS = t_0/TC_31BS;
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_Y_T31B, par, cPar, TC_31BS, U_E0_B, e_b, t_0_31BS);
 EWwe_Y_T31B = EWw_Y; % g, wet weight yolk
%%% body mass
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_T31B, par, cPar, TC_31BS, U_E0_B, e_b, t_0_31BS);
EWwe_T31B = EWw_e; % predicted wet structure in g        
%%% %respiration
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tJOe_T31B, par, cPar, TC_31BR, U_E0_B, e_b, t_0_31BS);
EJO_T31B = EJT_O; % O2 flux in ml/h
EJC_T31B = EJT_C; % CO2 flux in ml/h
  
%%%%%% CLUTCH F %%%%%%%
%%%% yolk mass
e_b = fF;
t_0_31FS = t_0/TC_31FS;
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_Y_T31F, par, cPar, TC_31FS, U_E0_F, e_b, t_0_31FS);
 EWwe_Y_T31F = EWw_Y; % g, wet weight yolk
%%% body mass
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_T31F, par, cPar, TC_31FS, U_E0_F, e_b, t_0_31FS);
EWwe_T31F = EWw_e; % predicted wet structure in g        
% %% respiration
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tJOe_T31F, par, cPar, TC_31FR, U_E0_F, e_b, t_0_31FS);
EJO_T31F = EJT_O; % O2 flux in ml/h
EJC_T31F = EJT_C; % CO2 flux in ml/h

%%%%%% CLUTCH H %%%%%%%
%%%% yolk mass
e_b = fH;
t_0_31HS = t_0/TC_31HS;
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_Y_T31H, par, cPar, TC_31HS, U_E0_H, e_b, t_0_31HS);
 EWwe_Y_T31H = EWw_Y; % g, wet weight yolk
% %%%% body mass
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_T31H, par, cPar, TC_31HS, U_E0_H, e_b, t_0_31HS);
EWwe_T31H = EWw_e; % predicted wet structure in g        
%%% respiration
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tJOe_T31H, par, cPar, TC_31HR, U_E0_H, e_b, t_0_31HS);
EJO_T31H = EJT_O; % O2 flux in ml/h
EJC_T31H = EJT_C; % CO2 flux in ml/h

%%%%%% CLUTCH X %%%%%%%
%%%% yolk mass
e_b = fX;
t_0_31XS = t_0/TC_31XS;
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_Y_T31X, par, cPar, TC_31XS, U_E0_X, e_b, t_0_31XS);
 EWwe_Y_T31X = EWw_Y; % g, wet weight yolk
% %%%% body mass
[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tWwe_T31X, par, cPar, TC_31XS, U_E0_X, e_b, t_0_31XS);
EWwe_T31X = EWw_e; % predicted wet structure in g        
%%% respiration

[EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(tJOe_T31X, par, cPar, TC_31XR, U_E0_X, e_b, t_0_31XS);
EJO_T31X = EJT_O; % O2 flux in ml/h
EJC_T31X = EJT_C; % CO2 flux in ml/h


%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% FIELD DATA %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% length-weight
EWw = (LWw(:,1) * del_MC).^3 * (1 + fN * w); % CCL

%%%% Growth in length between two re-capture events
  %f = 1;   
  Lw_i = fN * L_m/ del_MC;              % cm, ultimate length
  Lw_0 = L0Lt(:,1); % cm, CCL at first capture 
  
kT_M = k_M*TC_L0Lt;
rT_B = kT_M/3/(1 + fN/g);
  
  ELt = Lw_i - (Lw_i - Lw_0) .* exp( - rT_B * time.L0Lt); % cm, expected length at time

  % pack to output
  prdData.Tah = Eah; %  incub
  
  prdData.tWwe_Y_T27B = EWwe_Y_T27B;
  prdData.tWwe_T27B = EWwe_T27B;
  prdData.tJOe_T27B = EJO_T27B;
  prdData.tJCe_T27B = EJC_T27B;
  
  prdData.tWwe_Y_T27F = EWwe_Y_T27F;
  prdData.tWwe_T27F = EWwe_T27F;
  prdData.tJOe_T27F = EJO_T27F;
  prdData.tJCe_T27F = EJC_T27F;
  
  prdData.tWwe_Y_T27H = EWwe_Y_T27H;
  prdData.tWwe_T27H = EWwe_T27H;
  prdData.tJOe_T27H = EJO_T27H;
  prdData.tJCe_T27H = EJC_T27H;
  
  prdData.tWwe_Y_T27X = EWwe_Y_T27X;
  prdData.tWwe_T27X = EWwe_T27X;
  prdData.tJOe_T27X = EJO_T27X;
  prdData.tJCe_T27X = EJC_T27X;
  
  prdData.tWwe_Y_T31B = EWwe_Y_T31B;
  prdData.tWwe_T31B = EWwe_T31B;
  prdData.tJOe_T31B = EJO_T31B;
  prdData.tJCe_T31B = EJC_T31B;
  
  prdData.tWwe_Y_T31F = EWwe_Y_T31F;
  prdData.tWwe_T31F = EWwe_T31F;
  prdData.tJOe_T31F = EJO_T31F;
  prdData.tJCe_T31F = EJC_T31F;
  
  prdData.tWwe_Y_T31H = EWwe_Y_T31H;
  prdData.tWwe_T31H = EWwe_T31H;
  prdData.tJOe_T31H = EJO_T31H;
  prdData.tJCe_T31H = EJC_T31H;
  
  prdData.tWwe_Y_T31X = EWwe_Y_T31X;
  prdData.tWwe_T31X = EWwe_T31X;
  prdData.tJOe_T31X = EJO_T31X;
  prdData.tJCe_T31X = EJC_T31X;
  
     prdData.LWw = EWw;
    prdData.L0Lt = ELt;  

end


function [EL, EWw_e, EWw_Y, EJT_O, EJT_C] = get_LWYOC(age, p, c, TC, U_E0, e_b, t_0)  
    

% temperature correct parameter values:
vT = p.v * TC; kT_J = TC * p.k_J; pT_M = p.p_M * TC; UT_E0 = U_E0/ TC; 
JT_E_Am = c.J_E_Am * TC; 
% pT_Am = c.p_Am * TC; %%% comment out to use for calculations

 a = age(:,1) - t_0;  i_sel = (a > 0); a = [-1e-10; a(i_sel)]; % d, ages
[~, LUH] = ode45(@dget_LUH, a, [1e-10 UT_E0 0], [], p.kap, vT, kT_J, c.g, c.L_m);
LUH(1,:) = [];
L   = LUH(:,1); L3 = L .^3; 
M_E = LUH(:,2) * JT_E_Am; 
ee  = p.mu_E * M_E ./ L3/ c.E_m;


L   = LUH(:,1); % cm, structural length
EL  = L/p.del_MS;  % cm, length of embryo 

EWw_e        = 0 * age(:,1);  
EWw_e(i_sel) = L.^3 * (1 + e_b * c.w); % g, wet yolk-free embryo mass 

EWd_Y = 0 * age(:,1); 
EWd_Y(i_sel) = max(0, LUH(:,2) * JT_E_Am  - e_b * 1 * LUH(:,1).^ 3 * c.M_V) * c.w_E; % g, dry yolk

EWw_Y = EWd_Y/ p.d_Y; % g, wet yolk mass 
   
r   = vT * (ee ./ L - 1/ c.L_m) ./ (ee + c.g); pC = (vT ./ L - r) .* M_E * p.mu_E; 
pM  = pT_M * L3; 
pG  = p.kap * pC - pM; 
pD  = pM + (1 - p.kap) * pC;

eta_VG = p.d_V/ p.E_G/ c.w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ p.mu_E; 0 0];
J_M    = (- c.n_M\c.n_O * eta * [pD pG]')'; % mol/d, mineral fluxes

EJT_O  = 0 * age(:,1);
EJT_O(i_sel)  = - J_M(:,3) * 1e3 * 22.4/ 24;   % O2 flux in ml/h
 
EJT_C = 0 * age(:,1);
EJT_C(i_sel)  = J_M(:,1) * 1e3 * 22.4/24;      % CO2 flux in ml/h


end

function TC = tempcorr (T, T_ref, pars_T)
  %  Created at 2002/04/09 by Bas Kooijman; modified 2005/01/24, 2016/11/18
  % modified by JS to fit only the upper boundary for the 3-parameter function 2018/05/30
  
  %% Syntax
  % TC = <../tempcorr.m *tempcorr*> (T, T_ref, pars_T)

  %% Description
  %  Calculates the factor with which physiological rates should be multiplied 
  %    to go from a reference temperature to a given temperature. 
  %
  % Input
  %
  % * T: vector with new temperatures
  % * T_ref: scalar with reference temperature
  % * pars_T: 1-, 3- or 5-vector with temperature parameters
  %
  %    1: T_A
  %    3:%%% usually T_A, T_L, T_AL but  modified to T_A, T_H, T_AH for this file to describe the upper boundary only
  %    5: T_A, T_L, T_H, T_AL, T_AH    
  %
  % Output:
  %
  % * TC: vector with temperature correction factor(s) that affect(s) all rates
   
  %% Remarks
  %  shtempcorr shows a graph of this correction factor as function of the temperature. 
  
  %% Example of use
  %  tempcorr([330 331 332], 320, [12000 277 318 20000 190000]) and 
  %  shtemp2corr(320, [12000 277 318 20000 190000]). 

  T_A = pars_T(1); % Arrhenius temperature
  if length(pars_T) == 1
    TC = exp(T_A/ T_ref - T_A ./ T);

%%%%%%%%%%%%%%%%% this has been modified to describe only the upper boundary (rather than the lower boundary)
  elseif length(pars_T) == 3

    T_H  = pars_T(2);  % Upper temp boundary
     T_AH = pars_T(3);  % Arrh. temp for upper boundary
    TC = exp(T_A/ T_ref - T_A ./ T) .* ...
	     (1 +  exp(T_AH/ T_H - T_AH ./ T_ref)) ./ ...
	     (1 +  exp(T_AH/ T_H - T_AH ./ T    ));
       
  else
    T_L  = pars_T(2);  % Lower temp boundary
    T_H  = pars_T(3);  % Upper temp boundary
    T_AL = pars_T(4);  % Arrh. temp for lower boundary
    T_AH = pars_T(5);  % Arrh. temp for upper boundary

    TC = exp(T_A/ T_ref - T_A ./ T) .* ...
	     (1 + exp(T_AL ./ T_ref - T_AL/ T_L) + exp(T_AH/ T_H - T_AH ./ T_ref)) ./ ...
	     (1 + exp(T_AL ./ T     - T_AL/ T_L) + exp(T_AH/ T_H - T_AH ./ T    ));
  end
end
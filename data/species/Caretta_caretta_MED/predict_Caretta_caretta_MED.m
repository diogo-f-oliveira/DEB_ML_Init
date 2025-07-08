function [prdData, info] = predict_Caretta_caretta_MED(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  filterChecks = k * v_Hp >= f_Lab^3 || ...     % constraint required for reaching puberty with f_Lab
          ~reach_birth(g, k, v_Hb, f_Lab) ||... % constraint required for reaching birth with f_Lab
                E_Hh >= E_Hb||...               % maturity at hatching, birth
                del_MC >= del_MS||...           % shape coefficient
                z > z_NA ;                     % z of MED should not be larger than z of NA 
                % \--> this constraint interferes with the procedure if z is free though !
 
%   keyboard
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_Tah_Reid = tempcorr(C2K(Tah_Reid(:,1)), T_ref, T_A);
  TC_Tah_Zbin = tempcorr(C2K(Tah_Zbin(:,1)), T_ref, T_A);
  TC_Cas = tempcorr(temp.am, T_ref, T_A);
   
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap and v constant

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1)+t_0; aT_h = a_h/ TC_ah; % d, age at hatch at f and T
%   L_h = aUL(2,3); Lw_h = L_h/ del_M; % cm, SCL at hatch
%   E_h = aUL(2,2)/ p_Am; Ww_h = L_h^3 + w_E * E_h/ mu_E/ d_E; % g, wet weight at hatch


  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_MS;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = (t_b/k_M +t_0)/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p_SCL = L_p/ del_MS;           % cm SCL, physical length at puberty at f
  Lw_p_CCL = L_p/ del_MC;           % cm CCL, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = t_p/ k_M/ TC_tp - aT_b;   % d, time since birth at puberty at f and T


  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i_SCL = L_i/ del_MS;           % cm SCL, ultimate physical length at f
  Lw_i_CCL = L_i/ del_MC;           % cm CCL, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am ;               % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tp = tT_p/365;
  prdData.am = aT_m/365;
%   prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp_SCL = Lw_p_SCL;
  prdData.Lp_CCL = Lw_p_CCL;
  prdData.Li_SCL = Lw_i_SCL;
  prdData.Li_CCL = Lw_i_CCL;
%   prdData.Wwh = Ww_h;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.E0 = E0;
  prdData.Ri = RT_i;
  
%    disp(w)
  %% uni-variate data
  % temp-ah
  Eah_Reid = a_h ./ TC_Tah_Reid; % Reid incub
  Eah_Zbin = a_h ./ TC_Tah_Zbin; % Reid incub
  
 %% ---> posthatchlings & juveniles
% Cate1-10
% chose which length measure to use:
% L_birth = Lb*del_MS; % from data
  L_birth = L_b; % predicted
L0 = L_birth; E0 = L0^3 * p_Am/ v; H0 = E_Hb;
ELH_b = [f_Lab * E0; L0; H0]; % state vector at start for captive turtles

% tW_Cate23 = '2206','2211','2220','2221','2222','2224'
% tW_Cate23_25 = '2202','2213' ; tW_Cate23_22 = '2207','2215' ;
% tW_Cate23_X = '2208','2209','2210','2223' 
% tW_Cate23_26 = '2217','2218','2226','2302'
 
tW_turt = {'T3T4', 'Cate23','Cate23_25','Cate23_22','Cate23_X','Cate23_26'};
for ii= 1:2 % constant temp -- calculate TC before and pars into equation! 
    eval([  't = [0; tW_', tW_turt{ii},'(:,1)];']) % d, time since birth
    eval([ ' TC = tempcorr(temp.tW_', tW_turt{ii}, ', T_ref, T_A);' ])
    [a ELH] = ode45(@dget_ELH, t, ELH_b, [], L_birth, par, cPar, TC, f_Lab);    % get derivatives
     ELH(1,:) = []; L = ELH(:,2);
    eval([ 'EWw_',num2str(ii),'= L.^3 * (1 + f_Lab * w); '])  % pack output
end

for ii= 3:length(tW_turt)
    eval([  't = [0; tW_', tW_turt{ii},'(:,1)];']) % d, time since birth
    eval([ '[a ELH] = ode45(@dget_ELH1, t, ELH_b, [], L_birth, par, cPar, temp.tW_',...
        tW_turt{ii}, ', f_Lab);'   ])    % get derivatives
     ELH(1,:) = []; L = ELH(:,2);
    eval([ 'EWw_',num2str(ii),'= L.^3 * (1 + f_Lab * w); '])  % pack output
end
%%%%
% tL_Cate23 = '2206','2211','2220','2221','2222','2224'
% tL_Cate23_22 = '2207','2215' ;
% tL_Cate23_X = '2208','2209','2210','2223' 
% tL_Cate23_26 = '2217','2218'

tL_turt={'Cate23', 'Cate22', 'CateX','Cate23_26'};  %% 'length total' (CCL)

for ii= 1:length(tL_turt)-1  % constant temp -- calculate TC before and pars into equation! 
    eval([  't = [0; tL_', tL_turt{ii},'(:,1)];']) % d, time since birth
    eval([ ' TC = tempcorr(temp.tL_', tL_turt{ii}, ', T_ref, T_A);' ])
    [a ELH] = ode45(@dget_ELH, t, ELH_b, [], L_birth, par, cPar, TC, f_Lab ); % get derivatives
    ELH(1,:) = []; L = ELH(:,2);
    eval([ 'ELw_',num2str(ii),'= L / del_MC; '])  % pack output
end
   [a ELH] = ode45(@dget_ELH1, [0; tL_Cate23_26(:,1)], ELH_b, [], L_birth, par, cPar, ...
       temp.tL_Cate23_26, f_Lab ); % get derivatives
    ELH(1,:) = []; eval([ 'ELw_',num2str(ii+1),'= ELH(:,2) / del_MC; '])  % pack output
    
%%%% SCL !!! = '2226', '2302'
 t = [0; tL_Cate23_26s(:,1)]; % d, time since birth
 [a , ELH] = ode45(@dget_ELH1, t, ELH_b, [], L_birth, par, cPar, temp.tL_Cate23_26s, f_Lab );    % get derivatives
  ELH(1,:) = []; L = ELH(:,2);
  ELw_Cate23_26s = L / del_MS; % pack output
% 2215
 t = [0; tL_Cate22s(:,1)]; % d, time since birth
 TC = tempcorr(temp.tL_Cate22s, T_ref, T_A);
 [a , ELH] = ode45(@dget_ELH, t, ELH_b, [], L_birth, par, cPar, TC, f_Lab );    % get derivatives
  ELH(1,:) = []; L = ELH(:,2);
  ELw_Cate22s = L / del_MS; % pack output

% curved LW
 ELWw_Cate = (LW_Cate(:,1) * del_MC).^3 *(1 + f_Lab * w) ; 
% straight LW  = '2226', '2302'
 sELWw_Cate = (sLW_Cate(:,1) * del_MS).^3 *(1 + f_Lab * w) ; 

 
  %%%%% DATA FROM WILD %%%%%%%%%
  
  % length - fecundity per nest; % Fecundity = [egg number]/# of nests = [kap_R * R_T /E_0]/nest.LF
  R = reprod_rate(LN(:,1)*del_MS, f, pars_R);  % #/d, reproduction rate at T
  % R not corrected for temp because the temp correction cancels with fecund temp corr
  ELN = R * 365 ./ fecund.LN';  % #/ clutch
   
 % time - length from the wild
 
 growth = 'mono' ; % options: 'mono' (monophasic), 'bi' (biphasic)
switch growth 
    case 'mono'
%   [t_p, t_b, l_p, l_b] = get_tp(pars_tp, f); % length at birth
ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_Cas/ ir_B;     % d, 1/von Bert growth rate (at typical T and f)
% ELw_1 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL1(:,1)); % cm, total length
  L_i = f * L_m; Lw_i = L_i/ del_MC; L_b = get_lb([g k v_Hb], f) * L_m; Lw_b = L_b/ del_MC;
  ELw_CP = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL_CasaPino2009(:,1)); % cm, total length
  ELw_CC = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL_CasaConte2011(:,1)); % cm, total length
  
    case 'bi' % INSTEAD, APPROXIMATE A BIPHASIC GROWTH AND USE DATA AS L_1
    
    Lw_b = 4.1 ; % use actual size at birth
    L_i = L_m * (0.5*f - l_T); Lw_i = L_i/ del_MC; % 
     rT_B = TC_Cas  * (k_M/3)/(1 + 0.5*f/g);   % d, 1/von Bert growth rate 
    
    Lw_1 = 30; % length when they switch habitat / change growth curve
    t_1 = 1/rT_B*log((Lw_i-Lw_b)/(Lw_i-Lw_1));
      
     time = tL_CasaPino2009(tL_CasaPino2009(:,1) < t_1);
        ELw1 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * time); % cm, total length;

    time = tL_CasaConte2011(tL_CasaConte2011(:,1) < t_1);
        ELw3 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * time); % cm, total length; 

    % second part
    L_i = L_m * (f - l_T); Lw_i = L_i/ del_MC; % 
       rT_B = TC_Cas * (k_M/3)/(1+f/g);     % d, 1/von Bert growth rate
    
    time =tL_CasaPino2009(tL_CasaPino2009(:,1) >= t_1);
       ELw2 = Lw_i - (Lw_i - Lw_1) * exp( - rT_B * (time-t_1)); % cm, total length
    
    time = tL_CasaConte2011(tL_CasaConte2011(:,1) >= t_1);
        ELw4 = Lw_i - (Lw_i - Lw_1) * exp( - rT_B * (time-t_1)); % cm, total length
        
     % pack
      ELw_CP = [ELw1; ELw2]; 
      ELw_CC = [ELw3; ELw4]; 
end
  
 
  %% pack to output
  prdData.Tah_Reid = Eah_Reid; % Reid incub
  prdData.Tah_Zbin = Eah_Zbin; % Zbinden incub
  prdData.LN = ELN; % TiwaBjorn fecundity
  prdData.tL_CasaPino2009 = ELw_CP; %  CasaPino
  prdData.tL_CasaConte2011 = ELw_CC; %  CasaConte

   for ii= 1:length(tW_turt)
       eval([ 'prdData.tW_', tW_turt{ii}, '= EWw_',num2str(ii), ' ;'])  % pack output
   end
   prdData.tL_Cate23_26s = ELw_Cate23_26s;
   prdData.tL_Cate22s = ELw_Cate22s;
   
   for ii= 1:length(tL_turt)
       eval([ 'prdData.tL_', tL_turt{ii}, '= ELw_',num2str(ii), ' ;'])  % pack output
   end
   prdData.LW_Cate = ELWw_Cate ;  % pack output - curved
   prdData.sLW_Cate = sELWw_Cate ;  % pack output - straight
        
 
 
%   keyboard
%   
%     save('data_Caretta_caretta_MED', 'prdData',  '-append') %% comment out  during estimation!
end 
      
 %% SUBFUNCTIONS
function dELH = dget_ELH1(t, ELH, Lb, par, cPar, tT, f)
%  change in state variables during juvenile stage
%  dELH = dget_ELH_p_pj(t, ELH)
%  ELH: 3-vector
%   E: reserve E
%   L: structural length
%   H: maturity E_H
%  dELH: change in reserve, length, scaled maturity


%  unpack variables
E = ELH(1); L = ELH(2); H = ELH(3);
kappa = par.kap; 

%adjust the temperature (from predict_Oncorhynchus_tshawytscha.m)
if length(tT)>=2
    TC = tempcorr(spline1(t, tT), par.T_ref, par.T_A);
else
    TC = tempcorr(tT, par.T_ref, par.T_A);
end
kT_J = par.k_J * TC;  vT = par.v * TC; pT_Am = cPar.p_Am * TC;
pT_M = par.p_M * TC ; 

% standard model equations, from Marn et al 2017 
EL3 = E/ L^3; % reserve density
rT =  (EL3 * vT/L - pT_M/kappa) / ( EL3 + par.E_G/kappa ) ; % 1/d, spec growth rate
pT_C = E * (vT/ L - rT); % J/d, mobilisation
pT_G = kappa*pT_C -  pT_M * L^3;  % J/d, growth flux (fraction of mobilized - som.maint)

% generate dH/dt, dE/dt, dL/dt
dE = (H > par.E_Hb) * pT_Am * f * L^2 - pT_C; % J/d
dH = (1 - kappa) * pT_C - kT_J * H; % pR, J/d (fraction of mobilized - mat.maint)
dL = 1/(3*L^2) * pT_G/par.E_G; % cm/d , growth of structure 

% pack derivatives
dELH = [dE; dL; dH];
end

function dELH = dget_ELH(t, ELH, Lb , par, cPar, TC, f)
% same as dget_ELH1 but without change in temp!
%  change in state variables during juvenile stage
%  dELH = dget_ELH_p_pj(t, ELH)
%  ELH: 3-vector
%   E: reserve E
%   L: structural length
%   H: maturity E_H
%  dELH: change in reserve, length, scaled maturity


%  unpack variables
E = ELH(1); L = ELH(2); H = ELH(3);
kappa = par.kap; 

% correct for temp
kT_J = par.k_J * TC;  vT = par.v * TC; pT_Am = cPar.p_Am * TC;
pT_M = par.p_M * TC ; 

% standard model equations, from Marn et al 2017 
EL3 = E/ L^3; % reserve density
rT =  (EL3 * vT/L - pT_M/kappa) / ( EL3 + par.E_G/kappa ) ; % 1/d, spec growth rate
pT_C = E * (vT/ L - rT); % J/d, mobilisation
pT_G = kappa*pT_C -  pT_M * L^3;  % J/d, growth flux (fraction of mobilized - som.maint)

% generate dH/dt, dE/dt, dL/dt
dE = (H > par.E_Hb) * pT_Am * f * L^2 - pT_C; % J/d
dH = (1 - kappa) * pT_C - kT_J * H; % pR, J/d (fraction of mobilized - mat.maint)
dL = 1/(3*L^2) * pT_G/par.E_G; % cm/d , growth of structure 

% pack derivatives
dELH = [dE; dL; dH];
end

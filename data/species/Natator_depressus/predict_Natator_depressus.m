function [prdData, info] = predict_Natator_depressus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % customized filters for allowable parameters of the standard DEB model (std)
  % for other models consult the appropriate filter function.
%   filterChecks = k * v_Hp >= f_E^3 || ...              % constraint required for reaching puberty with f_E
%                  k >= 1 || ...
%                  ~reach_birth(g, k, v_Hb, f_E) ||...   % constraint required for reaching birth with f_E
%                  E_Hh >= E_Hb || U_Hh  >= U_Hb || U_Hh <= 0 ||... % this will give problems in ODE-solvers if estimation algorithm chooses an inaproppriate value for any of these pars
%                  t_0 < 10 ||... ; % biologically does not make sense
%                  f_tW1 > 1 ||... ;
%                  f_tW1 < 0.6 ||... ;
%                  f_tW2 > 1 ||... ;
%                  f_tW2 < 0.6 ||... ;
%                  f_tW3 > 1 ||... ;
%                  f_tW3 < 0.6 ||... ;
%                  f_tW4 > 1 ||... ;
%                  f_tW4 < 0.6 ||... ;
%                  f_tW5 > 1 ||... ;
%                  f_tW5 < 0.6 ||... ;
%                  f_tW6 > 1 ||... ;
%                  f_tW6 < 0.6 ;          
%   if filterChecks  
%     info = 0;
%     prdData = {};
%     return;
%   end  

  %% compute temperature correction factors
  % using 3-parameter Arrhenius function (with upper boundary defined)
  pars_T = [T_A; T_H; T_AH];
  % zero-variate
  TC_ah = tempcorr(temp.ah, T_ref, pars_T);
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_ap = tempcorr(temp.ap, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  % uni-variate
  TC_Tah = tempcorr(Tah(:,1), T_ref, pars_T);
  TC_tW_rear = tempcorr(temp.tW_11, T_ref, pars_T); % --> temp same for all reared hatchlings!
  TC_L0Lt = tempcorr(temp.L0Lt, T_ref, pars_T);
  
  %% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);  
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];            % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0);  % d.cm^2, initial scaled reserve for Eighty Mile Beach population
  Ww_0 = U_E0*p_Am/mu_E*w_E/d_E;                % g, initial wet weight of egg
  E_0  =  U_E0 * p_Am;                          % J, initial energy in the egg

  % hatch   
  [~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
%   L_h = L_m * l_b;                   % cm, structural length at hatch 
  L_h = aUL(2,3); 
  Lw_h = L_h/ del_MS;                  % cm, physical length at hatch 
  Ww_h = L_h^3 * (1 + f * ome);         % g, wet weight at hatch 
  a_h = aUL(2,1);                      % d, age at hatch 
  aT_h = (t_0 + a_h)/ TC_ah;           % d, age at hatch at T 

  % birth
  L_b = L_m * l_b ;                    % cm, structural length at birth 
  Lw_b = L_b/ del_MS;                  % cm, physical length at birth 
  Ww_b = L_b^3 * (1 + f * ome);         % g, wet weight at birth 
  aT_b = (t_0 + t_b/ k_M)/ TC_ab;     % d, age at birth at T
% aT_b = (t_0 + aUL(3,1)) / TC_ab;   % d, age at birth at T - this should give the same value as line above (you can check)

  % puberty 
  L_p = L_m * l_p;                     % cm, structural length at puberty at f
  Lw_p = L_p/ del_MC;                  % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);         % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;              % d, age at puberty at f and T

 % ultimate
  l_i = f - l_T;                       % -, scaled ultimate length
  L_i = L_m * l_i;                     % cm, ultimate structural length at f
  Lw_i = L_i/ del_MC;                  % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);        % g, ultimate wet weigth
      
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f_E, pars_R);            % #/d, ultimate reproduction rate at T

  % life span 
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
 
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwh = Ww_h;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.E0 = E_0;
  
%% uni-variate data
  
   Eah = (t_0 + a_h) ./ TC_Tah; % you need t_0 here too (see line 50)
  
%   length-weight

%   Roebuck sub adults and adults (captured in water)
  EW_roeadlt = (LW_roeadlt(:,1) * del_MC).^3 * (1 + f_E * w); % g, wet weight
  
  %   Thevenard females (post nesting, so weights do not include all the reproduction buffer)
  EW_thevfem = (LW_thevfem(:,1) * del_MC).^3 * (1 + f_T * w); % g, wet weight
  
%% Growth in length between two re-capture events 
 rT_B = TC_L0Lt * k_M/ 3/ (1 + f_E/ g); % 1/d, von Bert growth rate 
 Lw_i = L0Lt(:,1)/ (f_E - (f_E - get_lp(pars_tp, f_E)) * exp(- rT_B * 1.6 * 365));% cm, ultimate CCL Eighty Mile beach (f_E)
 ELt = Lw_i - (Lw_i - L0Lt(:,1)) .* exp( - rT_B * time.L0Lt); % cm, CCL at second capture

%% turtles collected at Eighty Mile Beach and reared from birth at AQWA,Perth by Mike Salmon and Jeanette Wyneken (see Salmon et al. 2015)

 Clutch1 = [11, 12, 13, 14, 15 ]; Clutch2 = [21, 22, 23, 24, 25] ; Clutch3 = [31, 32, 33, 34, 35, 36, 37, 38 ]; 
 Clutch4 =[41, 42, 43] ;  Clutch5 = [51, 52, 53, 54, 55];  Clutch6 = [61, 62, 63, 64, 65, 66];
 Clutches = [Clutch1, Clutch2, Clutch3, Clutch4, Clutch4, Clutch5, Clutch6];

  for ii = 1 : length(Clutch1)
     cc = Clutch1(ii);
     eval(['EW1 = (LW_', num2str(cc),'(1,1) * del_MS).^3 *(1 + f_tW1 * w);'])     % g, wet weight before birth, depends on f of mother    
     eval(['EW2 = (LW_', num2str(cc),'(2:end,1) * del_MS).^3 *(1 + f_tWR * w);']) % g, wet weight during rearing    
     eval(['EW_', num2str(cc), ' = [EW1 ; EW2];']) % g, pack together 
% NOTE: if you want to exclude the first pair, comment out the line above, and use the line below. Same for the next 5 for loops
%      eval(['EW_', num2str(cc), ' = EW2;') % g, pack only wet weight af_Ter f_Eeding
  end
 
 for ii = 1 : length(Clutch2)
     cc = Clutch2(ii);
     eval(['EW1 = (LW_', num2str(cc),'(1,1) * del_MS).^3 *(1 + f_tW2 * w);'])     % g, wet weight at birth, depends on f of mother    
     eval(['EW2 = (LW_', num2str(cc),'(2:end,1) * del_MS).^3 *(1 + f_tWR * w);']) % g, wet weight during rearing    
     eval(['EW_', num2str(cc), ' = [EW1 ; EW2];']) % g, pack together
 end
 
 for ii = 1 : length(Clutch3)
     cc = Clutch3(ii);
     eval(['EW1 = (LW_', num2str(cc),'(1,1) * del_MS).^3 *(1 + f_tW3 * w);'])     % g, wet weight at birth, depends on f of mother    
     eval(['EW2 = (LW_', num2str(cc),'(2:end,1) * del_MS).^3 *(1 + f_tWR * w);']) % g, wet weight during rearing    
     eval(['EW_', num2str(cc), ' = [EW1 ; EW2];']) % g, pack together
 end
  
 for ii = 1 : length(Clutch4)
     cc = Clutch4(ii);
     eval(['EW1 = (LW_', num2str(cc),'(1,1) * del_MS).^3 *(1 + f_tW4 * w);'])     % g, wet weight at birth, depends on f of mother    
     eval(['EW2 = (LW_', num2str(cc),'(2:end,1) * del_MS).^3 *(1 + f_tWR * w);']) % g, wet weight during rearing    
     eval(['EW_', num2str(cc), ' = [EW1 ; EW2];']) % g, pack together
 end
 
 for ii = 1 : length(Clutch5)
     cc = Clutch5(ii);
     eval(['EW1 = (LW_', num2str(cc),'(1,1) * del_MS).^3 *(1 + f_tW5 * w);'])     % g, wet weight at birth, depends on f of mother    
     eval(['EW2 = (LW_', num2str(cc),'(2:end,1) * del_MS).^3 *(1 + f_tWR * w);']) % g, wet weight during rearing    
     eval(['EW_', num2str(cc), ' = [EW1 ; EW2];']) % g, pack together
 end
 
 for ii = 1 : length(Clutch6)
     cc = Clutch6(ii);
     eval(['EW1 = (LW_', num2str(cc),'(1,1) * del_MS).^3 *(1 + f_tW6 * w);'])     % g, wet weight at birth, depends on f of mother    
     eval(['EW2 = (LW_', num2str(cc),'(2:end,1) * del_MS).^3 *(1 + f_tWR * w);']) % g, wet weight during rearing    
     eval(['EW_', num2str(cc), ' = [EW1 ; EW2];']) % g, pack together
 end
  

%%   age-weight

L_i = f_tWR * L_m;  % --> applies to all reared hatchlings
%   weight af_Ter birth --> will diff_Er if food or temps diff_Er (but all on same f_tWR, and also same water temp)
rT_B = TC_tW_rear * (k_M/3)/(1 + f_tWR/g);   % d, 1/von Bert growth rate


%  Clutch 1 --> all hatchlings in this clutch will have the same (predicted) length and wet weight at hatch and birth, same also for clucthes 2-6.
%  weight at hatch
Ww_h = L_h^3 * (1 + f_tW1 * w);                       % g, wet weight at hatch at f

%  Hatchling 1-1 to Hatchling 1-5
U_E0 = initial_scaled_reserve(f_tW1, pars_UE0);    
[~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
L_b = aUL(3,3);
for ii = 1: length(Clutch1)
    cc = num2str(Clutch1(ii)); 
    eval(['L = L_i - (L_i - L_b) .* exp( - rT_B .* tW_', cc, '(2:end ,1));']) % cm, total length;
    EW = L.^3 * (1 + f_tWR * w);                                              % g, expected wet weight at time, f = f_tWR
    eval(['EtW_', cc, ' = [Ww_h; EW];'])                                      % pack output
% NOTE: if you want to NOT use the first data point, comment out the line above, and use the line below. Same for next 5 for loops
% eval(['EtW_', cc, ' = EW;']) % only weight post-birth
end

%  Clutch 2
%  weight at hatch
Ww_h = L_h^3 * (1 + f_tW2 * w);                       % g, wet weight at hatch at f

%  Hatchling 2-1 to Hatchling 2-5
U_E0 = initial_scaled_reserve(f_tW2, pars_UE0);    
[~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
L_b = aUL(3,3);
for ii = 1: length(Clutch2)
    cc = num2str(Clutch2(ii)); 
    eval(['L = L_i - (L_i - L_b) .* exp( - rT_B .* tW_', cc, '(2:end ,1));']) % cm, total length;
    EW = L.^3 * (1 + f_tWR * w);                                              % g, expected wet weight at time, f = f_tWR
    eval(['EtW_', cc, ' = [Ww_h; EW];'])                                      % pack output
end

%  Clutch 3
%  weight at hatch
Ww_h = L_h^3 * (1 + f_tW3 * w);                       % g, wet weight at hatch at f

%  Hatchling 3-1 to Hatchling 3-8
U_E0 = initial_scaled_reserve(f_tW3, pars_UE0);    
[~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
L_b = aUL(3,3);
for ii = 1: length(Clutch3)
    cc = num2str(Clutch3(ii)); 
    eval(['L = L_i - (L_i - L_b) .* exp( - rT_B .* tW_', cc, '(2:end ,1));']) % cm, total length;
    EW = L.^3 * (1 + f_tWR * w);                                              % g, expected wet weight at time, f = f_tWR
    eval(['EtW_', cc, ' = [Ww_h; EW];'])                                      % pack output
end

%  Clutch 4
%  weight at hatch
Ww_h = L_h^3 * (1 + f_tW4 * w);                       % g, wet weight at hatch at f

%  Hatchling 4-1 to Hatchling 4-3
U_E0 = initial_scaled_reserve(f_tW4, pars_UE0);    
[~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
L_b = aUL(3,3);
for ii = 1: length(Clutch4)
    cc = num2str(Clutch4(ii)); 
    eval(['L = L_i - (L_i - L_b) .* exp( - rT_B .* tW_', cc, '(2:end ,1));']) % cm, total length;
    EW = L.^3 * (1 + f_tWR * w);                                              % g, expected wet weight at time, f = f_tWR
    eval(['EtW_', cc, ' = [Ww_h; EW];'])                                      % pack output
end

%  Clutch 5
%  weight at hatch
Ww_h = L_h^3 * (1 + f_tW5 * w);                       % g, wet weight at hatch at f

%  Hatchling 5-1 to Hatchling 5-5
U_E0 = initial_scaled_reserve(f_tW5, pars_UE0);    
[~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
L_b = aUL(3,3);
for ii = 1: length(Clutch5)
    cc = num2str(Clutch5(ii)); 
    eval(['L = L_i - (L_i - L_b) .* exp( - rT_B .* tW_', cc, '(2:end ,1));']) % cm, total length;
    EW = L.^3 * (1 + f_tWR * w);                                              % g, expected wet weight at time, f = f_tWR
    eval(['EtW_', cc, ' = [Ww_h; EW];'])                                      % pack output
end

%  Clutch 6
%  weight at hatch
Ww_h = L_h^3 * (1 + f_tW6 * w);                       % g, wet weight at hatch at f

%  Hatchling 6-1 to Hatchling 6-6
U_E0 = initial_scaled_reserve(f_tW6, pars_UE0);    
[~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
L_b = aUL(3,3);
for ii = 1: length(Clutch6)
    cc = num2str(Clutch6(ii)); 
    eval(['L = L_i - (L_i - L_b) .* exp( - rT_B .* tW_', cc, '(2:end ,1));']) % cm, total length;
    EW = L.^3 * (1 + f_tWR * w);                                              % g, expected wet weight at time, f = f_tWR
    eval(['EtW_', cc, ' = [Ww_h; EW];'])                                      % pack output
end

%% pack output
  prdData.Tah = Eah;
  prdData.LW_roeadlt = EW_roeadlt;
  prdData.LW_thevfem = EW_thevfem;
  prdData.L0Lt = ELt;  
  for ii = 1: length(Clutches)
      cc = num2str(Clutches(ii)); 
      eval(['prdData.LW_', cc,' = EW_', cc, ';'])
      eval(['prdData.tW_', cc,' = EtW_', cc, ';'])
  end
  
end

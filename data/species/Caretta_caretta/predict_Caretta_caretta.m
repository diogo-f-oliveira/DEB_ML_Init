function [prdData, info] = predict_Caretta_caretta(par, data, auxData)

% unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  filterChecks = k * v_Hp >= f_Lab^3 || ...            % constraint required for reaching puberty with f_Lab
                 ~reach_birth(g, k, v_Hb, f_Lab) ||... % constraint required for reaching birth with f_Lab
                E_Hh >= E_Hb ||...                     % maturity at hatching, birth
                del_CCL_a >= del_SCL_a;                % shape coefficient
 
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_Stok = tempcorr(temp.tL_Stok2014_1, T_ref, T_A); % Stok
  TC_Park1 = tempcorr(temp.tW_Park1929_1, T_ref, T_A); % tW_Park1, tL_Park
  TC_Park2 = tempcorr(temp.tW_Park1929_2, T_ref, T_A); % tW_Park2-4
  TC_HildHats = tempcorr(temp.tW_HildHats1927_1, T_ref, T_A); % tW_HH1-2, tL_HH
  TC_Tah = tempcorr(C2K(Tah(:,1)), T_ref, T_A);
  TC_LdL = tempcorr(temp.tp, T_ref, T_A);

% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  E_0 = iniRes.E0; % from auxData
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap and v constant

  % hatch   
 [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
a_h = (aUL(2,1)+t_0); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
L_h = aUL(2,3); Lw_h = L_h/ del_SCL; % cm, SCL at hatch
Ww_h = (w_V + f * m_Em * w_E)* M_V * L_h^3 / d_V; %  FROM MUELAUGU2102 FOR EMBRYO MASS, same as one below


  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_SCL;            % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = (t_b/k_M + t_0)/ TC_ab;    % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_SCL_a;            % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p/k_M)/ TC_ap + aT_b;   % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_SCL_a;            % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T
  % adjust for difference between predicted and observed egg energy
%     RT_i = RT_i * E0/E_0; %predicted vs observed

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwh = Ww_h;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.E0 = E0;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  % temp-ae
   Eae = (aT_h + 4.1)*TC_ah ./ TC_Tah; % data from Stokes2006, incubation duration, since age at hatching is calculated, 
  % it is corrected to age at emergence using the avg value of 4.1d hatch-to-emergence {GodfMros1997} (assumed to be at 30C). 
  % the temp.corrected a_h+4.1 is un-corrected back to T_ref (20C), and then corrected to temp of incubation
 
  % time-length, weight at f_Lab , for Stok2014_1,2,3
%   L_birth = Lb*del_SCL; % from data
  L_birth = L_b; % predicted
  Linit = L_birth; Einit = Linit^3 * p_Am/ v; Hinit = E_Hb;
  ELH_b = [f_Lab * Einit; Linit; Hinit]; % state vector at start for captive turtles
  
   Stokes=[1:6];% number of Stokes datasets
    
    for ii= 1:length(Stokes)
        eval([  't = [0; tW_Stok2014_', num2str(ii),'(:,1)];']) % d, time since birth
        [a ELH] = ode45(@dget_ELH1, t, ELH_b, [], L_birth, par, cPar, TC_Stok, f_Lab);    % get derivatives
        ELH(1,:) = []; L = ELH(:,2);
       eval([ 'ELw_',num2str(ii),'= L(1: length(tL_Stok2014_', num2str(ii),'(:,1))) / del_SCL; '])  % pack output
       eval([ 'EWw_',num2str(ii),'= L.^3 * (1 + f_Lab * w); '])  % pack output
    end
    
% % (length)time-weight at f (held in semi-natural housing, but fed)

      t = [0; tL_Park1926(:,1)]; % d, time since birth
      [a ELH] = ode45(@dget_ELH1, t, ELH_b, [], L_birth, par, cPar, TC_Park1, f_Lab);    % get derivatives
      ELH(1,:) = []; L = ELH(:,2);
      ELw_Park1926 = L / del_CL; % cm, physical length
      
      t = [0; tW_Park1929_1(:,1)]; % d, time since birth
      [a ELH] = ode45(@dget_ELH1, t, ELH_b, [], L_birth, par, cPar, TC_Park1, f_Lab);    % get derivatives
      ELH(1,:) = []; L = ELH(:,2);
      EWw_Park1929_1 = ELH(:,2).^3 * (1 + f_Lab * w);
      
      % time-weight at f_Lab , for Park1929_2,3,4
      t = [0; tW_Park1929_2(:,1)]; % d, time since birth
        [a ELH] = ode45(@dget_ELH1, t, ELH_b, [], L_birth, par, cPar, TC_Park2, f_Lab);    % get derivatives
      ELH(1,:) = []; L = ELH(:,2);
      EWw_Park1929_2 = ELH(:,2).^3 * (1 + f_Lab * w);
      
      t = [0; tW_Park1929_3(:,1)]; % d, time since birth
      [a ELH] = ode45(@dget_ELH1, t, ELH_b, [], L_birth, par, cPar, TC_Park2, f_Lab);    % get derivatives
      ELH(1,:) = []; L = ELH(:,2);
      EWw_Park1929_3 = ELH(:,2).^3 * (1 + f_Lab * w);
      
      t = [0; tW_Park1929_4(:,1)]; % d, time since birth
      [a ELH] = ode45(@dget_ELH1, t, ELH_b, [], L_birth, par, cPar, TC_Park2, f_Lab);    % get derivatives
      ELH(1,:) = []; L = ELH(:,2);
      EWw_Park1929_4 = ELH(:,2).^3 * (1 + f_Lab * w);
      
      t = [0; tL_HildHats1927(:,1)]; % d, time since birth
      [a ELH] = ode45(@dget_ELH1, t, ELH_b, [], L_birth, par, cPar, TC_HildHats, f_Lab);    % get derivatives
      ELH(1,:) = []; L = ELH(:,2);
      ELw_HildHats1927 = L / del_CL; % cm, physical length
      
      t = [0; tW_HildHats1927_1(:,1)]; % d, time since birth
      [a ELH] = ode45(@dget_ELH1, t, ELH_b, [], L_birth, par, cPar, TC_HildHats, f_Lab);    % get derivatives
      ELH(1,:) = []; L = ELH(:,2);
      EWw_HildHats1927_1 = ELH(:,2).^3 * (1 + f_Lab * w);
      
      t = [0; tW_HildHats1927_2(:,1)]; % d, time since birth
      [a ELH] = ode45(@dget_ELH1, t, ELH_b, [], L_birth, par, cPar, TC_HildHats, f_Lab);    % get derivatives
      ELH(1,:) = []; L = ELH(:,2);
      EWw_HildHats1927_2 = ELH(:,2).^3 * (1 + f_Lab * w);
      
   
  % length-weight
  EWw_L1 = (LW_Stok2014_1(:,1) * del_SCL).^3 * (1 + f_Lab * w); % g, expected wet weight at length; Stok1
  EWw_L2 = (LW_Stok2014_2(:,1) * del_SCL).^3 * (1 + f_Lab * w); % g, expected wet weight at length; Stok2
  EWw_L3 = (LW_Stok2014_3(:,1) * del_SCL).^3 * (1 + f_Lab * w); % g, expected wet weight at length; Stok3
  EWw_L4 = (LW_Stok2014_4(:,1) * del_SCL).^3 * (1 + f_Lab * w); % g, expected wet weight at length; Stok4
  EWw_L5 = (LW_Stok2014_5(:,1) * del_SCL).^3 * (1 + f_Lab * w); % g, expected wet weight at length; Stok5
  EWw_L6 = (LW_Stok2014_6(:,1) * del_SCL).^3 * (1 + f_Lab * w); % g, expected wet weight at length; Stok6
 
  L1 = LW_WabnPaul2008(LW_WabnPaul2008(:,1)<48,1) ; %BjorBolt2000 SCL at pelagic>neritic switch
  L2 = LW_WabnPaul2008(LW_WabnPaul2008(:,1)>=48,1) ;
  EWw_L_WabnPaul2008 = [(L1 * del_SCL).^3 * (1 + f * w); ...
        (L2 * del_SCL_a).^3 * (1 + f * w)];     % g, expected wet weight at time; WabnPaul1

 
  % length - fecundity per nest; % Fecundity = [egg number]/# of nests = [kap_R * R_T /E0]/nest.LF
  R =  reprod_rate(LN(:,1)*del_SCL_a, f, pars_R);  % #/d, reproduction rate at T, 
    % do NOT correct for temp here, because temp correction in R and fecund cancel out
%     N =length(data.LF);  
  EN = R * 365 ./ fecund.LN;  % #/ clutch

  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%% new data included (Feb 2018)%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% von Bertalanffy
% pelagic
Lw_i_CCL = f * L_m/ del_CCL_a;              % cm, ultimate length CCL
Lw_i_SCL = f * L_m/ del_SCL_a;              % cm, ultimate length SCL
ir_B = 3/ k_M + 3 * f * L_i/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate

%%%% Growth in length between two re-capture events
TC_BjorBolt = tempcorr(temp.L0Lt_BjorBolt2000, T_ref, T_A);
Lw_0 = L0Lt_BjorBolt2000(:,1); % cm, CCL at first capture
ELt_BjorBolt2000 = Lw_i_CCL - (Lw_i_CCL - Lw_0) .* exp( - (r_B * TC_BjorBolt) * time.L0Lt_BjorBolt2000); % cm, expected length at time

Lw_0 = L0Lt_SnovAven2007(:,1); % cm, SCL (!) at first capture
ELt_SnovAven2007 = Lw_i_SCL - (Lw_i_SCL - Lw_0) .* exp( - (r_B*TC_am) * time.L0Lt_SnovAven2007); % cm, expected length at time

%%%%% length - change in length (growth rate) % (from Apalone_spinifera)
kT_M = k_M * TC_LdL * 365; % per YEAR
rT_B = kT_M/ 3/ (1 + f/ g);

ELdL_BjorBolt2000 = rT_B * (Lw_i_CCL - LdL_BjorBolt2000(:,1));
ELdL_ScotMars2012 = rT_B * (Lw_i_CCL - LdL_ScotMars2012(:,1));
ELdL_BjorSchr2013 = rT_B * (Lw_i_CCL - LdL_BjorSchr2013(:,1));
TC_BE08 = tempcorr(temp.LdL_BrauEppe2008, T_ref, T_A);
ELdL_BrauEppe2008 = (r_B*TC_BE08* 365)* (Lw_i_SCL - LdL_BrauEppe2008(:,1)); % SCL!


  % pack to output
  prdData.Tah = Eae; % Stok incub
  % 
  prdData.tL_Stok2014_1 = ELw_1; % Stok1
  prdData.tL_Stok2014_2 = ELw_2; % Stok2
  prdData.tL_Stok2014_3 = ELw_3; % Stok3
  prdData.tL_Stok2014_4 = ELw_4; % Stok4
  prdData.tL_Stok2014_5 = ELw_5; % Stok5
  prdData.tL_Stok2014_6 = ELw_6; % Stok6
  %
  prdData.tW_Stok2014_1 = EWw_1; % Stok1
  prdData.tW_Stok2014_2 = EWw_2; % Stok2
  prdData.tW_Stok2014_3 = EWw_3; % Stok3
  prdData.tW_Stok2014_4 = EWw_4; % Stok4
  prdData.tW_Stok2014_5 = EWw_5; % Stok5
  prdData.tW_Stok2014_6 = EWw_6; % Stok6
  %
  prdData.LW_Stok2014_1 = EWw_L1; % Stok1
  prdData.LW_Stok2014_2 = EWw_L2; % Stok2
  prdData.LW_Stok2014_3 = EWw_L3; % Stok3
  prdData.LW_Stok2014_4 = EWw_L4; % Stok4
  prdData.LW_Stok2014_5 = EWw_L5; % Stok5
  prdData.LW_Stok2014_6 = EWw_L6; % Stok6
  %
  prdData.tL_Park1926 = ELw_Park1926; % Park1
  prdData.tL_HildHats1927 = ELw_HildHats1927; % HH tL
  %
  prdData.tW_Park1929_1 = EWw_Park1929_1; % Park1
  prdData.tW_Park1929_2 = EWw_Park1929_2; % Park2
  prdData.tW_Park1929_3 = EWw_Park1929_3; % Park3
  prdData.tW_Park1929_4 = EWw_Park1929_4; % Park4
  prdData.tW_HildHats1927_1 = EWw_HildHats1927_1; % HH tL
  prdData.tW_HildHats1927_2 = EWw_HildHats1927_2; % HH tL
  %
  prdData.LW_WabnPaul2008 = EWw_L_WabnPaul2008/1e3; % WabnPaul
  %
   prdData.LN = EN; % TiwaBjorn fecundity
% NEW
prdData.L0Lt_BjorBolt2000 = ELt_BjorBolt2000;
prdData.L0Lt_SnovAven2007 = ELt_SnovAven2007;
prdData.LdL_BjorBolt2000 = ELdL_BjorBolt2000;
prdData.LdL_ScotMars2012 = ELdL_ScotMars2012;
prdData.LdL_BjorSchr2013 = ELdL_BjorSchr2013;
prdData.LdL_BrauEppe2008 = ELdL_BrauEppe2008;

  

%   save('data_Caretta_caretta_NA', 'prdData',  '-append') %% comment out  during estimation!
end

  %% SUBFUNCTIONS
 function dELH = dget_ELH1(t, ELH, Lb, par, cPar, TC, f)
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

    
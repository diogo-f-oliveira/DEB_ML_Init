function [prdData, info] = predict_Tachidius_discipes(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);  vars_pull(par);
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  %pars_T = [T_A T_L T_AL];    % with lower tolerance limit
  %pars_T = [T_A T_H T_AH];    % with upper tolerance limit
  %pars_T = T_A;                % without tolerance limits

  % After trying different fits, all parameters were decided to be included
  % in the arrhenius parameters
  pars_T = [T_A, T_L, T_H, T_AL, T_AH]; % with all tolerance limits

  TC_ah  = tempcorr(temp.ah, T_ref, pars_T);                     % 15 C
  TC_am  = tempcorr(temp.am, T_ref, pars_T);                     % 15 C
  TC_Tah = tempcorr(C2K(Tah(:,1)), T_ref, pars_T);             % 12, 15, 18, 21, 24 C
  TC_Tap = tempcorr(C2K(Tap(:,1)), T_ref, pars_T);             % 12, 15, 18, 21, 24 C
  TC12 = tempcorr(temp.tL12, T_ref, pars_T);                % temp corr for both length and clutch size
  TC15 = tempcorr(temp.tL15, T_ref, pars_T);
  TC18 = tempcorr(temp.tL18, T_ref, pars_T);
  TC21 = tempcorr(temp.tL21, T_ref, pars_T);
  TC24 = tempcorr(temp.tL24, T_ref, pars_T);
  % Temperature correction for oxygen consumption added
  TC_JOi = tempcorr(temp.JOi, T_ref, pars_T);                  % 20 C
  
  % zero-variate data at f = f and T = 20 C (except for age at hatching at 15 C)
  
  % life cycle (modified from previous version which was pars_tp)
  pars_tjp = [g k l_T v_Hb v_Hp v_Hp];
  
   % gets scaled age and length at puberty (modified from previous version)
   
  [~, ~, ~, l_p, ~, l_b, ~, ~, ~, info] = get_tj(pars_tjp, f);
  if info == 0;  prdData = []; return; end
  
  % initial reserve
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  [U_E0, ~, info] = initial_scaled_reserve(1.0, pars_UE0); % d.cm^2, initial scaled reserve
  if info == 0;  prdData = []; return; end
  E_0 = U_E0 * p_Am; % J, initial energy in egg
  
  % hatch at 15 C
  [~, aUL] = ode45(@dget_aul, [0; U_Hh], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(end,1)/ TC_ah; % d, age at hatch
  L_h = aUL(end,3); % cm, structural length at hatch
  Lw_h = L_h/ del_M; % cm, physical length at hatch

  % birth (start of acceleration)
  L_b  = L_m * l_b;                  % cm, structural length at birth
  Lw_b = L_b/ del_M;                 % cm, length at birth
  
  % puberty (end of acceleration and growth and kappa-rule) at 15 C
  L_p  = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                 % cm, length at puberty
  Wd_p = L_p^3 * (1 + f * ome) * d_V; % g, ultimate dry weight
  Ww_p = 1e6 * L_p^3 * (1 + f * ome);  % mug, wet weight at puberty
  Wd_i = Ww_p * d_V;                 % mug, ultimate dry weight

  % ultimate
  Lw_i = (L_p/L_b)*p_Am*kap/p_M/del_M; % cm, ultimate length if growth whould not cease at puberty 
  
  % respiration at (and after) puberty at 20 C
  pTA_p = TC_JOi * f * p_Am * L_p^2;                     % J/d, assimilation flux at puberty
  pTC_p = pTA_p;                                         % J/d, mobilization flux at puberty is equivalent to assimilation flux
  pTG_p = TC_JOi * 0;                                    % J/d, growth flux at puberty = 0
  pTs_p = TC_JOi * p_M * L_p^3;                          % J/d, somatic maintenance flux at puberty
  pTJ_p = TC_JOi * k_J * E_Hp;                           % J/d, maturity maintenance flux at puberty
  pTR_p = pTC_p - pTs_p - pTJ_p;                         % J/d, reproduction flux at puberty
  pTD_p = pTs_p + pTJ_p + (1 - kap_R) * pTR_p;           % J/d, dissipation flux at puberty
  JT_M_p = -(n_M\ n_O) * eta_O * [pTA_p, pTD_p, pTG_p]'; % mol/d, mineral fluxes (J_C, J_H, J_O, J_N in rows)
  JT_O_p = -JT_M_p(3) * 24.4/ 24/ 1e-9/ Wd_i;            % nL O2/h/mug, dry weight specific O2 consumption (with 24.4 L O2/mol)
  
  % life span
  h3_W = f * h_a * v/ 6/ L_p;        % 1/d^3, cubed Weibull ageing rate
  aT_m = gamma(4/3)/ h3_W^(1/3)/ TC_am; % d, mean life span at T

  % pack to output
  prdData.ah  = a_h;             % d, age at hatch
  prdData.am  = aT_m;            % d, life span
  prdData.Lh  = Lw_h;            % cm, length at hatch
  prdData.Lb  = Lw_b;            % cm, length at birth
  prdData.Lp  = Lw_p;            % cm, length at puberty
  prdData.Li  = Lw_i;            % cm, theor ultimate length
  prdData.Wdp = Wd_p;            % g, dry weight at puberty
  prdData.JOi = JT_O_p;          % nL/h/mug, dry weight specific O2 consumption
 
  
  % uni-variate data
  p = [p_Am; v; p_M; k_J; kap; kap_G; E_G; E_Hb; E_Hp];
  E_b = E_m * L_b^3; % J, energy in reserve at birth
  ELHR0 = [E_b; L_b; E_Hb; 0]; % state variables at birth

  [tsort, ~, ci] = unique(tL12(:,1)); 
  [~, ELHR] = ode45(@dget_ELHR_abp, tsort, ELHR0,[], p, TC12, L_b, f_tL12);
  EL12 = ELHR(ci,2)./ del_M; 

  [tsort, ~, ci] = unique(tL15(:,1)); 
  [~, ELHR] = ode45(@dget_ELHR_abp, tsort, ELHR0,[], p, TC15, L_b, f_tL15);
  EL15 = ELHR(ci,2)/ del_M; 

  [tsort, ~, ci] = unique(tL18(:,1)); 
  [~, ELHR] = ode45(@dget_ELHR_abp, tsort, ELHR0,[], p, TC18, L_b, f_tL18);
  EL18 = ELHR(ci,2)/ del_M; 

  [tsort, ~, ci] = unique(tL21(:,1)); 
  [~, ELHR] = ode45(@dget_ELHR_abp, tsort, ELHR0,[], p, TC21, L_b, f_tL21);
  EL21 = ELHR(ci,2)/ del_M; 

  [tsort, ~, ci] = unique(tL24(:,1)); 
  [~, ELHR] = ode45(@dget_ELHR_abp, tsort, ELHR0,[], p, TC24, L_b, f_tL21);
  EL24 = ELHR(ci,2)/ del_M; 
      
  % time-clutch size at 12 C
  EN12 = zeros(size(tN12,1),1);
  for i = 1:size(tN12,1)
      [~, ELHR] = ode45(@dget_ELHR_abp, [0 tN12(i,1)], ELHR0,[], p, TC12, L_b, f_tL12);
      EN12(i) = kap_R * ELHR(end,4)/E_0; 
  end

  EN15 = zeros(size(tN15,1),1);
  for i = 1:size(tN15,1)
      [~, ELHR] = ode45(@dget_ELHR_abp, [0 tN15(i,1)], ELHR0,[], p, TC15, L_b, f_tL15);
      EN15(i) = kap_R * ELHR(end,4)/E_0; 
  end

  EN18 = zeros(size(tN18,1),1);
  for i = 1:size(tN18,1)
      [~, ELHR] = ode45(@dget_ELHR_abp, [0 tN18(i,1)], ELHR0,[], p, TC18, L_b, f_tL18);
      EN18(i) = kap_R * ELHR(end,4)/E_0; 
  end

  EN21 = zeros(size(tN21,1),1);
  for i = 1:size(tN21,1)
      [~, ELHR] = ode45(@dget_ELHR_abp, [0 tN21(i,1)], ELHR0,[], p, TC21, L_b, f_tL21);
      EN21(i) = kap_R * ELHR(end,4)/E_0; 
  end

  EN24 = zeros(size(tN24,1),1);
  for i = 1:size(tN24,1)
      [~, ELHR] = ode45(@dget_ELHR_abp, [0 tN24(i,1)], ELHR0,[], p, TC24, L_b, f_tL21);
      EN24(i) = kap_R * ELHR(end,4)/E_0; 
  end

  % temperature-age at hatch
  [~, aUL] = ode45(@dget_aul, [0; U_Hh], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  ETah = aUL(end,1)./ TC_Tah; % d, age at hatch

  % temperature-age at puberty (accounting for variable functional
  % response)
  fs = [f_tL12; f_tL15; f_tL18; f_tL21; f_tL21];
  ETap = zeros(size(Tap,1),1);
  if size(Tap,1) > length(fs)
    % During prediction for visualization, Tap is large, so interpolation
    % needed for visualization if multiple fs required
    % ETap_short = zeros(length(fs),1);
    % [~, indices] = ismember([12; 15; 18; 21; 24], round(Tap,0));
    % indices(end) = length(Tap);
    % for c = 1:length(fs)
    %     [t_p, ~, ~, ~, ~, ~, ~, ~, ~, info] = get_tj(pars_tjp, fs(c));
    %     ETap_short(c) = t_p / k_M / TC_Tap(c);
    % end
    % ETap = interp1(indices, ETap_short, 1:length(ETap), 'spline', 'extrap');
    for c = 1:length(ETap)
        [t_p, ~, ~, ~, ~, ~, ~, ~, ~, info] = get_tj(pars_tjp, f);
        ETap(c) = t_p / k_M / TC_Tap(c);
    end
  else
      for c = 1:length(ETap)
        [t_p, ~, ~, ~, ~, ~, ~, ~, ~, info] = get_tj(pars_tjp, fs(c));
        ETap(c) = t_p / k_M / TC_Tap(c);
      end
  end
  
  % weight of carbon and nitrogen. This can be deleted (no more LWCN data)
  % EWC = (LWCN(:,1) * del_M).^3 * (1 + f * ome) * d_V * 12/ w_V*1e6;  % mug, carbon weight
  % EWN = (LWCN(:,1) * del_M).^3 * (1 + f * ome) * d_V * n_NV * 14/ w_V*1e6;  % mug, nitrogen weight

  % pack to output
  prdData.tL12  = EL12;           % d, time        - cm, length
  prdData.tL15  = EL15;           % d, time        - cm, length
  prdData.tL18  = EL18;           % d, time        - cm, length
  prdData.tL21  = EL21;           % d, time        - cm, length
  prdData.tL24  = EL24;           % d, time        - cm, length
  prdData.tN12  = EN12;           % d, time        - #, clutch size
  prdData.tN15  = EN15;           % d, time        - #, clutch size
  prdData.tN18  = EN18;           % d, time        - #, clutch size
  prdData.tN21  = EN21;           % d, time        - #, clutch size
  prdData.tN24  = EN24;           % d, time        - #, clutch size
  prdData.Tah   = ETah;           % C, temperature - d, age at hatch
  prdData.Tap   = ETap;           % C, temperature - d, age at puberty
end

function dELHR = dget_ELHR_abp(t, ELHR, p, TC, L_b, f)
  % Define changes in the state variables for abp model
  % t: time
  % ELHR: 4-vector with state variables
  %         E , J, reserve energy
  %         L , cm, structural length
  %         E_H , J , cumulated energy inversted into maturity (E_H in Kooijman 2010)
  %         E_R , J, reproduction buffer (E_R in Kooijman 2010)
  %         
  % dELHR: 4-vector with change in E, L, H, R

  % unpack state variables

  E = ELHR(1); L = ELHR(2); E_H = ELHR(3);

  % unpack par
  p_Am = p(1); v = p(2); p_M = p(3); k_J = p(4); 
  kap = p(5); kap_G = p(6); 
  E_G = p(7); E_Hb = p(8); E_Hp = p(9);

  % temp and acceleration correction
  if E_H < E_Hb
      s_M = 1;
  else
      s_M = L / L_b;
  end
  pT_Am = TC * p_Am * s_M;
  vT = TC * v * s_M;  
  pT_M = TC * p_M;
  kT_J = TC * k_J; 

  pA = (pT_Am * f * L^2) * (E_H >= E_Hb);
  if E_H < E_Hp
    if  kap * E * vT >= pT_M * L^4 % section 4.1.5 comments to Kooy2010 (if the energy is higher than mantainance costs)
        r = (E * vT/ L - pT_M * L^3/ kap)/ (E + E_G * L^3/ kap); % d^-1, specific growth rate  
    else 
        r = (E * vT/ L - pT_M * L^3/ kap)/ (E + kap_G * E_G * L^3/ kap); % d^-1, specific growth rate                                      
    end
    pC  = E * (vT/ L - r); % J/d, mobilized energy flux
    % generate derivatives
    dE_H  = ((1 - kap) * pC - kT_J * E_H);     % J/d, change in cumulated energy invested in maturation
    dE_R  = 0; % J/d, change in reproduction buffer
  else
    % adults do not grow, and do not shrink
    r = 0; % d^-1, specific growth rate                                      
    pC  = E * vT/ L; % J/d, mobilized energy flux
    dE_H  = 0;     % J/d, change in cumulated energy invested in maturation
    dE_R  = pC - pT_M * L^3 - kT_J * E_Hp; % J/d, change in reproduction buffer
  end
  % generate derivatives
  dE    = pA - pC;  % J/d, change in energy in reserve
  dL    = r * L / 3;    % cm^3/d, change in structural volume

  % pack derivatives
  dELHR = [dE; dL; dE_H; dE_R]; 
end
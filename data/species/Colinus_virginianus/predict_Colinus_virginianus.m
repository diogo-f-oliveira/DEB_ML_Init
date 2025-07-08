function [prdData, info] = predict_Colinus_virginianus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hx > E_Hp || f_j_B20 > 3 || f_j_B20 < 1  || f_j_JH78 >2 || f_j_JH78 < 0.6 || f_j_L62 >3 || kap_X + kap_P > 0.9999
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

          
  % zero-variate data
  
  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
  [tau_x, ~,l_x,~,info] = get_tp(pars_tx, f); if info == 0; prdData = []; return; end
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); if info == 0; prdData = []; return; end % -, scaled times & lengths at f

  % start 
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  E_0  = U_E0 * p_Am; % J, energy in egg

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f 
  aT_b = tau_b/ k_M/ TC_ab;        % d, age at birth at f and T
    
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_m * l_i/ del_M;          % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 

  % fledging
  tT_x = (tau_x - tau_b)/ kT_M;      % d, time since birth at puberty at f and T
  L_x = l_x * L_m; % cm, structural length at fledging
  Ww_x = L_x^3 * (1 + f * ome);       % g,  wet weight at fledging

  % puberty
  tT_p = (tau_p - tau_b)/ kT_M;      % d, time since birth at puberty at f and T
  L_p = l_p * L_m; % cm, structural length at puberty
  Ww_p = L_p^3 * (1 + f * ome);  % g,  wet weight at puberty
  
  % time-weight at 14 days
  tf = [0 14; f_j_B20 f_j_B20]';
  [t, EL] = ode45(@get_EL, [0 14], [E_m, L_b], [], tf, v * TC, g, E_m, L_m, p_Am * TC); % EL: {J/cm^3, cm}, with {[E], L}
  Ww_14 = EL(:,2).^3 .* (1 + EL(:,1) * w_E/ mu_E/ d_E); % g, wet weight
  Ww_14 = Ww_14(end);
    
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tR = t_R;
  prdData.am = aT_m;
  prdData.Li  = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwp = Ww_p;    
  prdData.Wwi = Ww_i;
  prdData.Ww14 = Ww_14;
  
  % a-Wwe data for embryo
  a = [0; max(1e-3, aWe(:,1) - t_0)]; 
  [a, LUH] = ode45(@dget_LUH, a, [1e-10 U_E0/TC 0], [], kap, v *TC, k_J *TC, g, L_m); 
  LUH(1,:) = [];
  L = LUH(:,1);  
  EWw_e = L.^3 * (1 + f * ome);            % g, wet weight
  
   a = [0; max(1e-3, aWe2(:,1) - t_0)]; 
  [a, LUH] = ode45(@dget_LUH, a, [1e-10 U_E0/TC 0], [], kap, v *TC, k_J *TC, g, L_m); 
  LUH(1,:) = [];
  L = LUH(:,1);  
  EWw_e2 = L.^3 * (1 + f * ome);            % g, wet weight
  
  a = [0; max(1e-3, tLe(:,1) - t_0)]; 
  [a, LUH] = ode45(@dget_LUH, a, [1e-10 U_E0/TC 0], [], kap, v *TC, k_J *TC, g, L_m); 
  LUH(1,:) = [];
  L = LUH(:,1);  
  ELw = 10 * L/ del_Me; % mm, embryo length 
  
  % time-weight, time-reproduction, using observed ingestion as input
  % Bayer:  experiment starts at 112 dph, and photo-stimulation starts at
  % 168 dph.  
  tRstart = 168; % d, time of start of photoperiod, allocation to repro buffer starts
  Linit = (200/ (1 + ome * f))^(1/3); 
 LEHR_0 = [Linit; f * E_m * Linit^3; E_Hp; 0]; % initial conditions
 [~, LEHR_1] = ode45(@dget_LEHR, [168; tN0(1,1)], LEHR_0, [], ingestion.tN0, tRstart, kap, TC * v, TC * k_J, TC * p_M, E_G, E_Hp, kap_X, mu_X, d_X, w_X, TC * p_Am, kap_G);  
 [~, LEHR] = ode45(@dget_LEHR, tN0(:,1), LEHR_1(end,:), [], ingestion.tN0, tRstart,  kap, TC * v, TC * k_J, TC * p_M, E_G, E_Hp, kap_X, mu_X, d_X, w_X, TC * p_Am, kap_G);
 E_R = LEHR(:,4); % J, energy in the reproduction buffer
 EN  = kap_R * E_R/ E_0; % #, cumulated number of eggs    
 EN_rest = (round(EN(end)) < EN(end)) * (EN(end) - round(EN(end))) + ...
    (round(EN(end)) > EN(end)) * (EN(end) - round(EN(end))+1); % eggs are released as intervals t_e
 N = (tN0(:,1)-203) * t_e; % #, cumulated number of eggs  
 EN_1 = N(N < EN(end)- EN_rest); 
 EN_2 = 0 * N(N >= EN(end) - EN_rest); % no more eggs if not enough energy in the buffer to make an egg
 EN0 = [EN_1; EN_2];  % #, number of eggs 
 
  % time-weight:
  [~, LEHR] = ode45(@dget_LEHR, tWw0(:,1), [(189.7/ (1 + ome * f))^(1/3); f * E_m * Linit^3; E_Hp; 0], [], ingestion.tWw0, tRstart, kap, TC * v, TC * k_J, TC * p_M, E_G, E_Hp, kap_X, mu_X, d_X, w_X, TC * p_Am, kap_G);
  L = LEHR(1:end,1); % cm, struct. length
  E = LEHR(1:end,2); % J, energy in reserve
  E_R = LEHR(1:end,4); % J, energy in reserve
  EWw0 = L.^3 + E * w_E/ mu_E/ d_E + E_R * w_E/ mu_E/d_E; % g, wet weight - assumes water in the reproduction buffer 
  % weight of eggs from day 203 till end:
 Wweggs = N(end) * E_0 *  w_E/ mu_E/d_E;   % dry weight of eggs produced between day 203 and 273
 EWw0(end)= EWw0(end) - Wweggs; % subracting the dry weight of all the eggs produce from the expected wet weight at the end of the experiment
  
  % JoneHugh1978
  % time-weight: varying food
  tf = [0 20 65 100; f_j_JH78 f_j_JH78 f f]'; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tW(:,1)*kT_M);
  EWw = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
  
  % Lyon1962  
  tf = [0 15 35 100; f_j_L62 f_j_L62 f f]'; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [tau_b 1 l_b], tW2(:,1)*kT_M);
  EWw_2 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight

  % NewsBeak2008
  tvel = get_tp(pars_tp, f3, [tau_b 1 l_b], tW3(:,1)*kT_M);
  EWw_3 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight

 % pack to output
 prdData.tWw0 = EWw0;
 prdData.tN0  = EN0;
 prdData.tW   = EWw;
 prdData.tW2  = EWw_2;
 prdData.tW3  = EWw_3;
 prdData.tLe  = ELw;
 prdData.aWe  = EWw_e;
 prdData.aWe2 = EWw_e2;
end

function dLEHR = dget_LEHR(t, LEHR, tJX, tRstart, kap, v, k_J, p_M, E_G, E_Hp, kap_X, mu_X, d_X, w_X, p_Am, kap_G)
  % t: scalar with time since birth
  % LEHR: 4-vector with (L, E, E_H, E_R) of juvenile and adult
  % dLEHR: 4-vector with (dL/dt, dE/dt, dH/dt, dER/dt)
  
  % unpack
  L = LEHR(1);     % cm, structural length
  E = LEHR(2);     % J, reserve E
  E_H = LEHR(3);   % J, maturity E_H
  E_R = LEHR(4);    % #/d, cum reproductive output
  
  WwX = spline1(t,tJX,0);  % g Wt /d, ingestion rate at time t
  WdX = d_X * WwX; % g dr wt/ d, ingestion rate at time t
  JX  = WdX/ w_X; % c- mol X/ d, ingestion rate at time t
  pA  = kap_X * mu_X * JX; % % J/d, assimilation rate at time t
   
  L2  = L * L; L3 = L2 * L; L4 = L3 * L;
  f   = pA/ p_Am/ L2; % -, scaled func. resp
  r   = (E * v/ L4 - p_M/ kap)/ (E/ L3 + E_G/ kap);
  pC  = E * (v/ L - r);
  % generate derivatives
  dE     = f * p_Am * L2 - pC;
  if kap * pC >= p_M * L^3
    r    = (E * v/ L^4 - p_M/ kap)/ (E/ L^3 + E_G/ kap); % d^-1, specific growth rate                                           % J/d, change in energy in reserve
    dL   = r/ 3 * L;                                         % cm/d, change in structural length
    dE_R  = ((1 - kap) * pC - k_J * E_Hp) ;       % J, change in cumulated energy invested in the reproduction buffer
  else 
     if E_R > 0
        r = 0;
     else
        r    =  (E * v/ L - p_M * L^3/ kap)/ ...
        (E + kap_G * E_G  * L^3/ kap); % d^-1, specific growth rate
     end                                      % J/d, change in energy in reserve
  dL    = r/ 3 * L;                                        % cm/d, change in structural length
  dE_R  = ((1 - kap) * pC - k_J * E_Hp) * (t>= tRstart); % starts allocating to reproduction at photo-stimulation
  dE_R  = (dE_R  - (p_M * L^3 - kap * pC)) * (E_R > 0) ;       
  end
  dE_H   = max(0, ((1 - kap) * pC - k_J * E_H) * (E_H<E_Hp));

  dLEHR = [dL; dE; dE_H; dE_R]; % pack output 
end


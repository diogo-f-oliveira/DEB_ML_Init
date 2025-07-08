function [prdData, info] = predict_Poecilia_reticulata_HPY (par, data, auxData)
    % unpack par, data, auxData
    cPar = parscomp_st(par); vars_pull(par);
    vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

    % compute temperature correction factors (N.B. all temps were 26C)
    TC = tempcorr(temp.ab_f1, T_ref, T_A);
    TC_JO = tempcorr(temp.JO_74, T_ref, T_A);

    vT = v * TC; kT_J = k_J * TC; kT_M = k_M * TC; hT_a = h_a * (TC^2); pT_Am = p_Am * TC; VT_Hb = V_Hb *TC;
    pT25_Am = p_Am * TC_JO;
    %% zero-variate data
    
     % life cycle
    pars_tp = [g k l_T v_Hb v_Hp];
    [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
    
    % Length at birth assuming mother was fed ad lib (f=1)
    L_b = L_m * l_b;                  % cm, structural length at birth at f
    
    f1 = kap_X * spline1(1000, tpX.tL_f1)/ pT_Am/ (3.22 * del_M)^2;  % -, scaled functional response
    f2 = kap_X2 * spline1(1000, tpX.tL_f2)/ pT_Am/ (2.64 * del_M)^2;  % -, scaled functional response

    % NB 3.22 = mean max length at high food, 2.64 is mean max length at low

  % age and dry weight at birth
    % high food
    [tau_b1, l_b1] = get_tb([g k v_Hb], f1);
    L_b1 = L_m * l_b1;                % cm, structural length at birth at f1
    Wd_b1 = L_b1^3 * (1 + f1 * ome) * d_V;  % g, dry weight at birth at f1
    a_b1 = (t_0 * TC) + tau_b1/ kT_M;         % d, age at birth at f1
  % NB the development delay parameter t_0 is temperature dependent
    
    %low food
    [tau_b2, l_b2] = get_tb([g k v_Hb], f2);
    L_b2 = L_m * l_b2;                 % cm, structural length at birth at f2
    Wd_b2 = L_b2^3 * (1 + f2 * ome) * d_V; % g, dry weight at birth at f2
    a_b2 = (t_0 * TC) + tau_b2/ kT_M;         % d, age at birth at f2

    % ultimate length at ad-lib food
    Lw_i = L_m * f/ del_M;              % cm, ultimate std length
        
    % O2 consumption
    %UT25_Hb = U_Hb/TC_JO; UT25_Hp = U_Hp/TC_JO;
    pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose pars
    pT_ref =  pT25_Am * L_m^2; % J/d, max assimilation power at max size
    L_74 = (0.074 / (1 + f * ome))^(1/3); % cm, structural length at wet weight 74 mg
    pACSJGRD = pT_ref * scaled_power(L_74, f, pars_p, l_b, l_p); % J/d, powers
    pADG = pACSJGRD(:, [1 7 5]);
    pADG(:,1) = 0; % exclude assim contributions as fish were starved for 24 hours before measurement
    J_M = - (n_M\n_O) * eta_O * pADG';  % mol/d: J_C, J_H, J_O, J_N in rows
    J_O74 = - J_M(3,:)* 32000/ 24;                      % mg/h, O2 consumption
    
    % pack to output
    prdData.ab_f1 = a_b1;   % d, age at birth, high food
    prdData.ab_f2 = a_b2;   % d, age at birth, low food
    prdData.Li    = Lw_i;   % cm, ultimate standard length, abundant food
    prdData.Wdb_f1 = Wd_b1; % g, dry weight at birth, high food
    prdData.Wdb_f2 = Wd_b2; % g, dry weight at birth, low food
    prdData.JO_74 = J_O74; % mg / h, oxygen consumption (respiration)
    
    % univariate data

    
    eLHR_0 = [1, L_b, E_Hb, 0, 0, 0, 1]; % initial values for e, L, E_H, E_R, q, h, S
    % NB the mothers of the individuals for which we have data were kept at
    % ad-lib food, hence f = e = 1 here for initial value of e at birth.

    % t-L data
    % high food
    [~, eLHR] = ode45(@dget_eLHR, [0; tL_f1(:,1)], eLHR_0, [], tpX.tL_f1,  pT_Am, kap_X, kap, vT, g, L_m, kT_J, E_m, E_Hp, hT_a, s_G);
    eLHR(1,:) = []; ELw_f1 = eLHR(:,2)/ del_M;
    % low food
    [~, eLHR] = ode45(@dget_eLHR, [0; tL_f2(:,1)], eLHR_0, [], tpX.tL_f2,  pT_Am, kap_X2, kap, vT, g, L_m, kT_J, E_m, E_Hp, hT_a, s_G);
    eLHR(1,:) = []; ELw_f2 = eLHR(:,2)/ del_M;
    
    % t-Ww data
    % high food
    [~, eLHR] = ode45(@dget_eLHR, [0; tWw_f1(:,1)], eLHR_0, [], tpX.tWw_f1,  pT_Am, kap_X, kap, vT, g, L_m, kT_J, E_m, E_Hp, hT_a, s_G);
    eLHR(1,:) = []; EWw_f1 = eLHR(:,2).^3.* (1 + eLHR(:,1) * ome);
    % low food
    [~, eLHR] = ode45(@dget_eLHR, [0; tWw_f2(:,1)], eLHR_0, [], tpX.tWw_f2, pT_Am, kap_X2, kap, vT, g, L_m, kT_J, E_m, E_Hp, hT_a, s_G);
    eLHR(1,:) = []; EWw_f2 = eLHR(:,2).^3.* (1 + eLHR(:,1) * ome);
    
    
    % L-Ww data
    % Here we predict wet weight from standard length, accounting for changes
    % in food density with age
    % high food
    [~, eLHR] = ode45(@dget_eLHR, [0; tLWw.LWw_f1(:,1)], eLHR_0, [], tpX.LWw_f1, pT_Am, kap_X, kap, vT, g, L_m, kT_J, E_m, E_Hp, hT_a, s_G);
    eLHR(1,:) = []; ELWw_f1 = (LWw_f1(:,1) * del_M).^3.* (1 + eLHR(:,1) * ome);
    % low food
    [~, eLHR] = ode45(@dget_eLHR, [0; tLWw.LWw_f2(:,1)], eLHR_0, [], tpX.LWw_f2, pT_Am, kap_X2, kap, vT, g, L_m, kT_J, E_m, E_Hp, hT_a, s_G);
    eLHR(1,:) = []; ELWw_f2 = (LWw_f2(:,1) * del_M).^3.* (1 + eLHR(:,1) * ome);
    
    % t-N data
    % NB - usually, reserve in egg reflects reserve in mother, but under resource limitation, guppies provide additional nutrition to eggs, i.e. the opposite of what DEB predicts
    % This is not modelled here, instead we assume that mother at high and low food have equal egg provisioning.
    E_0 =  p_Am * initial_scaled_reserve(1, [V_Hb, g, k_J, k_M, v]); % J, amount of reserve in an egg
 
    % NB initial reserve is independent of temperature
    % high food
    [~, eLHR] = ode45(@dget_eLHR, [0; tN_f1(:,1)], eLHR_0, [], tpX.tN_f1, pT_Am, kap_X, kap, vT, g, L_m, kT_J, E_m, E_Hp, hT_a, s_G);
    eLHR(1,:) = []; EN_f1 = eLHR(:,4) * kap_R/ E_0;
    % low food
    [~, eLHR] = ode45(@dget_eLHR, [0; tN_f2(:,1)], eLHR_0, [], tpX.tN_f2, pT_Am, kap_X2, kap, vT, g, L_m, kT_J, E_m, E_Hp, hT_a, s_G);
    eLHR(1,:) = []; EN_f2 = eLHR(:,4) * kap_R/ E_0;
    
    % t-S  at high food
    % high food
    [~, eLHR] = ode45(@dget_eLHR, [0; tS_f1(:,1)], eLHR_0, [], tpX.tS_f1, pT_Am, kap_X, kap, vT, g, L_m, kT_J, E_m, E_Hp, hT_a, s_G);
    eLHR(1,:) = []; ES_f1 = eLHR(:,7);
    % low food
    [~, eLHR] = ode45(@dget_eLHR, [0; tS_f2(:,1)], eLHR_0, [], tpX.tS_f2, pT_Am, kap_X2, kap, vT, g, L_m, kT_J, E_m, E_Hp, hT_a, s_G);
    eLHR(1,:) = []; ES_f2 = eLHR(:,7);

    % pack to output
    prdData.tL_f1  = ELw_f1; % cm, expected standard length at high food, (time/length data)
    prdData.tL_f2  = ELw_f2; % cm, expected standard length at low food, (time/length data)
    prdData.tWw_f1 = EWw_f1; % g, expected wet weight at f1, (time/weight data)
    prdData.tWw_f2 = EWw_f2; % g, expected wet weight at f2, (time/weight data)
    prdData.LWw_f1 = ELWw_f1; % g, expected wet weight given length, ar f1 (length/wet weight data)
    prdData.LWw_f2 = ELWw_f2; % g, expected wet weight given length, ar f1 (length/wet weight data)
    prdData.tN_f1  = EN_f1;  % #, expected cumulative N offspring at f1, (time/#offspring data)
    prdData.tN_f2  = EN_f2;  % #, expected cumulative N offspring at f2, (time/#offspring data)
    prdData.tS_f1  = ES_f1;  % -, expected surviving fraction at f1, (time/surviving fraction data)
    prdData.tS_f2  = ES_f2;  % -, expected surviving fraction at f2, (time/surviving fraction data)
    end


  function deLHR = dget_eLHR(t, eLHR, tpX, p_Am, kap_X, kap, v, g, L_m, k_J, E_m, E_Hp, h_a, s_G)
    % unpack variables
    e = eLHR(1); L = eLHR(2); E_H = eLHR(3); E_R = eLHR(4);  q = eLHR(5); h = eLHR(6); S = eLHR(7);
    
    % help quantities
    f = kap_X * spline1(t, tpX)/ p_Am/ L^2;  % -, scaled functional response
    r = v * (e/ L - 1/ L_m)/ (e + g); % 1/d, spec growth rate
    p_R = (1 - kap) * e * L^3 * E_m * (v/ L - r) - (k_J * E_H); % J/d, maturation/reprod flux
   
    de = (f - e) * v/ L; % 1/d, change in scaled reserve density
    dL = r * L / 3; % cm/d, change in structural length
    dE_H = (E_H < E_Hp) * p_R; % J/d, maturation flux
    dE_R = (E_H >= E_Hp) * p_R; % J/d, reproduction flux
    dq = (q * (L/ L_m)^3 * s_G + h_a) * e * (v/ L - r) - r * q; % 1/d^3, change in aging accelation DEB3 (6.2)
    dh = q - h * r; % 1/d^2, change in hazard DEB3 (6.2)
    dS = - S * h; % 1/d, change in survival prob

    deLHR = [de; dL; dE_H; dE_R; dq; dh; dS]; % collect changes in variables
  end

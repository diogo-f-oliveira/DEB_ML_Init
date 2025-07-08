function [prdData, info] = predict_Heteronympha_merope(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if s_1 < 1 || s_2 < 1 || s_3 < 1 || s_4 < 1 || s_5 < 1
    prdData = []; info = 0; return
  end
  
  % temperature correction factors
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, [T_A0; T_L; T_H0; T_AL; T_AH]); % instar 0, embryo
  TC_n8 = [ ... % factors for instar 1,.,6
      tempcorr(temp.tW8, T_ref, [T_A1; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW8, T_ref, [T_A2; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW8, T_ref, [T_A3; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW8, T_ref, [T_A4; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW8, T_ref, [T_A5; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW8, T_ref, [T_AP; T_L; T_H6; T_AL; T_AH])];
  TC_n12 = [ ... % factors for instar 1,.,6
      tempcorr(temp.tW12, T_ref, [T_A1; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW12, T_ref, [T_A2; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW12, T_ref, [T_A3; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW12, T_ref, [T_A4; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW12, T_ref, [T_A5; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW12, T_ref, [T_AP; T_L; T_H6; T_AL; T_AH])];
  TC_n15 = [ ... % factors for instar 1,.,6
      tempcorr(temp.tW15, T_ref, [T_A1; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW15, T_ref, [T_A2; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW15, T_ref, [T_A3; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW15, T_ref, [T_A4; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW15, T_ref, [T_A5; T_L; T_H; T_AL; T_AH]);   
      tempcorr(temp.tW15, T_ref, [T_AP; T_L; T_H6; T_AL; T_AH])];  
  TC_te = tempcorr(temp.te, T_ref, [T_AP; T_L; T_H6; T_AL; T_AH]);       
 
  % zero-variate data
  pars_tj = [g k v_Hb v_He s_j kap kap_V];
  [tau_j, tau_e, tau_b, l_j, l_e, l_b, rho_j, v_Rj, u_Ee, info] = get_tj_hex(pars_tj, f);  
  if ~info
    prdData = []; return
  end      
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  [U_E0, L_b, info] = initial_scaled_reserve(f, pars_UE0); % d.cm^2 , initial energy content
  E_0 = p_Am * U_E0; % J, initial energy content
    
  % birth
  [t_b, l_b] = get_tb([g k v_Hb], f); % d, cm, scaled age and length at birth at T_ref
  a_b = t_b/ k_M;                     % d, age at birth at T_ref
  Ww_b = 1e3 * L_b^3 * (1 + f * w);   % mg, wet weight at birth
  k_E = v/ L_b;                       % 1/d, reserve turnover
  p_J = k_J * E_Hb;                   % J/d, maturity maint rate during larval stages at T_ref
  
  % moults-weights  
  E_R_ref = (1 - kap) * E_m * g * (k_E + k_M)/ (k_E - g * k_M); % J/cm^3, reference value for [E_R]
  E_Rj = s_j * E_R_ref; % J/cm^3, threshold reprod buffer density at pupation
  L_n = cumprod([L_b; [s_1; s_2; s_3; s_4; s_5].^0.5]);
  Lw_n = L_n/ del_M; % instar length
  
  ELE_0 = [f * E_m * L_b^3; L_b; 0]; % initial state vector
  options=odeset('Events', @pupa_event, 'RelTol',1e-9,'AbsTol',1e-9);
  [TE, ELE, TEe, YEe] = ode45(@dget_ELE, [0 1e4], ELE_0, options, f, f_5, TC_n15, L_n, k_M, v/ L_b, p_J, p_Am/ L_b, E_m, g, kap, E_Rj);
  tT_j15 = TE(end);    % d, age at pupation
  E = ELE(end,1);                  % J, reserve at pupation
  L_j = ELE(end,2);                % cm, structural length at pupation
  E_R = ELE(end,3);                % J, reprod buffer at pupation
  E_j = E + E_R;                    % J, reserve at pupation
  Ww_j = 1e3 * (L_j^3 + E_j * w_E/ mu_E/ d_E); % mg, wet weight at pupation
  s_M = L_j/ L_b;                   % -, acceleration factor
   
  % emergence
  v_j = v * s_M;         % cm/d, energy conductance of pupa and imago
  L_m = v/ k_M / g;      % cm, maximum structural length
  options=odeset('Events', @eclose_event);
  VELH_0 = [L_j^3; E + E_R; 1e-4; 0]; % initial state vector
  [t, VELH] = ode45(@dget_VELH, [0 1e4], VELH_0, options, k_J, v /L_b, v_j, E_m, L_m, kap, g, M_V, y_E_V, mu_E, E_He);
  t_e =  t(end);        % d, time since pupation at emergence
  V_e =  VELH(end,1);    % cm^3, larval structure at emergence (should be close to zero)
  E_e =  VELH(end,2);    % J, reserve at emergence
  L_e =  VELH(end,3);    % cm, length at emergence
  tT_e = t_e/ TC_te;        % d, time since pupation at emergence
  E_e = E_e + kap_V * V_e * M_V * mu_E; % J, convert last bit of larval structure to reserve instantaneously
  Ww_e = 1e3 * (L_e^3 + E_e * w_E/ mu_E/ d_E);   % mg, wet weight at emergence
  
  % tW-data
  options=odeset('Events', @pupa_event, 'RelTol',1e-9,'AbsTol',1e-9);
  [t8,ELE8] = ode45(@dget_ELE, tW8(:,1), ELE_0, options, f, f_5, TC_n8, L_n, k_M, v/ L_b, p_J, p_Am/ L_b, E_m, g, kap, E_Rj);
  [t12,ELE12] = ode45(@dget_ELE, tW12(:,1), ELE_0, options, f, f_5, TC_n12, L_n, k_M, v/ L_b, p_J, p_Am/ L_b, E_m, g, kap, E_Rj);
  [t15,ELE15] = ode45(@dget_ELE, tW15(:,1), ELE_0, options, f, f_5, TC_n15, L_n, k_M, v/ L_b, p_J, p_Am/ L_b, E_m, g, kap, E_Rj);
  ELE8 = vertcat(ELE8, reshape(repelem(ELE8(size(ELE8,1),:),size(tW8,1)-size(ELE8,1)),size(tW8,1)-size(ELE8,1),3));
  ELE12 = vertcat(ELE12, reshape(repelem(ELE12(size(ELE12,1),:),size(tW12,1)-size(ELE12,1)),size(tW12,1)-size(ELE12,1),3));
  ELE15 = vertcat(ELE15, reshape(repelem(ELE15(size(ELE15,1),:),size(tW15,1)-size(ELE15,1)),size(tW15,1)-size(ELE15,1),3));

  tspan = [0 1];
  ELE_0 = [f * E_m * L_b^3; L_b; 0]; % initial state vector
  [TE, ELE] = ode45(@dget_ELE, tspan, ELE_0, [], f, f_5, TC_n15, L_n, k_M, v/ L_b, p_J, p_Am/ L_b, E_m, g, kap, E_Rj);
  E = ELE(end,1);                  % J, reserve at pupation
  L = ELE(end,2);                % cm, structural length at pupation
  E_R = ELE(end,3);
  ELE_0 = ELE(end,:);
  tT_1 = 0;
  while (L < L_n(2))
  [TE, ELE] = ode45(@dget_ELE, tspan, ELE_0, [], f, f_5, TC_n15, L_n, k_M, v/ L_b, p_J, p_Am/ L_b, E_m, g, kap, E_Rj);
  E = ELE(end,1);                  % J, reserve at pupation
  L = ELE(end,2);                % cm, structural length at pupation
  E_R = ELE(end,3);                % J, reprod buffer at pupation
  ELE_0 = ELE(end,:);
  tT_1 = tT_1 + 1;
  end
  tT_1_15 = tT_1;
  while (L < L_n(3))
  [TE, ELE] = ode45(@dget_ELE, tspan, ELE_0, [], f, f_5, TC_n15, L_n, k_M, v/ L_b, p_J, p_Am/ L_b, E_m, g, kap, E_Rj);
  E = ELE(end,1);                  % J, reserve at pupation
  L = ELE(end,2);                % cm, structural length at pupation
  E_R = ELE(end,3);                % J, reprod buffer at pupation
  ELE_0 = ELE(end,:);
  tT_1 = tT_1 + 1;
  end  
  tT_2_15 = tT_1 - tT_1_15;
  while (L < L_n(4))
  [TE, ELE] = ode45(@dget_ELE, tspan, ELE_0, [], f, f_5, TC_n15, L_n, k_M, v/ L_b, p_J, p_Am/ L_b, E_m, g, kap, E_Rj);
  E = ELE(end,1);                  % J, reserve at pupation
  L = ELE(end,2);                % cm, structural length at pupation
  E_R = ELE(end,3);                % J, reprod buffer at pupation
  ELE_0 = ELE(end,:);
  tT_1 = tT_1 + 1;
  end  
  tT_3_15 = tT_1 - tT_2_15;
  while (L < L_n(5))
  [TE, ELE] = ode45(@dget_ELE, tspan, ELE_0, [], f, f_5, TC_n15, L_n, k_M, v/ L_b, p_J, p_Am/ L_b, E_m, g, kap, E_Rj);
  E = ELE(end,1);                  % J, reserve at pupation
  L = ELE(end,2);                % cm, structural length at pupation
  E_R = ELE(end,3);                % J, reprod buffer at pupation
  ELE_0 = ELE(end,:);
  tT_1 = tT_1 + 1;
  end  
  tT_4_15 = tT_1 - tT_3_15;
  tT_5_15 = tT_j15 - tT_1; 
  %tT_6_15 = tT_e15; 
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_n15(6);             % d, mean life span at T
  
  % pack to output
  prdData.t1 = tT_1_15;
  prdData.t2 = tT_2_15;
  prdData.t3 = tT_3_15;
  prdData.t4 = tT_4_15;
  prdData.t5 = tT_5_15;
  prdData.tj = tT_j15;
  prdData.te = tT_e;
  prdData.am = aT_m;
  prdData.L1 = Lw_n(1);
  prdData.L2 = Lw_n(2);
  prdData.L3 = Lw_n(3);
  prdData.L4 = Lw_n(4);
  prdData.L5 = Lw_n(5);
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwe = Ww_e;
  
  % uni-variate data
   
  % temperature - age at birth
  EaT_b = a_b ./ TC_ab;
  
  % time-weight 
  EWw8 = 1e3 * (ELE8(:,2).^3 + sum(ELE8(:,[1 3]), 2)/ mu_E * w_E/ d_E); % mg, wet weight
  EWw12 = 1e3 * (ELE12(:,2).^3 + sum(ELE12(:,[1 3]), 2)/ mu_E * w_E/ d_E); % mg, wet weight
  EWw15 = 1e3 * (ELE15(:,2).^3 + sum(ELE15(:,[1 3]), 2)/ mu_E * w_E/ d_E); % mg, wet weight

  % Reproduction, progeny since emergence
  E_R_ref = (1 - kap) * E_m * (g + l_b)/ (1 - l_b); % J/cm^3, reference value for [E_R]
  E_Rj = s_j * E_R_ref; % J/cm^3, threshold reprod buffer density at pupation
  N_i = kap_R * L_j^3 * E_Rj/ E_0;     % #, life time reprod output
  EN = N_i * max(0, tN(:,1) - 37)/66;% cumulative number of eggs
  
  prdData.Tab = EaT_b;
  prdData.tW8 = EWw8;
  prdData.tW12 = EWw12;
  prdData.tW15 = EWw15;
  prdData.tN = EN;
end

%% event pupa 
    function [value,isterminal,direction] = pupa_event(t, Y, f, f_5, TC_n, L_n, k_M, k_E, p_J, p_Am, E_m, g, kap, E_Rj)
    E_R= Y(3); L  = Y(2);
    value = E_R/ L^3 - E_Rj;  % new trigger 
    isterminal = 1;    % terminate after the first event
    direction  = 0;    % get all the zeros
    end     
%% event eclose 
    function [value,isterminal,direction] = eclose_event(T, Y, k_J, k_El, v, E_m, L_m, kap, g, M_V, y_EV, mu_E, E_He)
    H = Y(4);
    value = H-E_He;  % trigger 
    isterminal = 1;  % terminate after the first event
    direction  = 0;  % get all the zeros
    end
%% subfunctions
    function dELE = dget_ELE(t, ELE, f, f_5, TC_n, L_n, k_M, k_E, p_J, p_Am, E_m, g, kap, E_Rj)
      % larval development
      % t: time since birth
      
      % unpack variables
      E  = ELE(1); % J, reserve
      L  = max(ELE(2),1e-9); % cm, structural length
      %E_R= ELE(3); % J, reproduction buffer

      TC = TC_n(max(1,sum(L<L_n))); kT_E = k_E * TC; kT_M = k_M * TC; pT_Am = p_Am * TC; pT_J = p_J * TC;

      if L > L_n(4)
        f = f_5; % less feeding in instar 5
      end
      
      V = L^3;                             % cm^3, structural volume
      e = E/ V/ E_m;                       % -, scaled reserve density
      rT = (e * kT_E - g * kT_M)/ (e + g); % 1/d, specific growth rate
      pT_C = E * (kT_E - rT);              % J/d, mobilisation rate
      
      dE = f * pT_Am * V - pT_C;           % J/d, change in reserve
      dL = rT * L/ 3;                      % cm/d, change in length
      dE_R = (1 - kap) * pT_C - pT_J;      % J/d, change in reprod buffer

      dELE = [dE; dL; dE_R];  
    end    

    function dVELH = dget_VELH(T, VELH, k_J, k_El, v, E_m, L_m, kap, kap_V, g, M_V, y_E_V, mu_E, E_He)
      % pupal development
      %   y_EV: yield of reserve of imago on structure of larva
       
      % unpack variables
      V  = max(VELH(1),0);    % cm^3, structural volume of larva
      E  = max(VELH(2),0);    % J, reserve of larva
      L  = max(VELH(3),1e-5); % cm, structural length of imago
      H  = max(VELH(4),1e-5); % J, maturity of imago
      
      dV = - V * k_El;                % cm^3/d, change larval structure
      e = E/ L^3/ E_m;               % -, scaled reserve density
      r = v * (e/ L - 1/ L_m)/ (e + g); % 1/d, specific growth rate
      p_C = E * (v/ L - r);          % J/d, mobilisation rate
      dE = - dV * M_V * y_E_V * mu_E * kap_V - p_C; % J/d, change in reserve
      dL = r * L/ 3;                 % cm/d, change in length
      dH = (1 - kap) * p_C - k_J * H;% J/d, change in maturity
      
      dVELH = [dV; dE; dL; dH];
    end
   
    function dEEE = dget_EEE(t, EEE, p_A, p_J, p_M, k_E, kap_R)
        % change in reserves of imago
        % t: d, time since imago emergence
        
        %unpack variables
        E = EEE(1);      % J, reserves of the imago
        E_R = EEE(2);    % J,reprod buffer
        %E_eggs = EEE(3);% J, joules in eggs
        
        p_C = E * k_E;             % J/d, reserve mobilisation  
        p_R = p_C - p_M - p_J;     % J/d, energy allocation from reserve to E_R
        p_CR = (t > 40) * kap_R * E_R * k_E; % J/d, drain from E_ R to eggs
        
        dE = p_A - p_C;            % J/d, change in reserve
        dE_R = max(0, p_R - p_CR); % J/d, change in reprod buffer
        dE_eggs = max (0, p_CR);   % J/d, egg production
        
        dEEE = [dE; dE_R; dE_eggs];
    end

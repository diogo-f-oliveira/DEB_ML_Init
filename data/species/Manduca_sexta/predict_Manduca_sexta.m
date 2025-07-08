function [prdData, info] = predict_Manduca_sexta(par, data, auxData)
   
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if del_e > 1
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC_25 = tempcorr(temp.ab, T_ref, T_A); 
  TC_24 = tempcorr(temp.am, T_ref, T_A); 
  TC_27 = tempcorr(temp.te, T_ref, T_A); 
  TC_tW = tempcorr(temp.tW, T_ref, T_A); 
  
  % zero-variate data
      
  % life cycle
  pars_tj = [g, k, v_Hb, v_He, s_j, kap, kap_V];
  [tau_j, tau_e, tau_b, l_j, l_e, l_b, rho_j, v_Rj, u_Ee, info] = get_tj_hex(pars_tj, f);
  if ~info; prdData = []; return; end
  
  % initial
  E_0 = p_Am *  initial_scaled_reserve(f, [V_Hb, g, k_J, k_M, v]); % J, initial energy content

  % birth
  aT_b = tau_b/ k_M/ TC_27;          % d, age at birth
  L_b = L_m * l_b;                   % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * ome);      % g, wet weight at birth

  % pupation
  tT_j = (tau_j - tau_b)/ k_M/ TC_tW; % d, time since birth at pupation
  L_j = L_m * l_j; % cm, structural length at pupation
  E_Rj = s_j * (1 - kap) * E_m * (g + l_b)/ (1 - l_b); % J/cm^3, reprod buffer density at pupation
  Ww_Rj = E_Rj * L_j^3 * w_E/ mu_E/ d_E; % g, wet weight of reprod buffer at pupation
  Ww_j = Ww_Rj + L_j^3 * (1 + f * ome);  % g, wet weight at pupation
  s_M = L_j/ L_b;     % -, acceleration factor
  L_mj = L_m * s_M;   % cm, max struc length after acceleration
    
  % emergence
  t_e = (tau_e - tau_j)/ k_M; tT_e = t_e/ TC_27; % d, time since pupation at emergence
  L_e = L_m * l_e;                    % cm, structural length at emergence
  

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = (t_m - t_e)/ k_M/ TC_24;      % d, mean life span at T
    
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.te = tT_e;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;

  % uni-variate data    
 
  % larval data
  vT = v * TC_tW; kT_J = k_J * TC_tW; kT_M = k_M * TC_tW; pT_Am = p_Am * TC_tW; kT_E = vT/ L_b; 
  ELE_b = [f * E_m * L_b^3; L_b; 0]; % initial value at birth
  [t ELE] = ode45(@dget_ELE, tW(:,1), ELE_b, [], f, kT_M, kT_E, kT_J * E_Hb, pT_Am/ L_b, E_m, g, kap, E_Rj);
  L = ELE(:,2); V = L.^3; E = ELE(:,1); E_R = ELE(:,3);
  EWw = V + (E + E_R)/ mu_E * w_E/ d_E;   % g, wet weight including reprod buffer

  % pupal data
  vT_j = TC_27 * v * s_M; kT_M = k_M * TC_27; kT_J = k_J * TC_27; kT_EV = k_EV * TC_27; jT_EM = kT_M * y_E_V;
  VHEL_j = [L_j^3; 0; f * E_m * L_j^3; 1e-6]; % initial value at pupation
  [t VHEL] = ode45(@dget_VHEL, tjO(:,1), VHEL_j, [], kT_J, kT_EV, vT_j, E_m, L_mj, kap, g, M_V, kap_V * y_E_V, mu_E, E_He);
  V_l = VHEL(:,1); E = VHEL(:,3); L = VHEL(:,4); V = L.^3; e = E ./ V/ E_m;  
  Ww = V_l + V + E * w_E/ mu_E/ d_E + Ww_Rj; % g, wet weight of pupa 
  % t-jO data
  r = vT_j * (e ./ L - 1/ L_mj) ./ (e + g);  % 1/d, specific growth rate
  JEC = (y_E_V * r + jT_EM)/ kap * M_V .* V; % mol/d, mobilisation flux
  JV = M_V * (V .* r - V_l * kT_EV);         % mol/d, structure flux
  JE = kap_V * y_E_V * M_V * V_l * kT_EV - JEC; % mol/d, reserve flux
  JM = - n_M\n_O(:,2:3) * [JV, JE]';         % mol/d, mineral fluxes
  EjT_O = - JM(3,:)' * 24.4e3 ./ Ww;         % ml/d.g, specific O2 consumption 
    
  % cum number of eggs
  %N_i = E_Rj * L_j^3/ E_0;
  N_i = (del_e * L_e^3 * (M_V * mu_V + f * E_m) + E(end) - f * E_m * L_e^3 + E_Rj * L_j^3)/ E_0;

  EN = (tN(:,1) - 1) * N_i/ aT_m;
  
  % pack to output
  prdData.tW  = EWw;
  prdData.tjO = EjT_O;
  prdData.tN  = EN;
  prdData.Ni = N_i;

end

%% subfunctions 

    function dELE = dget_ELE(t, ELE, f, k_M, k_E, p_J, p_Am, E_m, g, kap, E_Rj)
      % larval development
      % t: time since birth
      
%       if t > 14 % reduce feeding of late larva
%         f = 0.3; 
%       elseif t > 16
%         f = 0;
%       end
      
      % unpack variables
      E  = ELE(1); % J, reserve
      L  = ELE(2); % cm, structural length
      %E_R= ELE(3); % J, reproduction buffer
            
      V = L^3;                          % cm^3, structural volume
      e = E/ V/ E_m;                    % -, scaled reserve density
      r = (e * k_E - g * k_M)/ (e + g); % 1/d, specific growth rate
      p_C = E * (k_E - r);              % J/d, mobilisation rate
      
      dE = f * p_Am * V - p_C;          % J/d, change in reserve
      dL = r * L/ 3;                    % cm/d, change in length
      dE_R = (1 - kap) * p_C - p_J;     % J/d, change in reprod buffer

      dELE = [dE; dL; dE_R];            % pack derivatives  
    end

    function [val, isterm, dir] = pupation(t, ELE, f, k_M, k_E, p_J, p_Am, E_m, g, kap, E_Rj)
      val = E_Rj - ELE(3)/ ELE(2)^3;
      isterm = 1; % stop
      dir = 0;    % all directions
    end

    function dVHEL = dget_VHEL(a, VHEL, k_J, k_EV, v, E_m, L_m, kap, g, M_V, y_EV, mu_E, E_He)
      % pupal development
      % a: d, time since pupation
      %   y_EV: yield of reserve of imago on structure of larva
       
      % unpack variables
      V  = VHEL(1); % cm^3, structural volume of larva
      H  = VHEL(2); % J, maturity 
      E  = max(1e-8, VHEL(3)); % J, reserve of larva
      L  = VHEL(4); % cm, structural length of imago
      
      dV = - V * k_EV;                     % cm^3/d, change larval structure
      e = E/ L^3/ E_m;                    % -, scaled reserve density
      r = v * (e/ L - 1/ L_m)/ (e + g);   % 1/d, specific growth rate
      p_C = E * (v/ L - r);               % J/d, mobilisation rate
      dE = - dV * M_V * y_EV * mu_E - p_C;  % J/d, change in reserve
      dL = r * L/ 3;                      % cm/d, change in length
      dH = (1 - kap) * p_C - k_J * H;     % J/d, change in maturity
      
      dVHEL = [dV; dH; dE; dL];          % pack derivatives
    end
    
    function [val, isterm, dir] = emergence(t, VHEL, k_J, k_EV, v, E_m, L_m, kap, g, M_V, y_EV, mu_E, E_He)
      val = E_He - VHEL(2);
      isterm = 1; % stop
      dir = 0;    % all directions
    end

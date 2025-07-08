function [prdData, info] = predict_Plodia_interpunctella(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); % all data at 25 C
  vT = v * TC; kT_J = k_J * TC; kT_M = k_M * TC; kT_EV = k_EV * TC; pT_Am = p_Am * TC; 
  
  % zero-variate data

  % life cycle
  pars_tj = [g k v_Hb v_He s_j kap kap_V];
  [t_j, t_e, t_b, l_j, l_e, l_b, rho_j, v_Rj, u_Ee, info] = get_tj_hex(pars_tj, f);
  
  % initial
  u_E0 = get_ue0([g, k, v_Hb], f);    % -, scaled initial reserve
  E_0 = u_E0 * g * E_m * L_m^3;       % J, initial energy content
    
  % birth
  aT_b = t_b/ kT_M;                   % d, age at birth at f and T
  L_b = L_m * l_b;                    % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * w);         % g, wet weight at birth
  kT_E = vT/ L_b;                     % 1/d, reserve turnover rate

  % pupation 
  tT_j = (t_j - t_b)/ kT_M;           % d, time since birth at pupation
  L_j = L_m * l_j;                    % cm, structural length at pupation
  Ww_j = L_j^3 * (1 + f * w);         % g, wet weight at pupation, excluding reprod buffer at pupation
  E_Rj = v_Rj * (1 - kap) * g * E_m * L_j^3; % J, reproduction buffer at pupation
  Ww_Rj = E_Rj * w_E/ mu_E/ d_E;      % g, wet weight repod buffer at pupation
  Ww_j = Ww_j + Ww_Rj;                % g, wet weight including reprod buffer
  s_M = l_j/ l_b;                     % -, acceleration factor
    
  % pupa: from pupation to emergence
  n_S = [1; 2.42; 0.92; 0.42];        % chemical indices for silk
  w_S = n_S' * [12; 1; 16; 14];       % g/mol, mol-weight of silk: 35 g/C-mol
  tT_e = (t_e - t_j)/ kT_M;           % d, time since start spinning at emergence
  VHELP_0 = [L_j^3; 0; f * E_m * L_j^3; 1e-4; 0]; % state at start pupation (before spinning)
%  [t VHELP] = ode45(@dget_VHELP, [0; 3; 5; tT_e], VHELP_0, [], kT_J, kT_EV, vT, E_m, L_m, kap, g, M_V, y_E_V, mu_E, y_S_V, w_S);
  [t VHELP] = ode45(@dget_VHELP, [0; .3; .5; 1] * tT_e, VHELP_0, [], kT_J, kT_EV, vT, E_m, L_m, kap, g, M_V, y_E_V, mu_E, y_S_V, w_S);
  V_js = VHELP(2,1); L_js = VHELP(2,4); E_js = VHELP(2,3); 
  Ww_js = V_js + L_js^3 + E_js * w_E/ mu_E/ d_E + Ww_Rj; % g, wet weight after spinning
  Wd_S = VHELP(4,5) * w_S;            % g, silk

  % emergence
  L_e = L_m * l_e;                    % cm, structural length at emergence
  Ww_e = L_e^3 + Ww_Rj + u_Ee * g * E_m * L_m^3 * w_E/ mu_E/ d_E; % g, wet weight including reprof buffer

  % reproduction
  N_i = kap_R * E_Rj/ E_0;             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                    % d, mean life span at T
  
  % starving imago at 5 d
  del_S = Wd_S / Ww_j;  % -, proportion weight of coccoon by weight at pupation with coccoon

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.te = tT_e;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwe = Ww_e;
  prdData.del_S = del_S;
  prdData.Ni = N_i;
  
  % uni-variate data
     
  % larval data
  ELE_0 = [f * E_m * L_b^3; L_b; 0];     % initial state vector
  [t ELE] = ode45(@dget_ELE, tW_bj(:,1), ELE_0, [], f, kT_M, kT_E, kT_J * E_Hb, pT_Am/ L_b, E_m, g, kap);
  L = ELE(:,2); V = L.^3; E = ELE(:,1); e = E ./ V/ E_m; E_R = ELE(:,3);
  EWw_bj = V + (E + E_R)/ mu_E * w_E/ d_E;  % g, wet weight
  
  % pupal data
  vT_j = vT * s_M;                              % cm/d, energy conductance of imago
  L_mj = L_m * s_M;                             % cm, max length of imago
  [t VHELP] = ode45(@dget_VHELP, tW_je(:,1), VHELP_0, [], kT_J, kT_EV, vT_j, E_m, L_mj, kap, g, M_V, kap_V * y_E_V, mu_E, w_E, d_E);
  V_l = VHELP(:,1); E = VHELP(:,3); L = VHELP(:,4); V = L.^3; P = VHELP(:,5); e = E ./ V/ E_m;  % -, scaled reserve density
  EWw_je = V_l + V + E * w_E/ mu_E/ d_E + Ww_Rj; % g, wet weight of pupa  

  % imago data
  pT_D = TC * (p_M * L_e^3 +  E_He * k_J);            % J/d, dissipation
  EWw_em = Ww_e - tW_em(:,1) * pT_D * w_E/ mu_E/ d_E; % g, wet weight for imago (including all eggs and reprod buffer)

  % pack to output
  prdData.tW_bj  = EWw_bj;
  prdData.tW_je  = EWw_je;
  prdData.tW_em  = EWw_em;
  
end

%% subfunctions 

    function dELE = dget_ELE(t, ELE, f, k_M, k_E, p_J, p_Am, E_m, g, kap)
      % larval development
      % t: time since birth
      
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
    
    function dVHELP = dget_VHELP(a, VHELP, k_J, k_E, v, E_m, L_m, kap, g, M_V, y_EV, mu_E, y_SV, w_S)
      % pupal development
      % a: d, time since pupation (before spinning)
      %   y_EV: yield of reserve of imago on structure of larva
      %   y_SV: yield of silk on structure of larva
       
      % unpack variables
      V  = VHELP(1); % cm^3, structural volume of larva
      H  = VHELP(2); % J, maturity 
      E  = VHELP(3); % J, reserve of larva
      L  = VHELP(4); % cm, structural length of imago
      %P  = VHELP(5); % g, silk 
            
      dV = - V * k_E;                     % cm^3/d, change larval structure
      e = E/ L^3/ E_m;                    % -, scaled reserve density
      r = v * (e/ L - 1/ L_m)/ (e + g);   % 1/d, specific growth rate
      p_C = E * (v/ L - r);               % J/d, mobilisation rate
      dE = - dV * M_V * y_EV * mu_E - p_C;  % J/d, change in reserve
      dL = r * L/ 3;                      % cm/d, change in length
      dH = (1 - kap) * p_C - k_J * H;     % J/d, change in maturity
      dP = max(0, - dV * M_V * y_SV);     % mol, silk produced
      
      dVHELP = [dV; dH; dE; dL; dP];      % pack derivatives
    end

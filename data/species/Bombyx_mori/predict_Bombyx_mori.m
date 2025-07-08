function [prdData, info] = predict_Bombyx_mori(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if s_j >= 1
    info = 0; prdData = []; return;
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); % all data at 25 C
  vT = v * TC; kT_J = k_J * TC; kT_M = k_M * TC; pT_M = p_M * TC; kT_EV = k_EV * TC; pT_Am = p_Am * TC; 
  jT_EM = kT_M * y_E_V;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k v_Hb v_He s_j kap kap_V];
  [t_j, t_e, t_b, l_j, l_e, l_b, rho_j, v_Rj, u_Ee, info] = get_tj_hex(pars_tj, f);
  
  % initial
  u_E0 = get_ue0([g, k, v_Hb], f);    % -, scaled initial reserve
  E_0 = 1e3 * u_E0 * g * E_m * L_m^3; % mJ, initial energy content
  Ww_0 = w_E * E_0/ mu_E/ d_E;        % mg, initial wet weight
    
  % birth
  aT_b = t_b/ kT_M;                   % d, age at birth at f and T
  L_b = L_m * l_b;                    % cm, structural length at birth
  Ww_b = 1e3 * L_b^3 * (1 + f * w);   % mg, wet weight at birth
  kT_E = vT/ L_b;                     % 1/d, reserve turnover rate

  % pupation (= start spinning)
  tT_j = (t_j - t_b)/ kT_M;           % d, time since birth at pupation
  L_j = L_m * l_j;                    % cm, structural length at pupation
  Ww_j = L_j^3 * (1 + f * w);         % g, wet weight at pupation, excluding reprod buffer at pupation
  E_Rj = v_Rj * (1 - kap) * g * E_m * L_j^3; % J, reproduction buffer at pupation
  Ww_Rj = E_Rj * w_E/ mu_E/ d_E;      % g, wet weight repod buffer at pupation
  Ww_j = 1e3 * (Ww_j + Ww_Rj);        % mg, wet weight including reprod buffer
  s_M = l_j/ l_b;                     % -, acceleration factor
    
  % pupa: from pupation to emergence
  n_S = [1; 2.42; 0.92; 0.42];        % chemical indices for silk
  w_S = n_S' * [12; 1; 16; 14];       % g/mol, mol-weight of silk: 35 g/C-mol
  tT_e = (t_e - t_j)/ kT_M;           % d, time since start spinning at emergence
  VHELP_0 = [L_j^3; 0; f * E_m * L_j^3; 1e-4; 0]; % state at start pupation (before spinning)
  vT_j = vT * s_M; L_mj = L_m * s_M;  % v and L_m after acceleration
  [t VHELP] = ode45(@dget_VHELP, [0; 3; 5; max(5.0001, tT_e)], VHELP_0, [], kT_J, kT_EV, vT_j, E_m, L_mj, kap, g, M_V, kap_V * y_E_V, mu_E, y_S_V);
  V_js = VHELP(2,1); L_js = VHELP(2,4); E_js = VHELP(2,3); 
  Ww_js = 1e3 * (V_js + L_js^3 + E_js * w_E/ mu_E/ d_E + Ww_Rj); % mg, wet weight after spinning
  V_j5 = VHELP(3,1); L_j5 = VHELP(3,4); E_j5 = VHELP(3,3);
  Ww_j5 = 1e3 * (V_j5 + L_j5^3 + E_j5 * w_E/ mu_E/ d_E + Ww_Rj); % mg, wet weight 5 d after start pupation
  Wd_S = 1e3 * VHELP(4,5) * w_S;      % mg, silk

  % emergence
  L_e = L_m * l_e;                    % cm, structural length at emergence
  Ww_e = 1e3 * (L_e^3 + Ww_Rj + u_Ee * g * E_m * L_m^3 * w_E/ mu_E/ d_E); % mg, wet weight including reprof buffer

  % reproduction
  N_i = 1e3 * kap_R * E_Rj/ E_0;       % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = (t_m - t_e)/ kT_M;            % d, mean life span as imago
  
  % starving imago at 5 d
  Ww_e5 = Ww_e - 5 * (kT_J * E_He + pT_M * L_e^3)/ mu_E/ d_E; % g, weight during starvation
  % no reprod, no loss of water

  % instar age, length
  L_2 = L_b * s_1^0.5; L_3 = L_2 * s_2^0.5; L_4 = L_3 * s_3^0.5; L_5 = L_4 * s_4^0.5; % cm, structural length of instar 1-5
  rT_j = TC * k_M * rho_j; % 1/d, specific growth rate
  tT_1 = log(L_2/ L_b) * 3/ rT_j;  tT_2 = log(L_3/ L_2) * 3/ rT_j;
  tT_3 = log(L_4/ L_3) * 3/ rT_j;  tT_4 = log(L_5/ L_4) * 3/ rT_j; tT_5 = log(L_j/ L_5) * 3/ rT_j;
  p_J = k_J * E_Hb; E_R = (1 - kap) * L_b^3 * f * E_m * (f + g)/ (f - l_b);
  t = tT_1;     E_R2 = E_R * (exp(t * rT_j) - 1) - t * p_J; Ww_2 = 1e3 * (L_2^3 * (1 + f * w) + E_R2 * w_E/ mu_E/ d_E);
  t = t + tT_2; E_R3 = E_R * (exp(t * rT_j) - 1) - t * p_J; Ww_3 = 1e3 * (L_3^3 * (1 + f * w) + E_R3 * w_E/ mu_E/ d_E);
  t = t + tT_3; E_R4 = E_R * (exp(t * rT_j) - 1) - t * p_J; Ww_4 = 1e3 * (L_4^3 * (1 + f * w) + E_R4 * w_E/ mu_E/ d_E);
  t = t + tT_4; E_R5 = E_R * (exp(t * rT_j) - 1) - t * p_J; Ww_5 = 1e3 * (L_5^3 * (1 + f * w) + E_R5 * w_E/ mu_E/ d_E);

  % pack to output
  prdData.ab = aT_b;
  prdData.t1 = tT_1;
  prdData.t2 = tT_2;
  prdData.t3 = tT_3;
  prdData.t4 = tT_4;
  prdData.t5 = tT_5;
  prdData.tj = tT_j;
  %prdData.ts = tT_s;
  prdData.te = tT_e;
  prdData.am = aT_m;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Ww2 = Ww_2;
  prdData.Ww3 = Ww_3;
  prdData.Ww4 = Ww_4;
  prdData.Ww5 = Ww_5;
  prdData.Wwj = Ww_j;
  prdData.WdS = Wd_S;
  prdData.Wwjs = Ww_js;
  prdData.Wwj5 = Ww_j5;
  prdData.Wwe = Ww_e;
  prdData.Wwe5 = Ww_e5;
  prdData.Ni = N_i;
  
  % uni-variate data
    
  % embryo data
  ULH_0 = [L_m^3 * g * u_E0/ vT; 1e-4; 0]; % d.cm^2, cm, d.cm^2
  [a ULH] = ode45(@dget_ulh, tWe(:,1), ULH_0, [], vT, g, L_m, kT_J, kap); % intgr in scaled time
  L = ULH(:,2); V = L.^3; E = ULH(:,1) * pT_Am; e = E ./ V/ E_m; 
  EWw_e = (L.^3 + E * w_E/ d_E/ mu_E) * 1e3; % mg, wet weight
  % t-JO data
  r = vT * (e ./ L - 1/ L_m) ./ (e + g); % 1/d, specific growth rate
  pC = E .* (vT ./ L - r);               % J/d, mobilisation rate
  pA = 0 * r; pM = pT_M * V; pD = (1 - kap) * pC + pM; pG = kap * pC - pM;  
  pADG = [pA, pD, pG];                   % J/d, assim, dissip, growth powers
  JM = - (n_M\n_O) * eta_O * pADG';      % mol/d, mineral fluxes
  EJT_Oe = 2 - JM(3,:)' * 24.4e6/ 24;    % mul/h, O2 consumption 
 
  % larval data
  ELE_0 = [f * E_m * L_b^3; L_b; 0];     % initial state vector
  [t ELE] = ode45(@dget_ELE, tW(:,1), ELE_0, [], f, kT_M, kT_E, kT_J * E_Hb, pT_Am/ L_b, E_m, g, kap);
  L = ELE(:,2); V = L.^3; E = ELE(:,1); e = E ./ V/ E_m; E_R = ELE(:,3);
  EWw = 1e3 * (V + (E + E_R)/ mu_E * w_E/ d_E);  % mg, wet weight
  % t-JO data
  r = (e * kT_E - g * kT_M) ./ (e + g);  % 1/d, specific growth rate
  pC = E .* (kT_E - r); pJ = kT_J * E_Hb; pM = pT_M * V; pR = (1 - kap) * pC - pJ;
  pA = 0*f * p_Am/ L_b * V; pD = pJ + pM + (1 - kap_R) * pR; pG = kap * pC - pM;  
  pADG = [pA, pD, pG];                   % scaled growth (page 78 DEB book)
  JM = - (n_M\n_O) * eta_O * pADG';      % mol/d, mineral fluxes
  EJT_O = - JM(3,:)' * 24.4e6/ 24;       % mul/h, O2 consumption 
  
  % pupal data
  vT_j = vT * s_M;                           % cm/d, energy conductance of imago
  L_mj = L_m * s_M;                          % cm, max length of imago
  [t VHELP] = ode45(@dget_VHELP, tWj(:,1), VHELP_0, [], kT_J, kT_EV, vT_j, E_m, L_mj, kap, g, M_V, kap_V * y_E_V, mu_E, y_S_V);
  V_l = VHELP(:,1); H = VHELP(:,2); E = VHELP(:,3); L = VHELP(:,4); V = L.^3; P = VHELP(:,5); e = E ./ V/ E_m;  % -, scaled reserve density
  EWw_j = 1e3 * ((V_l + V) + E * w_E/ mu_E/ d_E + Ww_Rj); % mg, wet weight of pupa  
  % t-JO data
  r = vT_j * (e ./ L - 1/ L_mj) ./ (e + g);  % 1/d, specific growth rate
  JEC = (y_E_V * r + jT_EM)/ kap * M_V .* V; % mol/d, mobilisation flux
  JV = M_V * (V .* r - V_l * kT_EV);         % mol/d, structure flux
  JE = kap_V * y_E_V * M_V * V_l * kT_EV - JEC; % mol/d, reserve flux
  JP = V_l * kT_EV * M_V * y_S_V;            % mol/d, silk flux
  JM = - (n_M\[n_O(:,2:3), n_S]) * [JV, JE, JP]'; % mol/d, mineral fluxes
  EJT_Oj = - JM(3,:)' * 24.4e6/ 24;          % mul/h, O2 consumption 
  EHe = H(end);                             % H, maturity at emergence
  
  % check for absence of rejuvenation at emergence
  dVHELP = dget_VHELP (0, VHELP(end,:), kT_J, kT_EV, vT_j, E_m, L_mj, kap, g, M_V, kap_V * y_E_V, mu_E, y_S_V);  
  if dVHELP(2) < 0
    info = 0; prdData = []; return;
  end
  
  % pack to output
  prdData.tWe  = EWw_e;
  prdData.tJOe = EJT_Oe;
  prdData.tW   = EWw;
  prdData.tJO  = EJT_O;
  prdData.tWj  = EWw_j;
  prdData.tJOj = EJT_Oj;
  
end

%% subfunctions 


    function dULH = dget_ulh(t,ULH, v, g, Lm, kJ, kap)
      % embryo stage embryo development
  
      % unpack state variables
      U = ULH(1); % U = M_E/{J_{EAm}}
      L = ULH(2); % structural length
      H = ULH(3); % H = M_H/{J_{EAm}}

      eL3 = U * v; % eL3 = L^3 * m_E/ m_Em
      gL3 = g * L^3;
      SC = L^2 * (1 + L/(g * Lm)) * g * eL3/ (gL3 + eL3); % J_EC/{J_EAm}
      dU = - SC;
      dL = v * (eL3 - L^4/ Lm)/ (3 * (eL3 + gL3));
      dH = (1 - kap) * SC - kJ * H;
     
      dULH = [dU; dL; dH]; % pack derivatives
    end

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
    
    function dVHELP = dget_VHELP(a, VHELP, k_J, k_E, v, E_m, L_m, kap, g, M_V, y_EV, mu_E, y_SV)
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

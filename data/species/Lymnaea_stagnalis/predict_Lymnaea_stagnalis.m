function [prdData, info] = predict_Lymnaea_stagnalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_18 = tempcorr(temp.ab_18, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri_FLE, T_ref, T_A);
  TC_JO_27 = tempcorr(temp.JO_27, T_ref, T_A);
  TC_JO_1 = tempcorr(temp.JO_1, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_A, T_ref, T_A);
  TC_e = tempcorr(temp.tWw_e, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial reserve
  Wd_0 = E_0 * w_E/ mu_E;           % g, initial dry weight
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  aT_b20 = t_b/ k_M; aT_b18 = aT_b20/ TC_18; % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V *(1 + f * w);  % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_32 = TC_Ri * reprod_rate_j(3.2 * del_M, f, pars_R);        % #/d, reproduction rate at Lw = 3.2 cm 

  % respiration
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  pT_ref = TC_JO_27 * p_Am * L_m^2; % J/d, max assimilation power at max size
  pACSJGRD = pT_ref * scaled_power_j(2.75 * del_M, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  JT_O27 = - J_M(3,:)/ 24.4/ 24;                      % L/h, O2 consumption 
  %
  pT_ref = TC_JO_1 * p_Am * L_m^2;  % J/d, max assimilation power at max size
  pACSJGRD = pT_ref * scaled_power_j(0.147 * del_M, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  JT_O1 = - J_M(3,:)/ 24.4/ 24;                       % L/h, O2 consumption 
 
  % pack to output
  prdData.ab_18 = aT_b18;
  prdData.ab_20 = aT_b20;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wd0 = Wd_0;
  prdData.Wdb = Wd_b;
  prdData.Wdi = Wd_i;
  prdData.Ri_FLE = RT_32;
  prdData.JO_27 = JT_O27;
  prdData.JO_1 = JT_O1;
  
  % uni-variate data
  
  % time-weight, O2 consumption for embryo at f and T
  pT_J = E_Hp * k_J * TC_e; vT = v * TC_e; pT_M = p_M * TC_e; pT_Am = p_Am * TC_e;
  LER_0 = [0.00001; E_0; 0];    % initial conditions
  [t, LER] = ode45(@get_LER, tWw_e(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f);
  EWw_e = LER(:,1).^3 .* (1 + f .* w); % g, wet weight  of embryo
  %
  [t, LER] = ode45(@get_LER, tJO_e(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f);
  L = LER(:,1); L3 = L .^3;      % cm, structural length, volume
  E = LER(:,2);                  % J, reserve
  ee = E ./ L3/ E_m;             % -, scaled reserve density
  r = vT * (ee ./ L - 1/ L_m) ./ (ee + g); % 1/d, specific growth rate
  pTC = (vT ./ L - r) .* E;      % J/d, mobilisation  (p.39 2.12)
  pTA = 0 * L;                   % J/d, asimilation 
  pTM = L3 * pT_M;               % J/d, somatic maintenance
  pTG = kap * pTC - pTM .* L3;   % J/d, growth
  pTD = pTM + (1 - kap) * pTC;   % J/d, disipation (without reproduction)
  J_O = eta_O * [pTA pTD pTG]';  % mol/d, organic fluxes
  J_M = (- n_M\n_O * J_O)';      % mol/d, mineral fluxes
  % molar volume of gas at 1 bar and 20 C is 24.4 L/mol
  X_gas = T_ref/ temp.tWw_e / 24.4;  % M, mol of gas per litre at 20 C and 1 bar 
  EJT_Oe = - J_M(:,3)/ X_gas / 24e-9; % nL/ h  

  % time-length,weight 
  % f_BohlJoos1982
  LER_0 = [L_0BohlJoos1982; f_BohlJoos1982 * E_m * L_0BohlJoos1982^3; 0];          % initial conditions
  [l_j, l_p, l_b] = get_lj(pars_tj, f); L_b = l_b * L_m; L_j = l_j * L_m; L_p = l_p * L_m;
  [t, LER] = ode45(@get_LER, tL_BohlJoos1982(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_BohlJoos1982);
  ELw_BohlJoos1982 = LER(:,1)/ del_M;                                          % cm, shell length
  %
  % f_FLE
  pT_J = k_J * TC_tL * E_Hp; vT = v * TC_tL; pT_M = p_M * TC_tL; pT_Am = p_Am * TC_tL;
  [l_j, l_p, l_b] = get_lj(pars_tj, f_FLE); L_b = l_b * L_m; L_j = l_j * L_m; L_p = l_p * L_m;
  LER_0 = [L_0FLE; f_FLE * E_m * L_0FLE^3; 0];                        % initial conditions
  [t, LER] = ode45(@get_LER, tL_FLE(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_FLE);
  ELw_FLE = LER(:,1)/ del_M;                                          % cm, shell length
  %
  % f_100
  LER_0 = [L_0; f_100 * E_m * L_0^3; 0];                              % initial conditions
  [l_j, l_p, l_b] = get_lj(pars_tj, f_100); L_b = l_b * L_m; L_j = l_j * L_m; L_p = l_p * L_m;
  [t, LER] = ode45(@get_LER, tL_100(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_100);
  ELw_100 = LER(:,1)/ del_M;                                          % cm, shell length
  [t, LER] = ode45(@get_LER, tN_100(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_100);
  EN_100 = max(0, LER(:,3) * kap_R/ E_0 - N_100);                                     % #, cum reprod
  %
  % f_50
  [l_j, l_p, l_b] = get_lj(pars_tj, f_50); L_b = l_b * L_m; L_j = l_j * L_m; L_p = l_p * L_m;
  [t, LER] = ode45(@get_LER, tL_50(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_50);
  ELw_50 = LER(:,1)/ del_M;                                           % cm, shell length
  [t, LER] = ode45(@get_LER, tN_50(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_50);
  EN_50 = max(0, LER(:,3) * kap_R/ E_0 - N_50);                                      % #, cum reprod
  %
  % f_25
  [l_j, l_p, l_b] = get_lj(pars_tj, f_25); L_b = l_b * L_m; L_j = l_j * L_m; L_p = l_p * L_m;
  [t, LER] = ode45(@get_LER, tL_25(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_25);
  ELw_25 = LER(:,1)/ del_M;                                           % cm, shell length
  [t, LER] = ode45(@get_LER, tN_25(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_25);
  EN_25 = max(0, LER(:,3) * kap_R/ E_0 - N_25);                                      % #, cum reprod
  %
  % f_A
  pT_J = k_J * TC_tL * E_Hp; vT = v * TC_tL; pT_M = p_M * TC_tL; pT_Am = p_Am * TC_tL;
  LER_0 = [L_0A; f_A * E_m * L_0A^3; 0];                              % initial conditions
  [l_j, l_p, l_b] = get_lj(pars_tj, f_A); L_b = l_b * L_m; L_j = l_j * L_m; L_p = l_p * L_m;
  [t, LER] = ode45(@get_LER, tL_A(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_A);
  ELw_A = LER(:,1)/ del_M;                                            % cm, shell length
  %
  [t, LER] = ode45(@get_LER, tWd_A(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_A);
  EWd_A = (LER(:,1).^3 * d_V + (LER(:,2) + LER(:,3)) * w_E/ mu_E) * (1 + w_s); % g, dry weight
  % 
  [t, LER] = ode45(@get_LER, tWw_A(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_A);
  EWw_A = LER(:,1).^3 + (LER(:,2) + LER(:,3)) * w_E/ mu_E/ d_E;       % g, wet weight
  % 
  [t, LER] = ode45(@get_LER, tN_A(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_A);
  E_0 = p_Am * initial_scaled_reserve(f_A, pars_UE0);                 % J, initial reserve
  EN_A = N_0 + LER(:,3) * kap_R/ E_0;                                 % #, cum reprod
  %
  % f_B
  [l_j, l_p, l_b] = get_lj(pars_tj, f_B); L_b = l_b * L_m; L_j = l_j * L_m; L_p = l_p * L_m;
  [t, LER] = ode45(@get_LER, tL_B(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_B);
  ELw_B = LER(:,1)/ del_M;                                            % cm, shell length
  %
  [t, LER] = ode45(@get_LER, tWd_B(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_B);
  EWd_B = (LER(:,1).^3 * d_V + (LER(:,2) + LER(:,3)) * w_E/ mu_E) * (1 + w_s); % g, dry weight
  % 
  [t, LER] = ode45(@get_LER, tWw_B(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_B);
  EWw_B = LER(:,1).^3 + (LER(:,2) + LER(:,3)) * w_E/ mu_E/ d_E;       % g, wet weight
  % 
  [t, LER] = ode45(@get_LER, tN_B(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_B);
  E_0 = p_Am * initial_scaled_reserve(f_B, pars_UE0);                 % J, initial reserve
  EN_B = N_0 + LER(:,3) * kap_R/ E_0;                                 % #, cum reprod
  %
  % f_C
  [l_j, l_p, l_b] = get_lj(pars_tj, f_C); L_b = l_b * L_m; L_j = l_j * L_m; L_p = l_p * L_m;
  [t, LER] = ode45(@get_LER, tL_C(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_C);
  ELw_C = LER(:,1)/ del_M;                                            % cm, shell length
  %
  [t, LER] = ode45(@get_LER, tWd_C(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_C);
  EWd_C = (LER(:,1).^3 * d_V + (LER(:,2) + LER(:,3)) * w_E/ mu_E) * (1 + w_s);  % g, dry weight
  % 
  [t, LER] = ode45(@get_LER, tWw_C(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_C);
  EWw_C = LER(:,1).^3 + (LER(:,2) + LER(:,3)) * w_E/ mu_E/ d_E;       % g, wet weight
  % 
  [t, LER] = ode45(@get_LER, tN_C(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_C);
  E_0 = p_Am * initial_scaled_reserve(f_C, pars_UE0);                 % J, initial reserve
  EN_C = N_0 + LER(:,3) * kap_R/ E_0;                                 % #, cum reprod
  %
  % f_D
  [l_j, l_p, l_b] = get_lj(pars_tj, f_D); L_b = l_b * L_m; L_j = l_j * L_m; L_p = l_p * L_m;
  [t, LER] = ode45(@get_LER, tL_D(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_D);
  ELw_D = LER(:,1)/ del_M;                                            % cm, shell length
  %
  [t, LER] = ode45(@get_LER, tWd_D(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_D);
  EWd_D = (LER(:,1).^3 * d_V + (LER(:,2) + LER(:,3)) * w_E/ mu_E) * (1 + w_s);      % g, dry weight
  % 
  [t, LER] = ode45(@get_LER, tWw_C(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_D);
  EWw_D = LER(:,1).^3 + (LER(:,2) + LER(:,3)) * w_E/ mu_E/ d_E;       % g, wet weight
  % 
  [t, LER] = ode45(@get_LER, tN_C(:,1), LER_0, [], L_b, L_j, L_p, pT_Am, kap, pT_M, vT, E_G, pT_J, f_D);
  E_0 = p_Am * initial_scaled_reserve(f_D, pars_UE0);                 % J, initial reserve
  EN_D = N_0 + LER(:,3) * kap_R/ E_0;                                 % #, cum reprod

  % time - survival: Eq (6.5) of Kooy2010 for short growth periods, e = 1, L = L_i, 20C
  h3_W = h_a * v/ 6/ L_i; h_G = s_G * v/ L_i; h3_G = h_G^3; th_G = h_G * tS(:,1);
  ES = exp(6 * h3_W/ h3_G * (1 - exp(th_G) + th_G + th_G.^2/ 2));
  
  % pack to output
  prdData.tL_BohlJoos1982 = ELw_BohlJoos1982;
  prdData.tL_FLE = ELw_FLE;
  prdData.tL_100 = ELw_100;
  prdData.tL_50 = ELw_50;
  prdData.tL_25 = ELw_25;
  prdData.tN_100 = EN_100;
  prdData.tN_50 = EN_50;
  prdData.tN_25 = EN_25;
  prdData.tL_A = ELw_A;
  prdData.tL_B = ELw_B;
  prdData.tL_C = ELw_C;
  prdData.tL_D = ELw_D;
  prdData.tWd_A = EWd_A;
  prdData.tWd_B = EWd_B;
  prdData.tWd_C = EWd_C;
  prdData.tWd_D = EWd_D;
  prdData.tWw_A = EWw_A;
  prdData.tWw_B = EWw_B;
  prdData.tWw_C = EWw_C;
  prdData.tWw_D = EWw_D;
  prdData.tN_A = EN_A;
  prdData.tN_B = EN_B;
  prdData.tN_C = EN_C;
  prdData.tN_D = EN_D;
  prdData.tWw_e = EWw_e;
  prdData.tJO_e = EJT_Oe;
  prdData.tS = ES;
  
end

function dLER = get_LER(t, LER, L_b, L_j, L_p, p_Am, kap, p_M, v, E_G, p_J, f)
                     
  L = LER(1); E = LER(2);  %ER = LER(3); % unpack state vars   

  MV = max(L_b, min(L, L_j))/ L_b;       % -, shape correction function   
  r = ((E * v * MV / L^4) - (p_M / kap)) / ((E / L^3) + (E_G / kap)); % 1/d, specific growth rate
  pC = E * (v * MV / L -  r);            % J/d, mobilization
  pA = f * MV * p_Am * L^2;              % J/d, assimilation

  dL = L * r / 3;                        % cm/d growth
  dE = pA - pC;                          % J/d reserve dynamics
  dR = (L > L_p) * max(0, (1 - kap) * pC - p_J);

  dLER = [dL; dE; dR];                   % pack output

end  
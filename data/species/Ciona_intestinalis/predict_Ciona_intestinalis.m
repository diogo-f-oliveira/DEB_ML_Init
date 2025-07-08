function [prdData, info] = predict_Ciona_intestinalis(par, data, auxData)  
  %% unpack par, chem, cpar and data

  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  K_cell = 1e-3 * K/ M_X;          % cell/ml, half-saturation coefficient in cells

  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_XdL = tempcorr(temp.XdL, T_ref, T_A);
  TC_WdJO = tempcorr(temp.WdJO, T_ref, T_A);
  TC_XJC = tempcorr(temp.XJC, T_ref, T_A);
  TC_XJX = tempcorr(temp.XJX, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_0 + t_b/ k_M/ TC;        % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % L-Wdb
  EWdb = (LWdb(:,1) * del_M).^3 * (1 + f * w);
  % L-Wdt
  EWdt = (LWdt(:,1) * del_M).^3 * (w_t + f * w);
 
  % X-dL
  f = XdL(:,1) ./ (K_cell + XdL(:,1)); Lw_i = (f * L_m - L_T)/ del_M;
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1./ ir_B; % d, 1/von Bert growth rate
  EdLw =  initL.XdL + t_exp.XdL * TC_XdL .* r_B .* (Lw_i - initL.XdL); % cm, length
  % X-dWdb
  f = XdWdb(:,1) ./ (K_cell + XdWdb(:,1)); L_i = (f * L_m - L_T);
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1./ ir_B; % d, 1/von Bert growth rate
  L = (1e-3 * initWd.XdWdb ./ (1 + f * w)/ d_V).^(1/3); % cm, structural length
  dL =  TC_XdL * r_B .* (L_i - L); % cm/d, change in structural length at T
  EdWdb = initWd.XdWdb + t_exp.XdWdb * 3e-3 * d_V .* (1 + f * w) .* L.^2 .* dL;  % mg body dry weight at t
  % X-dWdt
  f = XdWdt(:,1) ./ (K_cell + XdWdt(:,1)); L_i = (f * L_m - L_T);
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1./ ir_B; % d, 1/von Bert growth rate
  L = (1e-3 * initWd.XdWdt ./ (w_t + f * w)/ d_V).^(1/3); % cm, structural length
  dL =  TC_XdL * r_B .* (L_i - L); % cm/d, change in structural length at T
  EdWdt = initWd.XdWdt + t_exp.XdWdt * 3e-3 * d_V .* (w_t + f * w) .* L.^2 .* dL; % mg total dry weight at t
  
  % t-L
  vT = v * TC_tL;
  t = tL(:,1); U_b = f_tL * m_Em * M_V * L_b^3/ J_E_Am/ TC;
  [t LU] = ode45(@dget_LU, t, [L_b U_b], [], vT, g, L_m, f_tL); 
  ELw = LU(:,1)/ del_M;
  
  % Wd-JO
  f = f_WdJO;
  L = (WdJO(:,1)/ d_V/ (w_t + w * f)).^(1/3); % cm, structural length
  p_ref = TC_WdJO * p_Am * L_m^2;        % max assimilation power at max size
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  pACSJGRD = p_ref * scaled_power_old(L, f, pars_pow, l_b, l_p); % powers
  pADG = pACSJGRD(:,[1 7 5])';      % assimilation, dissipation, growth power
  pADG(1,:) = 0; % exclude contributions from assimulation
  J_O = eta_O * pADG;               % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;          % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  X_gas = 1/ 24.4;     % M, mol of gas per litre at 20 C and 1 bar 
  EJO = - 1e3 * J_M(3,:)'/ 24/ X_gas;  % ml/h, dioxygen use

  % X-JC
  f = max(.3,XJC(:,1) ./ (K + XJC(:,1))); % -, scaled func response
  L = (1e-3 * Wdry.XJC/ d_V ./ (1 + w * f)).^(1/3); % cm, structural length
  p_ref = TC_XJC * p_Am * L_m^2;                    % max assimilation power at max size
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  n = length(L); pACSJGRD = zeros(n,7);
  for i = 1:n
    pACSJGRD(i,:) = p_ref * scaled_power_old(L(i), f(i), pars_pow, l_b, l_p); % powers
  end
  pADG = pACSJGRD(:,[1 7 5])';  % assimilation, dissipation, growth power
  %pADG(1,:) = 0; % exclude contributions from assimulation
  J_O = eta_O * pADG;           % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;      % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  EJC = 1e6 * J_M(1,:)' ./ (Wdry.XJC * 12/ w_V);  % mugC/d.mgC, CO2 production
  
  % X-JX
  f = max(0.3,XJX(:,1) ./ (K + XJX(:,1))); % -, scaled func response 
  L = (1e-3 * Wdry.XJX/ d_V ./ (1 + w * f)).^(1/3);    % cm, structural length
  EJX = 1e6 * TC_XJX * J_X_Am * f .* L.^2 ./ (Wdry.XJX * 12/ w_V); % mugC/d.mgC
  
  %% pack to output               
  prdData.LWdb = EWdb;
  prdData.LWdt = EWdt;
  prdData.XdL = EdLw;
  prdData.XdWdb = EdWdb;
  prdData.XdWdt = EdWdt;
  prdData.tL = ELw;
  prdData.WdJO = EJO;
  prdData.XJC = EJC;
  prdData.XJX = EJX;
  
end

%% subfunction
  function dLU = dget_LU(t, LU, v, g, Lm, f_0)
  % dLUH = dget_LU(t, LU, v, g, Lm, f_0)
  % t: scalar with time since birth
  % LU: 2-vector with (L, U= M_E/{J_EAm})
  % dLU: 2-vector with (dL/da, dU/da)
  
  L = LU(1); % structural length
  U = LU(2); % scaled reserve M_E/{J_EAm} 
  
  if t < 5                                             % feeding protocol of CiriTosc2002
    f_t = f_0;
  elseif t < 15
    f_t = 0.7 * f_0;
  elseif t < 20
    f_t = 0.9 * f_0;
  else
    f_t = 1;
  end
  
  eL3 = U * v;                                         % cm^3, eL3 = L^3 * m_E/ m_Em
  gL3 = g * L^3;                                       % cm^3  
  SC = L^2 * (1 + L/ (g * Lm)) * g * eL3/ (gL3 + eL3); % cm^2, J_EC/{J_EAm}
  
  % generate dU/dt, dL/dt
  dU = f_t * L^2 - SC;                                 % cm^2
  dL = v * (eL3 - L^4/ Lm)/ (3 * (eL3 + gL3));         % cm/d
  
  % pack dL/dt, dU/dt
  dLU = [dL; dU];
  end
function [prdData, info] = predict_Mus_musculus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  
  filterChecks = (kap_X + kap_P < 1 || f_tW2 <0 || f_tW2 > 1 || f_tW3 > 1 || f_tW3 < 0 || ...
      f2 > f || f2 < f3 || f3 >= f2 || f3 < 0 );
  
  if filterChecks
      info = 0;
  end
  
  TC = tempcorr(temp.tg, T_ref, T_A); 
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + t_b/ k_M/ TC;        % d, gestation time at f and T

  % weaning
%   L_x = L_m * l_x;                  % cm, structural length at weaning
%   Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ k_M/ TC;      % d, time since birth at weaning at f and T
  
  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T
  
  % whole body energy density
  
  xi_WE = 1e-3 * ((f * E_m + mu_V * M_V)/ (d_V + f * E_m * w_E/ mu_E));  % kJ/g dry weight, whole-body energy density (no reprod buffer) 

  
  % pack to output
  prdData.tg    = aT_g;
  prdData.tx    = tT_x;
  prdData.tp    = tT_p;
  prdData.Li    = Lw_i;
  prdData.Wwb   = Ww_b;
  prdData.Wwp   = Ww_p;
  prdData.Wwi   = Ww_i;
  prdData.Ri    = RT_i;
  prdData.xi_WE = xi_WE;
   
  % uni-variate data
  
  %% h = ha mD
  % d/dt MD = kD (MQ yDQ + MD)
  % d/dt MQ = nu_QC pC

  vT = v * TC; kT_M = k_M * TC; hT_a = h_a * TC^2; hT_0 = h_0 * TC;  

  VeqhS0 = [L_b^3; 1; 0; 0; 1];

  rho = 1;
  [t VeqhS]  = ode45(@dget_VeqhS, [0;tS100(:,1)], VeqhS0, [], vT, kT_M, g, L_T, rho, hT_0, hT_a, s_G); 
  ES_100 = VeqhS(:,5); ES_100(1) = [];
  [t VeqhS]  = ode45(@dget_VeqhS, [0; tW100(:,1)], VeqhS0, [], vT, kT_M, g, L_T, rho, hT_0, hT_a, s_G);
  EWw_100 = VeqhS(:,1) .* (1 + w * VeqhS(:,2)); EWw_100(1) = []; % wet weight 1 g/cm^3

  rho = f2;
  [t VeqhS] = ode45(@dget_VeqhS, [0;tS75(:,1)], VeqhS0, [], vT, kT_M, g, L_T, rho, hT_0, hT_a, s_G); 
  ES_75 = VeqhS(:,5); ES_75(1) = [];
  [t VeqhS] = ode45(@dget_VeqhS, [0;tW75(:,1)], VeqhS0, [], vT, kT_M, g, L_T, rho, hT_0, hT_a, s_G);
  EWw_75 = VeqhS(:,1) .* (1 + w * VeqhS(:,2)); EWw_75(1) = []; % wet weight 1 g/cm^3

  rho = f3;
  [t VeqhS] = ode45(@dget_VeqhS, [0;tS44(:,1)], VeqhS0, [], vT, kT_M, g, L_T, rho, hT_0, hT_a, s_G); 
  ES_44 = VeqhS(:,5); ES_44(1) = [];
  [t VeqhS] = ode45(@dget_VeqhS, [0;tW44(:,1)], VeqhS0, [], vT, kT_M, g, L_T, rho, hT_0, hT_a, s_G);
  EWw_44 = VeqhS(:,1) .* (1 + w * VeqhS(:,2)); EWw_44(1) = []; % wet weight 1 g/cm^3
  
  % foetal development: fast 
  % formula 2.47 Kooy2010, assuming reserve density of the embryo is
  % contstant
  EWw_e = (1 + f * w) * (vT * max(0, tW_e(:,1) - t_0)/ 3) .^ 3; 
  
  
%  Gate1925:
  L_b  = L_m * get_lb([g k v_Hb], f); % cm, structural length
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;           % d, 1/von Bert growth rate
  L_i  = L_m * (f - l_T); 
  L    = L_i - (L_i - L_b) * exp( - rT_B * tWm(:,1));        % cm, structural length at time
  EWwm = L.^3 * (1 + f * w);                                 % g, wet weight
  % 
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;      % d, 1/von Bert growth rate
  L_i  = L_m * (f - l_T); 
  L    = L_i - (L_i - L_b) * exp( - rT_B * tWf(:,1));   % cm, structural length at time
  EWwf = L.^3 * (1 + f * w);                            % g, wet weight

% IshiHata2005:
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;  % d, 1/von Bert growth rate
  L_i = L_m * (f - l_T); 
  L = L_i - (L_i - L_b) * exp( - rT_B * tW1(:,1));           % cm, structural length at time
  EWw1 = L.^3 * (1 + f * w);                                 % g, wet weight
  
% HallFerg2002:
  ir_B = 3/ k_M + 3 * f_tW2 * L_m/ v; rT_B = TC/ ir_B;  % d, 1/von Bert growth rate
  L_i = L_m * (f_tW2 - l_T); 
  L = L_i - (L_i - L_b) * exp( - rT_B * tW2(:,1));           % cm, structural length at time
  EWw2 = L.^3 * (1 + f_tW2 * w);                                 % g, wet weight
  
% BakePing1993:
  rho = f_tW3; 
  [t, VeqhS]  = ode45(@dget_VeqhS, tW3(:,1), VeqhS0, [], vT, kT_M, g, L_T, rho, hT_0, hT_a, s_G); 
  EWw3 = VeqhS(:,1) .* (1 + w * VeqhS(:,2));
 
% respiration as function of size
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  L = (WJO(:,1)/ (1 + f * w)) .^ (1/3);             % cm, structural length
  pACSJGRD = p_ref * scaled_power(L, f, pars_p, l_b, l_p);  % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJO = - J_M(3,:)' * TC * 24.4e3/ 24/60;         % ml O2/min, O2 consumption 
  
  % pack to output
  prdData.tW100 = EWw_100;
  prdData.tW75  = EWw_75;
  prdData.tW44  = EWw_44;
  prdData.tS100 = ES_100;
  prdData.tS75  = ES_75;
  prdData.tS44  = ES_44;
  prdData.tW_e  = EWw_e;
  prdData.tW1  = EWw1;
  prdData.tW2  = EWw2;
  prdData.tWm  = EWwm;
  prdData.tWf  = EWwf;
  prdData.tW3  = EWw3;
  prdData.WJO  = EJO;
  
  
end

% %% subfunction

function dVeqhS = dget_VeqhS(t, VeqhS, v, kM, g, LT, rho, h0, ha, sG)

% upack vars
V = VeqhS(1); ee = VeqhS(2); L = max(1e-3, V)^(1/ 3);
Lm = v/ g/ kM; Li = Lm - LT;
q = VeqhS(3); h = VeqhS(4); S = max(1e-10,VeqhS(5));

% e and V trajectories
% de = (rho * Li^2/ L^2 - ee) * v/ L;

 

de = (rho - ee) * v/ L;
r = (v * ee/ L - (1 + LT/ L) * kM * g)/ (ee + g);
dV = r * V;

% dEH = (1 - kap) * pC - k_J * EH;

% aging
dq = ha * ee * (v/ L - r) - r * q;
dh = q - h * (r - sG * ee * (v/ L -r) * L^3/ Lm^3);

% survival
dS = - S * (h0 + h);

% pack output
dVeqhS = [dV; de; dq; dh; dS];

end
function [prdData, info] = predict_Euschistus_heros(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if k > 1 || f_B1 > 1
    prdData = []; info = 0; return
  end
  

  pars_Temp =  T_A;
  % compute temperature correction factors
  TC_27 = tempcorr(temp.Ri, T_ref, pars_Temp);
  TC_26 = tempcorr(temp.ab, T_ref, pars_Temp);
  TC_25 = tempcorr(temp.am, T_ref, pars_Temp);
  TC_N  =  tempcorr(temp.tN, T_ref, pars_Temp);
  TC_B  = tempcorr(temp.tL_fB1, T_ref, pars_Temp);  % Temperature correction for the Bayer experiment

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp s_1];
  [t_1, t_p, t_b, l_1, l_p, l_b, info] = get_tp_stinkbugs(pars_tp, f);

  if info == 0
    prdData = []; info = 0; return
  end

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial scaled reserve

  % birth
  aT_b = t_b/ k_M/ TC_26;           % d, age at birth at f and T
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lh_b = L_m * l_b/del_Mh;          % cm, head length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  aT_p = t_p / k_M/ TC_26;          % d, age at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % body length at larval instar
  L_2 = L_b * s_1^0.5;  % cm, length at start of instar 2
  L_3 = L_2 * s_2^0.5;  % cm,  length at start of instar 3
  L_4 = L_3 * s_3^0.5;  % cm,  length at start of instar 4
  L_5 = L_4 * s_4^0.5;  % cm, length at start of instar 5
  
  if L_5 > L_p
    prdData = []; info = 0; return
  end

 % instar durations
 opts = odeset('Events',@instars,'AbsTol',1e-9, 'RelTol',1e-9);

  ELHE_0 = [f * E_m * L_b^3; L_b; E_Hb; 0; 0; 0; 1]; % initial state vector
  pars = [TC_26 * p_M; TC_26 * k_J; E_G; E_Hp; TC_26 * v; TC_26 * p_Am; kap; s_1; s_2; s_3; s_4;h_a*TC_26*TC_26; s_G; 0; 0; E_Hb; L_p];
  %
  [t ELHE te ye] = ode45(@dget_ELHE, [0; 300], ELHE_0, opts, pars, f , L_b, t_1/k_M/TC_26);

  if length(te)<4 || length(te)>4
    prdData = []; info = 0; return
  end

  tT_1 = t_1/k_M/TC_26; tT_2 = te(1)-tT_1; tT_3 = te(2)-te(1); tT_4 = te(3)-te(2); tT_5 = te(4)-te(3);

  % reproduction (no kappa-rule)
  R_i = (kap_R * (p_Am * f * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0) * TC_27; % #/d, ultimate reproduction rate at T
  
  % life span
  pars_tm = [g; k; v_Hb; v_Hp; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_mod('sbp', pars_tm, f);      % -, scaled mean life span at T_ref
  aT_m = (t_m - t_p)/ k_M/TC_25;                % d, mean life span at T  
  
  % respiration after puberty no kappa-rule
  L = (weight.JC_p/(1 + f*w))^(1/3);  % cm, structural length
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  Hp = E_Hp/p_Am;  % scaled maturities at puberty E_H/ {p_Am}
  u_Hp = Hp *  g^2 * k_M^3/ v^2;
  l = L/L_m;
  pA = f * l^2;                    % assim
  pC = f* l^2;                      % mobilisation
  pS = kap * l^2 * l;               % somatic  maint
  pJ = k * u_Hp;                    % maturity maint
  pG = 0;                           % growth
  pR = pC - pS - pJ;         % maturation/reproduction
  pD = pS + pJ + (1 - kap_R) * pR ; % dissipation
  pACSJGRD = TC_27 * p_ref * [pA, pC, pS, pJ, pG , pR, pD];
  J_M = -(n_M\ n_O) * eta_O * [pACSJGRD(1) pACSJGRD(7) pACSJGRD(5)]'; % mol/d, mineral fluxes (J_C, J_H, J_O, J_N in rows)
  JC_p = 1e3 * J_M(1) * 22.4/24;   % mL CO2/h (with 22.4 L CO2/mol)

  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lhb = Lh_b;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Ri = R_i;
  prdData.t1 = tT_1;
  prdData.t2 = tT_2;
  prdData.t3 = tT_3;
  prdData.t4 = tT_4;
  prdData.t5 = tT_5;  
  prdData.JC_p = JC_p;

  % uni-variate data
  
  % temperature- age at birth
  TC = tempcorr(C2K(Tab(:,1)), T_ref, pars_Temp); 
  EaT_b = t_b / k_M./ TC;
 
  % temperature -instar durations
  TC = tempcorr(C2K(Ttins(:,1)), T_ref, pars_Temp);
  EtT_ins = ((t_p-t_b) / k_M - t_1)./TC;

  % time - length at different food level
  % We assume that time and length at birth are equal for all treatments.
  % The initial values are calculated at f=1
  ELHE_0 = [f * E_m * L_b^3; L_b; E_Hb; 0; 0; 0; 1]; % initial state vector
  pars_T = [TC_B * p_M; TC_B * k_J; E_G; E_Hp; TC_B * v; TC_B * p_Am; kap;s_1; s_2; s_3; s_4;h_a*TC_B*TC_B; s_G; 0; 0; E_Hb; L_p];
   
  [t1 ELHE1] = ode45(@dget_ELHE, [0; tL_fB1(:,1)], ELHE_0, [], pars_T, f_B1, L_b, t_1/k_M/TC_B);
  ELHE1(1,:) = []; t1(1) = [];
  ELw_B1 = ELHE1(:,2)/del_Mh; % cm, head length 
  EWw_B1 = ELHE1(:,2).^3 + (ELHE1(:,1) + ELHE1(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer

  [t2 ELHE2] = ode45(@dget_ELHE, [0; tL_fB2(:,1)], ELHE_0, [], pars_T, f_B2, L_b, t_1/k_M/TC_B);
  ELHE2(1,:) = []; t2(1) =[];
  ELw_B2 = ELHE2(:,2)/del_Mh; % cm, head length
  EWw_B2 = ELHE2(:,2).^3 + (ELHE2(:,1) + ELHE2(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer

  [t3 ELHE3] = ode45(@dget_ELHE, [0; tL_fB3(:,1)], ELHE_0, [], pars_T, f_B3, L_b, t_1/k_M/TC_B);
  ELHE3(1,:) = []; t3(1) = [];
  ELw_B3 = ELHE3(:,2)/del_Mh; % cm, head length
  EWw_B3 = ELHE3(:,2).^3 + (ELHE3(:,1) + ELHE3(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer

  [t4 ELHE4] = ode45(@dget_ELHE, [0; tL_fB4(:,1)], ELHE_0, [], pars_T, f_B4, L_b, t_1/k_M/TC_B);
  ELHE4(1,:) = []; t4(1) = [];
  ELw_B4 = ELHE4(:,2)/del_Mh; % cm, head length
  EWw_B4 = ELHE4(:,2).^3 + (ELHE4(:,1) + ELHE4(:,4))* (w_E/mu_E/d_E); % g, wet weight including reproduction buffer

  % Reproduction, progeny since emergence
  ELHE_0 = [f * E_m * L_p^3; L_p; E_Hp; 0; 0 ;0; 1]; % initial state vector
  pars_T = [TC_N * p_M; TC_N * k_J; E_G; E_Hp; TC_N * v; TC_N * p_Am; kap;s_1; s_2; s_3; s_4;h_a*TC_N*TC_N; s_G; 0; 0; E_Hb; L_p];
  [t ELHE] = ode45(@dget_ELHE, [t_p/k_M/TC_27; tN(:,1)+t_p/k_M/TC_27], ELHE_0, [], pars_T, f, L_b, t_1/k_M/TC_B);
  EN = kap_R * ELHE(:,4)/ E_0;     % #, cumulative reprod output
  EN(1) = []; t(1) = [];
  
  % time - survival: Eq (6.2) of Kooy2010
  ELHE_0 = [f * E_m * L_b^3; L_b; E_Hb; 0; 0; 0; 1]; % initial state vector
  p_surv = [TC_26 * p_M; TC_26 * k_J; E_G; E_Hp; TC_26 * v; TC_26 * p_Am; kap;s_1; s_2; s_3; s_4;h_a*TC_26*TC_26; s_G; h_i *TC_26; 0; E_Hb; L_p];
  [t ELHE] = ode45(@dget_ELHE, [0; tS(:,1)+ t_p/k_M/TC_26], ELHE_0, [], p_surv, f, L_b, t_1/k_M/TC_26);
  ES = ELHE(:,7); ES(1) =[]; 

  % time - nymphal survival grown on soybeans
  p_surv = [TC_26 * p_M; TC_26 * k_J; E_G; E_Hp; TC_26 * v; TC_26 * p_Am; kap;s_1; s_2; s_3; s_4;h_a*TC_26*TC_26; s_G; 0; h_j*TC_26; E_Hb; L_p];
  [t, ELHE] = ode45(@dget_ELHE, [0; tSN(:,1)], ELHE_0, [], p_surv, f, L_b, t_1/k_M/TC_26);
  ESN = ELHE(:,7); ESN(1)=[];

% pack to output
  prdData.Tab = EaT_b;
  prdData.Ttins = EtT_ins;  
  prdData.tN = EN;
  prdData.tS = ES;
  prdData.tL_fB1 = ELw_B1;
  prdData.tL_fB2 = ELw_B2;
  prdData.tL_fB3 = ELw_B3;
  prdData.tL_fB4 = ELw_B4;
  prdData.tWw_fB1 = EWw_B1;
  prdData.tWw_fB2 = EWw_B2;
  prdData.tWw_fB3 = EWw_B3;
  prdData.tWw_fB4 = EWw_B4;
  prdData.tSN = ESN;
end

function dELHE = dget_ELHE(t, ELHE, p, f, Lb, tT_1)
  % t: time since birth
 
  % unpack variables    
  E  = ELHE(1); % J, reserve
  L  = ELHE(2); % cm, structural length
  EH = ELHE(3); % J, maturity
  ER = ELHE(4); % J, reproduction buffer
  q = ELHE(5);  % 1/d^2, acceleration
  h = ELHE(6);  % 1/d,  hazard rate
  S = ELHE(7);  % surviving fraction
      
  % unpack parameters 
  p_M = p(1); k_J = p(2); E_G = p(3); E_Hp = p(4); v = p(5); p_Am = p(6); kap = p(7); 
  h_a = p(12); s_G = p(13); h_i = p(14); h_j = p(15); 
  
  L_m = kap*p_Am/p_M;
  V = L^3;  % cm^3, structural volume
  E_m = p_Am/v;
  e = E/V/E_m; %-. scaled reserve density

  if  EH < E_Hp
      % juvenile, instar 1 does not feed
      r = (E * v / L - p_M*V/kap)/(E + E_G*V/kap);       % 1/d, specific growth rate 
      p_C = E * (E_G * v / L  + p_M)/ (kap*E/V + E_G);  % J/d, mobilisation rate
      % generate derivatives
      dE = (t > tT_1) * f * p_Am * L^2 - p_C;    % J/d, change in reserve
      dL = r * L/ 3;                     % cm/d, change in length
      dEH = (1 - kap) * p_C - k_J * EH; % J/d, change in maturity  
      dER = 0;                    % J/d, change in reprod buffer
      % aging
      dq = (q * L^3 * s_G/ L_m^3  + h_a)* e * (v/L - r) - r * q;
      dh = q - r * h;
      hj = h_j; %% juvenile hazard
      % survival
      dS = -(h + hj) * S;
  end
  
  if EH >= E_Hp
      % adult
      pC  = E * v/ L; % J/d, mobilized energy flux  
      % generate derivatives
      dE    = f * p_Am * L^2  - pC;  % J/d, change in energy in reserve
      dL    = 0;  % cm/d, change in structural length
      dER  =  pC - p_M*L^3 - k_J * E_Hp; % J/d, change in reproduction buffer
      dEH  = 0; % J/d, change in cumulated energy invested in maturation
      % aging
      dq = (q * L^3 * s_G/ L_m^3  + h_a)* e * v/L;
      dh = q;
      % survival
      dS = -(h+h_i) * S;
  end

dELHE = [dE; dL; dEH; dER; dq; dh; dS];
end

function [value,isterminal,direction] = instars(t, ELHE, p, f, Lb, tT_1)
s1 = p(8); s2 = p(9); s3 = p(10); s4=p(11); E_Hp = p(4);
 value = [ELHE(2)-sqrt(s1*s2)*Lb; ELHE(2)-sqrt(s1*s2*s3)*Lb; ELHE(2)-sqrt(s1*s2*s3*s4)*Lb; ELHE(3)-E_Hp];
 isterminal = [0;0;0;0];
 direction = 0;
end

function varargout = get_tp_stinkbugs(p, f, tel_b, tau)
  % modified at 2024/04/01 from get_tj to include non-feeding first instar by Evridiki Klagkou, Dina Lika
    
  %%  Input
  %
  % * p: 6-vector with parameters: g, k, l_T, v_H^b, v_H^p, s1
  % * f: optional scalar with functional response (default f = 1) or (n,2)-array with scaled time since birth and scaled func response
  % * tel_b: optional scalar with scaled length at birth or 3-vector with scaled age at birth, reserve density and length at 
  % * tau: optional n-vector with scaled times since birth
  %  
  % Output
  %
  % * tvel: optional (n,4)-array with scaled time-since-birth, maturity, reserve density and length
  % * tau_p: scaled age at puberty \tau_p = a_p k_M
  % * tau_b: scaled age at birth \tau_b = a_b k_M
  % * l_p: scaled length at puberty
  % * l_b: scaled length at birth
  % * info: indicator equals 1 if successful, 0 otherwise

  %% 

  % unpack pars
  g    = p(1); % energy investment ratio
  k    = p(2); % k_J/ k_M, ratio of maturity and somatic maintenance rate coeff
  l_T  = p(3); % scaled heating length {p_T}/[p_M]Lm
  v_Hb = p(4); % v_H^b = U_H^b g^2 kM^3/ (1 - kap) v^2; U_H^b = E_H^b/ {p_Am}
  v_Hp = p(5); % v_H^p = U_H^p g^2 kM^3/ (1 - kap) v^2; U_H^p = E_H^p/ {p_Am}
  s1   = p(6); % stress at first molt
    
  if ~exist('f', 'var') || isempty(f)
    f = 1; f_i = f;
  elseif length(f) == 1
    f_i = f; 
  else
    f_i = f(end,2);  
  end
  
  % embryo
  if exist('tel_b', 'var') && ~isempty(tel_b)
    if length(tel_b) == 1
      tau_b = get_tb(p([1 2 4]), f_i);
      e_b = f_i;
      l_b = tel_b;
    else
      tau_b = tel_b(1);
      e_b   = tel_b(2);
      l_b   = tel_b(3);
    end
  else
    e_b = f_i;
    [tau_b, l_b] = get_tb(p([1 2 4]), e_b);
  end
  vel_b = [v_Hb; e_b; l_b]; % states at birth
  
  info = 1;
  if ~exist('tau','var'); tau = [0;1e10]; info_tau = 0; else; info_tau = 1; end   
  if exist('info_tb','var') && exist('info_lp','var'); info = min(info_tb, info_lp); end
  
  % non-feeding juvenile
  options = odeset('Events',@event_j1, 'AbsTol',1e-9, 'RelTol',1e-9); 
  [t, vel, tau_1, vel_1] = ode45(@dget_lp, [-1e-10; 10], vel_b, options, info_tau, 0, l_b, g, k, l_T, v_Hp,s1);
  tvel = [t, vel]; tvel(1,:) = []; if (length(tau)==1); tvel = tvel(end,:); end
  if isempty(vel_1)
    tau_1 = NaN; tau_j = NaN; tau_p = NaN; l_1 = NaN; l_j = NaN; l_p = NaN; l_i = NaN; info = 0;
  else
  % juvenile & adult
  options = odeset('Events',@event_p, 'AbsTol',1e-9, 'RelTol',1e-9); 
  [t, vel, tau_pp, vel_p] = ode45(@dget_lp, [tau_1; 1e10], vel_1, options, info_tau, f, l_b, g, k, l_T, v_Hp,s1);
  tvel = [t, vel]; tvel(1,:) = []; if (length(tau)==1); tvel = tvel(end,:); end
  if isempty(vel_p)
    tau_p = NaN; l_1 = vel_1(3); l_p = NaN; info = 0;
  else
    tau_p = tau_b + tau_pp;
    l_1 = vel_1(3); l_p = vel_p(1,3); 
  end
  end
  rho_B = 1/ 3/ (1 + f_i/ g); % -, scaled von Bert growth rate
 
  if isempty(tau_1) || isempty(tau_p) || ~isreal(tau_p) % tp must be real and positive
    info = 0;
  elseif tau_1 < 0 || tau_p < 0 || rho_B <=0
    info = 0;
  end

  if info_tau
    varargout = {tvel, tau_1, tau_p, tau_b, l_1, l_p, l_b, info};
  else
    varargout = {tau_1, tau_p, tau_b, l_1, l_p, l_b, info};
  end
end

function [value,isterminal,direction] = event_j1(tau, vel, info_tau, tf, l_b, g, k, l_T, v_Hp,s1)
  % vel: 3-vector with [v_H; e; l]
  value = s1*l_b - vel(3);
  isterminal = 1;
  direction  = 0; 
end

function [value,isterminal,direction] = event_p(tau, vel, info_tau, tf, l_b, g, k, l_T, v_Hp,s1)
  % vel: 3-vector with [v_H; e; l]
  value = v_Hp - vel(1);
  isterminal = 1;
  direction  = 0; 
end

function dvel = dget_lp (tau, vel, info_tau, tf, l_b, g, k, l_T, v_Hj, v_Hp, s1)
  % tau: scaled time since birth 
  % v_H continues changing after v_Hp for simplicity's sake, but is not used

  v_H = vel(1); e = vel(2); l = vel(3);
  
  if size(tf,2)==1 % f constant
    f = tf(1); 
  else % f is varying
    f = spline1(tau,tf);
  end
  
  de = (f - e) * g/ l; % d/d tau e
  rho = g * (e / l - 1 - l_T/ l)/ (e + g); % -, spec growth rate
  dl = l * rho/ 3; % -, d/d tau l  
  dv_H = e * l^3 * (1/ l - rho/ g) - k * v_H; % -, d/d tau v_H
  dvel = [dv_H; de; dl]; % pack to output

end




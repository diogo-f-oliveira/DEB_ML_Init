function [prdData, info] = predict_Sardina_pilchardus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  %filter for the lower f
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [~, ~, ~, l_j,~, l_b, ~, ~, ~, info] = get_tj(pars_tj, f_insitu);%f_insitu is the expected lower f of the data set

  if info ~= 1 % numerical procedure failed
    fprintf('warning: invalid parameter value combination for get_tj \n')
    prdData = {};
    return
  end
  
  s_M = l_j / l_b;
  if k * v_Hp >= f_insitu ^3 * s_M^3  || ... % constraint required for reaching puberty with lower f of the data set
          E_Hb >= E_Hj || E_Hb < 0  || ...
          E_Hj >= E_Hp || E_Hj < 0
      info = 0;
      prdData = {};
      return
  end
     
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_ap2 = tempcorr(temp.ap2, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, info] = get_tj(pars_tj, f); 

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = tau_p/ k_M/ TC_ap;         % d, time since birth at puberty at f and T
  aT_p2 = tau_p/ k_M/ TC_ap2;       % d, time since birth at puberty at f and T
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ k_M/ TC_am;             % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.ap2 = aT_p2;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lp2 = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwp2 = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
   
  %% uni-variate data
  
  % 1st data set for late juveniles and adults
  [tau_j tau_p tau_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f_insitu);
  rT_B = TC_tL * rho_B * k_M; rT_j = TC_tL * rho_j * k_M;              % 1/d, von Bert, exponential growth rate
  aT_b = tau_b/ k_M/ TC_tL; aT_j = tau_j/ k_M/ TC_tL;
  tau_j = aT_j - aT_b; % time since birth at metamorphosis
  t_bj = tL(tL(:,1) < tau_j,1); % select times between birth & metamorphosis
  Lw_b = l_b * L_m/ del_M; Lw_j = l_j * L_m/ del_M; Lw_i = l_i * L_m/ del_M;
  EL_bj = Lw_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
  t_ji = tL(tL(:,1) >= tau_j,1); % selects times after metamorphosis
  EL_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (t_ji - tau_j)); % cm, expected length at time
  ELw = [EL_bj; EL_ji]; % catenate lengths
 
   % L-W data
  EWw_p1 = (LW_p1(:,1) * del_M).^3 * (1 + f_exp1 * w); % g, wet weight
  EWw_p2 = (LW_p2(:,1) * del_M).^3 * (1 + f_exp1 * w); % g, wet weight
  EWw_p3 = (LW_p3(:,1) * del_M).^3 * (1 + f_exp1 * w); % g, wet weight
  EWw_p4 = (LW_p4(:,1) * del_M).^3 * (1 + f_exp1 * w); % g, wet weight
 
  
  
  [tau_j tau_p tau_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f_exp2);
  L_b = L_m * l_b;
  L_j = L_m * l_j;
  E_b = f_insitu * L_b^3 * p_Am / v ;
  EaT_b = tau_b/ k_M/ tempcorr(C2K(17), T_ref, T_A); 
  ELH_0 = [E_b; L_b; E_Hb; 0]; %initial conditions for state variables E,L,H and R
  
  temp.tL2(:,2) = C2K(temp.tL2(:,2)); % convert to K before the ode-solver for efficiency
  [~, ELHR] = ode45(@dget_ELHR_j, [EaT_b;tL2(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, kap_R, E_Hb, E_Hj, E_Hp, T_ref, T_A, temp.tL2,f_exp2); %[] in third column means no ODE options
  ELHR(1,:)=[];
  E = ELHR(:,1); L = ELHR(:,2);  R= ELHR(:,4); %H = ELHR(:,3);
  EWw= L.^3 + (E + R) * w_E/ mu_E/ d_E;
  ELw2=L/del_M;

  [~, ELHR] = ode45(@dget_ELHR_j, [EaT_b;tGSI(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, kap_R, E_Hb, E_Hj, E_Hp, T_ref, T_A, temp.tL2,f_exp2); %[] in third column means no ODE options
  ELHR(1,:)=[];
  E = ELHR(:,1); L = ELHR(:,2);  E_R= ELHR(:,4); %H = ELHR(:,3);
  W= L.^3 + (E + E_R) * w_E/ mu_E/ d_E;
  EGSI=(E_R * w_E/ mu_E/ d_E)./W.*100/10; % divide by 10 to account
  
 
% pack to output
  prdData.tL = ELw;
  prdData.tL2 = ELw2;
  prdData.tW = EWw;
  prdData.tGSI = EGSI;
  
  prdData.LW_p1 = EWw_p1;
  prdData.LW_p2 = EWw_p2;
  prdData.LW_p3 = EWw_p3;
  prdData.LW_p4 = EWw_p4;
end

function dELHR = dget_ELHR_j(t,ELHR, Lb, Lj, Lm, p_Am, v, g, kJ, kap, kap_R, Hb, Hj, Hp, T_ref, T_A, tT,f)

  %  change in state variables during juvenile and adult stage at given temperature for species with bj acceleration, by Seb Lefebvre
  
  %  dELHR = dget_ELHR_pj(t, ELH)
  %  ELHR: 4-vector
  %   E: reserve E in j
  %   L: structural length in cm
  %   H: maturity E_H in j
  %   R: reproduction buffer E_R in j
  %  dELHR: change in reserve, length, maturity and reproduction buffer
  
 
  %  unpack variables
  E = ELHR(1); L = ELHR(2); H = ELHR(3); R = ELHR(4);
  
  % interpolation for TC
  TC = tempcorr(interp1(tT(:,1),tT(:,2),t), T_ref, T_A);%
  
  vT = v * TC; kT_J = kJ * TC; pT_Am = p_Am * TC;
 
  if H < Hb 
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
  
    
  e = vT * E/ L^3/ pT_Am; % -, scaled reserve density; 
  rT = s * vT * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  pT_C = E * (s * vT/ L - rT); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt, dR/dt
  if H<Hp
    dH = (1 - kap) * pT_C - kT_J * H;  
    dR = 0;
  else
    dH = 0;
    dR = kap_R * (1 - kap) * pT_C - kT_J * Hp;
  end
  
  dE = (L > Lb) * s * pT_Am * f * L^2 - pT_C;
  dL = rT * L/3;

  % pack derivatives
  dELHR = [dE; dL; dH; dR];
end          
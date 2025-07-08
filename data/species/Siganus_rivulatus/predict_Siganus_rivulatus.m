function [prdData, info] = predict_Siganus_rivulatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  pars_T = [T_A, T_H, T_AH];

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, pars_T); 
  TC    = tempcorr(temp.am, T_ref, pars_T); 
  TC_tj = tempcorr(temp.tj, T_ref, pars_T); 
  TC_JX_L = tempcorr(temp.JX_L, T_ref, pars_T);
  TC_N = tempcorr(temp.LN, T_ref, pars_T);
  TC_N1 = tempcorr(temp.LN_1, T_ref, pars_T);
  tTC  = [temp.tL(:,1), tempcorr((temp.tL(:,2)), T_ref, pars_T)]; % vector of TC in time
  tTC_1  = [temp.tL_1(:,1), tempcorr((temp.tL_1(:,2)), T_ref, pars_T)]; % vector of TC in time
  tTC_2  = [temp.tL_2(:,1), tempcorr((temp.tL_2(:,2)), T_ref, pars_T)]; % vector of TC in time

% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = p_Am * U_E0;               % J, initial energy content
  Lw_0 = (E_0 * w_E/ mu_E/ d_E)^(1/3)/ del_Y; % cm, egg diameter

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  Lw_h = aUL(end,3)/ del_M; % cm, physical length at hatch
  aT_h = aUL(end,1)/ TC_ab; % d, age at hatch
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth

  % metam
  [t_jj, t_pj, t_bj, l_jj, l_pj, l_bj, l_ij, rho_jj, rho_Bj, infoj] = get_tj(pars_tj, f_j);

  tT_j = (t_jj - t_bj)/ k_M/ TC_tj;  % d, time since birth at metam
  L_jj = L_m * l_jj;                 % cm, structural length at metam
  Lw_j = L_jj/ del_M;                % cm, total length at metam at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
   
  % Reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);  % #/d, max reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % ingestion rate
  L = length.JX_L * del_M;
  s_M = l_j/ l_b;                   % -, acceleration factor
  JX_L = TC_JX_L * f * p_Am * s_M * L^2 * w_X/ mu_X/ d_X/ kap_X; % g/d, feeding rate
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.L0 = Lw_0;
  prdData.Lh = Lw_h;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.JX_L = JX_L;
  
% univariate data
  
  % time-length 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  L_b = L_m * l_b;  L_j = L_m * l_j; 
  LE_0 = [L_b; E_m * L_b^3]; 
  [t LE] = ode45(@dget_LE, [0;tL(:,1)], LE_0, [], L_b, p_Am, kap, v, p_M, E_G, f_tL, tTC, L_j, kap_G);
  ELw = LE(:,1)/del_M; ELw(1) = [];
  
  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f_tL * w); % g, wet weight

  % time-length1 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL_1);
  L_b = L_m * l_b;  L_j = L_m * l_j; 
  [c, ia, ic] = unique(tL_1(:,1));
  LE_0 = [L_b; E_m * L_b^3]; 
  [t LE] = ode45(@dget_LE, c, LE_0, [], L_b, p_Am, kap, v, p_M, E_G, f_tL_1, tTC_1, L_j, kap_G);
  ELw_1 = LE(ic,1)/del_M;

  % time-length2 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL_2);
  L_b = L_m * l_b;  L_j = L_m * l_j; 
  LE_0 = [L_b; E_m * L_b^3]; 
  [t LE] = ode45(@dget_LE, [0;tL_2(:,1)], LE_0, [], L_b, p_Am, kap, v, p_M, E_G, f_tL_2, tTC_2, L_j, kap_G);
  ELw_2 = LE(:,1)/del_M; ELw_2(1) = [];

  % total length - fecundity 
  LN_j = (LN(:,1) * del_M);
  ELN = TC_N * 365 * reprod_rate_j(LN_j, f, pars_R);           % #, fecundity

   % total length - fecundity 
  LN_j1 = (LN_1(:,1) * del_M);
  ELN_1 = TC_N1 * 365 * reprod_rate_j(LN_j1, f_N, pars_R);     % #, fecundity

  % total weight - fecundity 
  LN_j2 = (WN(:,1)/(1 + f * w)).^(1/3);
  EWN = TC_N1 * 365 * reprod_rate_j(LN_j2, f_N, pars_R);       % #, fecundity

  Ej_O = j_O*tempcorr(C2K(TjO(:,1)), 290, [T_A, T_H, T_AH]); % metabolic scope

  %% pack to output
  prdData.tL = ELw;
  prdData.tL_1 = ELw_1;
  prdData.tL_2 = ELw_2;
  prdData.LW = EWw;
  prdData.LN = ELN;
  prdData.LN_1 = ELN_1;
  prdData.WN = EWN;
  prdData.TjO = Ej_O;
end

function dLE = dget_LE(t, LE, Lb, p_Am, kap, v, p_M, E_G, f, TC, Lj, kap_G)
  % t: scalar with time since birth
  % LE: 2-vector with (L, E) of juvenile and adult
  % dLE: 2-vector with (dL/dt, dE/dt)
  
  % unpack
  L = LE(1);     % cm, structural length
  E = LE(2);     % J, reserve E
    
  sM = min(L,Lj)/Lb;
  v = v * sM;         % cm/d, conductance
  p_Am = p_Am *sM;    % J/d.cm^2, {p_Am}, spec assimilation flux

  tTC = spline1(t, TC);

  pT_M = p_M * tTC; vT = v * tTC; pT_Am = p_Am * tTC; 

  L2  = L * L; L3 = L2 * L; L4 = L3 * L;
  if  kap * E * vT >= pT_M * L^4 % section 4.1.5 comments to Kooy2010
    r   = (E * vT/ L4 - pT_M/ kap)/ (E/ L3 + E_G/ kap); % d^-1, specific growth rate  
  else 
    r   = (E * vT/ L4 - pT_M/ kap)/ (E/ L3 +kap_G*E_G/ kap);
  end
  
  pC = E * (vT/ L - r);
  pA = pT_Am * f * L2; % J/d, assimilation rate at time t

  % generate derivatives
  dE     = pA - pC;
  dL     = L * r/ 3;
  
  dLE = [dL; dE]; % pack output 

end



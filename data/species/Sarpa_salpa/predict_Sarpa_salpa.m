function [prdData, info] = predict_Sarpa_salpa(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  pars_T = [T_A, T_H, T_AH];
  TC = tempcorr(temp.am, T_ref, pars_T);
  TC_aj = tempcorr(temp.aj, T_ref, pars_T);
  tTC  = [temp.tL(:,1), tempcorr((temp.tL(:,2)), T_ref, pars_T)]; % vector of TC in time
  tTC_juv  = [temp.tL_juv(:,1), tempcorr((temp.tL_juv(:,2)), T_ref, pars_T)]; % vector of TC in time
  tTC_fm  = [temp.tL_fm(:,1), tempcorr((temp.tL_fm(:,2)), T_ref, pars_T)]; % vector of TC in time

% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  
  % metam
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  aT_j = t_j/k_M/ TC_aj;            % d, age  at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/del_M;                 % cm, total length at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(length.Ri*del_M, f, pars_R);        % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.aj = aT_j;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
% uni-variate data
  
  % time-length 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);
  L_b = L_m * l_b; L_j = L_m * l_j;
  LE_0 = [L_b; E_m * L_b^3]; 
  [t LE] = ode45(@dget_LE, [0;t0], LE_0, [], L_b, p_Am, kap, v, p_M, E_G, f_tL, tTC, L_j, kap_G);
  L_t0 = LE(end,1); E_t0 = LE(end,2);
  [c, ia, ic] = unique(tL(:,1));
  LE_0 = [L_t0; E_t0]; 
  [t LE] = ode45(@dget_LE, [t0;c+t0], LE_0, [], L_b, p_Am, kap, v, p_M, E_G, f_tL, tTC, L_j, kap_G);
  LE(1,:) = []; ELw = LE(ic,1)/del_M; 

   % time-length as young
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL_juv);
  L_b = L_m * l_b; L_j = L_m * l_j; 
  [c, ia, ic] = unique(tL_juv(:,1));
  LE_0 = [L_b; E_m * L_b^3]; 
  [t LE] = ode45(@dget_LE, [0;c], LE_0, [], L_b, p_Am, kap, v, p_M, E_G, f_tL_juv, tTC_juv,L_j, kap_G);
  LE(1,:) = []; ELw_juv = LE(ic,1)/del_M; 

  % time - length (females)
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL_fm);
  L_b = L_m * l_b; L_j = L_m * l_j;
  [c, ia, ic] = unique(tL_fm(:,1));
  LE_0 = [L_b; E_m * L_b^3]; 
  [t LE] = ode45(@dget_LE, [0;c], LE_0, [], L_b, p_Am, kap, v, p_M, E_G, f_tL_fm, tTC_fm, L_j, kap_G);
  LE(1,:) = []; ELw_fm = LE(ic,1)/del_M; 
  
  % length-weight
  ELW  = (LW(:,1) * del_M).^3 * (1 + f_tL_fm * w); % wet weight without reproduction buffer

  % temp metabolic scope
  EjT_O = j_O*tempcorr(C2K(TjO(:,1)), T_ref, [T_A, T_H, T_AH]);

  % pack to output
  prdData.tL_fm = ELw_fm;
  prdData.tL = ELw;
  prdData.tL_juv = ELw_juv;
  prdData.LW = ELW;
  prdData.TjO = EjT_O;
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
  p_Am = p_Am *sM;

  if length(TC)>1
      tTC = spline1(t, TC);
  else
      tTC = TC;
  end
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




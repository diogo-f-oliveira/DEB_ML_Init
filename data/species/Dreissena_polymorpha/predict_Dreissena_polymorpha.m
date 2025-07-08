function [prdData, info] = predict_Dreissena_polymorpha(par, data, auxData)
    
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
          
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_XF = tempcorr(temp.XF1992, T_ref, T_A);
  TC_LdL = tempcorr(temp.LdL, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % g, wet weight at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % reproduction
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R); % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
    
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
 
  
  % uni-variate data
  
  % time - length post metam
  [t EL] = ode45(@get_EL, tL(:,1), [E_m*L_j^3 L_j], [], T_ref, T_A, v, g, E_m, L_m * l_i);
  ELw = EL(:,2)/ del_M; % cm, shell length
  % time - weight post metam
  [t EL] = ode45(@get_EL, tWd(:,1), [E_m*L_j^3 L_j], [], T_ref, T_A, v, g, E_m, L_m * l_i);
  EWd = EL(:,2).^3 .* (d_V + EL(:,1) * w_E/ mu_E) * 1000; % mg, dry weight
  
  % length - change in length post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_LdL);
  rT_B = TC_LdL * rho_B * k_M; Lw_i = L_m * l_i/ del_M;
  EdLw = rT_B * (Lw_i - LdL(:,1));

  % food concentration - filtering rate
  K = K * w_X * 1000; % half saturation coefficient conversion from Mol to mg/L
  % 1992
  L = length.XF1992 * del_M; % cm, structural length
  Wd = L^3 * (1 + 0.7 * ome) * d_V; % g, dry weight at f = 0.7 (taken as typical)
  EF_1992 =  TC_XF * F_m * L^2 ./ (1 + XF1992(:,1)/ K)/ 24/ Wd; % ml/mg AFDW/h, specific filetering rate
  % 1993
  L = length.XF1993 * del_M; % cm, structural length
  Wd = L^3 * (1 + 0.7 * ome) * d_V; % g, dry weight at f = 0.7 (taken as typical)
  EF_1993 =  TC_XF * F_m * L^2 ./ (1 + XF1993(:,1)/ K)/ 24/ Wd; % ml/mg AFDW/h, specific filetering rate

  % pack to output
  prdData.tL = ELw;
  prdData.tWd = EWd;
  prdData.LdL = EdLw;
  prdData.XF1992 = EF_1992;
  prdData.XF1993 = EF_1993;
end

function dEL = get_EL(t, EL, T_ref, T_A, v, g, E_m, L_m)
  E = EL(1); L = EL(2); % J, cm, reserve, struc length
  L3 = L^3; e = E/ L3/ E_m; % -, scaled reserve density e=[E]/[E_m]
  
  TC = tempcorr(C2K(18 + 10*cos(2*pi*(t+0)/ 365)), T_ref, T_A);
  f = (0.8 + 0.2*cos(2*pi*(t+120)/365)).^2;
  
  de = TC * (f - e) * v/ L; % 1/d, change in e
  r = TC * v * (e/ L - 1/ L_m)/ (e + g);
  dL = max(0,L * r/ 3); % cm/d, change in L
  dE = de * L3 * E_m + E * r; % J/d, chain rule
  
  dEL = [dE; dL]; % catenate to output
end
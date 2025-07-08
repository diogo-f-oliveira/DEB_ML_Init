function [prdData, info] = predict_Physa_fontinalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  pars_T = T_A; % temp parameters
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC    = tempcorr(temp.ab, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = t_0 + tau_b/ k_M/ TC_ab;   % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * (1 + f * w) * d_V; % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length post metam
  [t, eL] = ode45(@get_eL, tL(:,1), [1; L_j], [], L_i, s_M * v, g, T_ref, pars_T);
  ELw = eL(:,2)/ del_M;                               % cm, shell length
  
  % length - fecundity
  EN = TC * 365 * reprod_rate_j(LN(:,1) * del_M, f, pars_R)/ 5; % #, eggs per capsule, assuming 5 capsules per individual

  % pack to output
  prdData.tL = ELw;
  prdData.LN = EN;
end

function deL = get_eL(t, eL, L_i, v, g, T_ref, pars_T)
  e = eL(1); L = eL(2);
  TC = tempcorr(C2K(10+8*sin(2*pi*(t+20)/365)), T_ref, pars_T);
  f = 1;
  de = (f - e) * TC * v/ L;
  r = TC * v * (e/ L - 1/ L_i)/ (e + g);
  dL = L * r/3;
  deL = [de; dL];
end
  
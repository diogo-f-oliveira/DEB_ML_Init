function [prdData, info] = predict_Faustina_faustina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Lw_b = L_b/ del_M;                % cm, shell height at birth
  aT_b = t_0 + tau_b/ kT_M;               % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, shell height at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length
  Wd_i = L_i^3 * (1 + f * ome)* d_V; % g, ultimate dry weight 
  Lw_i = L_i/ del_M;                % cm, ultimate shell height
  
  % reproduction
  pars_R = [kap; kap_R; g; TC * k_J; TC * k_M; L_T; TC * v; U_Hb/ TC;U_Hj;  U_Hp/ TC]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, reproduction rate
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span
  aT_m = t_m/ kT_M;                  % d, mean life span
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  % time-length, post metam
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  r_B = rho_B * k_M; L_j = l_j * L_m; L_i = l_i * L_m;
  [t, L] = ode45(@get_L, tL(:,1), L_j, [], L_i, r_B, T_A, T_ref); % cm, expected length at time
  ELw = L/ del_M;               % cm, shell breath

  % pack to output
  prdData.tL = ELw;
end

function dL = get_L(t, L, L_i, r_B, T_A, T_ref) 
  TC = tempcorr(C2K(5 + 18 * cos(2*pi*(t-80)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
function [prdData, info] = predict_Theodoxus_fluviatilis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  aT_b = t_0 + tau_b/ k_M/ TC_ab;   % d, time since birth at metam
  L_b = L_m * l_b;                  % cm, structural length at metam at f
  Lw_b = L_b/ del_M;                % cm, shell height at metam
    
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, shell height at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
      
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
    
  % length-weight
  EWd = (LWd(:,1) * del_M).^3 * (1 + f_tL * w) * d_V;


  % time-length post metam
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  L_j = l_j * L_m; L_i = l_i * L_m; r_B = rho_B * k_M;
  [t, L] = ode45(@get_L, tL(:,1), L_j, [], L_i, r_B, T_ref, T_A);
  ELw = L/ del_M;
  
  % pack to output
  prdData.tL = ELw;
  prdData.LWd = EWd;
  
end

function dL = get_L(t, L, L_i, r_B, T_ref, T_A)
  TC = tempcorr(C2K(10 + 10*cos(2*pi*(t-250)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end

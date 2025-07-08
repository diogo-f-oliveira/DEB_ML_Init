function [prdData, info] = predict_Austrolebias_viarius(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
    
  % compute temperature correction factors
  TC_25 = tempcorr(temp.tL_25, T_ref, T_A); kT_M = TC_25 * k_M; 
  TC_15 = tempcorr(temp.tL_15, T_ref, T_A); 
  tTC = temp.tL_fld; tTC(:,2) = tempcorr(C2K(tTC(:,2)), T_ref, T_A); 
    
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g,  wet weight at birth
    
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  NT_i = TC_25 * cum_reprod_j(200, f, pars_R);  % #, total # of eggs

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_25;               % d, mean life span at T

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  
  % univariate data

  % time-length post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_25);
  kT_M = TC_25 * k_M; rT_B = rho_B * kT_M; Lw_i = L_m * l_i/ del_M;
  ELw_25 = Lw_i - (Lw_i - Lw_0) * exp( - rT_B * tL_25(:,1)); 
  % 
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tj, f_15);
  kT_M = TC_15 * k_M; rT_B = rho_B * kT_M; Lw_i = L_m * l_im/ del_M;
  ELw_15 = Lw_i - (Lw_i - Lw_0) * exp( - rT_B * tL_15(:,1));
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_fld);
  r_B = rho_B * k_M; Lw_i = L_m * l_i/ del_M;  
  [t, ELw_fld] = ode45(@get_dL, tL_fld(:,1), Lw_0fld, [], tTC, r_B, Lw_i);

  % pack to output
  prdData.tL_25 = ELw_25;
  prdData.tL_15 = ELw_15;
  prdData.tL_fld = ELw_fld;
end

function dL = get_dL(t, L, tTC, r_B, L_i)
  dL = spline1(t, tTC) * r_B * (L_i - L);
end
  
function [prdData, info] = predict_Melarhaphe_neritoides(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                 % cm, struct length at birth
  Ww_b = L_b^3 * (1 + f * ome);    % g, wet weight at birth
    
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, shell height at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * (1 + f * ome) * d_V; % g, ultimate dry weight
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
      

  % pack to output
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdi = Wd_i;
  
  % uni-variate data
    
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN = TC * 365 * reprod_rate_j(LN(:,1) * del_M, f, pars_R); % #/d, ultimate reproduction rate at T

  % time-length post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  r_B = rho_B * k_M; L_i = l_i * L_m; 
  [t, L] = ode45(@get_L, tL(:,1), L_j, [], r_B, L_i, T_ref, T_A);
  ELw = L/ del_M; % cm, shell height at time
  
  % pack to output
  prdData.tL = ELw;
  prdData.LN = EN;
  
end

function dL = get_L(t, L, r_B, L_i, T_ref, T_A) 
  TC = tempcorr(C2K(13+8*sin(2*pi*(t-150)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
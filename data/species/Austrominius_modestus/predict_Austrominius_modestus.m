function [prdData, info] = predict_Austrominius_modestus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_12 = tempcorr(temp.tW12, T_ref, T_A);
  TC_18 = tempcorr(temp.tW18, T_ref, T_A);
  TC_24 = tempcorr(temp.tW24, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth

  % metam
  L_j = l_j * L_m;                  % cm, structural length as settlement
  Wd_j = L_j^3 * d_V * (1 + f * w); % g, dry weigth at settlement
  E_j = L_j^3 * (mu_V * M_V + f * E_m); % J, energy content at settlement
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at settlement

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  w_M = (L_p - L_j)./(L_i - L_j);   % -, weight coefficient for shape
  Lw_p = L_p/ ((1 - w_M)* del_Mj + w_M * del_M); % cm, basal diameter at puberty at f
  tT_p = (t_p - t_j)/ k_M/ TC;      % d, time since at pubertysettlement

  % ultimate
  Lw_i = L_i/ del_M;                % cm, ultimate basal diameter at f
  Ww_i = (1.35 * del_M)^3 * (1 + f * w); % g, ultimate wet weight 
  Wd_i = Ww_i * d_V;                % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_18 * reprod_rate_j(1.35 * del_M, f, pars_R);         % #/d, reproduction rate at 1.35 cm basal diameter  T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_18;               % d, mean life span at T
  
  % pack to output
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdj = Wd_j;
  prdData.Wdi = Wd_i;
  prdData.Wwi = Ww_i;
  prdData.Ej = E_j;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length post metam, varying temp
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  r_B = rho_B * k_M; L_j = l_j * L_m; L_i = l_i * L_m;      
  [t, L] = ode45(@Bert, [0; tL(:,1)], L_j, [], temp.tL, T_ref, T_A, r_B, L_i); % cm, struc length
  L(1) = []; w_M = (L - L_j) ./ (L_i - L_j);
  ELw = L./ ((1 - w_M) * del_Mj + w_M * del_M); % cm, basal diameter
  
  % time-weight/energy/resp pre metam (all have the same times per temp)
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];     % compose pars
  p_ref = p_Am * L_m^2;                                             % J/d, max assimilation power at max size
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  rT_j = rho_j * k_M; L_b = l_b * L_m; L_i = l_i * L_m; 
  % 12 C
  L = L_b * exp(tW12(:,1) * TC_12 * rT_j/ 3);
  EWd_12 = L.^3 * d_V * (1 + f_tL * w) * 1e6;                       % mug
  EE_12 = L.^3 * (M_V * mu_V + f_tL * E_m) * 1e3;                   % mJ
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);   % J/d, powers
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';              % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O12 = - J_M(3, :)' * TC_12 * 32e9/ 24;                        % ng O2/h, O2 consumption 
  % 18 C
  L = L_b * exp(tW18(:,1) * TC_18 * rT_j/ 3);
  EWd_18 = L.^3 * d_V * (1 + f_tL * w) * 1e6;                       % mug
  EE_18 = L.^3 * (M_V * mu_V + f_tL * E_m) * 1e3;                   % mJ
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);   % J/d, powers
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';              % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O18 = - J_M(3, :)' * TC_18 * 32e9/ 24;                        % ng O2/h, O2 consumption 
  % 24 C
  L = L_b * exp(tW24(:,1) * TC_24 * rT_j/ 3);
  EWd_24 = L.^3 * d_V * (1 + f_tL * w) * 1e6;                       % mug
  EE_24 = L.^3 * (M_V * mu_V + f_tL * E_m) * 1e3;                   % mJ
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);   % J/d, powers
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';              % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O24 = - J_M(3, :)' * TC_24 * 32e9/ 24;                        % ng O2/h, O2 consumption 

  % pack to output
  prdData.tL = ELw;
  prdData.tW12 = EWd_12;
  prdData.tW18 = EWd_18;
  prdData.tW24 = EWd_24;
  prdData.tE12 = EE_12;
  prdData.tE18 = EE_18;
  prdData.tE24 = EE_24;
  prdData.tJO12 = EJT_O12;
  prdData.tJO18 = EJT_O18;
  prdData.tJO24 = EJT_O24;

end

function dL = Bert(t, L, tT, T_ref, pars_T, r_B, L_i)
  TC = tempcorr(C2K(spline1(t, tT)), T_ref, pars_T); % -, temp correction factor
  dL = TC * r_B * (L_i - L); % cm/d, growth rate
end

function [prdData, info] = predict_Mimachlamys_asperrima(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_LL135 = tempcorr(temp.LL135, T_ref, T_A);
  TC_LL79 = tempcorr(temp.LL79, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate flesh wet weight
 
  % reproduction
  % max gonado-somatic index of fully grown individual 
  %   that spawns once per year see (4.89) of DEB3
  GSI = 365 * TC * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_J * U_Hp/ L_m^2/ s_M^2); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.GSI = GSI;

  % uni-variate data
  
  % length - length post metam 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_LL135);
  rT_B = rho_B * k_M * TC_LL135; Lw_i = l_i * L_m/ del_M;
  ELw_135 = Lw_i - (Lw_i - LL135(:,1)) * exp(-rT_B * 135); 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_LL79);
  rT_B = rho_B * k_M * TC_LL79; Lw_i = l_i * L_m/ del_M;
  ELw_79 = Lw_i - (Lw_i - LL79(:,1)) * exp(-rT_B * 79); 
  
  % length - weight
  EWw = (LWw(:,1) * del_M).^3 * (1 + f * ome); % g, tissue wet weight
 
  % pack to output
  prdData.LL135= ELw_135;
  prdData.LL79= ELw_79;
  prdData.LWw= EWw;

end

function [prdData, info] = predict_Valvata_cristata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  a_b = tau_b/ k_M;                 % d, age at birth at T_ref
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
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight
  
  % reproduction
  pars_R = [kap; kap_R; g; TC * k_J; TC * k_M; L_T; v; U_Hb/ TC; U_Hj/ TC; U_Hp/ TC]; % compose parameter vector
  NT_i = cum_reprod_j(377, f, pars_R);                 % #, cumulated reprod output

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
      
  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  
  % uni-variate data
    
  % time-length post metam
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  L_j = l_j * L_m; L_i = l_i * L_m; rT_B = rho_B * kT_M;
  ELw = (L_i - (L_i - L_j) * exp(- rT_B * tL(:,1)))/ del_M;

  % temperature - age at birth
  Eab = a_b ./ tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  
  % pack to output
  prdData.tL = ELw;
  prdData.Tab = Eab;
  
end


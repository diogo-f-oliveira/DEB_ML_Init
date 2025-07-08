function [prdData, info] = predict_Nematoflustra_flagellata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  E_Hp = E_Hj + 1e-6; %J, overwrite of maturity at puberty !!
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % end acceleration
  L_j = L_m * l_j;                  % cm, struc length at end accel
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Wd_i = L_i^3*(1+f*ome)*d_V;       % g, ultimate dry weight
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Wdi = Wd_i;
  
  % uni-variate data
  
  % weight-weight
  rT_j = kT_M * rho_j; rT_B = kT_M * rho_B;
  L_0 = (WdWd(:,1)/(1+f*ome)).^(1/3);
  L_bj = L_0 * exp(365 * rT_j/ 3); L_bj = L_bj - L_0; % cm, structural length increment after 1 yr
  L_ji = L_i - (L_i - L_0) * exp( - rT_B * 365); L_ji = L_ji - L_0; % cm, structural length increment after 1 yr
  EWd = ([L_bj(L_0 <= L_j);L_bj(L_0 > L_j)]).^3 * (1 + f * ome); % g, weight increase after 1 yr
  
  % pack to output
  prdData.WdWd = EWd;
  
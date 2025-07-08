function [prdData, info] = predict_Hyperia_galba(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_05 = tempcorr(temp.tL05, T_ref, T_A);
  TC_10 = tempcorr(temp.tL10, T_ref, T_A);
  TC_15 = tempcorr(temp.tL15, T_ref, T_A);
  TC_20 = tempcorr(temp.tL20, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  a_b = t_b/ k_M;                   % d, age at birth at f and T
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  s_M = l_j/ l_b;                   % acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  
  % length at 9 months
  rT_B = TC * k_M/ 3/ (1 + f/ g);   % 1/d, von Bert growth rate
  Lw_9 = (L_i - (L_i - L_j) * exp(-rT_B * (9 * 30.5 - tT_j)))/ del_M; % cm, total length at 9 month 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.L9 = Lw_9;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  % uni-variate data
  % temp- age at birth
  Eab = a_b ./ TC_ab; % d, age at birth
  
  % time-length
  kT_M = k_M * TC_05; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(tL05(tL05(:,1) < tT_j,1) * rT_j/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL05(tL05(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  L = [L_bj; L_ji]; w_M = 1 - min(1, (L - L_b)/(L_j - L_b));
  ELw_05 = L./ (w_M * del_Mb + (1 - w_M) * del_M);
  %
  kT_M = k_M * TC_10; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(tL10(tL10(:,1) < tT_j,1) * rT_j/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL10(tL10(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  L = [L_bj; L_ji]; w_M = 1 - min(1, (L - L_b)/(L_j - L_b));
  ELw_10 = L./ (w_M * del_Mb + (1 - w_M) * del_M);
  %
  kT_M = k_M * TC_15; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(tL15(tL15(:,1) < tT_j,1) * rT_j/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL15(tL15(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  L = [L_bj; L_ji]; w_M = 1 - min(1, (L - L_b)/(L_j - L_b));
  ELw_15 = L./ (w_M * del_Mb + (1 - w_M) * del_M);
  %
  kT_M = k_M * TC_20; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(tL20(tL20(:,1) < tT_j,1) * rT_j/ 3); % cm, struc length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL20(tL20(:,1) >= tT_j,1) - tT_j)); % cm, struc length
  L = [L_bj; L_ji]; w_M = 1 - min(1, (L - L_b)/(L_j - L_b));
  ELw_20 = L./ (w_M * del_Mb + (1 - w_M) * del_M);

  % length-weight
  EWd_f = (LW_f(:,1) * del_M).^3 * d_V * (1 + f * w);
  EWd_m = (LW_m(:,1) * del_Mm).^3 * d_V * (1 + f * w);
  
  % pack to output
  prdData.Tab = Eab;
  prdData.tL05 = ELw_05;
  prdData.tL10 = ELw_10;
  prdData.tL15 = ELw_15;
  prdData.tL20 = ELw_20;
  prdData.LW_f = EWd_f;
  prdData.LW_m = EWd_m;
end


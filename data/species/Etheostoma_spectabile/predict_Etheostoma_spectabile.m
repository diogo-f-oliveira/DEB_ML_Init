function [prdData, info] = predict_Etheostoma_spectabile(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if T_H < C2K(20)
    prdData = []; info = 0; return
  end
  
%% compute temperature correction factors
  pars_T = [T_A; T_H; T_AH];
  TC = tempcorr(temp.am, T_ref, T_A); 
  TC_27 = tempcorr(temp.tL_27, T_ref, pars_T); 
  TC_25 = tempcorr(temp.tL_25, T_ref, pars_T); 
  TC_24 = tempcorr(temp.tL_24, T_ref, pars_T); 
  TC_23 = tempcorr(temp.tL_23, T_ref, pars_T); 
  TC_21 = tempcorr(temp.tL_21, T_ref, pars_T); 
  TC_19 = tempcorr(temp.tL_19, T_ref, pars_T); 
  TC_15 = tempcorr(temp.tL_15, T_ref, pars_T); 
  TC_13 = tempcorr(temp.tL_13, T_ref, pars_T); 
  kT_M = k_M * TC; 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Lw_b = L_b/ del_M;                % cm, standard length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % univariate data

  % time-length
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  kT_M = TC_27 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(rT_j * tL_27(tL_27(:,1) < tT_j,1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_27(tL_27(:,1) >= tT_j,1) - tT_j)); % cm, total length
  ELw_27 = [L_bj; L_ji]/ del_M;
  %
  kT_M = TC_25 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(rT_j * tL_27(tL_27(:,1) < tT_j,1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_27(tL_27(:,1) >= tT_j,1) - tT_j)); % cm, total length
  ELw_25 = [L_bj; L_ji]/ del_M;
  %
  kT_M = TC_24 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(rT_j * tL_27(tL_27(:,1) < tT_j,1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_27(tL_27(:,1) >= tT_j,1) - tT_j)); % cm, total length
  ELw_24 = [L_bj; L_ji]/ del_M;
  %
  kT_M = TC_23 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(rT_j * tL_27(tL_27(:,1) < tT_j,1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_27(tL_27(:,1) >= tT_j,1) - tT_j)); % cm, total length
  ELw_23 = [L_bj; L_ji]/ del_M;
  %
  kT_M = TC_21 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(rT_j * tL_27(tL_27(:,1) < tT_j,1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_27(tL_27(:,1) >= tT_j,1) - tT_j)); % cm, total length
  ELw_21 = [L_bj; L_ji]/ del_M;
  %
  kT_M = TC_19 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(rT_j * tL_27(tL_27(:,1) < tT_j,1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_27(tL_27(:,1) >= tT_j,1) - tT_j)); % cm, total length
  ELw_19 = [L_bj; L_ji]/ del_M;
  %
  kT_M = TC_15 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(rT_j * tL_27(tL_27(:,1) < tT_j,1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_27(tL_27(:,1) >= tT_j,1) - tT_j)); % cm, total length
  ELw_15 = [L_bj; L_ji]/ del_M;
  %
  kT_M = TC_13 * k_M; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M; 
  L_bj = L_b * exp(rT_j * tL_27(tL_27(:,1) < tT_j,1)/3);
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_27(tL_27(:,1) >= tT_j,1) - tT_j)); % cm, total length
  ELw_13 = [L_bj; L_ji]/ del_M;
 
  % pack to output
  prdData.tL_27 = ELw_27;
  prdData.tL_25 = ELw_25;
  prdData.tL_24 = ELw_24;
  prdData.tL_23 = ELw_23;
  prdData.tL_21 = ELw_21;
  prdData.tL_19 = ELw_19;
  prdData.tL_15 = ELw_15;
  prdData.tL_13 = ELw_13;

end
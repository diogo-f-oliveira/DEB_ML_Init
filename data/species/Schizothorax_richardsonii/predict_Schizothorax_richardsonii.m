function [prdData, info] = predict_Schizothorax_richardsonii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];   % compose parameter vector
  RT_13 = TC * reprod_rate_j(13.5 * del_M, f, pars_R);            % #/d, rep rate at TL 13.5 cm
  RT_20 = TC * reprod_rate_j(20.5 * del_M, f, pars_R);            % #/d, rep rate at TL 20.5 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.R13 = RT_13;
  prdData.R20 = RT_20;

  % univariate data

  % time-length post metam
  rT_B = TC * rho_B * k_M; tT_j = (t_j - t_b)/ k_M/ TC; L_j = L_m * l_j;
  L = L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j)); % cm, expected length at time
  ELw = L/ del_M;  
  
  % time-weight post metam
  L = L_i - (L_i - L_j) * exp( - rT_B * (tW(:,1) - tT_j)); % cm, structural length
  EWw = L.^3 * (1 + f * w);  

  % pack to output  
  prdData.tW = EWw;
  prdData.tL = ELw;
end
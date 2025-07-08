function [prdData, info] = predict_Spratelloides_delicatulus(par, data, auxData)


  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if f_Nov > 1 || f_Dec > 1 || f_Jan > 1 
    info = 0; prdData = []; return
  end

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC; 

  %% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vecto
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                  % d, mean life span at T
  
  %% pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % time-length data
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_Nov);
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M;    % 1/d, von Bert, exponential growth rate
  L_bj = L_b * exp(tL_Nov(tL_Nov(:,1) < tT_j, 1) * rT_j/3); % exponential growth as V1-morph
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_Nov(tL_Nov(:,1) >= tT_j,1) - tT_j)); % cm, struct length
  ELw_Nov = [L_bj; L_ji]/ del_M; % cm, standard length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_Dec);
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;  tT_j = (t_j - t_b)/ kT_M;
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M;    % 1/d, von Bert, exponential growth rate
  L_bj = L_b * exp(tL_Dec(tL_Dec(:,1) < tT_j, 1) * rT_j/3); % exponential growth as V1-morph
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_Dec(tL_Dec(:,1) >= tT_j,1) - tT_j)); % cm, struct length
  ELw_Dec = [L_bj; L_ji]/ del_M; % cm, standard length
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_Jan);
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;  tT_j = (t_j - t_b)/ kT_M;
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M;    % 1/d, von Bert, exponential growth rate
  L_bj = L_b * exp(tL_Jan(tL_Jan(:,1) < tT_j, 1) * rT_j/3); % exponential growth as V1-morph
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL_Jan(tL_Jan(:,1) >= tT_j,1) - tT_j)); % cm, struct length
  ELw_Jan = [L_bj; L_ji]/ del_M; % cm, standard length
  %
  

  %% pack to output
  prdData.tL_Nov = ELw_Nov;
  prdData.tL_Dec = ELw_Dec;
  prdData.tL_Jan = ELw_Jan;

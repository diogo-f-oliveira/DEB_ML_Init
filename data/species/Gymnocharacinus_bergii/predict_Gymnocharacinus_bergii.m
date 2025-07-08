function [prdData, info] = predict_Gymnocharacinus_bergii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); % all rates/times at same temp
  kT_M = k_M * TC; % 1/d, maintenance rate coefficient

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if ~info
    prdData = []; return
  end

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth 
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam 
  s_M = l_j/l_b;                    % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, total length at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);          % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % time-length 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);
  if ~info
    prdData = []; return
  end
  rT_j = rho_j * kT_M;  rT_B = rho_B * kT_M; tT_j = (t_j - t_b) / kT_M; % d, time since birth at puberty        
  L_b = L_m * l_b;  L_j = L_m * l_j;  L_i = L_m * l_i;
  L_bj = L_b * exp(tL((tL(:, 1) <= tT_j), 1) * rT_j / 3); % cm, struct length
  L_jm = L_i - (L_i - L_j) * exp(-rT_B * (tL((tL(:, 1) > tT_j), 1) - tT_j)); % cm, struct length
  ELw = [L_bj; L_jm]/ del_M;  % cm, std length     
    
  % pack to output
  prdData.tL = ELw;

end

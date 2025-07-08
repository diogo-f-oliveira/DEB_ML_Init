function [prdData, info] = predict_Proteus_anguinus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  %% compute temperature correction factors
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_JO = tempcorr(temp.JO, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tR = [g; k; l_T; v_Hb; v_Hb+1e-3; v_Hp; t_N * k_M * TC];  % compose parameter vector
  [t_R, t_p, t_x, t_b, l_R, l_p, l_x, l_b, info] = get_tR(pars_tR, f); % -, scaled times & lengths at f

  % birth
  L_b = L_m * l_b; Lw_b = L_b/ del_M;  % cm, structural, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f
  a_b = t_b/ k_M;                      % d, age at birth at T_ref

  % puberty/first brood 
  L_R = L_m * l_p;                  % cm, structural length at 1st brood 
  Lw_R = L_R/ del_M;                % cm, total length at 1st brood 
  Ww_R = L_R^3 * (1 + f * w);       % g, wet weight at 1st brood 
  tT_R = (t_R - t_b)/ k_M/ TC;      % d, time since birth at 1st brood

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);               % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % respiration at 7.75 g
  L = (7.75/(1 + f * w))^(1/3);                                     % cm, struc length
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];           % compose pars
  p_ref = p_Am * L_m^2;                                             % J/d, max assimilation power at max size
  pACSJGRD = p_ref * scaled_power(L, f, pars_p, l_b, l_p);          % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                % mol/d: J_C, J_H, J_O, J_N in rows
  % molar volume of gas at 1 bar and 20 C is 24.4 L/mol
  JT_O = - J_M(3, :)' * TC_JO * 24.4e3/ 24;                            % ml O2/h, O2 consumption 

  % pack to output
  prdData.tR = tT_R;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.LR = Lw_R;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.WwR = Ww_R;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.JO = JT_O;

  %% uni-variate data
  
  % temp-ab
  EaT_b = a_b./ TC_ab; 

  % pack to output
  prdData.Tab = EaT_b;


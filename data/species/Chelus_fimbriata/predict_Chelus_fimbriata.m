function [prdData, info] = predict_Chelus_fimbriata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % unitial
  E_0 = p_Am * initial_scaled_reserve(f, [V_Hb, g, k_J, k_M, v]);
  Lw_0 = (E_0 * w_E/ mu_E/ d_E * 6/ pi)^(1/3); % cm, egg diameter
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, plastron length
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC;              % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, plastron length at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate plastron length
  Ww_i = L_i^3 * (1 + f * w);       % g,  ultimate wet weight
    
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % growth
  kT_M = k_M * TC; rT_B = kT_M/ 3/ (1 + f/ g);
  Lw_274 = Lw_i - (Lw_i - 8) * exp( - rT_B * 274); % cm, length at 274 d after Lw = 8 cm
  Ww_61 = (L_i - (L_i - L_b) * exp( - rT_B * 61))^3 * (1 + f * w); % g, wet weight at 61 d after birth
  Ww_122= (L_i - (L_i - L_b) * exp( - rT_B *122))^3 * (1 + f * w); % g, wet weight at 221 d after birth

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.L0 = Lw_0;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.L274 = Lw_274;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ww61 = Ww_61;
  prdData.Ww122 = Ww_122;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  ELw = Lw_i - (Lw_i - Lw_b) * exp(- rT_B * tL(:,1));
  
  % pack to output
  prdData.tL = ELw;

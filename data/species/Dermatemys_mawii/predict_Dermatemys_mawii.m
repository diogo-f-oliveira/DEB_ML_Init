function [prdData, info] = predict_Dermatemys_mawii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % unitial
  E_0 = p_Am * initial_scaled_reserve(f, [V_Hb, g, k_J, k_M, v]);
  Lw_0 = (E_0 * w_E/ mu_E/ d_E * 6/ pi)^(1/3); % cm, egg diameter
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, carapace length
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth
  
  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Ww_i = L_i^3 * (1 + f * w);       % g,  ultimate wet weight
    
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % growth
  rT_B = TC * k_M/ 3/ (1 + f/ g);
  Lw_365 = (L_i - (L_i - L_b) * exp( - rT_B * 365))/ del_M; % cm, carapace length at 365 d since birth
  Lw_1 = (L_i - (L_i - 30*del_M) * exp( - rT_B * 365 * 3))/ del_M; % cm, carapace length at 3 yr since L_0
  Lw_2 = (L_i - (L_i - 34*del_M) * exp( - rT_B * 365 * 3))/ del_M; % cm, carapace length at 3 yr since L_0
  Lw_3 = (L_i - (L_i - 34*del_M) * exp( - rT_B * 365 * 3))/ del_M; % cm, carapace length at 3 yr since L_0
  Ww_365 = (L_i - (L_i - L_b) * exp( - rT_B * 365))^3 * (1 + f * w); % g, at weight at 365 d since birth
  Ww_1 = (L_i - (L_i - (800/(1+f*w))^(1/3)) * exp( - rT_B * 365))^3 * (1 + f * w); % g, at weight at 3 yr since L_0
  Ww_2 = (L_i - (L_i - (3200/(1+f*w))^(1/3)) * exp( - rT_B * 365))^3 * (1 + f * w); % g, at weight at 3 yr since L_0
  Ww_3 = (L_i - (L_i - (5200/(1+f*w))^(1/3)) * exp( - rT_B * 365))^3 * (1 + f * w); % g, at weight at 3 yr since L_0
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % males
  pars_tpm = [g k l_T v_Hb v_Hpm];   % compose par-vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  Lw_pm = l_pm * L_m/ del_M;          % carapace length at puberty
  Ww_pm = (l_pm * L_m)^3 * (1 + f * w);% g, wet weight at puberty
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.L365 = Lw_365;
  prdData.L3_1 = Lw_1;
  prdData.L3_2 = Lw_2;
  prdData.L3_3 = Lw_3;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm; 
  prdData.Wwi = Ww_i;
  prdData.Ww365 = Ww_365;
  prdData.Ww3_1 = Ww_1;
  prdData.Ww3_2 = Ww_2;
  prdData.Ww3_3 = Ww_3;
  prdData.Ri = RT_i;
  

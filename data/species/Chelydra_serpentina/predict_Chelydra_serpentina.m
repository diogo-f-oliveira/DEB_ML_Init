function [prdData, info] = predict_Chelydra_serpentina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_tW = tempcorr(temp.tW, T_ref, T_A);
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  a_b = t_b/ k_M;                   % d, age at birth

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Ww_i = L_i^3 * (1 + f * w);       % g,  ultimate wet weight
  
  % weight at length
  Ww_22 = (22.5 * del_M)^3 * (1 + f * w); % g, wet weight at 22.5 cm carapace length
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  pars_tpm = [g k l_T v_Hb v_Hpm];     % compose par-vector
  [t_p t_b] = get_tp(pars_tpm, f);     % -, scaled length at puberty, birth
  tT_pm = (t_p - t_b)/ k_M/ TC;        % d, timce since birth at puberty

  % pack to output
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ww22 = Ww_22;
  prdData.Ri = RT_i;

  % uni-variate data
  
  % time-weight
  kT_M = k_M * TC_tW; rT_B = kT_M/ 3/ (1 + f/ g); 
  L= L_i - (L_i - L_b) * exp (- rT_B * tW(:,1)); % cm, struct langth
  EWw = L.^3 * (1 + f * w); % g, wet weight

  % temperature-incubation time
  Ea_b = a_b./TC_ab;
  
  % pack to output
  prdData.tW = EWw;
  prdData.Tab = Ea_b;
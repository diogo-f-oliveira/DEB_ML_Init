function [prdData, info] = predict_Cellarinella_watersi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tp, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled structural length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Wd_i = L_i^3*(1+f*ome)*d_V;       % g, ultimate dry weight
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wdi = Wd_i;
  
  % weight-weight
  rT_B = TC * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  L0 = (6e-4/(1+f*ome)).^(1/3); % dry weight of single zooid
  L = L_i - (L_i - L0) * exp( - rT_B * tWd(:,1)); % cm, change in structural length
  EWd = L.^3 * (1 + f * ome); % g, weight increase after 1 yr
  
  % pack to output
  prdData.tWd = EWd;

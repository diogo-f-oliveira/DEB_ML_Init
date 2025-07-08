function [prdData, info] = predict_Osmerus_eperlanus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled length at birth at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3*(1 + f *w);          % g, wet weight at birth
  a_b = t_b/ k_M; aT_b = a_b/ TC_ab;% d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * (f - l_T);            % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  % time-length data
  L_b = L_m * get_lb([g; k; v_Hb], f_tL);  L_i = f_tL * L_m; 
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B; % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)); % cm, expected physical length at time
  ELw = L/ del_M; % cm, total length

  % time-weight data
  L = L_i - (L_i - L_b) * exp( - rT_B * tW(:,1)); % cm, expected physical length at time
  EWw = L.^3*(1+f_tL*w); % g, wet weight

  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;
     
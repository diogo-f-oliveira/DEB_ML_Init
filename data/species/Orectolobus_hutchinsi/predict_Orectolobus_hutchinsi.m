function [prdData, info] = predict_Orectolobus_hutchinsi(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;     % cm, structural length at birth at f
  Lw_b = L_b/ del_M;   % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w); % g, wet weight at birth at f 
  aT_b = t_b/ kT_M;    % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;     % cm, structural length at puberty
  Lw_p = L_p/ del_M;   % cm, total length at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate fork length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R); % ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  pars_tpm = [g; k; l_T; v_Hb; v_Hpm];  % compose parameter vector
  l_pm = get_lp(pars_tpm, f); % -, scaled times & lengths at f
  Lw_pm = L_m * l_pm/ del_M; % cm, total length at puberty

  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data

  % time-length data
  tvel = get_tp(pars_tp, f_tL, [], tL_f(:,1)*kT_M);
  ELw_f = L_m*tvel(:,4)/ del_M; % cm, total langth
  %
  tvel = get_tp(pars_tpm, f_tL, [], tL_m(:,1)*kT_M);
  ELw_m = L_m*tvel(:,4)/ del_M; % cm, total langth
  

  %% pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;


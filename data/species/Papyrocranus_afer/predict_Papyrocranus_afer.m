function [prdData, info] = predict_Papyrocranus_afer(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  vars_pull(par); vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  %% zero-variate data

  % life cycle
  pars_lp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_lp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);      % g,  wet weight at puberty
  aT_p = t_p/ kT_M;                 % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  %RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
%% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;

  % univariate data
  % length-change in length
  Lw_i = L_m * f_tL/ del_M; rT_B = kT_M/ 3/ (1 + g/f_tL);
  EdLw = rT_B * (Lw_i - LdL(:,1)); % cm/d, change in length

  % length-fecundity
  EN = 365 * TC * reprod_rate(LN(:,1)*del_M, f_LN, pars_R); % #, ultimate reproduction rate

%% pack to output
  prdData.LdL = EdLw;
  prdData.LN = EN;



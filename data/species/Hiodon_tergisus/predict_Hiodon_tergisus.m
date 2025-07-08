function [prdData, info] = predict_Hiodon_tergisus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  vars_pull(par); vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_L365 = tempcorr(temp.L365, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_lp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_lp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  %Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  %aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  %L_p = L_m * l_p;                  % cm, structural length at puberty at f
  %Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  %Ww_p = L_p^3 * (1 + f * w);      % g,  wet weight at puberty
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);      % g, ultimate wet weight 

  % length at 1 yr
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  Lw_365 = Lw_i - (Lw_i - Lw_b) * exp( - TC_L365 * r_B * 365); % cm, expected physical length at time

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
    
  %% pack to output
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.L365 = Lw_365;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  

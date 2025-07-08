function [prdData, info] = predict_Phrynosoma_ditmarsi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  if info == 0
    prdData = []; return;
  end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + w * f);       % g, wet weight at birth

  % puberty 
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);               % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  pars_tpm = [g k l_T v_Hb v_Hpm];
  [t_pm, t_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f);
  if info == 0
    prdData = []; return;
  end
  L_pm = L_m * l_pm; Lw_pm = L_pm/ del_M; Ww_pm = L_pm^3 * (1 + f * w);

  % pack to output
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-weight
  rT_B = TC * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW_fm(:,1)); % cm, structural length
  EWw_f = L.^3 * (1 + f * w); % g, wet weight
  %
  L = L_i - (L_i - L_b) * exp( - rT_B * tW_fm(:,1)); % cm, structural length
  EWw_m = L.^3 * (1 + f * w);  % g, wet weight

  % pack to output
  prdData.tW_fm = [EWw_f EWw_m];

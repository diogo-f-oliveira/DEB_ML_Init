function [prdData, info] = predict_Typhlonectes_compressicauda(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if E_Hj < E_Hb || E_Hj > E_Hp
    prdData = []; info = 0; return
  end
  
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj];
  [t_j, t_b, l_j, l_b] = get_tp(pars_tj, f);
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b; Lw_b = L_b/ del_M;  % cm, structural, total length at birth
  
  % metamorphosis
  L_j = l_j * L_m; Lw_j= L_j/ del_M;   % cm, structural, total length at metam
  Ww_j = L_j^3 * (1 + f * w);          % g, wet weight at metam
  aT_j = t_j/ k_M/ TC;                 % age at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_j)/ k_M/ TC;      % d, time since metam at puberty

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % weight-at-length
  Ww_42 = (42 * del_M)^3 * (1 + f * w); % g, weight at 42 cm
  Ww_41 = (41.5 * del_M)^3 * (1 + f * w); % g, weight at 41.5 cm
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                   % d, mean life span at T
  
  % males
  pars_tpm = [g k l_T v_Hb v_Hpm];
  Lw_pm = L_m * get_lp(pars_tpm, f)/ del_M;


  % pack to output
  prdData.aj = aT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ww42 = Ww_42;
  prdData.Wwm41 = Ww_41;
  prdData.Ri = RT_i;
  


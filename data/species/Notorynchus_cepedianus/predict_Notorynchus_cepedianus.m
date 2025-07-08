function [prdData, info] = predict_Notorynchus_cepedianus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hpm < E_Hb
    info = 0; prdData = []; return
  end

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  kT_M = k_M * TC; 

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp_foetus(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = t_b/ kT_M;                 % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
    
  % males
  pars_tpm = [g k l_T v_Hb v_Hpm];
  [t_pm, t_bm, l_pm, l_bm] = get_tp_foetus(pars_tpm, f);
  Lw_pm = L_m * l_pm/ del_M;         % cm, total length at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;

  % uni-variate data
  
  % time-length
  rT_B = kT_M/ 3/ (1 + f_tL/ g); Lw_b = L_m * get_lb_foetus([g k v_Hb])/ del_M; Lw_i = L_m * f_tL/ del_M;
  ELw = Lw_i - (Lw_i - Lw_b) * exp(- rT_B * tL(:,1)); % cm, total length

  % length-weight
  EWw = (LWw(:,1)*del_M).^3*(1 + f_tL * w); % g, wet weight

  % pack to output
  prdData.tL = ELw;
  prdData.LWw = EWw;
  
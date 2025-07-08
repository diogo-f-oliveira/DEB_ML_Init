function [prdData, info] = predict_Neophocaena_phocaenoides(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A);

  % foetal development
  pars_tx = [g; k; l_T; v_Hb; v_Hx; v_Hp];        % compose pars for get_tx
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f); % -, scaled age at puberty

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  tT_g = t_0 + t_b/ k_M/ TC;        % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Lw_x = L_x/ del_M;                % cm, total length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning 
  tT_x = (t_x - t_b)/ k_M/ TC;      % d, time since birth at weaning

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
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
  [t_pm, t_bm, l_pm, l_bm] = get_tp([g k l_T v_Hb v_Hpm], f);
  tT_pm = (t_pm - t_bm)/ k_M/ TC;     % d, time since birth at puberty at f and T

  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lx = Lw_x;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
    
   % uni-variate data
  
  % t-L data
  f = f_tL; L_i = f * L_m; L_b = L_m * get_lb([g; k; v_Hb], f);
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;  % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)); % cm, struct length
  ELw = L/ del_M; % cm, total length 
  % L-W data
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w)/1e3; % kg, weight
     
  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;

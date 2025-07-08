function [prdData, info] = predict_Myzostoma_cirriferum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, body length
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty
  L_p = l_p * L_m;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, body length at puberty 
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate body length at f 
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-length
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;    % d, 1/von Bert growth rate
  ELw = Lw_i - (Lw_i - L_0) * exp( - rT_B * tL(:,1)); % cm, predicted length at time

  if Lw_i < 0.172
    info = 0; prdData = []; return
  end
  
  % length-eggs
  par_R = [kap; kap_R; g; TC * k_J; TC * k_M; L_T; TC * v; U_Hb/ TC; U_Hp/ TC];
  t = - log((Lw_i - LN(:,1))/ (Lw_i - Lw_b))/ rT_B;
  EN = cum_reprod(t, f, par_R, L_b); % #, predicted cum reprod at time
  
  % pack to output
  prdData.tL = ELw;
  prdData.LN = EN;
  
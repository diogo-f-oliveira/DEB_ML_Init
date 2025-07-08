function [prdData, info] = predict_Hyporhamphus_picarti(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL1 = tempcorr(temp.tL1, T_ref, T_A);
  
  % shape coefficients
  del_F = 0.95 * del_M; % fork vs standard length
  
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_F;                % cm, total length at puberty at f

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_F;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate((100/(1 + f * w))^(1/3), f, pars_R); % #/d, max reproduction rate at 100 g

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length for total length
  rT_B = TC_tL * k_M/3/ (1 + f_tL/ g);                    % d, 1/von Bert growth rate
  Lw_i = f_tL * L_m/ del_M;                               % cm, ultimate standard length at f
  Lw_b = get_lb([g; k; v_Hb], f_tL) * L_m/ del_M;         % cm,  length at birth at f
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL(:,1));    % cm, standard length at time
  %
  rT_B = TC_tL1 * k_M/3/ (1 + f_tL/ g);                   % d, 1/von Bert growth rate
  Lw_i = f_tL * L_m/ del_M;                               % cm, ultimate standard length at f
  Lw_b = get_lb([g; k; v_Hb], f_tL) * L_m/ del_M;         % cm,  length at birth at f
  ELw_1 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL1(:,1)); % cm, standard length at time

  % pack to output
  prdData.tL = ELw;
  prdData.tL1 = ELw_1;

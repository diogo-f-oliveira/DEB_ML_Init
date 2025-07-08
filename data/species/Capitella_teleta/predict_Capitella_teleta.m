function [prdData, info] = predict_Capitella_teleta(par, data, auxData)
  
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
  Lw_b = L_b/ del_M;                % cm, volumetric length at birth 

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate volumetric length at f 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  
  % uni-variate data
  
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;   % d, 1/von Bert growth rate
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL(:,1)); % cm, predicted length at time

  par_R = [kap; kap_R; g; TC * k_J; TC * k_M; L_T; TC * v; U_Hb/ TC; U_Hp/ TC];
  EN = cum_reprod(tN(:,1), f, par_R, L_b); % #, predicted cum reprod at time
  
  % pack to output
  prdData.tL = ELw;
  prdData.tN = EN;
  
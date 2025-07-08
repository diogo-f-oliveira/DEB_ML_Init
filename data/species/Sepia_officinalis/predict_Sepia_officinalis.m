function [prdData, info] = predict_Sepia_officinalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_Ni = tempcorr(temp.Ni, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  r_B = rho_B * k_M;  % 1/d, von Bert growth rate
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, mantle length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis
  tj = (t_j - t_b)/ k_M;            % d, time since birth at metamorphosis
  L_j = L_m * l_j;                  % cm, structural length at metamorphosis at f = 1
  Lw_j = L_j/ del_M;                % cm, mantle length at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, mantle length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- TC_Ni * r_B * (aT_m - t_j/ kT_M));  
  Lw_i = L_am/ del_M;              % cm, mantle length at death
  Ww_i = L_am^3 * (1 + f * w);     % g, wet weight at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC_Ni*k_J; TC_Ni*k_M; L_T; TC_Ni*v; U_Hb/TC_Ni; U_Hj/TC_Ni; U_Hp/TC_Ni]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, cum no of eggs at L

  % GSI
  GSI = NT_i * Ww_b/ Ww_i;          % -, gonado somatic index just before egg laying
  
  % males
  Lw_im = Lw_i * z_m/ z; % cm, mantle length for male
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Li_m = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ni = NT_i;
  prdData.GSI = GSI;
    
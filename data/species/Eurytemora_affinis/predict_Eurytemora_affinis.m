function [prdData, info] = predict_Eurytemora_affinis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_Ttj = tempcorr(C2K(Ttj(:,1)), T_ref, T_A);
  TC_Ttp = tempcorr(C2K(Ttp(:,1)), T_ref, T_A);
  TC_Ttm = tempcorr(C2K(Ttm(:,1)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tjj = [g k l_T v_Hb v_Hj v_Hj+1e-8];
  [t_j, ~, t_b, l_j, ~, l_b, l_i, rho_j, ~, info] = get_tj(pars_tjj, f);
  pars_tjp = [g k l_T v_Hb v_Hp v_Hp+1e-8]; 
  [t_p, ~, t_b, l_p] = get_tj(pars_tjp, f); % overwrite t_p, l_p
  
  % initial (used in R_i)
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial reserve

  % birth (start of acceleration)
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Wd_b = 1e6 * L_b^3 * d_V * (1 + f * w); % mug, dry weight at birth
  a_b = t_b/ k_M;                   % d, age at birth 

  % metam (morphological only)
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  Wd_j = 1e6 * L_j^3 * d_V * (1 + f * w); % mug, dry weight at metam
  
  % puberty (end of acceleration and growth and kappa-rule)
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = 1e6 * L_p^3 * d_V * (1 + f * w); % mug, dry weight at puberty 
  s_M = L_p/ L_b;                   % -. acceleration factor

  % ultimate (same as puberty)
  Lw_i = L_p/ del_M;                % cm, ultimate total length at f
  Wd_i = 1e6 * L_p^3 * d_V * (1 + f * w); % mug, ultimate dry weight 
 
  % reproduction (no kappa-rule)
  RT_i = TC_Ri * kap_R * ((1 - kap) * p_Am * s_M * L_p^2  - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T

  % life span
  h3_W = f * h_a * v/ 6/ L_b; % 1/d^3, cubed Weibull ageing rate
  a_m = gamma(4/3)/ h3_W^(1/3); % d, mean life span at T
  aT_m = a_m/ TC_am; t_m = a_m * k_M;
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdj = Wd_j;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
    
  % Ta-data
  Ea_b = (t_0 + a_b) ./ TC_Tab;
  Et_j = (t_j - t_b)/ k_M ./ TC_Ttj;
  Et_p = (t_p - t_j)/ k_M ./ TC_Ttp;
  Et_m = (t_m - t_p)/ k_M ./ TC_Ttm;

  % time-length
  [t_p, ~, t_b, l_p, ~, l_b] = get_tj(pars_tjp, f_tL); % overwrite t_p, l_p
  L_b = L_m * l_b; L_p = L_m * l_p; rT_j = TC_tL * v * (f_tL/ L_b - 1/ L_m)/ (f_tL + g);        
  ELw = min(L_p, L_b * exp(tL(:,1) * rT_j/ 3))/ del_M;% cm, length

  % pack to output
  prdData.tL = ELw;
  prdData.Tab = Ea_b;
  prdData.Ttj = Et_j;
  prdData.Ttp = Et_p;
  prdData.Ttm = Et_m;
  
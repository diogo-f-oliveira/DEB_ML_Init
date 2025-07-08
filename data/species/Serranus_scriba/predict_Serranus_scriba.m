function [prdData, info] = predict_Serranus_scriba(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);
  
  % compute temperature correction factors
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if info ~= 1 % numerical procedure failed
     fprintf('warning: invalid parameter value combination for get_tj \n')
  end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Wd_0 = U_E0* p_Am * w_E/ mu_E; % g, in initial dry weight
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
     
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wd0= Wd_0;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  
  % uni-variate data
  
  % time-length 
  f = f_tL; 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = TC_tL * rho_B * k_M;  % 1/d, von Bert growth rate   
  rT_j = TC_tL * rho_j * k_M;  % 1/d, exponential growth rate
  t_j = (t_j - t_b)/ k_M/ TC_tL; % time since birth at metamorphosis
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; % cm, struc lengths
  L_bj = L_b * exp(tL(tL(:,1) < t_j,1) * rT_j/3); % cm, struct length
  L_ji = L_i - (L_i - L_j) * exp( - rT_B * (tL(tL(:,1) >= t_j,1) - t_j)); % cm, struct length
  ELw = [L_bj; L_ji]/ del_M; % cm, total length
  
  % length-weight
  EWw = (LW_BAH(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

  % length-reprod   
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  EN = TC_LN * 365 * reprod_rate_j(LN(:,1) * del_M, f, pars_R); % #, yearly fecundity
  
  % pack to output
  prdData.tL = ELw;
  prdData.LW_BAH = EWw;
  prdData.LN = EN;
  

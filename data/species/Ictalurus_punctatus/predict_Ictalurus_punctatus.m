function [prdData, info] = predict_Ictalurus_punctatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if T_L > T_ref || T_H < T_ref
      info = 0; prdData = []; return
  end
    
  % compute temperature correction factors
  pars_T = [T_A T_L T_H T_AL T_AH];
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_tp = tempcorr(temp.tp, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  TC_tL = tempcorr(temp.tL, T_ref, pars_T);
  TC_tN = tempcorr(temp.tN, T_ref, pars_T);
  TC_TJO_1 = tempcorr(C2K(TJO_1(:,1)), T_ref, pars_T);
  TC_TJO_0 = tempcorr(C2K(TJO_0(:,1)), T_ref, pars_T);
  TC_WwJO = tempcorr(temp.WwJO_1, T_ref, pars_T);
  TC_TPer_6 = tempcorr(C2K(TPer_6(:,1)), T_ref, pars_T); 
  TC_TPer_4 = tempcorr(C2K(TPer_4(:,1)), T_ref, pars_T);
  TC_TPer_2 = tempcorr(C2K(TPer_2(:,1)), T_ref, pars_T);
    
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  s_M = l_j / l_b;
%   if k * v_Hp >= f6 ^3 * s_M^3  || k * v_Hp >= f4 ^3 * s_M^3  || k * v_Hp >= f2 ^3 * s_M^3 || f4 > 1  || f2 > 1 || f2 >= f4;         % constraint required for reaching puberty with f's
%     info = 0; prdData = []; return;
%   end  
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth at f and T
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
   
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);          % #/d, ultimate reproduction rate at T
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data

  % temp-O2 consumption 1 hour after feeding
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];     % compose pars
  p_ref = p_Am * L_m^2;                                             % J/d, max assimilation power at max size
  %
  L = (Ww_0/ (1 + f * w)) .^ (1/3);                                 % cm, structural length
  pACSJGRD_1 = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M_1 = - (n_M\n_O) * eta_O * pACSJGRD_1(:, [1 7 5])';            % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O_1 = - J_M_1(3,:)' * TC_TJO_1 * 32e3/ 24/ Ww_0;              % mg O2/h.g, spec O2 consumption 
  % temp-O2 consumption 24 hours after feeding
  pACSJGRD_0 = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  pADG_0 = pACSJGRD_0(:, [1 7 5]);                                  % only need these columns
  pADG_0(:, 1) = 0;                                                 % set assim to zero because starving
  J_M_0 = - (n_M\n_O) * eta_O * pADG_0';                            % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O_0 = - J_M_0(3,:)' * TC_TJO_0 * 32e3/ 24/ Ww_0;              % mg O2/h.g, spec O2 consumption 
  %
  % weight-O2 consumption 1 hour after feeding
  L = (WwJO_1(:,1)/ (1 + w * f)).^(1/3);                            % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);   % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';                % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O_1a = - J_M(3, :)' * TC_WwJO * 32e3/ 24 ./ WwJO_1(:,1);      % mg O2/h.g, spec O2 consumption 
  % weight-O2 consumption 24 hour after feeding
  L = (WwJO_0(:,1)/ (1 + w * f)).^(1/3);                            % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);   % J/d, powers
  pADG = pACSJGRD(:, [1 7 5]);                                      % only need these columns
  pADG(:, 1) = 0;                                                   % set assim to zero because starving
  J_M = - (n_M\n_O) * eta_O * pADG';                                % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O_0a = - J_M(3, :)' * TC_WwJO * 32e3/ 24 ./ WwJO_0(:,1);      % mg O2/h.g, spec O2 consumption 
   
  % temperature-fraction weight increase during t_dW for a fish of weight Ww_dW, post metam 
  % (d/dt W)/ W = (d/dt L^3)/ L^3 = (3 d/dt L)/ L, but reserve at start was at f
  L_0 = (Ww_dW / (1 + f * w)).^ (1/3);                              % initial structural length
  % fed 6% of body weight
  rT_B6 = TC_TPer_6 * k_M/ 3/ (1 + f6/ g); L_i6 = s_M * f6 * L_m;  
  EdWw_6 = 3 * t_dW * rT_B6 * (L_i6 - L_0) * (1 + w * f6)/ L_0/ (1 + w * f);  % -, fraction of weight increase 
  % fed 4% of body weight
  rT_B4 = TC_TPer_4 * k_M/ 3/ (1 + f4/ g); L_i4 = s_M * f4 * L_m;  
  EdWw_4 = 3 * t_dW * rT_B4 * (L_i4 - L_0) * (1 + w * f4)/ L_0/ (1 + w * f);  % -, fraction of weight increase 
  % fed 2% of body weight
  rT_B2 = TC_TPer_2 * k_M/ 3/ (1 + f2/ g); L_i2 = s_M * f2 * L_m;  
  EdWw_2 = 3 * t_dW * rT_B2 * (L_i2 - L_0) * (1 + w * f2)/ L_0/ (1 + w * f);   % -, fraction of weight increase 
        
  % length-weight at f
  EWw = (LWw(:,1) * del_M).^3 * (1 + f * w); % g, wet weight    
  
  % time-fecundity at f
  kT_M = k_M * TC_tN; tT_j = (t_j - t_b)/ kT_M; rT_B = rho_B * kT_M;
  L = L_i - (L_i - L_j) * exp( - rT_B * (tN(:,1) - tT_j));    % cm, structural length 
  EN_t = TC_tN * 365 * reprod_rate_j(L, f, pars_R);           % #, number of eggs in 1 yr
 
  % time-length after metam at f_tL
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);
  if info == 0
      prdData = []; return
  end
  kT_M = k_M * TC_tL; rT_B = rho_B * kT_M;  % 1/d, von Bert growth rate   
  Lw_i = l_i * L_m/ del_M; % cm, ultimate total length
  ELw = Lw_i - (Lw_i - Lw_0) * exp( - rT_B * tL(:,1)); % cm, total length 

  %% pack to output
  prdData.tL = ELw;
  prdData.LWw = EWw;
  prdData.tN = EN_t;
  prdData.TJO_0 = EJT_O_0;
  prdData.TJO_1 = EJT_O_1;
  prdData.WwJO_0 = EJT_O_0a;
  prdData.WwJO_1 = EJT_O_1a;
  prdData.TPer_6 = EdWw_6;
  prdData.TPer_4 = EdWw_4;
  prdData.TPer_2 = EdWw_2;
  
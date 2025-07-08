function [prdData, info] = predict_Adamussium_colbecki(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  
  TC_L_GSI_f1 = tempcorr(temp.L_GSI_f1, T_ref, T_A);
  TC_L_GSI_f2 = tempcorr(temp.L_GSI_f2, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL_f0_8 = tempcorr(temp.tL_f0_8, T_ref, T_A);
  TC_WdJO = tempcorr(temp.WdJO, T_ref, T_A);
    

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];               % compose parameter vector for get_tj later 
  
  % initial
   pars_UE0 = [V_Hb; g; k_J ;k_M; v];
   U_E0 = initial_scaled_reserve(f, pars_UE0); %d.cm2, initial scaled reserve. Fraction des réserves restantes at birth
   Ww_0 = U_E0 * p_Am * w_E / mu_E /d_V; % g, initial dry weight
 
  % birth
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M_larvae;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  a_b = t_b/ k_M/ TC_ab;            % d, age at birth at f and T

  % metamorphosis 
  L_j = L_m * l_j; % cm, structural length at metamorphosis 
  Lw_j = L_j / del_M_larvae ; % cm, total length at metam at f 
  tT_j = (t_j - t_b)/k_M /TC_ab ; % d, time since birth at metam
  s_M= l_j/l_b; % - acceleration factor

  % puberty
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w); % g, dry weight at puberty (remove d_V for wet weight)
  a_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  %l_i = f - l_T;   (removed because it is a "get_tp" stuff) % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)
 
  % life span
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  a_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = a_b;
  prdData.tj = tT_j;
  prdData.ap = a_p;
  prdData.am = a_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % GSI - length : max gonad weight and proportion to soma (GSI= gonad weight/ soma weight)
  pars_R = [kap; kap_R; g; TC_L_GSI_f1*k_J; TC_L_GSI_f1*k_M; L_T; TC_L_GSI_f1*v; U_Hb/TC_L_GSI_f1; U_Hj/TC_L_GSI_f1; U_Hp/TC_L_GSI_f1]; % compose parameter vector
  L_GSI_f1 = L_GSI_f1(:,1) .* del_M; %cm, structural length
  Ww_f1 = (L_GSI_f1.^3) .* (1+f1* w); % wet weight in grams
  GWW_f1 = 100 * 365 * TC_L_GSI_f1 * reprod_rate_j(L_GSI_f1, f1, pars_R)* Ww_0 ;
  EGSI_f1 = GWW_f1./Ww_f1; % estimate of the GSI
  
  pars_R = [kap; kap_R; g; TC_L_GSI_f2*k_J; TC_L_GSI_f2*k_M; L_T; TC_L_GSI_f2*v; U_Hb/TC_L_GSI_f2; U_Hj/TC_L_GSI_f2; U_Hp/TC_L_GSI_f2]; % compose parameter vector
  L_GSI_f2 = L_GSI_f2(:,1) .* del_M; %cm, structural length
  Ww_f2 = (L_GSI_f2.^3) .* (1+f2* w); % wet weight in grams
  GWW_f2 = 100 * 365 * TC_L_GSI_f2 * reprod_rate_j(L_GSI_f2, f2, pars_R)* Ww_0 ;
  EGSI_f2 = GWW_f2./Ww_f2; % estimate of the GSI
  
  % time-length
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC_tL; rT_B = rho_B * kT_M; Lw_i = L_m * l_i/ del_M; 
  ELw= Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL(:,1)); % cm, structural length

  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f0_8);
  kT_M_f0_8 = k_M * TC_tL_f0_8; rT_B_f0_8 = rho_B * kT_M_f0_8; Lw_i = L_m * l_i/ del_M; 
  ELw_f0_8 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B_f0_8 * tL_f0_8(:,1)); % cm, structural length


   % Length-AFDW
   L= LWw(:,1) * del_M;  % cm, structural length
   ELAFDW= L.^3 * (1+ f_ec * w) ; % g, wet weight
   
  % weight-respiration
  p_ref = p_Am * L_m^2;               % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  L = (WdJO(:,1)/ (1 + f_resp * w)/ d_V).^(1/3);  % cm, structural length
  pACSJGRD = p_ref .* scaled_power_j(L, f_resp, pars_power, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);      %pADG(:,1)=0; 
  JM = pADG * eta_O' * O2M;         % mineral fluxes
  X_gas    = 1/ 24.4;                                    % mol/L, mol of gas per litre at 20 C and 1 bar
  EWJO = - 1e6 * JM(:,3) * TC_WdJO/ 24/ X_gas ./((1./ WdJO(:,1)).^0.911);  % mul/h/1g of dry weight indi, dioxygen consumption rate at temp T`
  % see relationship in Heil2003 for the conversion

  % pack to output
  prdData.L_GSI_f1 = EGSI_f1;
  prdData.L_GSI_f2 = EGSI_f2;
  prdData.tL = ELw;
  prdData.tL_f0_8 = ELw_f0_8;
  prdData.LWw = ELAFDW;
  prdData.WdJO = EWJO;

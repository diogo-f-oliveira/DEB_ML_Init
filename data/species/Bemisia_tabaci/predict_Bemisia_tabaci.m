function [prdData, info] = predict_Bemisia_tabaci(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if T_L > T_ref || T_H < T_ref 
    info = 0; prdData = []; return
  end

  % compute temperature correction factors
  pars_T = [T_A; T_L; T_H; T_AL; T_AH]; pars_Ts = [T_A; T_L; T_Hs; T_AL; T_AH];
  TC_30   = tempcorr(temp.ab, T_ref, pars_T);
  TC_Tab  = tempcorr(C2K(Tab(:,1)), T_ref, pars_T);
  TC_Tab2 = tempcorr(C2K(Tab2(:,1)), T_ref, pars_T);
  TC_Tab3 = tempcorr(C2K(Tab3(:,1)), T_ref, pars_T); 
  TC_Tab4 = tempcorr(C2K(Tab4(:,1)), T_ref, pars_T);
  TC_Tab5 = tempcorr(C2K(Tab5(:,1)), T_ref, pars_T);
  TC_Tap  = tempcorr(C2K(Tap(:,1)), T_ref, pars_T);
  TC_Tap2 = tempcorr(C2K(Tap2(:,1)), T_ref, pars_T);
  TC_Ttp2 = tempcorr(C2K(Ttp2(:,1)), T_ref, pars_T);
  TC_Ttp3 = tempcorr(C2K(Ttp3(:,1)), T_ref, pars_T);
  TC_Tap3 = tempcorr(C2K(Tap3(:,1)), T_ref, pars_T);
  TC_TRi  = tempcorr(C2K(TRi(:,1)), T_ref, pars_T);
  TC_TRi2 = tempcorr(C2K(TRi2(:,1)), T_ref, pars_T);
  TC_Ts   = tempcorr(C2K(Ts(:,1)), T_ref, pars_Ts);
  TC_Ts2  = tempcorr(C2K(Ts2(:,1)), T_ref, pars_Ts);
  TC_Tse  = tempcorr(C2K(Tse(:,1)), T_ref, pars_Ts);
  TC_Tse2 = tempcorr(C2K(Tse2(:,1)), T_ref, pars_Ts);
  
  % zero-variate data  
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
   
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  
  % initial
  u_E0 = get_ue0([g k v_Hb], f, l_b);   % -, scaled initial reserve
  E_0 = g * E_m * L_m^3 * u_E0;         % J, initial energy content
  Ww_0 = E_0 * w_E/ mu_E/ d_E*1000000;          % mug, initial wet weight  
  Lw_0 = (E_0 * w_E/ mu_E/ d_E)^(1/3)/ del_Y; % cm, egg diameter

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, body length at birth at f
  %Wd_b = L_b^3 * d_V * (1 + f * w); % mg, dry weight at birth
  a_b = t_b/ k_M;                   % d, age at birth at f and T
  aT_b = t_b/ k_M/ TC_30;           % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_I ;               % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, dry weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_30;   % d, time since birth at puberty at f and T
  aT_p = t_p / k_M/ TC_30;          % d, age at puberty at f and T
  s_M = l_p/ l_b;                   % -, acceleration factor 
  
  % reproduction (no kappa-rule)
  R_i = (kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0) * TC_30; % #/d, ultimate reproduction rate at T

  % body length at larval instar
  Lw_2 = Lw_b * s_1^0.5;   % cm, length at start of instar 2   
  Lw_3 = Lw_2 * s_2^0.5;  % cm,  length at start of instar 3
  Lw_4 = Lw_3 * s_3^0.5;  % cm,  length at start of instar 4
    
  % instar durations
  rT_j = TC_30 * v * (f/ L_b - 1/ L_m)/ (f + g);     % 1/d, specific growth rate during accelleration
  tT_1 = log(Lw_2/ Lw_b) * 3/ rT_j;  tT_2 = log(Lw_3/ Lw_2) * 3/ rT_j;
  tT_3 = log(Lw_4/ Lw_3) * 3/ rT_j;  tT_4 = log(Lw_p/ Lw_4) * 3/ rT_j;  
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/TC_30;                % d, mean life span at T  
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Ww0 = Ww_0;
  prdData.L0 = Lw_0;
  prdData.Lb = Lw_b;
  prdData.LN2 = Lw_2;
  prdData.LN3 = Lw_3;
  prdData.LN4 = Lw_4;
  prdData.Lp = Lw_p;
  prdData.Wwp = Ww_p;
  prdData.Ri = R_i;
  prdData.t1 = tT_1;
  prdData.t2 = tT_2;
  prdData.t3 = tT_3;
  prdData.t4 = tT_4;
  
  % uni-variate data
  % temperature-age at birth
  Ea_b = t_b/ k_M ./ TC_Tab;
  Ea_b2 = t_b/ k_M ./ TC_Tab2;
  Ea_b3 = t_b/ k_M ./ TC_Tab3;
  Ea_b4 = t_b/ k_M ./ TC_Tab4;
  Ea_b5 = t_b/ k_M ./ TC_Tab5;
  
   % temperature-time age at puberty / since birth at puberty
  Ea_p = t_p   / k_M ./ TC_Tap;   %age at puberty
  Ea_p2 = t_p   / k_M ./ TC_Tap2; %age at puberty
  Et_p4 = t_p  / k_M ./ TC_Tap3;  %age at puberty
  
  Et_p2 = (t_p - t_b) / k_M ./ TC_Ttp2; %time since birth at puberty
  Et_p3 = (t_p - t_b) / k_M ./ TC_Ttp3; %time since birth at puberty   

  % Temperture - reproduction rate (no kappa-rule)
  ETR_i = (kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0) * TC_TRi ;   % #/d, ultimate reproduction rate at T
  ETR_i2 = (kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0) * TC_TRi2 ; % #/d, ultimate reproduction rate at T
  
  %Larval mortality
  r_j =  v * (f/ L_b - 1/ L_m)/ (f + g);     % 1/d, specific growth rate during accelleration
  t_1 = log(Lw_2/ Lw_b) * 3/ r_j;  t_2 = log(Lw_3/ Lw_2) * 3/ r_j;
  t_3 = log(Lw_4/ Lw_3) * 3/ rT_j;  t_4 = log(Lw_p/ Lw_4) * 3/ r_j; 
  
  ETsL = 100*(1- exp (-h_b  .* (t_1 + t_2 + t_3)./ TC_Ts));
  ETsL2 = 100*(1- exp (-h_b  .* (t_1 + t_2 + t_3)./ TC_Ts2));
  
  %egg mortality
  ETse = 100*(1- exp (-h_b  .* a_b./ TC_Tse));
  ETse2 = 100*(1- exp (-h_b  .* a_b./ TC_Tse2));
  
  % pack to output
  prdData.Tab  = Ea_b;
  prdData.Tab2 = Ea_b2;
  prdData.Tab3 = Ea_b3;
  prdData.Tab4 = Ea_b4;
  prdData.Tab5 = Ea_b5;
  prdData.Tap  = Ea_p;
  prdData.Tap2 = Ea_p2;  
  prdData.Ttp2 = Et_p2;
  prdData.Ttp3 = Et_p3;
  prdData.Tap3 = Et_p4;
  prdData.TRi  = ETR_i;
  prdData.TRi2 = ETR_i2;  
  prdData.Ts   = ETsL;
  prdData.Ts2  = ETsL2;
  prdData.Tse  = ETse;
  prdData.Tse2 = ETse2;
  


function [prdData, info] = predict_Diaphorina_citri(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if T_L > T_ref || T_H < T_ref 
    info = 0; prdData = []; return
  end

  % compute temperature correction factors
  pars_T = [T_A; T_L; T_H; T_AL; T_AH];
  TC_ab   = tempcorr(temp.ab, T_ref, pars_T);
  TC_Tab  = tempcorr(C2K(Tab(:,1)), T_ref, pars_T);  
  TC_Tap  = tempcorr(C2K(Tap(:,1)), T_ref, pars_T);  
  TC_Tab2  = tempcorr(C2K(Tab2(:,1)), T_ref, pars_T);  
  TC_Tap2  = tempcorr(C2K(Tap2(:,1)), T_ref, pars_T);
  TC_Tab3  = tempcorr(C2K(Tab3(:,1)), T_ref, pars_T); 
  TC_Tap3  = tempcorr(C2K(Tap3(:,1)), T_ref, pars_T);
  TC_Tap4  = tempcorr(C2K(Tap4(:,1)), T_ref, pars_T);
  
  %temperature correction factors for ageing, T_A different from above
  pars_T = [T_Aa; T_L; T_H; T_AL; T_AH];
  TC_25a   = tempcorr(temp.ab, T_ref, pars_T);
  TC_15a   = tempcorr(temp.tN15, T_ref, pars_T);
  TC_20a   = tempcorr(temp.tN20, T_ref, pars_T);
  TC_28a   = tempcorr(temp.tN28, T_ref, pars_T);
  TC_30a   = tempcorr(temp.tN30, T_ref, pars_T);  
 
  %T_H for larval survival is assumed to be lower
  pars_T = [T_Aa; T_L; T_Hs; T_AL; T_AH];
  TC_Ts   = tempcorr(C2K(Ts(:,1)), T_ref, pars_T);
  TC_Ts2   = tempcorr(C2K(Ts2(:,1)), T_ref, pars_T);
  
  %temperature correction factors for reproduction, same T_H as for survial 
  pars_T = [T_A; T_L; T_Hs; T_AL; T_AH]; 
  TC_25   = tempcorr(temp.ab, T_ref, pars_T);
  TC_15   = tempcorr(temp.tN15, T_ref, pars_T);
  TC_20   = tempcorr(temp.tN20, T_ref, pars_T);
  TC_28   = tempcorr(temp.tN28, T_ref, pars_T);
  TC_30   = tempcorr(temp.tN30, T_ref, pars_T);
  
  % zero-variate data  
   pars_tj = [g k l_T v_Hb v_Hp v_Hp];
  [t_p, ~, t_b, l_p, ~, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); 
 
  % initial
  u_E0 = get_ue0([g k v_Hb], f, l_b);   % -, scaled initial reserve
  E_0 = g * E_m * L_m^3 * u_E0;         % J, initial energy content  
  Lw_0 = (E_0 * w_E/ mu_E/ d_E)^(1/3)/ del_Y; % cm, egg length
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  aT_p = t_p / k_M/ TC_ab;          % d, age at puberty at f and T
  s_M = l_p/ l_b;                   % -, acceleration factor     

  % body length at larval instar
  L_2 = L_b * s_1^0.5;  % cm, length at start of instar 2  
  L_3 = L_2 * s_2^0.5;  % cm,  length at start of instar 3
  L_4 = L_3 * s_3^0.5;  % cm,  length at start of instar 4
  L_5 = L_4 * s_4^0.5;  % cm,  length at start of instar 5 
  Ww_5 = L_5^3 * (1 + f * w);       % g, dry weight at puberty 
   
  % instar durations
  rT_j = TC_ab * v * (f/ L_b - 1/ L_m)/ (f + g);     % 1/d, specific growth rate during accelleration
  tT_1 = log(L_2/ L_b) * 3/ rT_j;  tT_2 = log(L_3/ L_2) * 3/ rT_j;
  tT_3 = log(L_4/ L_3) * 3/ rT_j;  tT_4 = log(L_5/ L_4) * 3/ rT_j;  
  tT_5 = log(L_p/ L_5) * 3/ rT_j;
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.L0 = Lw_0;

  prdData.Lb = L_b/del_M;
  prdData.LN2 = L_2/del_M;
  prdData.LN3 = L_3/del_M;
  prdData.LN4 = L_4/del_M;
  prdData.LN5 = L_5/del_M;
  prdData.LN52 = L_5/del_M;
  prdData.Ww5 = Ww_5;
  prdData.Lp = L_p/del_Mi;
  prdData.t1 = tT_1;
  prdData.t2 = tT_2;
  prdData.t3 = tT_3;
  prdData.t4 = tT_4;
  prdData.t5 = tT_5;
  
  % uni-variate data
  
  % temperature-age at birth
  Ea_b = t_b/ k_M ./ TC_Tab;
   Ea_b2 = t_b/ k_M ./ TC_Tab2;
    Ea_b3 = t_b/ k_M ./ TC_Tab3;
    
  % temperature-time age at puberty
   Ea_p = t_p   / k_M ./ TC_Tap;   %age at puberty
    Ea_p2 = t_p   / k_M ./ TC_Tap2;   %age at puberty
     Ea_p3 = t_p   / k_M ./ TC_Tap3;   %age at puberty
      Ea_p4 = t_p   / k_M ./ TC_Tap4;   %age at puberty
     
  %Larvalmortality
  r_j =  v * (f/ L_b - 1/ L_m)/ (f + g);     % 1/d, specific growth rate during accelleration
  t_1 = log(L_2/ L_b) * 3/ r_j;  t_2 = log(L_3/ L_2) * 3/ r_j;
  t_3 = log(L_4/ L_3) * 3/ rT_j;  t_4 = log(L_5/ L_4) * 3/ r_j; 
  t_5 = log(L_p/ L_5) * 3/ r_j;   
 
  ETsL = 100*(1- exp (-h_b  .* (t_1 + t_2 + t_3+ t_4 + t_5)./ TC_Ts)); 
   ETsL2 = 100*(1- exp (-h_b  .* (t_1 + t_2 + t_3+ t_4 + t_5)./ TC_Ts2));
  
  % time - cumulative reproduction (no kappa-rule)   
  Ri = (kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0) * TC_25;
   EN25 = kap_R * Ri*  tN25(:,1); 
  
  Ri = (kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0) * TC_15;
     EN15 = kap_R * Ri *  tN15(:,1);
     
  Ri = (kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0) * TC_20;
       EN20 = kap_R * Ri *  tN20(:,1);
        
  Ri = (kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0) * TC_28;
      EN28 = kap_R * Ri *  tN28(:,1);
      
  Ri = (kap_R * (p_Am * s_M * L_p^2 - p_M * L_p^3 - k_J * E_Hp)/ E_0) * TC_30;
       EN30 = kap_R * Ri *  tN30(:,1);
              
  % time - female survival: Eq (6.5) of Kooy2010 for short growth periods, f = 1, L = L_i
  TC=TC_25a; L_i = L_p; hW3 = h_a * f * v/ 6/ L_i; hG = s_G * f * v / L_i; 
   hGt = TC * hG * tS25(:,1);
    ES25 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt.^2/ 2));     
  
  TC=TC_15a;  L_i = L_p; hW3 = h_a * f * v/ 6/ L_i; hG = s_G * f * v / L_i; 
    hGt = TC * hG * tS15(:,1);
     ES15 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt.^2/ 2)); 
  
  TC=TC_20a; L_i = L_p; hW3 = h_a * f * v/ 6/ L_i; hG = s_G * f * v / L_i; 
    hGt = TC * hG * tS20(:,1);
     ES20 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt.^2/ 2));
     
  TC=TC_28a; L_i = L_p; hW3 = h_a * f * v/ 6/ L_i; hG = s_G * f * v / L_i; 
    hGt = TC * hG * tS28(:,1);
     ES28 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt.^2/ 2));   
  
  TC=TC_30a; L_i = L_p; hW3 = h_a * f * v/ 6/ L_i; hG = s_G * f * v / L_i; 
    hGt = TC * hG * tS30(:,1);
     ES30 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt.^2/ 2)); 

 %moults - head capsule width
   L_b = L_m * l_b; L_p = L_m * l_p; rT_j = TC_25 * v * (f/ L_b - 1/ L_m)/ (f + g);        
   ELw = min(L_p, L_b * exp(tL(:,1) * rT_j/ 3))/ del_Mh;% cm, length    
     
     
  % pack to output
  prdData.Tab   = Ea_b;  
  prdData.Tap   = Ea_p;  
  prdData.Tab2  = Ea_b2;  
  prdData.Tap2  = Ea_p2; 
  prdData.Tab3  = Ea_b3;  
  prdData.Tap3  = Ea_p3; 
  prdData.Tap4  = Ea_p4; 
  prdData.Ts    = ETsL;
  prdData.Ts2   = ETsL2;
  prdData.tN15  = EN15;
  prdData.tN20  = EN20;
  prdData.tN25  = EN25;
  prdData.tN28  = EN28;
  prdData.tN30  = EN30;
  prdData.tS15  = ES15;
  prdData.tS20  = ES20;
  prdData.tS25  = ES25;
  prdData.tS28  = ES28;
  prdData.tS30  = ES30;  
  prdData.tL    = ELw;
  
  


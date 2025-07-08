
function [prdData, info] = predict_Ctenophorus_adelaidensis(par, data, auxData)
 
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  filterChecks = k * v_Hp >= f_Lab^3 || ...         % constraint required for reaching puberty with f_tL
                 ~reach_birth(g, k, v_Hb, f_Lab);   % constraint required for reaching birth with f_tL
  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tLW = tempcorr(temp.tL_Gf1h1, T_ref, T_A);
  TC_wild = tempcorr(temp.tL_femrecap, T_ref, T_A);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  
% zero-variate data
  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w); % g, wet weight at birth at f (remove d_V for wet weight)
  a_b = t_b/ k_M; aT_b = a_b/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w); % g, wet weight at puberty (remove d_V for wet weight)
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w); % g, ultimate wet weight (remove d_V for wet weight)
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
   
  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  %Temp / age at birth
  prdData.Tab = a_b ./ TC_Tab; % d, age at birth at f and T
 
  % time-length 
  f = f_Lab; pars_lb = [g; k; v_Hb];                          % compose parameters
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
  Lw_i = (f * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
  Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                    % cm, physical length at birth at f
  
  %Gf1h1 section
  ELw_Gf1h1 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tLW * r_B * tL_Gf1h1(:,1)); % cm, expected physical length at time
  EWw_Gf1h1 = (ELw_Gf1h1 * del_M).^3 * (1 + f * w);                   % g, expected wet weight at time
  EWw2_Gf1h1 = (LW_Gf1h1(:,1) * del_M).^3 * (1 + f * w);
  %Gf2h1 section
  ELw_Gf2h1 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tLW * r_B * tL_Gf2h1(:,1)); % cm, expected physical length at time
  EWw_Gf2h1 = (ELw_Gf2h1 * del_M).^3 * (1 + f * w); 
  EWw2_Gf2h1 = (LW_Gf2h1(:,1) * del_M).^3 * (1 + f * w); 
  %gf5h1 section
  ELw_Gf5h1 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tLW * r_B * tL_Gf5h1(:,1)); % cm, expected physical length at time
  EWw_Gf5h1 = (ELw_Gf5h1 * del_M).^3 * (1 + f * w);
  EWw2_Gf5h1 = (LW_Gf5h1(:,1) * del_M).^3 * (1 + f * w);
 %Gf12h2 section
  ELw_Gf12h2 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tLW * r_B * tL_Gf12h2(:,1)); % cm, expected physical length at time
  EWw_Gf12h2 = (ELw_Gf12h2 * del_M).^3 * (1 + f * w);                   % g, expected wet weight at time
  EWw2_Gf12h2 = (LW_Gf12h2(:,1) * del_M).^3 * (1 + f * w);
  
  % COOL INCUBATION TREATMENT
  %Gf1h2 section
  ELw_Gf1h2 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tLW * r_B * tL_Gf1h2(:,1)); % cm, expected physical length at time
  EWw_Gf1h2 = (ELw_Gf1h2 * del_M).^3 * (1 + f * w); 
  EWw2_Gf1h2 = (LW_Gf1h2(:,1) * del_M).^3 * (1 + f * w); 
  %gf3h2 section
  ELw_Gf3h2 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tLW * r_B * tL_Gf3h2(:,1)); % cm, expected physical length at time
  EWw_Gf3h2 = (ELw_Gf3h2 * del_M).^3 * (1 + f * w);
  EWw2_Gf3h2 = (LW_Gf3h2(:,1) * del_M).^3 * (1 + f * w);
  %Gf2h2 section
  ELw_Gf2h2 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tLW * r_B * tL_Gf2h2(:,1)); % cm, expected physical length at time
  EWw_Gf2h2 = (ELw_Gf2h2 * del_M).^3 * (1 + f * w);                   % g, expected wet weight at time
  EWw2_Gf2h2 = (LW_Gf2h2(:,1) * del_M).^3 * (1 + f * w);
  %Gf6h1 section
  ELw_Gf6h1 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tLW * r_B * tL_Gf6h1(:,1)); % cm, expected physical length at time
  EWw_Gf6h1 = (ELw_Gf6h1 * del_M).^3 * (1 + f * w); 
  EWw2_Gf6h1 = (LW_Gf6h1(:,1) * del_M).^3 * (1 + f * w); 
  %gf8h1 section
  ELw_Gf8h1 = Lw_i - (Lw_i - Lw_b) * exp( - TC_tLW * r_B * tL_Gf8h1(:,1)); % cm, expected physical length at time
  EWw_Gf8h1 = (ELw_Gf8h1 * del_M).^3 * (1 + f * w);
  EWw2_Gf8h1 = (LW_Gf8h1(:,1) * del_M).^3 * (1 + f * w);
  
%Bamford data section
 %Females w/l
  f= f_wild;

 EWw2_B_Cool_F = (LW_B_Cool_F(:,1) * del_M).^3 * (1 + f * w); 
 %Recap 1992 data
 Lw_i = f * L_m/ del_M;  % ultimate length at f
 Lw_0 = L0Lt_B_Recap(:,1); % cm,L at first capture 

 ir_B = 3/ k_M + 3 * f * L_i/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
 rT_B = r_B * TC_wild; 

 ELt_B_Recap = Lw_i - (Lw_i - Lw_0) .* exp(- rT_B * time.L0Lt_B_Recap(:,1)); % cm, expected length at time   
 
 %Recap female individual
  ELw_femrecap = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL_femrecap(:,1)); % cm, expected physical length at time

 % pack to output
  prdData.tL_Gf1h1 = ELw_Gf1h1;
  prdData.tW_Gf1h1 = EWw_Gf1h1;
  prdData.LW_Gf1h1 = EWw2_Gf1h1;
  
  prdData.tL_Gf2h1 = ELw_Gf2h1;
  prdData.tW_Gf2h1 = EWw_Gf2h1;
  prdData.LW_Gf2h1 = EWw2_Gf2h1;
  
  prdData.tL_Gf5h1 = ELw_Gf5h1;
  prdData.tW_Gf5h1 = EWw_Gf5h1;
  prdData.LW_Gf5h1 = EWw2_Gf5h1;
  
  prdData.tL_Gf12h2 = ELw_Gf12h2;
  prdData.tW_Gf12h2 = EWw_Gf12h2;
  prdData.LW_Gf12h2 = EWw2_Gf12h2;
  
  prdData.tL_Gf1h2 = ELw_Gf1h2;
  prdData.tW_Gf1h2 = EWw_Gf1h2;
  prdData.LW_Gf1h2 = EWw2_Gf1h2;
  
  prdData.tL_Gf3h2 = ELw_Gf3h2;
  prdData.tW_Gf3h2 = EWw_Gf3h2;
  prdData.LW_Gf3h2 = EWw2_Gf3h2;
  
  prdData.tL_Gf2h2 = ELw_Gf2h2;
  prdData.tW_Gf2h2 = EWw_Gf2h2;
  prdData.LW_Gf2h2 = EWw2_Gf2h2;
  
  prdData.tL_Gf6h1 = ELw_Gf6h1;
  prdData.tW_Gf6h1 = EWw_Gf6h1;
  prdData.LW_Gf6h1 = EWw2_Gf6h1;
  
  prdData.tL_Gf8h1 = ELw_Gf8h1;
  prdData.tW_Gf8h1 = EWw_Gf8h1;
  prdData.LW_Gf8h1 = EWw2_Gf8h1;
  
  prdData.LW_B_Cool_F = EWw2_B_Cool_F;
  prdData.L0Lt_B_Recap = ELt_B_Recap;
  
  prdData.tL_femrecap = ELw_femrecap;
  
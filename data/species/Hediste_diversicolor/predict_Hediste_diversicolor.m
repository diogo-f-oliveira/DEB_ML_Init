% predict_my_pet
% Obtains predictions, using parameters and data


function [prdData, info] = predict_Hediste_diversicolor(par, data, auxData)
  % created by Starrlight Augustine, Dina Lika, Bas Kooijman, Goncalo Marques and Laure Pecquerie 2015/01/30; 
  % last modified 2015/07/29
  
   
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
      
  % compute temperature correction factors
  TC_ab_18 = tempcorr(temp.ab_18, T_ref, T_A);
  TC_aj_8  = tempcorr(temp.aj_8, T_ref, T_A);
  TC_aj_18 = tempcorr(temp.aj_18, T_ref, T_A);
  TC_ap_16 = tempcorr(temp.ap_16, T_ref, T_A);
  TC_am    = tempcorr(temp.am, T_ref, T_A);
  TC_Ww60  = tempcorr(temp.Ww60, T_ref, T_A);
  TC_Ri    = tempcorr(temp.L3_Ri, T_ref, T_A);
  TC_p_Xm    = tempcorr(temp.p_Xm, T_ref, T_A);
  
 
  TC_tWw1 = tempcorr(temp.tWw1, T_ref, T_A);
  TC_tWw2 = tempcorr(temp.tWw2, T_ref, T_A);
  TC_tWw3 = tempcorr(temp.tWw3, T_ref, T_A);
  TC_tWw4 = tempcorr(temp.tWw4, T_ref, T_A);
  TC_JOWd15 = tempcorr(temp.Wd_JO_T15, T_ref, T_A);
  TC_rpX15 = tempcorr(temp.p_Xm_r_T15, T_ref, T_A);
  TC_JOWd10 = tempcorr(temp.Wd_JO_T10, T_ref, T_A);
  TC_tL= tempcorr(temp.tL, T_ref, T_A);
  TC_tL2= tempcorr(temp.tL2, T_ref, T_A);

  % Common parameter sets
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];

  p_ref = p_Am * L_m^2;% max assimilation power at max size
  O2M = (- n_M\n_O)';
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  
  % zero-variate data
  
  % life cycle
  [t_j, t_p, t_b, l_j, l_p, l_b, ~, ~, ~, info] = get_tj(pars_tj, f);
  if info ~= 1 % numerical procedure failed
    fprintf('warning: invalid parameter value combination for get_tj \n')
    prdData = {};
    return
  end
  
  % initial scales reserve
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = U_E0 * p_Am ;           % J, energy in egg
  Ww_0 = E_0 * w_E/ mu_E/ d_E;  % g, egg wet weight 
  
  % Birth
  aT_b_18 = t_b/ k_M/ TC_ab_18;           % d, age at birth at f and T
  
  % Metamorphosis
  tT_j_8 = t_j/ k_M / TC_aj_8;     % d, age at metam
  Lw_j = l_j * L_m/ del_M;           % cm, total length at metam
  tT_j_18 = t_j/ k_M/ TC_aj_18;     % d, age at metam

  % Puberty
  aT_p_16 = t_p/ k_M/ TC_ap_16;           % d, age at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w); % g, wet weight at puberty (remove d_V for wet weight)

  % Life span
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;             % d, mean life span at T
  
  % Nesto at 60 days
  L_b = L_m * l_b;
  L_j = L_m * l_j;
  E_b = f * E_m * L_b^3;
  aT_b_60 = t_b/ k_M/ TC_Ww60;  
  
  ELH_0 = [E_b; L_b; E_Hb; 0]; %initial conditions for state variables E,L,H and R
  [~, ELHR] = ode45(@dget_ELHR_pj, [aT_b_60;60], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, kap_R, E_Hb, E_Hj, E_Hp, TC_Ww60,f); %[] in third column means no ODE options
  ELHR(1,:)=[];
  E = ELHR(end,1); L = ELHR(end,2);  R= ELHR(end,4); %H = ELHR(:,3);
  Ww_60 = L.^3 + (E + R) * w_E/ mu_E/ d_E;
    
  % Nesto Lenghts and Weights at infinite (ie reproduction and death)
  [~, ELHR] = ode45(@dget_ELHR_pj, [aT_b_60; aT_m], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, kap_R, E_Hb, E_Hj, E_Hp, TC_am,f); %[] in third column means no ODE options
  ELHR(1,:)=[];
  E = ELHR(end,1); L = ELHR(end,2);  R= ELHR(end,4); %H = ELHR(:,3);
  
  Ww_i = L.^3 + (E + R) * w_E/ mu_E/d_E;
  Wd_i = Ww_i * d_V;
  L_i = L/ del_M ;
  L3_i = L/ del_M3 ;
    
  %p_Xm  
   L_pX = (Wd.p_Xm./ (d_V * (1 + f * w))) .^ (1/3);
   if L_pX < L_b 
     s = 1; % -, multiplication factor for v and {p_Am}
   elseif L_pX < L_j
     s = L/ L_b;
   else
     s = L_j/ L_b;
   end
     
   p_Xm = p_Am/ kap_X * s * L_pX^2 * TC_p_Xm; 
  
  % pack to output
  prdData.ab_18     = aT_b_18;
  prdData.ap_16     = aT_p_16;
  prdData.aj_8      = tT_j_8;
  prdData.aj_18     = tT_j_18;
  prdData.am        = aT_m;
  prdData.Lj        = Lw_j;
  prdData.Ww0       = Ww_0;
  prdData.Wwp       = Ww_p;
  prdData.Ww60      = Ww_60;
  prdData.Wwi       = Ww_i ;
  prdData.Wdi       = Wd_i ;
  prdData.Li        = L_i ;
  prdData.L3i       = L3_i ;
  prdData.p_Xm      = p_Xm; 
 
  % uni-variate data
 
  % Max Reproduction rate at several length
  [t_j, ~, ~, l_j, ~, l_b, l_i, ~, rho_B, ~] = get_tj(pars_tj, f_u);
    
  L_i = L_m * l_i;                       
  L_b = L_m * l_b;
  L_j = L_m * l_j;
  T_j = t_j/ k_M/ TC_Ri;
  r_B = rho_B * k_M * TC_Ri; 
  L_fR = L3_Ri(:,1) .* del_M3; %cm structural length from physical length passed through the auxData structure
  ERT_i = cum_reprod_j(T_j + log((L_i - L_j) ./ (L_i - L_fR))./ r_B, f_u, pars_R); % #, cum no of eggs at L_fr
 
  
  % Nielsen r vs Jx 
  L_pX15=(Wd.p_Xm_r_T15./(d_V*(1 + f_u * w))).^(1/3);%f unknown before experiment then 0.8
  
  if L_pX15 < L_b 
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif L_pX15 < L_j
    s = L/ L_b;
  else
    s = L_j/ L_b;
  end
     
  f_ing = p_Xm_r_T15(:,1) / (L_pX15^2 * p_Am/ kap_X * s);
  Er_15 = TC_rpX15 * v * (f_ing * s/ L_pX15 - (1 + L_T/ L_pX15)/ L_m) ./ (f_ing + g); % 1/d, spec growth rate dans cum reprod j et DEB book 3 
  
  
  %Nesto tW
  L=(0.025./(1 + f_u * w)).^(1/3);%f unknown before experiment then 0.8
  
  [EWw_nesto1] = nesto(f_nesto1,TC_tWw1,tWw1(:,1),L,pars_tj,w,L_m,k_M);
  [EWw_nesto2] = nesto(f_nesto2,TC_tWw2,tWw2(:,1),L,pars_tj,w,L_m,k_M);
  [EWw_nesto3] = nesto(f_nesto3,TC_tWw3,tWw3(:,1),L,pars_tj,w,L_m,k_M);
  [EWw_nesto4] = nesto(f_nesto1,TC_tWw4,tWw4(:,1),L,pars_tj,w,L_m,k_M);%f_nesto_4=f_nesto_1
  
  % Nesto tL  
  ELH_0 = [E_0; Ww_0^(1/3); 0; 0];
  [~, ELHR] = ode45(@dget_ELHR_pj, [0;tL(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, kap_R, E_Hb, E_Hj, E_Hp, TC_tL,f_u); %[] in third column means no ODE options
  ELHR(1,:)=[]; %E = ELHR(:,1); R= ELHR(:,4); H = ELHR(:,3);
  L = ELHR(:,2);  
  w_1 = min(1, max(0, (L - L_b)./ (L_j - L_b))); 
  shape_b_to_j=(del_Me * (1 - w_1) + del_M * w_1);% del_Me before b linear change to del_M between b and j del_M after j
  EtL = L./shape_b_to_j; %length from fertilisation
   
  
  % Marty tL2   
   [~, ELHR] = ode45(@dget_ELHR_pj, [0;tL2(:,1)], ELH_0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, kap_R, E_Hb, E_Hj, E_Hp, TC_tL2,f_u); %[] in third column means no ODE options
   ELHR(1,:)=[];
   %E = ELHR(:,1); R= ELHR(:,4); H = ELHR(:,3);
   L = ELHR(:,2);  
   w_1 = min(1, max(0, (L - L_b)./ (L_j - L_b))); %dynamic shape
   shape_b_to_j=(del_Me * (1 - w_1) + del_M * w_1);% del_Me before b linear change to del_M between b and j del_M after j
   EtL2 = L./shape_b_to_j; %length from fertilisation
    
  % Wd_JO Nielsen
   L_O15 = (Wd_JO_T15(:,1)./(d_V * (1 + f_u * w))).^(1/3); % structural length from physical length
   pACSJGRD = p_ref * scaled_power_j(L_O15, f_u, pars_pow, l_b, l_j, l_p);
   pADG = pACSJGRD(:, [1 7 5]);  
   JO = pADG * eta_O';        % organic fluxes
   JM = JO * O2M;             % mineral fluxes
   EJOWd15 = -JM(:,3) .* TC_JOWd15;   % mol/d, oxygen consumption rate at temp T
   
  % Wd_JO Shumway
    L_O10 = (Wd_JO_T10(:,1)./(d_V * (1 + f_u * w))).^(1/3); % structural length from physical length
    pACSJGRD = p_ref * scaled_power_j(L_O10, f_u, pars_pow, l_b, l_j, l_p);
    pADG = pACSJGRD(:, [1 7 5]);  
    JO = pADG * eta_O';        % organic fluxes
    JM = JO * O2M;             % mineral fluxes
    EJOWd10 = -JM(:,3) .* TC_JOWd10;   % mol/d, oxygen consumption rate at temp T
 
    
  %---------------------- 
  % TC_T Kristensen
  %----------------------
    
   ETC_T = tempcorr(C2K(TC_T(:,1)), T_ref, T_A);
   
  %----------------------
  % shapes and other biometrics
  %----------------------
   EWw_L3w = (Ww_L3w(:,1).*del_M3).^3 .* (1 + f_u * w);% shape with L3 
   EWw_Lw  = (Ww_Lw(:,1) .*del_M).^3 .* (1 + f_u * w);% shape with L 

%% pack to output (the names of the fields in the structure must be the 
    
    prdData.tWw1         = EWw_nesto1;
    prdData.tWw2         = EWw_nesto2;
    prdData.tWw3         = EWw_nesto3;
    prdData.tWw4         = EWw_nesto4;
    prdData.tL           = EtL;
    prdData.tL2          = EtL2;
    prdData.Wd_JO_T15    = EJOWd15;
    prdData.Wd_JO_T10    = EJOWd10;
    
    prdData.TC_T      = ETC_T;
    prdData.p_Xm_r_T15   = Er_15;
    prdData.Ww_L3w    = EWw_L3w;
    prdData.Ww_Lw     = EWw_Lw ;
    prdData.L3_Ri     = ERT_i;
end 
  
function Ww = nesto(f,T,t,L_60,pars_tj,w,L_m,k_M)
%Nesto experiment
  [~, ~, ~, ~, ~, ~, l_i, ~, rho_b, ~] = get_tj(pars_tj, f);
  L_i = L_m * l_i; % cm, ultimate structural length at f
  r_B = rho_b* k_M * T;
  L = L_i - (L_i - L_60) .* exp(- r_B .* (t - 60));  %length
  Ww= L.^3 * (1 + f * w);
end

function dELHR = dget_ELHR_pj(t,ELHR, Lb, Lj, Lm, p_Am, v, g, kJ, kap, kap_R, Hb, Hj, Hp, TC,f)

  %  change in state variables during juvenile and adult stage at given temperature
  %  dELHR = dget_ELHR_pj(t, ELH)
  %  ELHR: 4-vector
  %   E: reserve E in j
  %   L: structural length in cm
  %   H: maturity E_H in j
  %   R: reproduction buffer E_R in j
  %  dELHR: change in reserve, length, maturity and reproduction buffer
  
 
  %  unpack variables
  E = ELHR(1); L = ELHR(2); H = ELHR(3); R = ELHR(4);
  
  % interpolation for T and f
  %TC = tempcorr(C2K(interp1(tT(:,1),tT(:,2),t)), T_ref, T_A);%TC = tempcorr(C2K(spline1(t, tT)), T_ref, T_A);
  %f = interp1(tF(:,1),tF(:,2),t);
  
  vT = v * TC; kT_J = kJ * TC; pT_Am = p_Am * TC;
 
  if H < Hb 
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
  
    
  e = vT * E/ L^3/ pT_Am; % -, scaled reserve density; 
  rT = s * vT * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  pT_C = E * (s * vT/ L - rT); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt, dR/dt
  if H<Hp
    dH = (1 - kap) * pT_C - kT_J * H;  
    dR = 0;
  else
    dH = 0;
    dR = kap_R * (1 - kap) * pT_C - kT_J * Hp;
  end
  
  dE = (L > Lb) * s * pT_Am * f * L^2 - pT_C;
  dL = rT * L/3;

  % pack derivatives
  dELHR = [dE; dL; dH; dR];
end


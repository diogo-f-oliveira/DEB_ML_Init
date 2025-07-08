function [prdData, info] = predict_Pinna_nobilis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%   % customized filters for allowable parameters of the standard DEB model (std)
%   % for other models consult the appropriate filter function.
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); %f_tL
  if info ~= 1 % numerical procedure failed
      fprintf('warning: invalid parameter value combination for get_tj \n')
  end
  s_M = l_j / l_b;
  
  filterChecks = k * v_Hp >= f_tL1^3 * s_M^3 || ...         % constraint required for reaching puberty with f_tL1
                 ~reach_birth(g, k, v_Hb, f_tL1) || ...  % constraint required for reaching birth with f_tL1
                 k * v_Hp >= f_tL2^3 * s_M^3 || ...         % constraint required for reaching puberty with f_tL2
                 ~reach_birth(g, k, v_Hb, f_tL2)|| ...  % constraint required for reaching birth with f_tL2
                del_M1 > 1 || E_Hh > E_Hb || E_Hh < 0 || f_tLT > 1; %filter for constraining shape coeficients under 1      
  
  if filterChecks
    info = 0;
    prdData = {};
    return;
  end  

  % compute temperature correction factors

  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  
  TC_tL1 = tempcorr(temp.tL1, T_ref, T_A);
  TC_tL2 = tempcorr(temp.tL2, T_ref, T_A);
  tTC1 = [temp.tL1_T(:,1), tempcorr(C2K(temp.tL1_T(:,2)), T_ref, T_A)]; % vector of T in time for Pinna1
  tTC2 = [temp.tL2_T(:,1), tempcorr(C2K(temp.tL2_T(:,2)), T_ref, T_A)]; % vector of T in time for Pinna2
  TC_TdL1 = tempcorr(C2K(data.TdL1(:,1)), T_ref, T_A);
  TC_TdL2 = tempcorr(C2K(data.TdL2(:,1)), T_ref, T_A);
  
  TC_LdL = tempcorr(temp.LdL, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  
  %% zero-variate data
 
%   F = f_w; %set for wild populations, 0.8
   F = f;
  % life cycle
   pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
   [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, F); %zamijenjen t_b sa tau_b
   if info ~= 1 % numerical procedure failed
        fprintf('warning: invalid parameter value combination for get_tj \n')
   end
 
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(F, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap and v constant
  
  % hatch   
%  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
%  a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f_w
  Lw_b = L_b/ del_M1;                % cm, physical length at birth at f_w
  aT_b = tau_b/ k_M/ TC_ab;           % d, age at birth at f_w and T %t_b =tau_b
%   Ww_b = L_b^3 * (1 + F * ome);       % g, wet weight at birth at f_w 

  % metamorphosis
  L_j = L_m * l_j;      % cm, structural length at metam
  Lw_j = L_j/ del_M2;    % cm, physical length at metam at f_w
  aT_j = tau_j / k_M/ TC_aj;   % d, time since birth at metam
%   Ww_j = L_j^3 * (1 + F * w);  % g, wet weight at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f_w
  Lw_p = L_p/ del_M2;                % cm, physical length at puberty at f_w
  tT_p = (tau_p - tau_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f_w and T
%   Ww_p = L_p^3 *(1 + F * ome);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f_w
  Lw_i_w = L_i/ del_M2;                % cm, ultimate physical length at f_w
%   Ww_i = L_i^3 * (1 + F * ome);       % g, ultimate wet weight 
 
  % reproduction
  GSI = 365 * TC_GSI * k_M * g/ F^3/ (F + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * F^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); %equation taken from Litophaga_litophaga* *curated by Bas
%   GSI = GSI * ((1 - kap) * F^3 - k_J * U_Hp/ L_m^2/ s_M^2); % mol E_R/ mol W 

%   pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
%   [R_i, UE0, Lb, Lj, Lp, info]  =  reprod_rate_j(L_i, f, pars_R);
%   RT_i = TC_Ri * R_i;% #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, F, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
%   % ultimate ref
%   [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
%   L_i = L_m * l_i;                  % cm, ultimate structural length at f
%   Lw_i_ref = L_i/ del_M2;                % cm, ultimate physical length at f

   
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.tp = tT_p;
  prdData.aj = aT_j;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i_w;
%   prdData.Li_ref = Lw_i_ref;
  prdData.Lp = Lw_p;
  prdData.Lj  = Lw_j;
  prdData.GSI = GSI;
  prdData.E0 = E_0;
%   prdData.Ri = RT_i;
%   prdData.Wwh = Ww_h;
%   prdData.Wwb = Ww_b;
%   prdData.Wwp = Ww_p;
%   prdData.Wwi = Ww_i;
  
  %% uni-variate data
  
  % time-length (adults), t-L, at diferent f
  F = f_tL1; 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, F);
  kT_M= TC_tL1 * k_M;
  rT_B = rho_B * kT_M;  % 1/d, von Bert growth rate   
  rT_j = rho_j * kT_M;  % 1/d, exponential growth rate
  aT_b = tau_b/ kT_M; aT_j = tau_j/ kT_M;   
  t_j = aT_j - aT_b; % time since birth at metamorphosis
  t_bj = tL1(tL1(:,1) < t_j,1); % select times between birth & metamorphosis   
  Lw_b = L0.tL1; %deleted Lw_b = L_m * l_b / del_Mb; 
  Lw_j = l_j * L_m/ del_M2; 
  Lw_i = l_i * L_m/ del_M2;
  EL_bj = Lw_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
  t_ji = tL1(tL1(:,1) >= t_j,1); % selects times after metamorphosis
  EL_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (t_ji - t_j)); % cm, expected length at time
  ELw1 = [EL_bj; EL_ji]; % catenate lengths
  
  F = f_tL2; 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, F);
  kT_M= TC_tL2 * k_M;
  rT_B = rho_B * kT_M;  % 1/d, von Bert growth rate
  rT_j = rho_j * kT_M;  % 1/d, exponential growth rate
  aT_b = tau_b/ kT_M; aT_j = tau_j/ kT_M;   % /kT_M = /k_M/TC
  t_j = aT_j - aT_b; % time since birth at metamorphosis
  t_bj = tL2(tL2(:,1) < t_j,1); % select times between birth & metamorphosis   
  Lw_b = L0.tL2; %deleted Lw_b = L_m * l_b / del_Mb; 
  Lw_j = l_j * L_m/ del_M2;
  Lw_i = l_i * L_m/ del_M2;
  EL_bj = Lw_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
  t_ji = tL2(tL2(:,1) >= t_j,1); % selects times after metamorphosis
  EL_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (t_ji - t_j)); % cm, expected length at time
  ELw2 = [EL_bj; EL_ji]; % catenate lengths

  %%%%  novo %%%%%%
  % time-length (post metam), at diferent T
  F = f_tLT;
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj,F);
  r_j = rho_j * k_M; r_B = rho_B * k_M; Lw_i = L_m * l_i/del_M2; % 1/d, exponential, von Bert growth rate
  [t L] = ode45(@dget_L, tL1_T(:,1), L0.tL1_T, [], tTC1, r_B, Lw_i); % <-- promijeni f! 
  ELw1_T = L; % cm, shell length
  
  [t L] = ode45(@dget_L, tL2_T(:,1), L0.tL2_T, [], tTC2, r_B, Lw_i); % <-- promijeni f! 
  ELw2_T = L; % cm, shell length
  
  %%%%%%%%%%
  
  % length-weight
%   EWw = (LW(:,1) * del_M).^3 * (1 + f * ome); % g, wet weight

  % Temperature vs. growth rate, T-dL
  F = f_tLT; 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, F);
  rT_B = TC_TdL1 * rho_B * k_M;  % 1/d, von Bert growth rate   
  Lw_i = l_i * L_m/ del_M2;  % del_M2 because adult
  ETdL1 = rT_B * (Lw_i - L0.TdL1); % smaller Pinna at Villaricos
 
  rT_B = TC_TdL2 * rho_B * k_M;  % 1/d, von Bert growth rate   
  Lw_i = l_i * L_m/ del_M2;  % del_M2 because adult
  ETdL2 = rT_B * (Lw_i - L0.TdL2); % larger Pinna at Villaricos

  % Length vs. growth rate, L-dL
  F = f_LdL; 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, F);
  rT_B = TC_LdL * rho_B * k_M;  % 1/d, von Bert growth rate   
  Lw_i = l_i * L_m/ del_M2;
  ELdL = rT_B * (Lw_i - LdL(:,1));   

  % Length- #oocytes       % code taken from Placopecten_magellanicus
%   F = f_w;
  F = f;
  pars_R = [kap, kap_R, g, TC_LN * k_J, TC_LN * k_M, L_T, TC_LN * v, U_Hb/ TC_LN, U_Hj/ TC_LN, U_Hp/ TC_LN];
  EN = 365*reprod_rate_j(data.LN(:,1) * del_M2, F, pars_R); % #, number of oocytes per year

  
  % pack to output
  prdData.tL1 = ELw1;
  prdData.tL2 = ELw2;
  prdData.tL1_T = ELw1_T;
  prdData.tL2_T = ELw2_T;
  prdData.TdL1 = ETdL1;
  prdData.TdL2 = ETdL2;
  prdData.LdL = ELdL;
  prdData.LN  = EN;

end

% subfunction taken from Mastigias_papua , version 2018/01/06
function dLP = dget_L(t, L, tTC, r_B, Lw_i)
%   s_M = min(L, L_j)/ L_b; % -, acceleration factor
%   r = v * s_M * (f/ L - 1/ L_i)/ (f + g); % 1/d, spec growth rate
%   p_C = L^3 * E_m * f * (s_M * v/ L - r); % J/d, mobilisation rate
%   dE_H = (1 - kap) * p_C - k_J * E_H; % change in maturity at T_ref
%   if E_H < E_Hj
%     dL = L * r_j/3; % cm/d, change in length before metam at T_ref
%   else
%     dL = r_B * (L_i - L); % cm/d, change in length after metam at T_ref
%   end
%   dLH = spline1(t, tTC) * [dL; dE_H]; % cm/d, J/d: changes at T
  
  dL = r_B * (Lw_i - L); % cm/d, change in length after metam at T_ref
  dLP = spline1(t, tTC) * dL; % cm/d: changes at T
  
end

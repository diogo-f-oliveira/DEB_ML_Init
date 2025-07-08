function [prdData, info] = predict_Scophthalmus_maximus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  if E_Hh >= E_Hb
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_tb = tempcorr(temp.tb, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL1 = tempcorr(temp.tL1, T_ref, T_A);
  TC_tL2 = tempcorr(temp.tL2, T_ref, T_A);
  TC_WN = tempcorr(temp.WN, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_Mj;               % cm, S-V length at hatch at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mj;               % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_b = (t_b/ k_M - a_h)/ TC_tb;   % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at birth at f
  Lw_j = L_j/ del_M;                % cm, physical length at birth at f
  t_j = (t_j/ k_M - a_h); tT_j = t_j/ TC_tj; % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.tb = tT_b;
  prdData.tj = tT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % length-fecundity at f of 0-var data
  L = (WN(:,1)/ (1 + f * w)).^(1/3);                  % cm, structural length
  EN = TC_WN * 365 * reprod_rate_j(L, f, pars_R);  % #, 1e6 eggs per yr
  
  % length-weight at f of 0-var data
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w);     % g, expected wet weight at time

  % time-length 
  % tL for late juveniles and adults at f of 0-var data
  rT_B = rho_B * k_M * TC_tL1;                               % 1/d, von Bert growth rate
  ELw = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (tL(:,1) - t_j)); % cm, expected length at time
  
  % tL1 for embry and non-feeding early juveniles  
  kT_M = k_M * TC_tL1; % 1/d, som maint rate coeff at T
  U_E0 = initial_scaled_reserve(f_tL1, pars_UE0);  % d.cm^2, initial scaled reserve
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  U_Eh = aUL(2,2); u_Eh = U_Eh * g^2 * k_M^3/ v^2; % -, scaled maturity at hatch
  [t1 uEl] = ode45(@dget_uEl_embryo, tL1(:,1) * kT_M, [u_Eh; L_0*del_Mj/L_m], [], g); 
  ELw1 = uEl(:,2) * L_m/ del_Mj;
  
  % tL2 for embryo and feeding early juveniles  
  kT_M = k_M * TC_tL2; % 1/d, som maint rate coeff at T
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL2);
  rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; % 1/d, von Bert, exponential growth rate
  aT_b = t_b/ kT_M; aT_j = t_j/ kT_M;
  t_j = aT_j - aT_b; % time since birth at metamorphosis
  t_bj = tL2(tL2(:,1) < t_j,1); % select times between birth & metamorphosis
  Lw_b = l_b * L_m/ del_M; Lw_j = l_j * L_m/ del_M; Lw_i = l_i * L_m/ del_M;
  EL_bj = Lw_b * exp(t_bj * rT_j/3); % exponential growth as V1-morph
  t_ji = tL2(tL2(:,1) >= t_j,1); % selects times after metamorphosis
  EL_ji = Lw_i - (Lw_i - Lw_j) * exp( - rT_B * (t_ji - t_j)); % cm, expected length at time
  ELw2 = [EL_bj; EL_ji]; % catenate lengths

  % pack to output
  prdData.tL = ELw;
  prdData.tL1 = ELw1;
  prdData.tL2 = ELw2;
  prdData.WN = EN;
  prdData.LW = EWw;
  
end

%  %%%%%% SUBFUNTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function duEl = dget_uEl_embryo(t, uEl, g) % subfunction
  
  % upack uEl
  uE = uEl(1); l = uEl(2);
    
  l3 = l^3;
  duE = - uE * l * l * (g + l)/ (uE + l3);
  dl = (g * uE - l * l3)/ 3/ (uE + l3);
    
  duEl = [duE; dl]; % pack output
  end
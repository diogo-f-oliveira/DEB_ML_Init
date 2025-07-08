function [prdData, info] = predict_Boreogadus_saida(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

   
  if  f2 > 1 || f2 < 0 || f_tL > 1 || f_tL < 0 || del_Me < 0 || del_Me > 1.5 || T_L > T_ref 
      info = 0; prdData = []; return
  end

  % compute temperature correction factors
  pars_T = [T_A; T_L; T_H; T_AL; T_AH];
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_aj = tempcorr(temp.aj, T_ref, pars_T);
  TC_ap = tempcorr(temp.ap, T_ref, pars_T);
  TC_tW = tempcorr(temp.tW1, T_ref, pars_T);
  TC_Ni = tempcorr(temp.Ni, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_tL = tempcorr(temp.tL, T_ref, pars_T);
  TC_LN = tempcorr(temp.LN, T_ref, pars_T);
  TC_tL0 = tempcorr(temp.tL0, T_ref, pars_T);
  TC_tL3 = tempcorr(temp.tL3, T_ref, pars_T);
  TC_tL6 = tempcorr(temp.tL6, T_ref, pars_T);
  TC_tL8 = tempcorr(temp.tL8, T_ref, pars_T);
  TC0 = tempcorr(C2K(0), T_ref, pars_T);
  TC1 = tempcorr(C2K(1.5), T_ref, pars_T);
  TC3 = tempcorr(C2K(3), T_ref, pars_T);
  TC4 = tempcorr(C2K(4.5), T_ref, pars_T);
  TC6 = tempcorr(C2K(6), T_ref, pars_T);
  
  TC_tL2 = tempcorr(temp.tL2, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0  = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E0    = U_E0 * p_Am;               % J, initial energy in egg
  Ww_0  = w_E/ mu_E * E0/ d_E;       % g, wet weight of egg
  V_egg = E0 * w_E/ (mu_E * d_E)/ del_Y^3; % cm^3, volume of egg, Augustine, Litvak & Kooijman 2011
  Lw_0  = (V_egg * 6/ pi)^(1/3);     % cm, diameter of egg
  
  % hatch   
%   [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
%   a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
%   L_h = aUL(2,3); % cm, structural length
%   Lw_h = L_h/ del_M; %cm, standard length
  
%   % 31 and 36 dpf at 3 deg
%   a    = [0; 31; 36]; % d, age dpf
%   UT_E0 = U_E0/ TC_Lt; % cm^2 * d, scaled energy in egg at T and f
%   vT = v * TC_Lt; kT_J = k_J * TC_Lt; pT_Am = p_Am * TC_Lt;
%   LUH = [1e-9; UT_E0; 0]; % initial parameters
%   [t, LUH] = ode45(@dget_LUH, a, LUH, [], kap, vT, kT_J, g, L_m);
%   L     = LUH(2,1); % cm, structural length at 31 dpf
%   Lw_t  = L/ del_Me; % cm, physical length at 31 dpf
%   L     = LUH(3,1); % cm, structural length at 36 dpf
%   Lw_t2 = L/ del_Me; % cm, physical length at 36 dpf
  
  % birth at 1.5 deg
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis from the field
  L_j = L_m * l_j;                  % cm, structural length at metamorphosis at f
  Lw_j = L_j/ del_M;                % cm, standard length at metamorphosis at f
  Ww_j = L_j^3 *(1 + f * w);        % g, wet weight at metamorphosis 
  aT_j = t_j/ k_M/ TC_aj;           % d, age at metamorphosis at f and T  

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  N_i = 365 * TC_Ni * reprod_rate_j(21*del_M, f, pars_R);       % #, fecundity at 21 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  

  % pack to output
%   prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.L0 = Lw_0;
%   prdData.Lt = Lw_t;
%   prdData.Lt2 = Lw_t2;
%   prdData.Lh = Lw_h;
%   prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
%   prdData.Wwh = Ww_h;
%   prdData.Wwb = Ww_b;
  prdData.Ww0 = Ww_0;
%   prdData.Wwt = Ww_t;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ni  = N_i;
  
  % uni-variate data
   
  
  %   % HopTonn1997 - 
  funcRes = f; TC = TC_tW; % set func. res. and temperature correction factor
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, funcRes);
  s_M = l_j/ l_b; % -, acceleration factor 
  L_i = l_i * L_m;  % cm, structural length at metamorphosis
  rT_B = TC * rho_B * k_M;  % 1/d, von Bert, exponential growth rate

  
  tW = tW1(:,1);
  L_0  = (W0.tW1/ (1 + funcRes * w))^(1/3); % cm, structural length at t = 0 
  L = L_i - (L_i - L_0) * exp( - rT_B * tW(:,1)); % cm, expected length at time
  EW1 = L.^3 * (1 + funcRes * w);
  
  tW = tW2(:,1);
  L_0  = (W0.tW2/ (1 + funcRes * w))^(1/3); % cm, structural length at t = 0 
  L = L_i - (L_i - L_0) * exp( - rT_B * tW(:,1)); % cm, expected length at time
  EW2 = L.^3 * (1 + funcRes * w);

  
    funcRes = f; % use f= 1 - data not detailed enough for doing otherwise

  % length-weight
%   EWwjuv = (LWjuv(:,1)* 1e-1 * del_Me).^3 * (1 + funcRes * w) * 1e3  ; % mg, wet weight for early life stages (standard lengths) 
  EWw1  = (LW1(:,1) * del_M).^3         * (1 + funcRes * w) .* ((LW1 (:,1)* del_M) <= L_i);       % g, wet weight for juvenile/ adult (total lengths)
  EWw  = (LW(:,1) * del_M).^3         * (1 + funcRes * w) .* ((LW (:,1)* del_M) <= L_i);       % g, wet weight for juvenile/ adult (total lengths)
  
%   EWw1  = (LW1(:,1) * del_M).^3 * (1 + funcRes * w) ;       % g, wet weight for juvenile/ adult (total lengths)
%   EWw  = (LW(:,1) * del_M).^3     * (1 + funcRes * w) ;       % g, wet weight for juvenile/ adult (total lengths)

  funcRes = f_tL;
%     funcRes = f2;
  % fecundity   
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN_L = TC_LN * 365 * reprod_rate_j(LN(:,1) * del_M, funcRes, pars_R)  .* ((LN(:,1)* del_M) <= L_i);
  
  % mature individuals
  TC =  TC_tL;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, funcRes);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL(:,1) * rT_j/ 3) .* (tL(:,1) < tT_j);
  L = L + (tL(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j))); % cm, expected length at time
  ELw = L/ del_M;

  
 % indiced for the different temperatures:
naT0 = find(TJO(:,1) == 0); naT1 = find(TJO(:,1) == 1.5); naT3 = find(TJO(:,1) == 3);
naT4 = find(TJO(:,1) == 4.5); naT6 = find(TJO(:,1) == 6);
% age vectors for the different temperatures:
a0 = age.TJO(naT0,1); a1 = age.TJO(naT1,1); a3 = age.TJO(naT3,1); a4 = age.TJO(naT4,1); a6 = age.TJO(naT6,1);
% ages need to be unique and in ascending order for integration:
[a0_sort, i0a, i0a_sort] = unique(a0,'sorted'); % returns unique values of a in sorted order¨
[a1_sort, i1a, i1a_sort] = unique(a1,'sorted'); % returns unique values of a in sorted order¨
[a3_sort, i3a, i3a_sort] = unique(a3,'sorted'); % returns unique values of a in sorted order¨
[a4_sort, i4a, i4a_sort] = unique(a4,'sorted'); % returns unique values of a in sorted order¨
[a6_sort, i6a, i6a_sort] = unique(a6,'sorted'); % returns unique values of a in sorted order¨
% compute the respiration at the different ages at each temperature:
EJT_O = get_JO(a0_sort, TC0, U_E0, par, cPar);   EJTO_0 = EJT_O(i0a_sort);
EJT_O = get_JO(a1_sort, TC1, U_E0, par, cPar);   EJTO_1 = EJT_O(i1a_sort);
EJT_O = get_JO(a3_sort, TC3, U_E0, par, cPar);   EJTO_3 = EJT_O(i3a_sort);
EJT_O = get_JO(a4_sort, TC4, U_E0, par, cPar);   EJTO_4 = EJT_O(i4a_sort);
EJT_O = get_JO(a6_sort, TC6, U_E0, par, cPar);   EJTO_6 = EJT_O(i6a_sort);
% concatenate results:
EJT_O = [EJTO_0; EJTO_1; EJTO_3; EJTO_4; EJTO_6];   
  
% weights and lengths at different temperatures and different ages:
naT0      = find(TJO(:,1)==0); naT0(end) = []; naT1 = find(TJO(:,1)==1.5)-1; naT3 = find(TJO(:,1)==3)-1;
% age vectors for the different temperatures:
a0 = tWwe(naT0,1); a1 = tWwe(naT1,1); a3 = tWwe(naT3,1);
% ages need to be unique and in ascending order for integration:
[a0_sort, i0a, i0a_sort] = unique(a0,'sorted'); % returns unique values of a in sorted order¨
[a1_sort, i1a, i1a_sort] = unique(a1,'sorted'); % returns unique values of a in sorted order¨
[a3_sort, i3a, i3a_sort] = unique(a3,'sorted'); % returns unique values of a in sorted order¨
  
  [~, L, E] = get_JO(a0_sort, TC0, U_E0, par, cPar);
  Lw_e0 = L(i0a_sort)/ del_Me;
  Ww_e0 = L(i0a_sort).^3 + w_E/ mu_E/ d_E .* E(i0a_sort); % g, wet weight at 31 dpf

  [~, L, E] = get_JO(a1_sort, TC1, U_E0, par, cPar);
  Lw_e1 = L(i1a_sort)/ del_Me;
  Ww_e1 = L(i1a_sort).^3 + w_E/ mu_E/ d_E .* E(i1a_sort); % g, wet weight at 31 dpf
  
  [~, L, E] = get_JO(a3_sort, TC3, U_E0, par, cPar);
  Lw_e3 = L(i3a_sort)/ del_Me;
  Ww_e3 = L(i3a_sort).^3 + w_E/ mu_E/ d_E .* E(i3a_sort); % g, wet weight at 31 dpf
  
  ELw_e = [Lw_e0;Lw_e1;Lw_e3]* 1e1; % mm, standard length
  EWw_e = [Ww_e0;Ww_e1;Ww_e3]* 1e6; % mg wet weight


  
  
  % KunzFric2016 
  funcRes = f2;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, funcRes);
  % experiments at 0 deg C
  TC       = TC_tL0;
  [ELw0, EW0, EWw0, EJO0, EJX0 ] = get_LWXO(TC, funcRes, expLength.tL0, ...
      tL0, LW0, LJX0, LJO0, l_b, l_j, l_p, l_i, rho_B, par, cPar); 
    % experiments at 3 deg C
    TC       = TC_tL3;
  [ELw3, EW3, EWw3, EJO3, EJX3 ] = get_LWXO(TC, funcRes, expLength.tL3, ...
      tL3, LW3, LJX3, LJO3, l_b, l_j, l_p, l_i, rho_B, par, cPar); 
  % experiments at 6 deg C
      TC       = TC_tL6;
  [ELw6, EW6, EWw6, EJO6, EJX6 ] = get_LWXO(TC, funcRes, expLength.tL6, ...
      tL6, LW6, LJX6, LJO6, l_b, l_j, l_p, l_i, rho_B, par, cPar); 
  % experiments at 8 deg C
      TC       = TC_tL8;
  [ELw8, EW8, EWw8, EJO8, EJX8 ] = get_LWXO(TC, funcRes, expLength.tL6, ...
      tL8, LW8, LJX8, LJO8, l_b, l_j, l_p, l_i, rho_B, par, cPar); 

  
 % field data: larve and early juveniles are ages with otholiths
   % time - standard length of larvae and early juveniles
  funcRes = f_tL2; TC = TC_tL2;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, funcRes);
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;  % cm, structural length at birth, metamorphosis, ultimate
  kT_M = k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  tT_j = (t_j - t_b)/ k_M/ TC;   % d, time since birth at metam
  L_bj = L_b * exp(tL2((tL2(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL2((tL2(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw2 = 10 * [L_bj; L_jm]/ del_M; % mm, standard length (I use the same shape as for total length because these fish are developing on don't yet have full caudal fin ...

  % pack to output  
  prdData.tL2 = ELw2;
%   prdData.LWjuv = EWwjuv;
  prdData.LW = EWw;
  prdData.LW1 = EWw1;
  prdData.LW = EWw;
  prdData.LN = EN_L;
  prdData.tL = ELw;
  
  prdData.tW1 = EW1;
  prdData.tW2 = EW2;

  
  prdData.TJO  = EJT_O;
  prdData.tWwe = EWw_e;  
  prdData.tLe  = ELw_e;
  
  prdData.tL0 = ELw0;  
  prdData.tW0 = EW0;
  prdData.LW0 = EWw0;
  prdData.LJO0 = EJO0;
  prdData.LJX0 = EJX0;

  prdData.tL3 = ELw3;  
  prdData.tW3 = EW3;
  prdData.LW3 = EWw3;
  prdData.LJO3 = EJO3;
  prdData.LJX3 = EJX3;

  prdData.tL6 = ELw6;  
  prdData.tW6 = EW6;
  prdData.LW6 = EWw6;
  prdData.LJO6 = EJO6;
  prdData.LJX6 = EJX6;

  prdData.tL8 = ELw8;  
  prdData.tW8 = EW8;
  prdData.LW8 = EWw8;
  prdData.LJO8 = EJO8;
  prdData.LJX8 = EJX8;


  
end

  
  
  function dULXP = dget_ulxp(t, ULH, sM, Lm, v, g, y_X_E, y_P_X, mu_E, f, p_Am)
  % change in state variables post metamorphosis
  % dULXP = dget_ulxp(t, ULH, sM, Lm, v, g, y_X_E, y_P_X, f)
  % ULXP: 4-vector
  %  U: scaled reserve M_E/ {J_{EAm}}; reference is at embryo value at T
  %  L: structural length
  %  JX: c-mol/d ingestion rate
  %  JP: c-mol/d faeces production
  % dULH: change in scaled reserve, length, scaled maturity
  
  % unpack variables
  U = ULH(1); L = ULH(2); JX = ULH(3); JP = ULH(4);
 
  e = v * U/ L^3; % -, scaled reserve density
  r = sM * v * (e/ L - 1/ Lm/ sM)/ (e + g); % 1/d, spec growth rate
  SC = U * (sM * v/ L - r); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
%   dH = (1 - kap) * SC - kJ * H;
  dU = sM * f * L^2 - SC;
  dL = r * L/3;
  dJX = - y_X_E * mu_E^-1 * f * p_Am * sM * L^2;
  dJP = - y_P_X * dJX;
  
  % pack derivatives
  dULXP = [dU; dL; dJX; dJP];
  end

  function [ELw, EW, EWw, EJO, EJX ] = get_LWXO(TC, funcRes, expLength,...
      tL, LW, LJX, LJO, lb, lj, lp, li, rho_B, p, c)
  
  L_i = li * c.L_m; s_M = lj/ lb;
  p_ref = c.p_Am * c.L_m^2; % J/d, max assimilation power at max size

  rT_B     = TC * rho_B * c.k_M;    % 1/d, von Bert, exponential growth rate
  L_0      = tL(:,1) * 1e-1 * p.del_M; % cm, structural lengths at t = 0 
  L        = L_i - (L_i - L_0) .* exp( - rT_B * expLength); % cm, expected structural lengths at time
  ELw     = 10 * L/ p.del_M; % mm, expected total lengths at time
  EW      = L.^3 * (1 + c.w * funcRes); % g, wet weight
  L = LJO(:,1) * 1e-1 * p.del_M; % cm, structural length at end of experiment
  [L_sort, iL, iL_sort] = unique(L,'sorted'); % returns unique values of L in sorted order¨
  pACSJGRD = p_ref * scaled_power_j(L_sort, funcRes, [p.kap; p.kap_R; c.g; p.k_J; c.k_M; c.L_T; p.v; c.U_Hb; c.U_Hj; c.U_Hp], lb, lj, lp);  % J/d, powers
  J_M      = - (c.n_M\c.n_O) * c.eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJO     = - J_M(3,:)' * TC/ 24/ 60 * 1e6;     % µmol/min, O2 consumption 
  EJO     = EJO(iL_sort); % reconstruct all values 
   
  EWw  = (LW(:,1) * 1e-1 * p.del_M).^3 * (1 + funcRes * c.w);  % g, wet weight for juvenile/ adult (total lengths)

  EJX = zeros(length(LJX),1); % pre-allocate space for expected cumulated food ingested during the experiment
    for i  = 1:length(LJX(:,1))  
        L0        = LJX(i,1) * 1e-1 * p.del_M; % cm, structural length at t = 0 
        UE0       = funcRes * c.E_m * L0^3/ c.p_Am/ TC; % d.cm^2, scaled initial amount of reserve
        InitCond  = [UE0; L0; 0; 0]; % initial conditions
        [t, ULXP] = ode45(@dget_ulxp, [0 expLength(i)], InitCond, [], s_M, c.L_m, p.v * TC, c.g, c.y_X_E, c.y_P_X, p.mu_E, funcRes, c.p_Am * TC); 
        ULXP      = ULXP(end,:); % c-mol, cumulated food ingested
        EJX(i)   = - ULXP(3)* c.w_X; % g, total food consumed
    end


  end



% subfunction: embryo growth and respiration
function [EJT_O, L, E] = get_JO(age, TC, U_E0, p, c)

UT_E0 = U_E0/ TC; % cm^2 * d, scaled energy in egg at T and f
vT = p.v * TC; kT_J = p.k_J * TC; pT_Am = c.p_Am * TC;
LUH = [1e-9; UT_E0; 0]; % initial parameters
[t, LUH] = ode23s(@dget_LUH, [0;age], LUH, [], p.kap, vT, kT_J, c.g, c.L_m);
LUH(1,:) = [];
  if length(age) == 1 
      LUH = LUH(end,:);
  end
L = LUH(:,1); 
U = LUH(:,2); % cm and J, structural length and energy in reserve
E = U * pT_Am; 
e         = vT * U./ L.^ 3;  % -, scaled reserve density
l         = L/ c.L_m;         % -, scaled length
pD        = p.kap * l.^3 + (1 - p.kap) * e.* l.^2 .* (c.g + l) ./ (c.g + e); 
pG        = p.kap * l.^2 .* (e - l) ./ (1 + e/c.g);
O2        = (c.n_M\ c.n_O) * [0 0; 0 c.M_V/ p.E_G; -1/p.mu_E -1/p.mu_E; 0 0] * [pD'; pG'];
EJT_O = 1e9 * O2(3,:)' * c.L_m^2 * pT_Am/ 24; % nmol/h, oxygen consumption

end

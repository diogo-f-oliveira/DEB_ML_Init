function [prdData, info] = predict_Acipenser_persicus(par, data, auxData)
    
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  if E_Hh >= E_Hb || E_Hh < 0
         info = 0;
    prdData = {};
    return;
  end  

%% compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_lp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_lp, f);
  
  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  %E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap constant

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC_ah;           % d, age at hatch at f and T
  M_Eh = J_E_Am * aUL(end,2);       % mol, reserve at hatch at f
  L_h = aUL(2,3);                   % cm, structural length at f
  Lw_h = L_h/ del_M;
  E_h = aUL(2,2)* p_Am * TC_ah;   % J, energy in reserve at hatch

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g,  wet weight at puberty
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
   
  % uni-variate data
[t, LEH] = ode45(@ode_LEH, [0; tL(:,1)], [L_h; E_h; E_Hh], [], par, f, TC_tL);
 ELw = LEH(2:end,1)/ del_M; % cm, total length

%% pack to output
  prdData.ah = aT_h;  
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.tL = ELw;
end

  
  % used for growth:
function dLEH = ode_LEH(t, LEH, p, f, TC)
% Input: 
% p: structure 'par' 
% c: structure 'Cpar' obtained by cPar = parscomp_st(par)
% TC, scalar, -, temperature correction factor

% --------------- unpack LEHR ------------------------------------------
L   =  max(0,LEH(1)); % cm, volumetric structural length
E   =  max(0,LEH(2)); % J,   energy in reserve 
EH  =  max(0,LEH(3)); % J, E_H maturity

% Temperature and shape correct the relevant paramters
vT    = p.v * TC; 
pT_Am = p.z * p.p_M/ p.kap * TC;
pT_M  = p.p_M * TC; 
kT_J  = p.k_J * TC; 
%
pA  = f * pT_Am * L^2 * (EH >= p.E_Hb);           % J/d, assimilation
r   = (E * vT/ L - pT_M * L^3/ p.kap)/ (E + p.E_G * L^3/ p.kap);
pC  = E * (vT/ L - r); % J/d, mobilisation 
dE  = pA - pC;               % J/d, change in energy in reserve
dL  = r/ 3 * L;              % cm/d, change in structural length
dEH = ((1 - p.kap) * pC - kT_J * EH) * (EH < p.E_Hp);    % J/d, change in cum energy invested in maturation (it is implied here that no rejuvenation occurs).

% pack dLEHR
dLEH = [dL; dE; dEH];    
end
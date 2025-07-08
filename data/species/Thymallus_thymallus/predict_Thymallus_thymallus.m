function [prdData, info] = predict_Thymallus_thymallus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% customized filters
if E_Hh > E_Hb % constraint required for mass conservation
  info = 0;
  prdData = {};
  return
end

   
%% compute temperature correction factors
  TC_ah_8 = tempcorr(temp.ah_8, T_ref, T_A);
  TC_ah_13 = tempcorr(temp.ah_13, T_ref, T_A);
  TC_ah_15 = tempcorr(temp.ah_15, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_R45 = tempcorr(temp.R45, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_Indals, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);
  TC_Tah = tempcorr(Tah(:,1), T_ref, T_A); 

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);

  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1);                 % d, age at hatch at f and T_ref
  L_h = aUL(2,3);                 % cm, structural length at f
  Lw_h = L_h/ del_M;              % cm, S-V length at hatch at f
  aT_h8 = a_h/ TC_ah_8; % d, age at hatch at T
  aT_h13 = a_h/ TC_ah_13; % d, age at hatch at T
  aT_h15 = a_h/ TC_ah_15; % d, age at hatch at T

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b.^3 * (1 + f * w);      % g, wet weight at birth

  % metam
  L_j = l_j * L_m;                  % cm, structural length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_45 = TC_R45 * reprod_rate_j(45 * del_M, f, pars_R);                 % ultimate reproduction rate
  % max gonado-somatic index of fully grown individual that spawns once per year see (4.89) of DEB3
  GSI = 365 * RT_45 * Ww_b/ Ww_i;     % - , gonado somatic index

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.ah_8 = aT_h8;
  prdData.ah_13 = aT_h13;
  prdData.ah_15 = aT_h15;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.R45 = RT_45;
  prdData.GSI = GSI;

  %% uni-variate data
  
  % t-L data
  vT = v * TC_tL; kT_J = k_J * TC_tL; UT_Hb = U_Hb/ TC_tL; UT_Hj = U_Hj/ TC_tL; % correct for temp
  t = [0; tL_Test(:,1)]; % d, time since hatch
  ULH_h = [aUL(2,2)/ TC_tL; L_h; U_Hh]; % state vector at h
  [a ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f_tL_Test, UT_Hb, UT_Hj); 
  ULH(1,:) = []; ELw_Test = ULH(:,2)/ del_M; % cm, structural length, physical length
  %
  t = [0; tL_Storsjo(:,1)]; % d, time since hatch
  ULH_h = [aUL(2,2)/ TC_tL; L_h; U_Hh]; % state vector at h
  [a ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f_tL_Storsjo, UT_Hb, UT_Hj); 
  ULH(1,:) = []; ELw_Storsjo = ULH(:,2)/ del_M; % cm, structural length, physical length
  %
  t = [0; tL_Indals(:,1)]; % d, time since hatch
  ULH_h = [aUL(2,2)/ TC_tL; L_h; U_Hh]; % state vector at h
  [a ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f_tL_Indals, UT_Hb, UT_Hj); 
  ULH(1,:) = []; ELw_Indals = ULH(:,2)/ del_M; % cm, structural length, physical length
  %
  t = [0; tL_Llyn(:,1)]; % d, time since hatch
  ULH_h = [aUL(2,2)/ TC_tL; L_h; U_Hh]; % state vector at h
  [a ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f_tL_Llyn, UT_Hb, UT_Hj); 
  ULH(1,:) = []; ELw_Llyn = ULH(:,2)/ del_M; % cm, structural length, physical length

  % t-W data
  t = [0; tW(:,1)]; % d, time since hatch
  [a ULH] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f_tW, UT_Hb, UT_Hj); 
  ULH(1,:) = []; L = ULH(:,2); % cm, structural length
  EWw = L.^3 * (1 + f_LW * w); % g, wet weight
  
  % L-Ww data
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f_LW * w); % g, wet weight
  EWw_L1 = (LW1(:,1) * del_M).^3 * (1 + f_LW1 * w); % g, wet weight

  % T-ah data
  U_E0 = initial_scaled_reserve(f_Tah, pars_UE0); % d.cm^2, initial scaled reserve
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1);                 % d, age at hatch at f and T_ref
  Eah = a_h ./ TC_Tah; 
  
  % pack to output
  prdData.tL_Test = ELw_Test;
  prdData.tL_Storsjo = ELw_Storsjo;
  prdData.tL_Indals = ELw_Indals;
  prdData.tL_Llyn = ELw_Llyn;
  prdData.tW = EWw;
  prdData.LW = EWw_L;
  prdData.LW1 = EWw_L1;
  prdData.Tah = Eah;
     
end

%% sub subfuctions

  function dULH = dget_ulh_pj(t, ULH, Lb, Lj, Lm, v, g, kJ, kap, f, Hb, Hj)
  % change in state variables during juvenile stage
  % dULH = dget_ulh_p_pj(t, ULH)
  % ULH: 3-vector
  %  U: scaled reserve M_E/ {J_{EAm}}; reference is at embryo value at T
  %  L: structural length
  %  H: scaled maturity M_H/ {J_{EAm}}; reference is at embryo value at T
  % dULH: change in scaled reserve, length, scaled maturity
  
 
  %% unpack variables
  U = ULH(1); L = ULH(2); H = ULH(3);
 
  if H < Hb 
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
  e = v * U/ L^3; % -, scaled reserve density
  r = s * v * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  SC = U * (s * v/ L - r); % d.cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dH = (1 - kap) * SC - kJ * H;
  dU = (L > Lb) * s * f * L^2 - SC;
  dL = r * L/3;

  %% pack derivatives
  dULH = [dU; dL; dH];

  end
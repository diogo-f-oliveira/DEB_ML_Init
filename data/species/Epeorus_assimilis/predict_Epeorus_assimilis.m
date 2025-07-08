function [prdData, info] = predict_Epeorus_assimilis(par, data, auxData)

  global tT

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


  pars_T = [T_A; T_L; T_AL];
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_tj = tempcorr(temp.tj, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  
  tTC  = [tT(:,1), tempcorr((tT(:,2)), T_ref, pars_T)]; % vector of T in time
  TC_LW = tempcorr(temp.LW, T_ref, pars_T);
  TC_LW2 = tempcorr(temp.LW2, T_ref, pars_T);
  
% zero-variate data

  % life cycle
  v_Rj = kap/ (1 - kap) * E_Rj/ E_G; 
  pars_tj = [g; k; v_Hb; v_Hp; v_Rj];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f);
  
  % initial
  u_E0 = get_ue0([g k v_Hb], f, l_b);   % -, scaled initial reserve
  E_0 = g * E_m * L_m^3 * u_E0;         % J, initial energy content
  Lw_0 = (E_0 * w_E/ mu_E/ d_E)^(1/3)/ del_Y; % cm, egg diameter
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f

  % emergence
  L_j = l_j * L_m;                      % cm, structural length at emergence
  Lw_j = L_j/ del_M;                    % cm, body length nymph at emergence
  tT_j = (t_j - t_b)/k_M/TC_tj;         % d, time since birth at emergence
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_j/ del_Mi;               % cm, ultimate physical length at f
 
  % reproduction
  N_i = kap_R * (1 - kap) * v_Rj * l_j^3/ u_E0; % # of eggs at j, see section 7.8 of the comments to DEB

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.L0 = Lw_0;
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Li = Lw_i;
  prdData.Ni = N_i;
  
  % uni-variate data     

  % time-length data Sand1981 (varying temperature)
  r_j = rho_j * k_M; r_B = rho_B * k_M; % 1/d, exponential, von Bert growth rate
  L_0 = L_ini * del_M;% cm, structural length 
  [t LH] = ode45(@dget_LH, tL(:,1), [L_0; E_Hb], [], tTC, E_Hp, r_j, r_B, L_b, L_p, L_i, v, g, kap, k_J, E_m, f); 
  ELw = LH(:,1)/ del_M; % body length in cm

  % Length-dry weight data Haue2011
  % it includes the dry weight of the eggs
  L_p = l_p * L_m; L_i = l_i * L_m; % cm, structural lengths at puberty and ultimate at f 
  kT_M = k_M * TC_LW; rT_B = rho_B * kT_M; % 1/d, von Bert growth rate at f and T
  tT_p = (t_p - t_b)/ k_M/ TC_LW; % d, time since birth at puberty at f and T
  L = LW(:,1) * del_M; % cm, structural length 
  t = 1/ rT_B * log((L_i - L_p)./ (L_i - L)); % d, time since puberty
  pars_R = [kap; kap_R; g; k_J * TC_LW; kT_M; 0; v * TC_LW; U_Hb/ TC_LW; U_Hp/ TC_LW; U_Hp/ TC_LW + 1e-8]; % parameters at T
  [N, Lpred, U_E0] = cum_reprod_j(t + tT_p, f_LW, pars_R); % cum reproductive output at T
  E_0  = U_E0 * p_Am; % J, energy in the egg
  Wd_0 = w_E/ mu_E * E_0; % g, dry mass of the egg
  Ewd = L.^3 * d_V * (1 + f_LW * w); % g, dry weight  excluding the reproduction buffer
  EWdb = Ewd +  N.* Wd_0; % g, dry weight including the reproduction buffer 
  
  % Length-dry weight data Beck2011
  % it includes the dry weight of the eggs
  L_p = l_p * L_m; L_i = l_i * L_m; % cm, structural lengths at puberty and ultimate at f 
  kT_M = k_M * TC_LW2; rT_B = rho_B * kT_M; % 1/d, von Bert growth rate at f and T
  tT_p = (t_p - t_b)/ k_M/ TC_LW; % d, time since birth at puberty at f and T
  L = LW2(:,1) * del_M; % cm, structural length 
  t = 1/ rT_B * log((L_i - L_p)./ (L_i - L)); % d, time since puberty
  pars_R = [kap; kap_R; g; k_J * TC_LW2; kT_M; 0; v * TC_LW2; U_Hb/ TC_LW2; U_Hp/ TC_LW2; U_Hp/ TC_LW2 + 1e-8]; % parameters at T
  [N, Lpred, U_E0] = cum_reprod_j(t + tT_p, f_LW2, pars_R); % cum reproductive output at T
  E_0  = U_E0 * p_Am; % J, energy in the egg
  Wd_0 = w_E/ mu_E * E_0; % g, dry mass of the egg
  EWd2 = L.^3 * d_V * (1 + f_LW2 * w); % g, dry weight  excluding the reproduction buffer
  EWdb2 = EWd2 +  N.* Wd_0; % g, dry weight including the reproduction buffer 
  
  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWdb;
  prdData.LW2 = EWdb2;
 
end

function dLH = dget_LH(t, LH, tTC, E_Hp, r_j, r_B, L_b, L_p, L_i, v, g, kap, k_J, E_m, f)
  L = LH(1); E_H = LH(2); % cm, J: structural length, maturity
  s_M = min(L, L_p)/ L_b; % -, acceleration factor
  r = v * s_M * (f/ L - 1/ L_i)/ (f + g); % 1/d, spec growth rate
  p_C = L^3 * E_m * f * (s_M * v/ L - r); % J/d, mobilisation rate
  dE_H = (1 - kap) * p_C - k_J * E_H; % change in maturity at T_ref
  if E_H < E_Hp
    dL = L * r_j/3; % cm/d, change in length before metam at T_ref
  else
    dL = r_B * (L_i - L); % cm/d, change in length after metam at T_ref
  end
  dLH = spline1(t, tTC) * [dL; dE_H]; % cm/d, J/d: changes at T
end
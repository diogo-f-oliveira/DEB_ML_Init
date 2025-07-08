function [prdData, info] = predict_Lota_lota(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC_ah= tempcorr(temp.ah, T_ref, T_A);
  TC_tb = tempcorr(temp.tb, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tLb = tempcorr(temp.tL_b, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC_ah; t_h = a_h * k_M; % d, age at hatch at f and T
  U_Eh = aUL(2,2);                 % d.cm^2, scaled reserve at hatch
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_M;               % cm, total length at hatch at f

  % birth
  L_b = L_m * l_b;                     % cm, structural length at birth
  Lw_b = L_b/ del_M;                   % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f
  tT_b = (t_b - t_h)/ k_M/ TC_tb;      % d, time since hatch at birth at f, temp corrected
     
  % puberty 
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);          % g, wet weight at puberty
  tT_p = (t_p-t_h)/ k_M/ TC;           % d, time since hatch at puberty
  
  % ultimate 
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reproduction at 50 cm
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);          % #/d, max reproduction rate 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  

%% pack to output
  prdData.ah = aT_h;
  prdData.tb = tT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
%% uni-variate data

  % length-weight data
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

  % time-length 
  f = f_tL; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC_tL; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL(:,1) * rT_j/ 3) .* (tL(:,1) < tT_j);
  L = L + (tL(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j))); % cm, expected length at time
  ELw = L/ del_M;
  % tL_b data 
  f = f_tLb; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC_tLb; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M; vT = v * TC_tLb;
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i; 
  [t Le] = ode45(@dget_Le_j, tL_b(:,1), [L_h; U_Eh * p_Am/ L_h^3/ E_m], [], L_b, L_j, L_m, f, vT, g);
  ELw_b = Le(:,1)/ del_M;
  
  % pack to output
  prdData.tL = ELw;
  prdData.tL_b = ELw_b;
  prdData.LW = EWw;
end

%% subfunction 
function dLe = dget_Le_j(t, Le, L_b, L_j, L_m, f, v, g)
  % embryo/juvenile with acceleration between b and j
  % t: scalar with time
  % Le: 2-vector with (L, e= M_E/ M_Em) of embryo/juvenile
  % dLe: 2-vector with (dL/dt, de/dt)

  L   = Le(1);    % cm, structural length
  e   = Le(2);    % -, scaled reserve density M_E/M_Em
  s_M = L_j/ L_b; % acceleration factor
  
  if L <= L_b % before birth, no acceleration
    f = 0;
    gM = g;
    vM = v;
  elseif L > L_b && L <= L_j % between birth and metam, acceleration
    gM = g * L/ L_b;
    vM = v * L/ L_b;
  else % L > L_j: post metam: no acceleration
    gM = g * s_M;
    vM = v * s_M;
  end
  
  r = vM * (e/ L - 1/ L_m/ s_M)/ (e + g);
  
  dL = L * r/ 3;          % cm/d
  de = (f - e) * vM/ L;   % 1/d                               

  % pack dL/dt, de/dt
  dLe = [dL; de];
end
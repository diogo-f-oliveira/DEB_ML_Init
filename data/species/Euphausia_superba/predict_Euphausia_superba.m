function [prdData, info] = predict_Euphausia_superba(par, data, auxData)
    
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if E_Hh >= E_Hb || E_Hb >= E_Hj || E_Hj >= E_Hp
    prdData = []; info = 0; return
  end

  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_0 = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  pars_tj = [g k l_T v_Hb v_Hj];
  [t_j, t_bb, l_j, l_bb] = get_tp(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];          % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % J, initial energy in egg
  Ww_0 = 1e6 * p_Am * U_E0 * w_E/ mu_E/ d_E;  % mug, initial wet weight 
  
  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = 1e3 * L_b^3 * (1 + f * w); % mg, wet weight at birth
  aT_b = (t_0 + t_b/ k_M)/ TC_0;    % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  Ww_j = 1e3 * L_j^3 * (1 + f * w); % mg, wet weight at metam
  tT_j = (t_j - t_b)/ k_M/ TC_0;    % d, time since birth at metam at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-length  
  rT_B = TC_0 * k_M/ 3/ (1 + f_tL/ g); L_i = L_m * f_tL;
  ELw_f = (L_i - (L_i - Lw_0f * del_M) * exp( - rT_B * tL_f(:,1)))/ del_M; % cm, length at time
  %
  ELw_m = (L_i - (L_i - Lw_0m * del_M) * exp( - rT_B * tL_m(:,1)))/ del_M; % cm, length at time
  %
  rT_B = TC_0 * k_M/ 3/ (1 + f_tW/ g); L_i = L_m * f_tW;
  EWw = max(L_b, L_i - (L_i - L_b) * exp( - rT_B * (tW(:,1) - aT_b))).^3 * (1 + f_tW * w); % cm, length at time

  % L-J_X data
  L = LjX(:,1) * del_M; Wd = L.^3 * d_V * (1 + f * w);
  EjT_X = TC_0 * L.^2 * w_X * p_Am/ kap_X./ Wd/ mu_X; % g/d.g, specific ingestion
  
  % L-J_C data
  L = del_M * LjC(:,1); Wd = L.^3 * d_V * (1 + f * w); % g, dry weight 
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  pACSJGRD = L_m^2 * p_Am * scaled_power(L, f, pars_R, l_b, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:,[1 7 5])')'; % mol/d, mineral fluxes
  EjT_C = TC_0 * J_M(:,1) * 32 ./ Wd;        % g/d.g, CO2 flux

  % L-N data
  EN = TC_0 * reprod_rate (LN(:,1) * del_M, f, pars_R) * 365/ 2;  % #/d, clutch size for spawning twice per yr

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tW   = EWw;
  prdData.LjX  = EjT_X;
  prdData.LjC  = EjT_C;
  prdData.LN   = EN;
end


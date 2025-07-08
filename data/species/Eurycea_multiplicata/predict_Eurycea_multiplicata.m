function [prdData, info] = predict_Eurycea_multiplicata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if f_L > 1.2 || f_T > 1.2 || f_B > 1.2 || E_Hj < E_Hb || E_Hj > E_Hp
     info = 0; prdData = []; return
  end

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tj, f); % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
    
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  
  % univariate data
  % time-length
  L_b = L_m * get_lb([g; k; v_Hb], f_T); L_i = L_m * f_T; r_B = k_M/ 3/ (1 + f_T/ g);
  [t, L] = ode45(@get_L, tL_T(:,1), L_b, [], T_A, T_ref, t_T0, 3, r_B, L_i);
  ELw_T = L/ del_M;
  %
  L_b = L_m * get_lb([g; k; v_Hb], f_L); L_i = L_m * f_L; r_B = k_M/ 3/ (1 + f_L/ g);
  [t, L] = ode45(@get_L, tL_L(:,1), L_b, [], T_A, T_ref, t_L0, 5, r_B, L_i);
  ELw_L = L/ del_M;
  %
  L_b = L_m * get_lb([g; k; v_Hb], f_B); L_i = L_m * f_B; r_B = k_M/ 3/ (1 + f_B/ g);
  [t, L] = ode45(@get_L, tL_B(:,1), L_b, [], T_A, T_ref, t_B0, 15, r_B, L_i);
  ELw_B = L/ del_M;
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN = TC * 365 * reprod_rate(LN(:,1)*del_M, f, pars_R);            % #, fecundity

  % pack to output
  prdData.tL_T = ELw_T;
  prdData.tL_L = ELw_L;
  prdData.tL_B = ELw_B;
  prdData.LN = EN;

end

function dL = get_L(t, L, T_A, T_ref, t_0, T_ampl, r_B, L_i)
  TC = tempcorr(C2K(15+T_ampl*sin(2*pi*(t-t_0)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
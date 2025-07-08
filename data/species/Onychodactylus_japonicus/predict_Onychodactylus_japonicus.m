function [prdData, info] = predict_Onychodactylus_japonicus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tj, f); % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, age at metam at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);% #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univariate data
  
  % time-length
  r_B = k_M/ 3/ (1 + f_tL/ g); L_i = f_tL * L_m; 
  [t, L] = ode45(@get_dL, tL_73(:,1), L_073 * del_M, [], r_B, L_i, T_ref, T_A); ELw_73 = L/ del_M;
  [t, L] = ode45(@get_dL, tL_74(:,1), L_074 * del_M, [], r_B, L_i, T_ref, T_A); ELw_74 = L/ del_M;
  [t, L] = ode45(@get_dL, tL_75(:,1), L_075 * del_M, [], r_B, L_i, T_ref, T_A); ELw_75 = L/ del_M;
  [t, L] = ode45(@get_dL, tL_76(:,1), L_076 * del_M, [], r_B, L_i, T_ref, T_A); ELw_76 = L/ del_M;
  [t, L] = ode45(@get_dL, tL_77(:,1), L_077 * del_M, [], r_B, L_i, T_ref, T_A); ELw_77 = L/ del_M;
  [t, L] = ode45(@get_dL, tL_78(:,1), L_078 * del_M, [], r_B, L_i, T_ref, T_A); ELw_78 = L/ del_M;
  
  prdData.tL_73 = ELw_73;
  prdData.tL_74 = ELw_74;
  prdData.tL_75 = ELw_75;
  prdData.tL_76 = ELw_76;
  prdData.tL_77 = ELw_77;
  prdData.tL_78 = ELw_78;

end

function dL = get_dL(t, L, r_B, L_i, T_ref, T_A)

  global tT

  TC = tempcorr(C2K(spline1(t,tT)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
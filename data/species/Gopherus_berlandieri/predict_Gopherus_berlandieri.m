function [prdData, info] = predict_Gopherus_berlandieri(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, carapace length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;

  % uni-variate data
  
  % time-length/weight
  r_B = k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL;
  [t, L] = ode45(@get_L, tL(:,1), L_b, [], L_i, r_B, T_ref, T_A, t_T);
  ELw = L/ del_M; % cm, carapace length
  %
  [t, L] = ode45(@get_L, tWw(:,1), L_b, [], L_i, r_B, T_ref, T_A, t_T);
  EWw = L.^3 * (1 + f_tL * ome); %g, wet weight

  % pack to output
  prdData.tL = ELw;
  prdData.tWw = EWw;
end

function dL = get_L(t, L, L_i, r_B, T_ref, T_A, t_T)
  TC = tempcorr(C2K(15 + 15*sin(2*pi*(t - t_T)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
  
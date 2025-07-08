function [prdData, info] = predict_Styela_plicata(par, data, auxData)  
  %% unpack par, chem, cpar and data

  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 

  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  TC_Tt2 = tempcorr(C2K(Tt2(:,1)), T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % cm^3, volume at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, diameter at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate diameter
  Ww_i = L_i^3 * (1 + f * w);       % cm^3, ultimate volume at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % time-length
  r_B = k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  L_i = L_m * f_tL;
  [t, L] = ode45(@get_L, [0; tL_win(:,1)], L_0, [], temp.tL_win, settle.tL_win, T_ref, T_A, L_i, r_B); % cm, diameter
  L(1) = []; ELw_win = L/ del_M;
  %
  [t, L] = ode45(@get_L, [0; tL_sum(:,1)], L_0, [], temp.tL_sum, settle.tL_sum, T_ref, T_A, L_i, r_B); % cm, diameter
  L(1) = []; ELw_sum = L/ del_M;
    
  % temperature doubling time of body length
  L_i = L_m * f_Tt2; L_b = L_m * get_lb([g; k; v_Hb], f_Tt2); r_B = k_M/ 3/ (1 + f_Tt2/ g);
  Et2 = log((L_i - L_b)/(L_i - 2 * L_b))/ r_B ./ TC_Tt2; 
  
  %% pack to output               
  prdData.tL_win = ELw_win;
  prdData.tL_sum = ELw_sum;
  prdData.Tt2 = Et2;

end

function dL = get_L(t, L, tT, t_0, T_ref, T_A, L_i, r_B)
  TC = tempcorr(spline1(t+t_0,tT), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end

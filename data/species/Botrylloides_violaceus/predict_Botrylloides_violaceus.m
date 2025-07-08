function [prdData, info] = predict_Botrylloides_violaceus(par, data, auxData)  

  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 

  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  TC_Tt2 = tempcorr(C2K(data.Tt2(:,1)), T_ref, T_A);

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

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
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
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % time-number of zooids
  tT = temp.tN_spr; tT(:,1) = tT(:,1) - settle.tN_spr;
  [t, EN_spr] = ode45(@get_L, [0; tN_spr(:,1)], N_0, [], tT, T_ref, T_A, f, L_b, L_m, v, g); 
  EN_spr(1) = []; % #, number of zooids
  %
  tT = temp.tN_sum; tT(:,1) = tT(:,1) - settle.tN_sum;
  [t, EN_sum] = ode45(@get_L, [0; tN_sum(:,1)], N_0, [], tT, T_ref, T_A, f, L_b, L_m, v, g); 
  EN_sum(1) = []; % #, number of zooids
  
  % temperature-doubling time t = ln(2)/r at Lb
  Et2 = log(2)/(v*(f_Tt2/ L_b - 1/L_m)/(f_Tt2 + g)) ./ TC_Tt2; % d, doubling time
    
  %% pack to output               
  prdData.tN_spr= EN_spr;
  prdData.tN_sum= EN_sum;
  prdData.Tt2 = Et2;

end

function dN = get_L(t, N, tT, T_ref, T_A, f, L_b, L_m, v, g)
  TC = tempcorr(spline1(t,tT), T_ref, T_A);
  r = TC * v * (f/L_b - 1/L_m)/(f+g);
  dN = r * N;
end
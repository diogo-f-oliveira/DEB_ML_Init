function [prdData, info] = predict_Boltenia_echinata(par, data, auxData)  
  %% unpack par, chem, cpar and data

  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
      
  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % cm^3, volume at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty 
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
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % time-length
  r_B = k_M/ 3/ (1 + f_tL1973/ g); % 1/d, von Bert growth rate
  Lw_i = L_m * f_tL1973/ del_M; % cm, diameter
  [t, ELw_1973] = ode45(@get_L, tL_1973(:,1), Lw_01973, [], start.tL_1973, T_ref, T_A, Lw_i, r_B); % cm, diameter
  %
  r_B = k_M/ 3/ (1 + f_tL1974/ g); % 1/d, von Bert growth rate
  Lw_i = L_m * f_tL1974/ del_M; % cm, diameter
  [t, ELw_1974] = ode45(@get_L, tL_1974(:,1), Lw_01974, [], start.tL_1974, T_ref, T_A, Lw_i, r_B); % cm, diameter
      
  
  %% pack to output               
  prdData.tL_1973 = ELw_1973;
  prdData.tL_1974 = ELw_1974;

end

function dL = get_L(t, L, t_0, T_ref, T_A, L_i, r_B)
  TC = tempcorr(C2K(9+7*cos((150+t+t_0)/365*2*pi)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end

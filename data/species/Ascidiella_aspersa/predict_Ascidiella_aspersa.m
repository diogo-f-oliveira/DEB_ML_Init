function [prdData, info] = predict_Ascidiella_aspersa(par, data, auxData)  
  %% unpack par, chem, cpar and data

  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 

  if f_tL000 < 0 || f_tLsum > 2 || f_tL200 > f_tL300
      prdData = []; info = 0; return
  end
      
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
  r_B = k_M/ 3/ (1 + f_tLspr/ g); % 1/d, von Bert growth rate
  Lw_i = L_m * f_tLspr/ del_M;
  [t, ELw_spr] = ode45(@get_L, tL_spr(:,1), Lw_0spr, [], temp.tL_spr, settle.tL_spr, T_ref, T_A, Lw_i, r_B); % cm, diameter
  %
  r_B = k_M/ 3/ (1 + f_tLsum/ g); % 1/d, von Bert growth rate
  Lw_i = L_m * f_tLsum/ del_M;
  [t, ELw_sum] = ode45(@get_L, tL_sum(:,1), Lw_0sum, [], temp.tL_sum, settle.tL_sum, T_ref, T_A, Lw_i, r_B); % cm, diameter
  %
  
  tf = [0 f_tL000; 100 f_tL100; 200 f_tL200; 300 f_tL300];
  [t, ELw_2010] = ode45(@get_Lf, tL_2010(:,1), Lw_02010, [], temp.tL_2010, settle.tL_2010, T_ref, T_A, tf, del_M, L_m, k_M, g); % cm, diameter
  %
  [t, ELw_2011] = ode45(@get_Lf, tL_2011(:,1), Lw_02011, [], temp.tL_2011, 365+settle.tL_2011, T_ref, T_A, tf, del_M, L_m, k_M, g); % cm, diameter
  %
  [t, ELw_2012] = ode45(@get_Lf, tL_2012(:,1), Lw_02012, [], temp.tL_2012, 730+settle.tL_2012, T_ref, T_A, tf, del_M, L_m, k_M, g); % cm, diameter
  %
  [t, ELw_2013] = ode45(@get_Lf, tL_2013(:,1), Lw_02013, [], temp.tL_2013, 1095+settle.tL_2013, T_ref, T_A, tf, del_M, L_m, k_M, g); % cm, diameter
    
  
  %% pack to output               
  prdData.tL_spr = ELw_spr;
  prdData.tL_sum = ELw_sum;
  prdData.tL_2010 = ELw_2010;
  prdData.tL_2011 = ELw_2011;
  prdData.tL_2012 = ELw_2012;
  prdData.tL_2013 = ELw_2013;

end

function dL = get_L(t, L, tT, t_0, T_ref, T_A, L_i, r_B)
  TC = tempcorr(spline1(t+t_0,tT), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end

function dL = get_Lf(t, L, tT, t_0, T_ref, T_A, tf, del_M, L_m, k_M, g)
  TC = tempcorr(spline1(t+t_0,tT), T_ref, T_A);
  f = spline(t, tf);
  r_B = k_M/ 3/ (1 + f/ g); Lw_i = L_m * f/ del_M;
  dL = TC * r_B * (Lw_i - L);
end
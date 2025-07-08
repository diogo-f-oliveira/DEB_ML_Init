function [prdData, info] = predict_Semaprochilodus_insignis(par, data, auxData)
  
  par.E_Hj = 1.05*par.E_Hb;
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); % all rates/times at same temp
  kT_M = k_M * TC; % 1/d, maintenance rate coefficient

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth 
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, total length at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);  % 1/d, max reproduction rate 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % time-length post metam: varying temperature
  r_B = rho_B * k_M;
  [t, L] = ode45(@dget_L, tL(:,1), L_j, [], L_i, r_B, T_ref, T_A); % cm, struc length
  ELw = L/ del_M; % cm, standard length
  
  % pack to output
  prdData.tL = ELw;

end

function dL = dget_L(t, L, L_i, r_B, T_ref, T_A)
  TC = tempcorr(C2K(24 + 5 * sin(2*pi*(t+220)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L); 
end
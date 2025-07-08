function [prdData, info] = predict_Pholis_nebulosa(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  s_M = l_j/ l_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
   
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R);               % reproduction rate 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span 
    
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % time-length/weight
  options = odeset('Events',@event_j, 'AbsTol',1e-9, 'RelTol',1e-9); 

  % time-length 
  T_m = 22; T_a = 8; % C, mean and amplitude of temperature
  [tau, vel] = ode45(@dget_lj, [0;tL(:,1)*k_M], [v_Hb, f_tL, l_b], options, f, T_ref, T_A, T_m, T_a, tau_0, k_M, l_b, g, k, v_Hj);
  vel(1,:)=[]; ELw = L_m * vel(:,3)/ del_M;   % cm, total length

  % pack to output
  prdData.tL = ELw;

end

function [value,isterminal,direction] = event_j(tau, vel, f, T_ref, T_A, T_m, T_a, tau_0, k_M, l_b, g, k, v_Hj)
  % vel: 3-vector with [v_H; e; l]
  value = v_Hj - vel(1);
  isterminal = 0;
  direction  = 0; 
end

function dvel = dget_lj (tau, vel, f, T_ref, T_A, T_m, T_a, tau_0, k_M, l_b, g, k, v_Hj)
  % tau: scaled time since birth 
  % v_H continues changing after v_Hp for simplicity's sake, but is not used
  persistent s_M % set while v_H<v_Hj, used after v_H>v_Hj
  
  v_H = vel(1); e = vel(2); l = vel(3);
   
  TC = tempcorr(C2K(T_m+T_a*sin(2*pi*(tau - tau_0)/365/k_M)), T_ref, T_A); 
  if v_H < v_Hj; s_M = l/ l_b; end  % s_M = acceleration factor, requires v_H(0) < v_Hj
  de = (f - e) * g/ l; % d/d tau e
  rho = g * (e * s_M/ l - 1)/ (e + g); % -, spec growth rate
  dl = l * rho/ 3; % -, d/d tau l  
  dv_H = e * l^3 * (s_M/ l - rho/ g) - k * v_H; % -, d/d tau v_H
  dvel = TC * [dv_H; de; dl]; % pack to output
 
end

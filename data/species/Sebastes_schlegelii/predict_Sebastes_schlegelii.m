function [prdData, info] = predict_Sebastes_schlegelii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_C = tempcorr(temp.tL_C, T_ref, T_A); 
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, ultimate reproduction rate at TL 45.6 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % uni-variate data 

  % time-length/weight
  options = odeset('Events',@event_j, 'AbsTol',1e-9, 'RelTol',1e-9); 

  % XiXiakou
  T_X = K2C(temp.tL_X);
  [tau, vel] = ode45(@dget_lj, [0;tL_X(:,1)*k_M], [v_Hb, f_X, l_b], options, f, T_ref, T_A, T_X, T_aX, k_M, l_b, g, k, v_Hj);
  vel(1,:)=[]; ELw_X = L_m * vel(:,3)/ del_M;   % cm, total length
  %
  [tau, vel] = ode45(@dget_lj, [0;tW_X(:,1)*k_M], [v_Hb, f_X, l_b], options, f, T_ref, T_A, T_X, T_aX, k_M, l_b, g, k, v_Hj);
  vel(1,:)=[]; EWw_X = (L_m * vel(:,3)).^3 .* (1 + vel(:,2) * ome);   % g, weight
  %
  % Changdao
  T_C = K2C(temp.tL_C);
  [tau, vel] = ode45(@dget_lj, [0;tL_C(:,1)*k_M], [v_Hb, f_C, l_b], options, f, T_ref, T_A, T_C, T_aC, k_M, l_b, g, k, v_Hj);
  vel(1,:)=[]; ELw_C = L_m * vel(:,3)/ del_M;   % cm, total length
  %
  [tau, vel] = ode45(@dget_lj, [0;tW_C(:,1)*k_M], [v_Hb, f_C, l_b], options, f, T_ref, T_A, T_C, T_aC, k_M, l_b, g, k, v_Hj);
  vel(1,:)=[]; EWw_C = (L_m * vel(:,3)).^3 .* (1 + vel(:,2) * ome);   % g, weight
  % Qiansandao
  T_Q = K2C(temp.tL_Q);
  [tau, vel] = ode45(@dget_lj, [0;tL_Q(:,1)*k_M], [v_Hb, f_Q, l_b], options, f, T_ref, T_A, T_Q, T_aQ, k_M, l_b, g, k, v_Hj);
  vel(1,:)=[]; ELw_Q = L_m * vel(:,3)/ del_M;   % cm, total length
  %
  [tau, vel] = ode45(@dget_lj, [0;tW_Q(:,1)*k_M], [v_Hb, f_Q, l_b], options, f, T_ref, T_A, T_Q, T_aQ, k_M, l_b, g, k, v_Hj);
  vel(1,:)=[]; EWw_Q = (L_m * vel(:,3)).^3 .* (1 + vel(:,2) * ome);   % g, weight

  % length - weight
  EWw_CL = (LW_C(:,1)*del_M).^3 * (1 + f_C * ome);
   
  % weight - fecundity
  EN_C =  TC_C * 365 * reprod_rate_j((WN_C/(1 + f_C * ome)).^(1/3), f_C, pars_R); % #/d, ultimate reproduction rate at TL 45.6 cm

%% pack to output
  prdData.tL_X = ELw_X;
  prdData.tL_C = ELw_C;
  prdData.tL_Q = ELw_Q;
  prdData.tW_X = EWw_X;
  prdData.tW_C = EWw_C;
  prdData.tW_Q = EWw_Q;
  prdData.LW_C = EWw_CL;
  prdData.WN_C = EN_C;
end

function [value,isterminal,direction] = event_j(tau, vel, f, T_ref, T_A, T_m, T_a, k_M, l_b, g, k, v_Hj)
  % vel: 3-vector with [v_H; e; l]
  value = v_Hj - vel(1);
  isterminal = 0;
  direction  = 0; 
end

function dvel = dget_lj (tau, vel, f, T_ref, T_A, T_m, T_a, k_M, l_b, g, k, v_Hj)
  % tau: scaled time since birth 
  % v_H continues changing after v_Hp for simplicity's sake, but is not used
  persistent s_M % set while v_H<v_Hj, used after v_H>v_Hj
  
  v_H = vel(1); e = vel(2); l = vel(3);
   
  TC = tempcorr(C2K(T_m+T_a*sin(2*pi*tau/365/k_M)), T_ref, T_A); 
  if v_H < v_Hj; s_M = l/ l_b; end  % s_M = acceleration factor, requires v_H(0) < v_Hj
  de = (f - e) * g/ l; % d/d tau e
  rho = g * (e * s_M/ l - 1)/ (e + g); % -, spec growth rate
  dl = l * rho/ 3; % -, d/d tau l  
  dv_H = e * l^3 * (s_M/ l - rho/ g) - k * v_H; % -, d/d tau v_H
  dvel = TC * [dv_H; de; dl]; % pack to output
 
end

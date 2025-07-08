function [prdData, info] = predict_Dallia_pectoralis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); 
  kT_M = k_M * TC; 

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3 * (1 + f * ome);     % g, wet weight at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;

  % time-length/weight post metam
  r_B = k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  Lw_b = L_m * get_lb([g k v_Hb], f_tL); Lw_i = L_m * f_tL/ del_M; % cm, total length
  [t, L] =  ode45(@get_L, [0; tL(:,1)], Lw_b, [], T_ref, T_A, t_T, Lw_i, r_B); L(1) = []; ELw = L;
  
  % length - weight
  EWw = (LWw(:,1) * del_M).^3 * (1 + f_tL * ome); % g, wet weight
  
  % weight - ovary weight
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  EWw_R = Ww_b * 365 * TC * reprod_rate((WWR(:,1)/(1 + f_tL * ome)).^(1/3), f_tL, pars_R); % g, ovary weight

  % pack to output
  prdData.tL = ELw;
  prdData.LWw = EWw;
  prdData.WWR = EWw_R;
end

function dL = get_L(t, L, T_ref, T_A, t_T, L_i, r_B)
  TC = tempcorr(C2K(max(0,5+20 * sin((t + t_T) * 2 * pi/ 365))), T_ref, T_A); 
  dL = TC * r_B * (L_i - L);
end
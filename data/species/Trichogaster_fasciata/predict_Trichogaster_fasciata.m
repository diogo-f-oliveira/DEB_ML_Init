function [prdData, info] = predict_Trichogaster_fasciata(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);


  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
      
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, fork length at puberty at f

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];    % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);             % #/d, max reprod rate 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;               % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % univariate data

  % time-length, weight 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i; r_B = rho_B * k_M; r_j = rho_j * k_M;
  [~, L] = ode45(@get_dL,tL(:,1),L_b,[],T_ref,T_A,t_0,L_j,L_i,r_j,r_B);
  ELw = L/ del_M; % cm, total length
  
  prdData.tL = ELw;
  
end

function dL = get_dL(t,L,T_ref,T_A,t_0,L_j,L_i,r_j,r_B)
  TC = tempcorr(C2K(20+10*sin(2*pi*(t-t_0)/365)), T_ref, T_A);
  if L < L_j
    dL = TC * r_j * L/ 3;
  else
   dL = TC * r_B * (L_i - L);
  end
end

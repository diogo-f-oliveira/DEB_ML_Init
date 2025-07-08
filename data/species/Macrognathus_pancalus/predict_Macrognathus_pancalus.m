function [prdData, info] = predict_Macrognathus_pancalus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  

  % birth
  aT_b = tau_b/ kT_M;                % d, age at birth at f and T
  L_b = L_m * l_b;                 % cm, struct length at birth
  Ww_b = L_b^3 * (1 + f * w);      % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

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
  [l_p, l_b] = get_lp(pars_tp, f_tL);
  L_b = L_m * l_b;  L_i = L_m * f_tL; r_B = k_M/3/(1+f/g);
  [~, L] = ode45(@get_dL,tL(:,1),L_b,[],T_ref,T_A,t_0,L_i,r_B);
  ELw = L/ del_M; % cm, total length
  
  prdData.tL = ELw;
  
end

function dL = get_dL(t,L,T_ref,T_A,t_0,L_i,r_B)
  TC = tempcorr(C2K(20+10*sin(2*pi*(t-t_0)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end

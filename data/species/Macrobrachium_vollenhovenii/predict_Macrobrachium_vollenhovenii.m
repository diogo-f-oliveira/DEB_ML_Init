function [prdData, info] = predict_Macrobrachium_vollenhovenii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 *(1 + f * ome);        % g, wet weight at birth
  
  % metam
  aT_j = tau_j/(k_M*TC);             % age at recruitment
  L_j = l_j * L_m;                  % cm, structural length at recruitment at f
  Lw_j = L_j/del_M;                % cm, total length at recruitment at f

  % puberty 
  aT_p = tau_p/(k_M*TC);             % age at puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length, post metam 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC;  r_B = rho_B * k_M;  
%   L_j = 2.45*del_M ; %use data instead
  L_j = L_m * l_j; L_i = L_m * l_i;% tT_j = (tau_j - tau_b)/ kT_M; 
  [t, L] = ode45(@get_dL, tL(:,1), L_j, [], L_i, r_B, T_ref, T_A); % cm, struct length
  ELw = L/ del_M; % cm, total length
  
  % pack to output
  prdData.tL = ELw;
end
function dL = get_dL(t, L, L_i, r_B, T_ref, T_A)
  TC = tempcorr(C2K(28+4*sin(2*pi*(t+50)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
function [prdData, info] = predict_Siganus_luridus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A); 
  TC_am    = tempcorr(temp.am, T_ref, T_A); 
  TC_tL_2 = tempcorr(temp.tL_2, T_ref, T_A);
  TC_N = tempcorr(temp.LN, T_ref, T_A);

% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);


  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(end,1)/ TC_ab; % d, age at hatch
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = tau_b/ k_M/ TC_ab;           % d, age at birth
    
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
   
  % Reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);  % #/d, max reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ah = aT_h;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univariate data
  
   % time-length1 
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL1);
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i; r_j = rho_j * k_M; r_B = rho_B * k_M;
  [t, L] = ode45(@dget_L, [0;tL_1(:,1)], L_b, [], T_ref, T_A, temp.tL_1, L_j, L_i, r_j, r_B);
  L(1) = []; ELw_1 = L/ del_M;
  %  
  tvel = get_tj(pars_tj, f_tL2, [], tL_2(:,1)*k_M*TC_tL_2);
  ELw_2 = L_m * tvel(:,4)/ del_M; % cm, total length
  
  % length-weight
  EWw_1 = (LW_1(:,1) * del_M).^3 * (1 + f_tL1 * w); % g, wet weight
  % 
  EWw_2 = (LW_2(:,1) * del_M).^3 * (1 + f_tL2 * w); % g, wet weight

  % length - reproduction rate
  EN = TC_N * 365 * reprod_rate_j(LN(:,1) * del_M, f, pars_R);                    % #/d, ultimate reproduction rate at T

  %% pack to output
  prdData.tL_1 = ELw_1;
  prdData.tL_2 = ELw_2;
  prdData.LW_1 = EWw_1;
  prdData.LW_2 = EWw_2;
  prdData.LN = EN;
end

function dL = dget_L(t, L, T_ref, T_A, tT, L_j, L_i, r_j, r_B)
  % t: time since birth
  % L: struc length
  % dL: dL/dt)
  
  TC = tempcorr(C2K(spline1(mod(t,365),tT)), T_ref, T_A);
  if L<L_j
    dL = TC * r_j/ 3;
  else
    dL = TC * r_B * (L_i - L);
  end
   
end






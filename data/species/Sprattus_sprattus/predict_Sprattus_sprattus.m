function [prdData, info] = predict_Sprattus_sprattus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_1995, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if ~info; prdData = []; return; end

  % birth
  L_b = L_m * l_b;                   % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3*(1 + f * ome);        % g, weight at birth
  %Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  %aT_b = t_b/ k_M/ TC_ab;           % d, age at birth of foetus at f and T
  
  % metam
  L_j = L_m * l_j;                   % cm, structural length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  %aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data

  % length-weight
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight at L_w
  
  % length-fecundity
  EN = TC_LN * 365e-3 * reprod_rate_j(LN(:,1) * del_M, f, pars_R);  % #, 10^3 eggs at length

  % time-length 1995/1996 
  tf = [10 1; 40 f_40];
  [t, EL] = ode45(@get_EL, tL_1995(:,1), [E_m, L_b], [], tf, L_j, TC_tL * k_M * rho_j, TC_tL * v, g, E_m, L_m, TC_tL * p_Am);
  ELw_1995 = EL(:,2)/ del_MS; % cm, SL
  %
  [t, EL] = ode45(@get_EL, tL_1996(:,1), [E_m, L_b], [], tf, L_j, TC_tL * k_M * rho_j, TC_tL * v, g, E_m, L_m, TC_tL * p_Am);
  ELw_1996 = EL(:,2)/ del_MS; % cm, SL

  % time-length-weight
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tLW);
  Lw_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  r_j = rho_j * k_M;  r_B = rho_B * k_M; 
  [t, L] = ode45(@get_dL, [0;tLW(:,1)], L_b, [], T_A, T_ref, t_0, L_j, L_i, r_j, r_B);
  L(1) = []; ELw = L/ del_M; EWw = L.^3 * (1 + f_tLW * ome); % cm, g
  
  % pack to output
  prdData.tLW = [ELw EWw];
  prdData.tL_1995 = ELw_1995;
  prdData.tL_1996 = ELw_1996;
  prdData.LW = EWw_L;
  prdData.LN = EN;
end

function dL = get_dL(t, L, T_A, T_ref, t_0, L_j, L_i, r_j, r_B)
  TC = tempcorr(C2K(9.5+6.5*sin(2*pi*(t-t_0)/365)), T_ref, T_A);
  if L < L_j
     dL = TC * r_j/ 3 * L;
  else
     dL = TC * r_B * (L_i - L);
  end
end

function dEL = get_EL(t, EL, tf, L_j, rT_j, vT, g, E_m, L_m, pT_Am)
  E = EL(1); % J/cm^3, reserve density [E}
  L = EL(2); % cm, structural length
  
  f = spline1(t, tf);                    % -, scaled functional response at t
  if L < L_j
    dE = 0;
    dL = L * rT_j/ 3;
  else
    dE = (f * pT_Am - E * vT)/ L;          % J/d.cm^3, change in reserve density d/dt [E]
    e = E/ E_m;                            % -, scaled reserve density
    r = vT * (e/ L - 1/ L_m)/ (e + g);     % 1/d, specific growth rate
    dL = L * r/ 3;                         % cm/d, change in structural length d/dt L
  end
  dEL = [dE; dL]; % catenate for output
end

function [prdData, info] = predict_Salvelinus_alpinus(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
  if E_Hh >= E_Hb   % maturity level consistency
   info = 0; prdData = {}; return
  end

%% compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  M_Eh = J_E_Am * aUL(2,2);        % mol, reserve at hatch at f
  L_h = aUL(2,3);                  % cm, structural length at f
  Ww_h = L_h^3 + M_Eh * w_E/ d_E;  % g, wet weight at hatch at f
  aT_h = aUL(2,1)/ TC_ah;          % d, age at hatch at f and T

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth of foetus at f and T


  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

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
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwh = Ww_h;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
    
  % t-Ww-data
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tW);
  rT_B = TC_tW * rho_B * k_M; rT_j = TC_tW * rho_j * k_M; % 1/d, von Bert, exponential growth rate
  aT_b = t_b/ k_M/ TC_tW; aT_j = t_j/ k_M/ TC_tW;
  L_b = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m;
  L_0 = (W_0/ (1 + f_tW * w))^(1/3); % cm, structural length at t = 0 
  if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j;
    t_bj = tW(tW(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = tW(tW(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
  else 
    L = L_i - (L_i - L_0) * exp( - rT_B * tW(:,1)); % cm, expected length at time
  end
  EWw = L.^3 * (1 + f_tW * w);

  % pack to output
  prdData.tW = EWw;
     
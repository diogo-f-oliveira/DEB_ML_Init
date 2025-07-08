function [prdData, info] = predict_Scyliorhinus_retifer(par, data, auxData)  
 
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth 
  aT_b = t0 + t_b/ k_M/ TC;         % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(44*del_M, f, pars_R); % #/d, ultimate reproduction rate at TL 44 cm
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  pars_tpm = [g; k; l_T; v_Hb; v_Hpm]; % compose parameter vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f); % -, scaled times & lengths at f
  L_pm = l_pm * L_m; Lw_pm = L_pm/ del_M;

  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  % length - weight;
  EWw = (LWw(:,1)*del_M).^3*(1 + f * ome); % g, weit weight

  % embryo t-L data
  par_UE0 = [V_Hb/ TC; g; k_J * TC; k_M * TC; v * TC]; % pars for initial scaled reserve
  UE0 = initial_scaled_reserve(f_tL, par_UE0); LUH0 = [1e-6; UE0; 0];
  t = tLe(:,1) - t0; t = [0; t(t>0)]; % d, age
  [t LUH] = ode45(@dget_LUH, t, LUH0, [], kap, v * TC, k_J * TC, g, L_m);
  Lw = LUH(:,1)/ del_M; % cm, total length of embryo
  Lw(1) = []; n = size(tLe,1); n_a = size(Lw,1); ELw_e = [zeros(n - n_a,1); Lw]; 

  %% pack to output
  prdData.tLe = ELw_e;
  prdData.LWw = EWw;
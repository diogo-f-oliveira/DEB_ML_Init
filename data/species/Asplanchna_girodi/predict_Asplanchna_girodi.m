function [prdData, info] = predict_Asplanchna_girodi(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); info = 1;
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tV_20, T_ref, T_A);
      
  % birth
  pars_lb = [g; k; v_Hb];                      % compose parameter vector
  [t_b_20, l_b_20] = get_tb(pars_lb, f_20);    % -, scaled and length at birth at f
  [t_b_30, l_b_30] = get_tb(pars_lb, f_30);    % -, scaled and length at birth at f
  [t_b_60, l_b_60] = get_tb(pars_lb, f_60);    % -, scaled and length at birth at f
  [t_b_120, l_b_120] = get_tb(pars_lb, f_120); % -, scaled and length at birth at f
  [t_b_240, l_b_240] = get_tb(pars_lb, f_240); % -, scaled and length at birth at f
  L_b_20 = L_m * l_b_20; L_b_60 = L_m * l_b_60; L_b_240 = L_m * l_b_240;
  V_b = 1e6 * L_b_240^3;

  % puberty and ultimate size
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [t_p_20, t_b_20, l_p_20, l_b_20]     = get_tp(pars_tp, f_20, l_b_20); % -, scaled length at birth at f
  L_p_20 = L_m * l_p_20;              % cm, structural length at puberty at f
  [t_p_30, t_b_20, l_p_30, l_b_30]     = get_tp(pars_tp, f_30, l_b_30); % -, scaled length at birth at f
  L_p_30 = L_m * l_p_30;              % cm, structural length at puberty at f
  [t_p_60, t_b_60, l_p_60, l_b_60]     = get_tp(pars_tp, f_60, l_b_60); % -, scaled length at birth at f
  L_p_60 = L_m * l_p_60;              % cm, structural length at puberty at f
  [t_p_120, t_b_120, l_p_120, l_b_120] = get_tp(pars_tp, f_120, l_b_120); % -, scaled length at birth at f
  L_p_120 = L_m * l_p_120;            % cm, structural length at puberty at f
  [t_p_240, t_b_240, l_p_240, l_b_240] = get_tp(pars_tp, f_240, l_b_240); % -, scaled length at birth at f
  L_p_240 = L_m * l_p_240;            % cm, structural length at puberty at f
  EaT_p = TC * [t_p_20; t_p_30; t_p_60; t_p_120; t_p_240]/ k_M; % d, age at puberty
  EaT_p = spline1(JXap(:,1), [[20; 30; 60; 120; 240], EaT_p]);  % used for plotting
  EV_p = 1e6 * [L_p_20, L_p_30, L_p_60, L_p_120, L_p_240].^3';  % 10^6 mum^3, volume at puberty
  EV_p = spline1(JXVp(:,1), [[20; 30; 60; 120; 240], EV_p]);    % used for plotting
  EV_i = 1e6 * (L_m * [f_20, f_30, f_60, f_120, f_240]').^3;    % 10^6 mum^3, ultimate volume
  EV_i = spline1(JXVi(:,1), [[20; 30; 60; 120; 240], EV_i]);    % used for plotting

  % growth
  l_i_20 = f_20 - l_T; L_i_20 = L_m * l_i_20;          % cm, ultimate structural length at f
  ir_B = 3/ k_M + 3 * f_20 * L_m/ v; rT_B = TC/ ir_B;  % d, 1/von Bert growth rate
  L_20 = L_i_20 - (L_i_20 - L_b_20) * exp( - rT_B * tV_20(:,1)); % cm, structural length at time
  EV_20 = L_20.^3 * 1e6;                               % 10^6 mum^3, volume-at-time
  l_i_60 = f_60 - l_T; L_i_60 = L_m * l_i_60;          % cm, ultimate structural length at f
  ir_B = 3/ k_M + 3 * f_60 * L_m/ v; rT_B = TC/ ir_B;  % d, 1/von Bert growth rate
  L_60 = L_i_60 - (L_i_60 - L_b_60) * exp( - rT_B * tV_60(:,1)); % cm, structural length at time
  EV_60 = L_60.^3 * 1e6;                               % 10^6 mum^3, volume-at-time
  l_i_240 = f_240 - l_T; L_i_240 = L_m * l_i_240;      % cm, ultimate structural length at f
  ir_B = 3/ k_M + 3 * f_240 * L_m/ v; rT_B = TC/ ir_B; % d, 1/von Bert growth rate
  L_240 = L_i_240 - (L_i_240 - L_b_240) * exp( - rT_B * tV_240(:,1)); % cm, structural length at time
  EV_240 = L_240.^3 * 1e6;                             % 10^6 mum^3, volume-at-time
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  R_i_20 =  reprod_rate(L_m * f_20,  f_20,  pars_R); % #/d, ultimate reproduction rate
  R_i_30 =  reprod_rate(L_m * f_30,  f_30,  pars_R); % #/d, ultimate reproduction rate
  R_i_60 =  reprod_rate(L_m * f_60,  f_60,  pars_R); % #/d, ultimate reproduction rate
  R_i_120 = reprod_rate(L_m * f_120, f_120, pars_R); % #/d, ultimate reproduction rate
  R_i_240 = reprod_rate(L_m * f_240, f_240, pars_R); % #/d, ultimate reproduction rate
  ERT_i = TC * [R_i_20; R_i_30; R_i_60; R_i_120; R_i_240]; % #/d, reproduction rate
  ERT_i = spline1(JXRi(:,1), [[20; 30; 60; 120; 240],ERT_i]); % used for plotting

  % life span; NO2-tox propto paramecium/d, see Fig 6.2 Kooy2010
  %   this is because paramecium is fed with lettuce, which is rich in NO3
  pars_tm = [g; l_T; (h_a + 20*hf_a)/ k_M^2; 1e-4]; % compose parameter vector at T_ref
  t_m_20 =  get_tm_s(pars_tm, f_20,  l_b_20);  % -, scaled mean life span at T_ref
  pars_tm = [g; l_T; (h_a + 30*hf_a)/ k_M^2; 1e-4]; % compose parameter vector at T_ref
  t_m_30 =  get_tm_s(pars_tm, f_30,  l_b_30);  % -, scaled mean life span at T_ref
  pars_tm = [g; l_T; (h_a + 60*hf_a)/ k_M^2; 1e-4]; % compose parameter vector at T_ref
  t_m_60 =  get_tm_s(pars_tm, f_60,  l_b_60);  % -, scaled mean life span at T_ref
  pars_tm = [g; l_T; (h_a + 120*hf_a)/ k_M^2; 1e-4]; % compose parameter vector at T_ref
  t_m_120 = get_tm_s(pars_tm, f_120, l_b_120); % -, scaled mean life span at T_ref
  pars_tm = [g; l_T; (h_a + 240*hf_a)/ k_M^2; 1e-4]; % compose parameter vector at T_ref
  t_m_240 = get_tm_s(pars_tm, f_240, l_b_240); % -, scaled mean life span at T_ref
  EaT_m = TC * [t_m_20; t_m_30; t_m_60; t_m_120; t_m_240]/ k_M; % d, mean life span at T
  EaT_m = spline1(JXam(:,1), [[20; 30; 60; 120; 240],EaT_m]);   % used for plotting

  % pack to output
  prdData.Vb = V_b;
  prdData.tV_20 = EV_20;
  prdData.tV_60 = EV_60;
  prdData.tV_240 = EV_240;
  prdData.JXVp = EV_p;
  prdData.JXVi = EV_i;
  prdData.JXRi = ERT_i;
  prdData.JXap = EaT_p;
  prdData.JXam = EaT_m;
  
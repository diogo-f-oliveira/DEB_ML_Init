function [prdData, info] = predict_Percopsis_omiscomaycus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
  %% customized filters
  if E_Hh >= E_Hb   % maturity level consistency
    info = 0;
    prdData = {};
    return
  end

%% compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_RL = tempcorr(temp.RL, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p t_b l_p l_b info] = get_tp(pars_tp, f);

  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC_ah;          % d, age at hatch at f and T
  M_Eh = J_E_Am * aUL(end,2);      % mol, reserve at hatch at f
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_M;               % cm, S-V length at hatch at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * (f - l_T);            % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % length at 20.56 g
  Lw_20 = (20.56/ (1 + w * f))^(1/3)/ del_M; % cm, total length 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_L = TC_RL * reprod_rate(14.6 * del_M, f, pars_R);    % reproduction rate at 14.6 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.L20 = Lw_20;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.RL = RT_L;

  %% uni-variate data
    
  f = f_tL; 
  pars_lb = [g; k; v_Hb];                 % compose parameter vector
  Lw_b = L_m * get_lb(pars_lb, f)/ del_M; % -, scaled length and age at birth at f
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_tL/ ir_B; % d, 1/von Bert growth rate
  Lw_i = (f * L_m - L_T)/ del_M; % ultimate physical length at f
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL(:,1)); % cm, expected physical length at time
  ELw_f = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL_f(:,1)); % cm, expected physical length at time
  ELw_m = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL_m(:,1)); % cm, expected physical length at time

  % pack to output
  prdData.tL_m = ELw_m;
  prdData.tL_f = ELw_f;
  prdData.tL = ELw;
     
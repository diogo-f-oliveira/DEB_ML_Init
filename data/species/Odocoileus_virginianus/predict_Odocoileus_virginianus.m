function [prdData, info] = predict_Odocoileus_virginianus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp 1]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
  if ~info
    prdData = []; return
  end
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ k_M/ TC;        % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ k_M/ TC;      % d, time since birth at fledging at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  %% Ww-JO dataset
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  X_gas = 1/ 24.4;    % M, mol of gas per litre at 20 C and 1 bar 
  f = 1;
  pT_ref = TC * p_Am * L_m^2;             % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hx; U_Hp];
  L = (WJO(:,1)/ (1 + f * w)).^(1/3);     % cm, structural length
  pACSJGRD = pT_ref * scaled_power_old(L, f, pars_power, l_b, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
  JM =  - pADG * eta_O' * O2M;            % mineral fluxes
  EJO = 1e3 * JM(:,3)/ 24/ X_gas/ 60;     % ml/min, oxygen consumption rate

  %% tL_e and tW_e datasets
  f = f_e; L_i = f * L_m; 
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; rT_B = r_B * TC; % d, 1/von Bert growth rate 
  L = L_i * (1 - exp( - rT_B * max(0, tL_e(:,1)- t_0))); % cm, struct length
  ELw_e = L/ del_M;
  L = L_i * (1 - exp( - rT_B * max(0, tW_e(:,1)- t_0))); % cm, struct length
  EWw_e = L.^3 * (1 + f * w); % g, wet weight
  %% tL datasets
  f = 1; L_i = f * L_m; 
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; rT_B = r_B * TC; % d, 1/von Bert growth rate
  [~, ~, ~, ~, ~, l_b, info] = get_tx(pars_tx, f); L_b = l_b * L_m; % -, scaled age at puberty
  if ~info
    prdData = []; return
  end
  L = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)); % cm, struct length
  ELw = L/ del_M;
  %% tW_BH dataset
  f = f_BH; L_i = f * L_m; 
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; rT_B = r_B * TC; % d, 1/von Bert growth rate
  [~, ~, ~, ~, ~, l_b, info] = get_tx(pars_tx, f); L_b = l_b * L_m; % -, scaled age at puberty
  if ~info
    prdData = []; return
  end
  L = L_i - (L_i - L_b) * exp( - rT_B * tW_BH(:,1)); % cm, struct length
  EWw_BH = L.^3 * (1 + f * w); % g, wet weight
  %% tW_SD dataset
  f = f_SD; L_i = f * L_m; 
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; rT_B = r_B * TC; % d, 1/von Bert growth rate
  [~, ~, ~, ~, ~, l_b, info] = get_tx(pars_tx, f); L_b = l_b * L_m; % -, scaled age at puberty
  if ~info
    prdData = []; return
  end
  L = L_i - (L_i - L_b) * exp( - rT_B * tW_SD(:,1)); % cm, struct length
  EWw_SD = L.^3 * (1 + f * w); % g, wet weight
  %% tW dataset
  f = f_tW; L_i = f * L_m; 
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; rT_B = r_B * TC; % d, 1/von Bert growth rate
  [~, ~, ~, ~, ~, l_b, info] = get_tx(pars_tx, f); L_b = l_b * L_m; % -, scaled age at puberty
  if ~info
    prdData = []; return
  end
  L = L_i - (L_i - L_b) * exp( - rT_B * tW(:,1)); % cm, struct length
  EWw = L.^3 * (1 + f * w); % g, wet weight

  
  %% pack to output
  prdData.tL_e = ELw_e;
  prdData.tW_e = EWw_e;
  prdData.tL = ELw;
  prdData.tW = EWw;
  prdData.tW_BH = EWw_BH;
  prdData.tW_SD = EWw_SD;
  prdData.WJO = EJO;
  
function [prdData, info] = predict_Sphyrna_tiburo(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp_foetus(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  aT_p = t_p/ k_M/ TC;              % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
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
  
  % males
  p_Amm = z_m * p_M/ kap;            % J/d.cm^2, {p_Am} max spec assimilation flux for male
  E_mm = p_Amm/ v;                   % J/cm^3, [E_m] reserve capacity for male
  m_Emm = y_E_V * E_mm/ E_G;         % mol/mol, reserve capacity for males
  g_m = E_G/ kap/ E_mm;              % -, energy investment ratio for male
  w_m = m_Emm * w_E/ w_V;            % -, contribution of reserve to weight for males
  L_mm = v/ k_M/ g_m;                % cm, maximum structural length
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hpm]; % compose parameter vector
  [~, ~, l_pm, l_b] = get_tp_foetus(pars_tpm, f, l_b); % -, scaled length at birth at f
  L_pm = L_mm * l_pm;                % cm, structural length at puberty at f
  Lw_pm = L_pm/ del_M;               % cm, physical length at puberty at f

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
  [tau_b, l_b] = get_tb_foetus([g; k; v_Hb]); % -, scaled lengths at f
  Lw_b = l_b * L_m/ del_M; Lw_i = f_T * L_m/ del_M;
  ir_B = 3/ k_M + 3 * f_T * L_m/ v; r_B = 1/ ir_B;     % d, 1/von Bert growth rate
  ELw_Tf = Lw_i - (Lw_i - Lw_b) * exp( - TC * r_B * tL_Tf(:,1)); % cm, expected length at time
  %
  [tau_bm, l_bm] = get_tb_foetus([g_m; k; v_Hb]); % -, scaled lengths at f
  Lw_bm = l_bm * L_mm/ del_M; Lw_im = f_T * L_mm/ del_M;
  ir_Bm = 3/ k_M + 3 * f_T * L_mm/ v; r_Bm = 1/ ir_Bm; % d, 1/von Bert growth rate
  ELw_Tm = Lw_im - (Lw_im - Lw_bm) * exp( - TC * r_Bm * tL_Tm(:,1)); % cm, expected length at time
  %
  Lw_i = f_F * L_m/ del_M;
  ir_B = 3/ k_M + 3 * f_F * L_m/ v; r_B = 1/ ir_B;     % d, 1/von Bert growth rate
  ELw_Ff = Lw_i - (Lw_i - Lw_b) * exp( - TC * r_B * tL_Ff(:,1)); % cm, expected length at time
  %
  Lw_im = f_F * L_mm/ del_M;
  ir_Bm = 3/ k_M + 3 * f_F * L_mm/ v; r_Bm = 1/ ir_Bm; % d, 1/von Bert growth rate
  ELw_Fm = Lw_im - (Lw_im - Lw_bm) * exp( - TC * r_Bm * tL_Fm(:,1)); % cm, expected length at time

  %% pack to output
  prdData.tL_Tm = ELw_Tm;
  prdData.tL_Tf = ELw_Tf;
  prdData.tL_Fm = ELw_Fm;
  prdData.tL_Ff = ELw_Ff;

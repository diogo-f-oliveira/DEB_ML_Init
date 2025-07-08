function [prdData, info] = predict_Belone_belone(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ah, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_L  = tempcorr(temp.L1, T_ref, T_A);
  TC_LN  = tempcorr(temp.LN, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];               % compose parameter vector
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); % -, scaled times & lengths at f
  
  % hatch
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, standard length at birth at f
  Lw_bt = L_b/ del_Mt;              % cm, total length at birth at f
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_pf = L_p/ del_Mt;              % cm, total length at puberty for female

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight for female
 
  % Lt 
  tvel =  get_tj(pars_tj, f, [], [1; 3] * TC_L * k_M);
  L = L_m * tvel(:,4); % cm, struct length
  Lw_1 = L(1)/ del_M; Lw_1t = L(1)/ del_Mt; % cm, SL, TL 
  Lw_3 = L(2)/ del_M; Lw_3t = L(2)/ del_Mt; % cm, SL, TL
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;         % J/d.cm^2, {p_Am} max spec assimilation flux for female
  E_m_m = p_Am_m/ v;               % J/cm^3, [E_m] reserve capacity for male
  m_Em_m = y_E_V * E_m_m/ E_G;     % mol/mol, reserve capacity for male
  g_m = E_G/ kap/ E_m_m;           % -, energy investment ratio for male
  w_m = m_Em_m * w_E/ w_V;         % -, contribution of reserve to weight for male
  L_mm = kap * p_Am_m/ p_M;        % cm, maximum structural length for male
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f); % -, scaled times & lengths at f
  Lw_pm = l_pm * L_mm/ del_Mt;     % cm, total length at puberty for males
  Lw_im = L_mm/ del_Mt;            % cm, ultimate total length for males
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  
  % pack to output
  prdData.ah = aT_b;
  prdData.am = aT_m;
  prdData.Lh = Lw_b;
  prdData.Lht = Lw_bt;
  prdData.L1 = Lw_1;
  prdData.L1t = Lw_1t;
  prdData.L3 = Lw_3;
  prdData.L3t = Lw_3t;
  prdData.Lp_f = Lw_pf;
  prdData.Lp_m = Lw_pm;
  prdData.Li_f = Lw_i;
  prdData.Li_m = Lw_im;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-length
  % female
  tvel = get_tj(pars_tj, f_tL, [], tL_f(:,1)*k_M*TC_tL);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tpm(pars_tpm, f_tL, [0, f_tL*z/z_m, l_b*z/z_m], tL_m(:,1)*k_M*TC_tL);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w);                   % g, expected wet weight at time

  % length/weight-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN_L = 365 * TC_LN * reprod_rate_j(LN(:,1) * del_Mt, f, pars_R);               % #, fecundity
  EN_W = 365 * TC_LN * reprod_rate_j((WN(:,1)/ (1 + f * w)).^(1/3), f , pars_R); % #, fecundity

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LW = EWw;
  prdData.LN = EN_L;
  prdData.WN = EN_W;
    
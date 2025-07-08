function [prdData, info] = predict_Odorrana_swinhoana(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hj < E_Hb || E_Hj > E_Hp
      prdData = []; info = 0; return
  end
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_L = tempcorr(temp.tL_Lfm, T_ref, T_A);
  TC_H = tempcorr(temp.tL_Hfm, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b] = get_tp(pars_tj, f);       % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam 
  Lw_j = L_j/ del_M;                % cm, SVP at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction: (4.89) of Kooy2010
  GSI = 365 * TC_GSI * k_M * g/ f^3/ (f + kap * g * y_V_E);  % -, GSI based on 365 d accumulation (wild guess)
  GSI = GSI * ((1 - kap)/f^3 - k_J * U_Hp/ L_m^2);       % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate struct, SVL
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, SVL at puberty
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  Ww_pm = L_pm^3 * (1 + f * w_m);      % g, weight at puberty

  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.GSI = GSI;
  
  % univar data
  
  % time-SVL
  pars_lb = [g k v_Hb]; pars_lbm = [g_m k v_Hb];
  %
  L_i = f_L * L_m; % cm, strc length
  rT_B = TC_L * k_M/ 3/ (1 + f_L/ g); % 1/d, von Bert growth rate
  ELw_Lf = (L_i - (L_i - L_j) * exp( - rT_B * tL_Lfm(:,1)))/ del_M; % cm, SVL 
  %
  L_im = f_L * L_mm; % cm, strc length
  rT_Bm = TC_L * k_M/ 3/ (1 + f_L/ g_m); % 1/d, von Bert growth rate
  ELw_Lm = (L_im - (L_im - L_j) * exp( - rT_Bm * tL_Lfm(:,1)))/ del_M; % cm, SVL
  %
  L_i = f_H * L_m; % cm, strc length
  rT_B = TC_H * k_M/ 3/ (1 + f_H/ g); % 1/d, von Bert growth rate
  ELw_Hf = (L_i - (L_i - L_j) * exp( - rT_B * tL_Hfm(:,1)))/ del_M; % cm, SVL 
  %
  L_im = f_L * L_mm; % cm, strc length
  rT_Bm = TC_H * k_M/ 3/ (1 + f_H/ g_m); % 1/d, von Bert growth rate
  ELw_Hm = (L_im - (L_im - L_j) * exp( - rT_Bm * tL_Hfm(:,1)))/ del_M; % cm, SVL

  % length-weight
  EWw_f = (LW_f(:,1)*del_M).^3 * (1 + f * w);
  EWw_m = (LW_m(:,1)*del_M).^3 * (1 + f * w_m);


  % pack to output
  prdData.tL_Lfm = [ELw_Lf ELw_Lm];
  prdData.tL_Hfm = [ELw_Hf ELw_Hm];
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;

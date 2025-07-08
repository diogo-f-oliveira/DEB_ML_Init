function [prdData, info] = predict_Ascaphus_truei(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if E_Hj < E_Hb || E_Hj > E_Hp
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_LL = tempcorr(temp.LL_f, T_ref, T_A);
  
  % zero-variate data
  
  % life cycle
  pars_tpb = [g k l_T v_Hb v_Hj];  % pars for tadpole
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tpb, f);
  if ~info; prdData = []; return; end
  pars_tp = [g k l_T v_Hb v_Hp];     % for female toad
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mb;               % cm, total length of tadpole at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % metam
  Lw_jb = L_m * l_j/ del_Mb;      % cm, total length at metam at f
  L_j = L_m * l_j; Lw_j = L_j/ del_M; % cm, SVL of frog at metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;     % d, time since birth at puberty at f and T
  
  % puberty for toad
  tT_p = (t_p - t_j)/ k_M/ TC;    % d, time time metam at puberty at f and T
  
  % ultimate for toad
  l_i = f - l_T;                  % -, scaled ultimate length at f
  L_i = L_m * l_i;                % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;              % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);     % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f);          % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                 % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate structural, body length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m k l_T v_Hj v_Hpm];   % pars for toad
  [t_pm, t_jm, l_pm, l_jm] = get_tp(pars_tpm, f);
  tT_pm = (t_pm - t_jm)/ k_M/ TC;      % d, time since metam at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  Lw_i = L_m * f_LL/ del_M;
  rT_B = TC_LL * k_M/ 3/ (1 + f_LL/ g); % d 1/von Bert growth rate
  ELw_f = Lw_i - (Lw_i - LL_f(:,1)) * exp( - rT_B * 365) - LL_f(:,1); % cm, SVL
  %
  Lw_im = L_mm * f_LL/ del_M;
  rT_Bm = TC_LL * k_M/ 3/ (1 + f_LL/ g_m); % d 1/von Bert growth rate
  ELw_m = Lw_im - (Lw_im - LL_m(:,1)) * exp( - rT_Bm * 365) - LL_m(:,1); % cm, SVL
  
  % pack to output
  prdData.LL_f = ELw_f;
  prdData.LL_m = ELw_m;


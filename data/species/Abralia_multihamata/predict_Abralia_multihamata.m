function [prdData, info] = predict_Abralia_multihamata(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if E_Hpm+1e-3 <= E_Hj
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC; 
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  rT_B = TC * rho_B * k_M; % 1/d, von Bert growth rate
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, mantle length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, weight at birth
  aT_b = tau_b/ kT_M;               % d, age at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (tau_j - tau_b)/ kT_M;     % d, time since birth at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  tau_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                     % d, mean life span at T
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m - tau_j/ kT_M));  
  Lw_i = L_am/ del_M;               % cm, mantle length at death
  Ww_i = L_am^3 * (1 + f *ome);     % g, weight at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  NT_i = cum_reprod_j(200, f, pars_R); % #, cum no of eggs at 200 d
  GSI = Ww_b * NT_i/ Ww_i;           % -, gonado somatic index

  % male
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hpm];
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  tT_jm = (tau_jm - tau_bm)/ kT_M;     % d, time since birth at metam
  L_jm= L_mm * l_jm;  L_im = L_mm * l_im; % cm, structural lengths at f
  rT_Bm = rho_Bm * kT_M;
  pars_tmm = [pars_tjm; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  aT_mm = get_tm_j(pars_tmm, f)/ kT_M; % d, mean life span at T
  L_amm = L_im - (L_im - L_jm) * exp(- rT_Bm * (aT_mm - tau_jm/ kT_M));  
  Lw_im = L_amm/ del_M;               % cm, mantle length at death
  Lw_pm = L_mm * l_pm/ del_M;         % cm, mantle length at puberty
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length-weight
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f(:,1)*kT_M);
  L = L_m * tvel(:,4); ELw_f = L/ del_M;   % cm, dorsal mantle length at time
  EWw_f = L.^3 .* (1 + ome * tvel(:,3)); % g, weight 
  % male
  tvel = get_tj(pars_tjm, f_tL, [], tL_m(:,1)*kT_M);
  L = L_mm * tvel(:,4); ELw_m = L/ del_M;   % cm, dorsal mantle length at time
  EWw_m = L.^3 .* (1 + ome_m * tvel(:,3)); % g, weight 
  
  % length-weight
  EWw_Lf = (LWw_f(:,1)*del_M).^3*(1+f_tL*w);
  EWw_Lm = (LWw_m(:,1)*del_M).^3*(1+f_tL*ome_m);

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
  prdData.LWw_f = EWw_Lf;
  prdData.LWw_m = EWw_Lm;
 
  
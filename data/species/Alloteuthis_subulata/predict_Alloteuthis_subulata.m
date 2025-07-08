function [prdData, info] = predict_Alloteuthis_subulata(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if E_Hpm < E_Hj
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  rT_B = rho_B * kT_M; % 1/d, von Bert growth rate
  rT_j = rho_j * kT_M; % 1/d, exponential growth rate
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, wmantle length at birth
  aT_b = t_b/ kT_M;                 % d, age at birth 

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- rT_B * (aT_m - t_j/ kT_M));  
  Lw_i = L_am/ del_M;              % cm, mantle length at death
  Ww_i = L_am^3 * (1 + f * w);     % g, wet weight at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  NT_i = cum_reprod_j(aT_m, f, pars_R); % #, cum no of eggs at 600 d
    
  % male
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  rT_jm = rho_jm * kT_M; rT_Bm = rho_Bm * kT_M; % 1/d, growth rates
  tT_jm = (t_jm - t_bm)/ kT_M;         % d, time since birth at metam
  L_bm = L_mm * l_bm; L_jm = L_mm * l_jm;  L_pm = L_mm * l_pm; L_im = L_mm * l_im; % cm, structural lengths at f
  pars_tmm = [pars_tjm; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  aT_mm = get_tm_j(pars_tmm, f)/ kT_M;     % d, mean life span at T
  L_am = L_im - (L_im - L_jm) * exp(- rT_Bm * (aT_mm - t_jm/ kT_M));  
  Lw_im = L_am/ del_Mm; Lw_pm = L_pm/ del_Mm; % cm, mantle length at death
  Ww_im = L_am^3 * (1 + f * w_m);     % g, wet weight at death
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % time-length, weight
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, dorsal mantle length at time
  % male
  tvel = get_tj(pars_tjm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, dorsal mantle length at time

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  
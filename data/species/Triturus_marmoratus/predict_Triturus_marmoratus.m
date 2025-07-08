function [prdData, info] = predict_Triturus_marmoratus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if E_Hpm < E_Hb 
    info = 0; prdData = []; return
  end
  
  %% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_L = tempcorr(temp.tL_L, T_ref, T_A);
  TC_H = tempcorr(temp.tL_H, T_ref, T_A);
  TC_S = tempcorr(temp.tL_S, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tj, f); % -, scaled times & lengths at f
  if ~info; prdData = []; return; end
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam at f and T
  L_j = L_m * l_j;                  % cm, struc length at metam
  Lw_j = L_j/ del_M;                % cm, SVL at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

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
  pars_tpm = [g_m k l_T v_Hb v_Hpm];
  [t_pm, t_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f);
  if ~info; prdData = []; return; end
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, SVL at puberty
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  tT_pm = (t_pm-t_bm)/ k_M/ TC_tp;       % cm, time since birth at puberty

  
  %% pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univariate data
  % high alt
  rT_B = TC_H * k_M/ 3/ (1 + f_H/ g); % 1.d, von Bert growth rate
  L_b = L_m * get_lb([g; k; v_Hb], f_H); L_i = L_m * f_H; % cm, ultimate SVL 
  L =  L_i - (L_i - L_b) * exp(-rT_B * tL_H(:,1)); % cm, struc length
  ELw_Hf = L/ del_M; % cm, SVL
  %
  rT_Bm = TC_H * k_M/ 3/ (1 + f_H/ g_m); % 1.d, von Bert growth rate
  L_bm = L_mm * get_lb([g; k; v_Hb], f_H); L_im = L_mm * f_H; % cm, ultimate SVL 
  L =  L_im - (L_im - L_bm) * exp(-rT_Bm * tL_H(:,1)); % cm, struc length
  ELw_Hm = L/ del_M; % cm, SVL
  % low alt
  rT_B = TC_L * k_M/ 3/ (1 + f_L/ g); % 1.d, von Bert growth rate
  L_b = L_m * get_lb([g; k; v_Hb], f_L); L_i = L_m * f_L; % cm, ultimate SVL 
  L =  L_i - (L_i - L_b) * exp(-rT_B * tL_L(:,1)); % cm, struc length
  ELw_Lf = L/ del_M; % cm, SVL
  %
  rT_Bm = TC_L * k_M/ 3/ (1 + f_L/ g_m); % 1.d, von Bert growth rate
  L_bm = L_mm * get_lb([g; k; v_Hb], f_L); L_im = L_mm * f_L; % cm, ultimate SVL 
  L =  L_im - (L_im - L_bm) * exp(-rT_Bm * tL_L(:,1)); % cm, struc length
  ELw_Lm = L/ del_M; % cm, SVL
  % south
  rT_B = TC_S * k_M/ 3/ (1 + f_S/ g); % 1.d, von Bert growth rate
  L_b = L_m * get_lb([g; k; v_Hb], f_S); L_i = L_m * f_S; % cm, ultimate SVL 
  L =  L_i - (L_i - L_b) * exp(-rT_B * tL_S(:,1)); % cm, struc length
  ELw_Sf = L/ del_M; % cm, SVL
  %
  rT_Bm = TC_S * k_M/ 3/ (1 + f_S/ g_m); % 1.d, von Bert growth rate
  L_bm = L_mm * get_lb([g; k; v_Hb], f_S); L_im = L_mm * f_S; % cm, ultimate SVL 
  L =  L_im - (L_im - L_bm) * exp(-rT_Bm * tL_S(:,1)); % cm, struc length
  ELw_Sm = L/ del_M; % cm, SVL

  %% pack to output
  prdData.tL_L = [ELw_Lf ELw_Lm];
  prdData.tL_H = [ELw_Hf ELw_Hm];
  prdData.tL_S = [ELw_Sf ELw_Sm];
  
end

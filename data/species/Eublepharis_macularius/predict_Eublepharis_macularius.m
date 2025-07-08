function [prdData, info] = predict_Eublepharis_macularius(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, body weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, struc length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_im = f * L_mm; Lw_im = L_im/ del_M;    % cm, ultimate SVL
  L_bm = l_bm * L_mm; Lw_bm = L_bm/ del_M; % cm,  SVL at puberty
  L_pm = l_pm * L_mm; Lw_pm = L_pm/ del_M; % cm,  SVL at puberty
  Ww_im = L_im^3 * (1 + w_m * f);          % g, body weight

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-weight
  L_b = L_m * get_lb([g k v_Hb], f_tW); L_i = L_m * f_tW;
  rT_B = TC * k_M/ 3/ (1 + f_tW/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(-rT_B * tW(:,1)); % cm, struc length
  EWw = L.^3 * (1 + f_tW * w); % g, body weight
  %
  L_b = L_m * get_lb([g k v_Hb], f_tW1); L_i = L_m * f_tW1;
  rT_B = TC * k_M/ 3/ (1 + f_tW1/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(-rT_B * tW1(:,1)); % cm, struc length
  EWw_1 = L.^3 * (1 + f_tW1 * w); % g, body weight
  %
  L_b = L_m * get_lb([g k v_Hb], f_tW2); L_i = L_m * f_tW2;
  rT_B = TC * k_M/ 3/ (1 + f_tW2/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(-rT_B * tW2(:,1)); % cm, struc length
  EWw_2 = L.^3 * (1 + f_tW2 * w); % g, body weight
  
  % pack to output
  prdData.tW = EWw;
  prdData.tW1 = EWw_1;
  prdData.tW2 = EWw_2;


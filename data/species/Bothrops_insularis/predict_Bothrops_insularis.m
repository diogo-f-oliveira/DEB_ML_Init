function [prdData, info] = predict_Bothrops_insularis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  L_p = l_p * L_m;                  % cm, struc length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate structural, body length
  pars_tpm = [g_m k l_T v_Hb v_Hp];

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;

  % univar data
  
  % time-length
  % female 1
  tvel = get_tp(pars_tp, f_f1, [], tL_f1(:,1)*kT_M);
  ELw_f1 = L_m * tvel(:,4)/ del_M;   % cm, length 
  % female 2
  tvel = get_tp(pars_tp, f_f2, [], tL_f2(:,1)*kT_M);
  ELw_f2 = L_m * tvel(:,4)/ del_M;   % cm, length 
  % female 3
  tvel = get_tp(pars_tp, f_f3, [], tL_f3(:,1)*kT_M);
  ELw_f3 = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tpm(pars_tpm, f_m, [t_b, f_m*z/z_m, l_b*z/z_m], tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % time-weight
  % female 1
  tvel = get_tp(pars_tp, f_f1, [], tW_f1(:,1)*kT_M);
  EWw_f1 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % female 2
  tvel = get_tp(pars_tp, f_f2, [], tW_f2(:,1)*kT_M);
  EWw_f2 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % female 2
  tvel = get_tp(pars_tp, f_f3, [], tW_f3(:,1)*kT_M);
  EWw_f3 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male
  tvel = get_tpm(pars_tpm, f_m, [t_b, f_m*z/z_m, l_b*z/z_m], tW_m(:,1)*kT_M);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight

  % length - weight
  LWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w);   % g, weight
  LWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w_m); % g, weight
  
  % pack to output
  prdData.tL_f1 = ELw_f1;
  prdData.tL_f2 = ELw_f2;
  prdData.tL_f3 = ELw_f3;
  prdData.tL_m = ELw_m;
  prdData.tW_f1 = EWw_f1;
  prdData.tW_f2 = EWw_f2;
  prdData.tW_f3 = EWw_f3;
  prdData.tW_m = EWw_m;
  prdData.LW_f = LWw_f;
  prdData.LW_m = LWw_m;
  
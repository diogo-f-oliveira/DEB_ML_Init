function [prdData, info] = predict_Apalone_spinifera(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm plastron length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ kT_M;                 % d, age at birth

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Ww_i = L_i^3 * (1 + f * w);       % g,  ultimate wet weight
    
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
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hpm];   % compose par-vector
  [t_pm t_bm l_pm l_bm] = get_tp(pars_tpm, f); % -, scaled length at puberty, birth
  tT_pm = (t_pm - t_bm)/ kT_M;         % d, timce since birth at puberty
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, struc, plestron length                 % 
  L_bm = l_bm * L_mm;                   % cm, plastron length at birth
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, struct, plastron length

  % pack to output

  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tL, [], tL_f(:,1)*k_M*TC_tL);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tp(pars_tpm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m(:,1)*k_M*TC_tL);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 
  
  % length-change in length
  Lw_i = L_m * f_tL; rT_B = k_M*TC_tL/3/(1+f_tL/g); ELdL_f = rT_B * (Lw_i - LdL_f(:,1));
  Lw_im = L_mm * f_tL; rT_Bm = k_M*TC_tL/3/(1+f_tL/g_m); ELdL_m = rT_Bm * (Lw_im - LdL_m(:,1));

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LdL_f = ELdL_f;
  prdData.LdL_m = ELdL_m;
  
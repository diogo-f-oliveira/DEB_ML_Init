function [prdData, info] = predict_Nothobranchius_kadleci(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_16 = tempcorr(C2K(16), T_ref, T_A);
  TC_25 = tempcorr(C2K(25.3), T_ref, T_A);
  TC_tL = tempcorr(temp.tL_fNK430, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_0 + t_b/ k_M/ TC_ab;     % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  tT_p = (t_p-t_b)/ k_M/ TC_tp;     % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wey weight
  
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
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f); % -, scaled times & lengths at f
  L_bm = l_bm * L_mm; Lw_bm = L_bm/ del_M; % cn, struc, total length at birth
  L_im = f * L_mm;  Lw_im = L_im/ del_M; % cm, ultimate struct, total length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  
  % uni-variate data
  
  % time-length 
  [t ELw_fNK91] = ode45(@get_L, tL_fNK91(:,1), Lw_b, [], k_M/ 3/ (1 + f_NK91/g),    f_NK91 * L_m/ del_M, TC_16, TC_25, TC_tL);
  [t ELw_mNK91] = ode45(@get_L, tL_mNK91(:,1), Lw_b, [], k_M/ 3/ (1 + f_NK91/g_m),  f_NK91 * L_mm/ del_M, TC_16, TC_25, TC_tL);
  [t ELw_fNK430]= ode45(@get_L, tL_fNK91(:,1), Lw_b, [], k_M/ 3/ (1 + f_NK430/g), f_NK430 * L_m/ del_M, TC_16, TC_25, TC_tL);
  [t ELw_mNK430]= ode45(@get_L, tL_mNK91(:,1), Lw_b, [], k_M/ 3/(1 + f_NK430/g_m),f_NK430 * L_mm/ del_M, TC_16, TC_25, TC_tL);
  
  pars_R = [kap; kap_R; g; TC_tL*k_J; TC_tL*k_M; L_T; TC_tL*v; U_Hb/TC_tL; U_Hp/TC_tL];
  EN_NK91 = cum_reprod(tN_NK91(:,1), f_NK91, pars_R);
  EN_NK430 = cum_reprod(tN_NK430(:,1), f_NK430, pars_R);

  % pack to output
  prdData.tL_fNK91 = ELw_fNK91;
  prdData.tL_mNK91 = ELw_mNK91;
  prdData.tL_fNK430 = ELw_fNK430;
  prdData.tL_mNK430 = ELw_mNK430;
  prdData.tN_NK91 = EN_NK91;
  prdData.tN_NK430 = EN_NK430;
  
end

function dL = get_L(t, L, r_B, Lw_i, TC_16, TC_25, TC_tL)
  if t<2
    dL = TC_16 * r_B * (Lw_i - L);
  elseif t < 8
    dL = TC_25 * r_B * (Lw_i - L);
  else
    dL = TC_tL * r_B * (Lw_i - L);
  end
end
    
    
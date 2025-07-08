function [prdData, info] = predict_Nothobranchius_furzeri(par, data, auxData)
  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_16 = tempcorr(C2K(16), T_ref, T_A);
  TC_25 = tempcorr(C2K(25.3), T_ref, T_A);
  TC_tL = tempcorr(temp.tL_fNF222, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_0 + tau_b/ k_M/ TC_ab;     % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (tau_p-tau_b)/ k_M/ TC_tp;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wey weight
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ k_M/ TC_am;               % d, mean life span at T
  
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
  [t ELw_fNF221] = ode45(@get_L, tL_fNF221(:,1), Lw_b, [], k_M/ 3/ (1 + f_NF221/g),    f_NF221 * L_m/ del_M, TC_16, TC_25, TC_tL);
  [t ELw_mNF221] = ode45(@get_L, tL_mNF221(:,1), Lw_b, [], k_M/ 3/ (1 + f_NF221/g_m),  f_NF221 * L_mm/ del_M, TC_16, TC_25, TC_tL);
  [t ELw_fNF222]= ode45(@get_L, tL_fNF222(:,1), Lw_b, [], k_M/ 3/ (1 + f_NF222/g), f_NF222 * L_m/ del_M, TC_16, TC_25, TC_tL);
  [t ELw_mNF222]= ode45(@get_L, tL_mNF222(:,1), Lw_b, [], k_M/ 3/(1 + f_NF222/g_m),f_NF222 * L_mm/ del_M, TC_16, TC_25, TC_tL);
  
  pars_R = [kap; kap_R; g; TC_tL*k_J; TC_tL*k_M; L_T; TC_tL*v; U_Hb/TC_tL; U_Hp/TC_tL];
  EN_NF221 = cum_reprod(tN_NF221(:,1), f_NF221, pars_R);
  EN_NF222 = cum_reprod(tN_NF222(:,1), f_NF222, pars_R);

  % pack to output
  prdData.tL_fNF221 = ELw_fNF221;
  prdData.tL_mNF221 = ELw_mNF221;
  prdData.tL_fNF222 = ELw_fNF222;
  prdData.tL_mNF222 = ELw_mNF222;
  prdData.tN_NF221 = EN_NF221;
  prdData.tN_NF222 = EN_NF222;
  
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
    
    
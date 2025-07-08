function [prdData, info] = predict_Podarcis_muralis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_K = tempcorr(temp.tL_K, T_ref, T_A);
  TC_D = tempcorr(temp.tL_D, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Ww_0 = U_E0 * p_Am * w_E/ mu_E/ d_E; % g, egg wet weight
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty
  tT_p = (t_p-t_b)/ k_M/ TC_tp;     % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap * E_m_m);            % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = L_mm * f; Lw_im = L_im/ del_Mm; % cm, ultimate SVL
  pars_tpm = [g_m k l_T v_Hb v_Hpm];
  [t_pm, t_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f, [l_b f*z/z_m l_b*z/z_m]);
  Lw_pm = L_mm * l_pm/ del_Mm;         % cm, SVL at puberty
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate weight  

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-length
  % female D
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_D, [], tL_D(:,1)*k_M*TC_D);
  ELw_Df = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male D
  tvel = get_tp(pars_tpm, f_D, [t_b, f_D*z/z_m, l_b*z/z_m], tL_D(:,1)*k_M*TC_D);
  ELw_Dm = L_mm * tvel(:,4)/ del_Mm;   % cm, length 
  % female K
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_K, [], tL_K(:,1)*k_M*TC_K);
  ELw_Kf = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male K
  tvel = get_tp(pars_tpm, f_K, [t_b, f_K*z/z_m, l_b*z/z_m], tL_K(:,1)*k_M*TC_K);
  ELw_Km = L_mm * tvel(:,4)/ del_Mm;   % cm, length 

  % length-weight
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + w * f);   % g, wet weight females
  EWw_m = (LW_m(:,1) * del_Mm).^3 * (1 + w_m * f);% g, wet weight males
      
  % length - yearly fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  LN = TC_LN * 365 * reprod_rate(LN(:,1) * del_M, f, pars_R); % #, yearly fecundity
  
  % temperature-development
  aT_b = t_b/ k_M ./ TC_ab; % d, age at birth at f and T
  
  % pack to output
  prdData.tL_D = [ELw_Df ELw_Dm];
  prdData.tL_K = [ELw_Kf ELw_Km];
  prdData.LN = LN;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  prdData.Tab = aT_b;
  
  
 
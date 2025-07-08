function [prdData, info] = predict_Lophius_piscatorius(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
  %% customized filters
  if E_Hh >= E_Hb   % maturity level consistency
    info = 0;
    prdData = {};
    return
  end

%% compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_tb = tempcorr(temp.tb, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL_fm = tempcorr(temp.tL_fm, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);

  % initial % choice for fixed or implied eggs size is again at uni-variate embryo data
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve for kap constant

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC_ah;% d, age at hatch at f and T
  M_Eh = J_E_Am * aUL(2,2);        % mol, reserve at hatch at f
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_M;               % cm, total length at hatch at f
  Ww_h = L_h^3 + M_Eh * w_E/ d_E;  % g, wet weight at hatch at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Lw_b = L_b/ del_M;                % cm, total length at birth
  a_b = t_b/ k_M; aT_b = a_b/ TC_tb; % d, age at birth 
  tT_b = aT_b - aT_h;               % d, time since hatch at birth

  % metamorphosis
  a_j = t_j/ k_M; aT_j = a_j/ TC_tb;  % d, age at metamorphosis, temp corrected 
  L_j = l_j * L_m; Lw_j = L_j/ del_M; % cm, length at metamorphosis

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

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
  L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];

  % pack to output
  prdData.ah = aT_h;
  prdData.tb = tT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  % time-length
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL(:,1)*k_M*TC_tL);
  ELw = L_m * tvel(:,4)/ del_M;   % cm, length
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL_f, [], tL_fm(:,1)*k_M*TC_tL_fm);
  ELw_f = L_m * tvel(:,4)/ del_M;  % cm, length
  % male
  tvel = get_tj(pars_tjm, f_tL_f, [t_b, f_tL_f*z/z_m, l_b*z/z_m], tL_fm(:,1)*k_M*TC_tL_fm);
  ELw_m = L_mm * tvel(:,4)/ del_M; % cm, length

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

  % pack to output
  prdData.tL = ELw;
  prdData.tL_fm = [ELw_f ELw_m];
  prdData.LW = EWw;
     
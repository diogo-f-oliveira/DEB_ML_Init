function [prdData, info] = predict_Myoxocephalus_scorpius(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  if E_Hh >= E_Hb
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_tb = tempcorr(temp.tb, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_fm, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E_0 = J_E_Am * U_E0 * mu_E;        % J, initial reserve 

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_Me;               % cm, total length at hatch at f

  % birth
  tT_b = (t_b/ k_M - a_h)/ TC_tb;  % d, time since hatch at birth at f and T
  L_b = L_m * l_b;                 % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, weight at birth

  % metam
  L_j = L_m * l_j;                 % cm, structural length at metam
  Lw_j = L_j/ del_M;               % cm, total length at metam
  s_M = l_j/ l_b;                  % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T

  % supply stress
  s_s = k_J * E_Hp * (p_M + p_T/ L_i)^2/ p_Am^3/ f^3/ s_M^3;
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp]; % pack parameters
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_im = L_mm * l_im; Lw_im = L_im/ del_M;

  % pack to output
  prdData.ah = aT_h;
  prdData.tb = tT_b;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;

  % uni-variate data
  
  % time-length
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_fm(:,1)*k_M*TC_tL);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f, [0, z/z_m, l_b*z/z_m], tL_fm(:,1)*k_M*TC_tL);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length

  % length-fecundity 
  EN_L = TC_LN * 365 * reprod_rate_j(LN(:,1) * del_M, f, pars_R); % #, fecundity at T

  % weight-fecundity 
  EN_W = TC_LN * 365 * reprod_rate_j((WN(:,1)/ (1 + f * w)).^(1/3), f, pars_R); % #, fecundity at T

  % pack to output
  prdData.tL_fm = [ELw_f ELw_m];
  prdData.LN = EN_L;
  prdData.WN = EN_W;
function [prdData, info] = predict_Marinogammarus_marinus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_10 = tempcorr(temp.ab10, T_ref, T_A);
  TC_15 = tempcorr(temp.ab15, T_ref, T_A);
  TC_20 = tempcorr(temp.ab20, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = 1e3 * L_b^3 * (1 + f * w); % mg, wet weight at birth
  a_b = (t_0 + t_b/ k_M); 
  a10_b = a_b/ TC_10;               % d, age at birth at f and T
  a15_b = a_b/ TC_15;               % d, age at birth at f and T
  a20_b = a_b/ TC_20;               % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = 1e3 * L_p^3 * (1 + f * w); % mg, wet weight at puberty 
  t_p = (t_p - t_b)/ k_M;           % 
  t10_p = t_p/ TC_10;               % d, time since birth at puberty at f and T
  t15_p = t_p/ TC_15;               % d, time since birth at puberty at f and T
  t20_p = t_p/ TC_20;               % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = 1e3 * L_i^3 * (1 + f * w); % mg, ultimate wet weight 
 
  % reproduction
  pars_R10 = [kap; kap_R; g; TC_10*k_J; TC_10*k_M; L_T; TC_10*v; U_Hb/TC_10; U_Hj/TC_10; U_Hp/TC_10]; % compose parameter vector at T
  N10_i = cum_reprod_j(365/TC_10, f, pars_R10);                 % #/d, ultimate reproduction rate at T
  pars_R15 = [kap; kap_R; g; TC_15*k_J; TC_15*k_M; L_T; TC_15*v; U_Hb/TC_15; U_Hj/TC_15; U_Hp/TC_15]; % compose parameter vector at T
  N15_i = cum_reprod_j(365/TC_15, f, pars_R15);                 % #/d, ultimate reproduction rate at T
  pars_R20 = [kap; kap_R; g; TC_20*k_J; TC_20*k_M; L_T; TC_20*v; U_Hb/TC_20; U_Hj/TC_20; U_Hp/TC_20]; % compose parameter vector at T
  N20_i = cum_reprod_j(365/TC_20, f, pars_R20);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  a_m = t_m/ k_M;     
  a10_m = a_m/ TC_10;                   % d, mean life span at T
  a20_m = a_m/ TC_20;                   % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m]);
  L_bm = L_mm * l_bm; L_j_m = L_mm * l_jm; L_im = l_i * L_mm; % cm, structural lengths
  Lw_im = L_im/del_M;                  % cm, total length

  % pack to output
  prdData.ab10 = a10_b;
  prdData.ab15 = a15_b;
  prdData.ab20 = a20_b;
  prdData.tp10 = t10_p;
  prdData.tp15 = t15_p;
  prdData.tp20 = t20_p;
  prdData.am10 = a10_m;
  prdData.am20 = a20_m;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ni10 = N10_i;
  prdData.Ni15 = N15_i;
  prdData.Ni20 = N20_i;
  
  % uni-variate data
  % time-length
  pars_tj = [g k*p_M/p_M_10 l_T v_Hb v_Hj v_Hp];
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S10T10(:,1)*k_M*TC_10*p_M_10/p_M);
  ELw_S10T10 = 10*(L_m*p_M_10/p_M * tvel(:,4))/del_MH;   % mm, head length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S10T15(:,1)*k_M*TC_15*p_M_10/p_M);
  ELw_S10T15 = 10*(L_m*p_M_10/p_M * tvel(:,4))/del_MH;   % mm, head length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S10T20(:,1)*k_M*TC_20*p_M_10/p_M);
  ELw_S10T20 = 10*(L_m*p_M_10/p_M * tvel(:,4))/del_MH;   % mm, head length
  %
  pars_tj = [g k*p_M/p_M_15 l_T v_Hb v_Hj v_Hp];
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S15T10(:,1)*k_M*TC_10*p_M_15/p_M);
  ELw_S15T10 = 10*(L_m*p_M_10/p_M * tvel(:,4))/del_MH;   % mm, head length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S15T15(:,1)*k_M*TC_15*p_M_15/p_M);
  ELw_S15T15 = 10*(L_m*p_M_15/p_M * tvel(:,4))/del_MH;   % mm, head length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S15T20(:,1)*k_M*TC_20*p_M_15/p_M);
  ELw_S15T20 = 10*(L_m*p_M_15/p_M * tvel(:,4))/del_MH;   % mm, head length
  %
  pars_tj = [g k*p_M/p_M_20 l_T v_Hb v_Hj v_Hp];
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S20T10(:,1)*k_M*TC_10*p_M_20/p_M);
  ELw_S20T10 = 10*(L_m*p_M_20/p_M * tvel(:,4))/del_MH;   % mm, head length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S20T15(:,1)*k_M*TC_15*p_M_20/p_M);
  ELw_S20T15 = 10*(L_m * tvel(:,4))/del_MH;   % mm, head length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S20T20(:,1)*k_M*TC_20*p_M_20/p_M);
  ELw_S20T20 = 10*(L_m*p_M_20/p_M * tvel(:,4))/del_MH;   % mm, head length
  %
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S25T10(:,1)*k_M*TC_10);
  ELw_S25T10 = 10*(L_m * tvel(:,4))/del_MH;   % mm, head length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S25T15(:,1)*k_M*TC_15);
  ELw_S25T15 = 10*(L_m * tvel(:,4))/del_MH;   % mm, head length
  %
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_S25T20(:,1)*k_M*TC_20);
  ELw_S25T20 = 10*(L_m * tvel(:,4))/del_MH;   % mm, head length
    
  % pack to output
  prdData.tL_S10T10 = ELw_S10T10;
  prdData.tL_S10T15 = ELw_S10T15;
  prdData.tL_S10T20 = ELw_S10T20;
  prdData.tL_S15T10 = ELw_S15T10;
  prdData.tL_S15T15 = ELw_S15T15;
  prdData.tL_S15T20 = ELw_S15T20;
  prdData.tL_S20T10 = ELw_S20T10;
  prdData.tL_S20T15 = ELw_S20T15;
  prdData.tL_S20T20 = ELw_S20T20;
  prdData.tL_S25T10 = ELw_S25T10;
  prdData.tL_S25T15 = ELw_S25T15;
  prdData.tL_S25T20 = ELw_S25T20;


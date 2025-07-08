function [prdData, info] = predict_Chaoborus_crystallinus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  if E_Hp < E_Hb
    prdData = []; info = 0; return
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); % all data at 20 C (TC = 1)
  vT = v * TC; kT_J = k_J * TC; kT_M = k_M * TC; pT_Am = p_Am * TC; UT_Hb = U_Hb/ TC; UT_Hp = U_Hp/ TC;
  
  % zero-variate data

  % life cycle
  v_Rj = kap/ (1 - kap) * E_Rj/ E_G; 
  pars_tj_hax = [g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V];
  [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj_hax, f);
  
  % initial
  u_E0 = get_ue0([g, k, v_Hb], f);    % -, scaled initial reserve
  E_0 = u_E0 * g * E_m * L_m^3;       % J, initial energy content
  Wd_0 = E_0/ mu_E * w_E;             % g, initial dry weight
  Ww_0 = Wd_0/ d_E;                   % g, initial wet weight
    
  % birth
  aT_b = t_b/ kT_M;                   % d, age at birth at f and T
  L_b = L_m * l_b;                    % cm, structural length at birth
  kT_E = vT/ L_b;                     % 1/d, reserve turnover rate

  % pupation 
  tT_j = (t_j - t_b)/ kT_M;           % d, time since birth at pupation
  L_j = L_m * l_j;                    % cm, structural length at pupation
  Ww_j = L_j^3 * (1 + f * w);         % g, wet weight at pupation, excluding reprod buffer at pupation
  E_Rj = v_Rj * (1 - kap) * g * E_m * L_j^3; % J, reproduction buffer at pupation
  Ww_Rj = E_Rj * w_E/ mu_E/ d_E;      % g, wet weight repod buffer at pupation
  Ww_j = Ww_j + Ww_Rj;                % g, wet weight including reprod buffer
   
  % emergence
  L_e = L_m * l_e;                    % cm, structural length at emergence
  Ww_e = L_e^3 + Ww_Rj + u_Ee * g * E_m * L_m^3 * w_E/ mu_E/ d_E;        % g, wet weight including reprod buffer
  Wd_e = d_V * L_e^3 + d_E * Ww_Rj + u_Ee * g * E_m * L_m^3 * w_E/ mu_E; % g, dry weight including reprod buffer
  tT_e = (t_e - t_j)/ k_M;            % d, time since pupation at emergence

  % reproduction
  N_i = kap_R * E_Rj/ E_0;             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;            % d, mean life span as imago
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight

  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j; % will be overwritten, since f_tL is more appropriate than f
  prdData.te = tT_e; 
  prdData.am = aT_m;
  prdData.Wd0 = Wd_0;
  prdData.Wwj = Ww_j;
  prdData.Wwe = Ww_e;
  prdData.Wde = Wd_e;
  prdData.Ni = N_i;
  
  % uni-variate data
     
  % time-weight data for larvae at f
  % females
  pars_R = [kap; kap_R; g; kT_J; kT_M; 0; vT; UT_Hb; UT_Hp; UT_Hp + 1e-8];
  [N, L] = cum_reprod_j(tWw_f(:,1) + t0, f, pars_R);
  EWw_f  = L.^3 * (1 + f * w) + Ww_0 * N;  % g, wet weight
  % males
  pars_Rm = [kap; kap_R; g_m; kT_J; kT_M; 0; vT; UT_Hb; UT_Hp; UT_Hp + 1e-8];
  [N, L] = cum_reprod_j(tWw_m(:,1) + t0, f, pars_Rm);
  EWw_m  = L.^3 * (1 + f * w_m) + Ww_0 * N;  % g, wet weight (assumption: sperm and eggs weigh the same)
  % time-head length data for instars of larvae
  [N, L] = cum_reprod_j(tLi(:,1), f, pars_R);
  ELw_i  = L/ del_Mh;  % cm, length of total capsule
  
  % time-total length data for larvae at f_tL for Wier184
  [N, L] = cum_reprod_j(tL(:,1), f_tL, pars_R);
  ELw  = L/ del_M;  % cm, total length 
  % life cycle at f_tL
  [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj_hax, f_tL);
  prdData.tj = (t_j - t_b)/ kT_M;           % d, time since birth at pupation. Overwrite!!

  % imago data
  % weight-egg number data
  pars_aux = [kap_R, E_m, L_m, w_E, mu_E, d_E];
  EN = get_NW_hax(WN(:,1), pars_tj_hax, pars_aux);
  EN_2 = get_NW_hax(WN_2(:,1), pars_tj_hax, pars_aux);

  % pack to output
  prdData.tWw_f  = EWw_f;
  prdData.tWw_m  = EWw_m;
  prdData.tL  = ELw;
  prdData.tLi  = ELw_i;
  prdData.WN  = EN;
  prdData.WN_2  = EN_2;
  
end

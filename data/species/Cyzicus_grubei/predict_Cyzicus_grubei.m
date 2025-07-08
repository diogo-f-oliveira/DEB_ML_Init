function [prdData, info] = predict_Cyzicus_grubei(par, data, auxData)
 
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
 
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled structural length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Ww_i = L_i.^3 * (1 + f * ome);    % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Ww_im = L_im^3 * (1 + f * ome_m);    % g, ultimate wet weight
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hpm];% compose parameter vector
  [t_pm, t_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f);
  if ~info; prdData = []; return; end
  Lw_pm = L_mm * l_pm/ del_M; % cm, carapace length at puberty 
  Lw_im = L_im/ del_M; % cm, ultimate carapace length
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  L_i = f_tL * L_m; r_B = k_M/ 3/ (1 + f_tL/ g);
  [t, L] = ode45(@get_L, [0;tL_fm(:,1)], L_b, [], temp.tL_fm, T_ref, T_A, L_i, r_B);
  L(1)= []; ELw_f = L/del_M; % cm, carapace length
  %
  L_im = f_tL * L_mm; r_Bm = k_M/ 3/ (1 + f_tL/ g_m);
  [t, L] = ode45(@get_L, [0;tL_fm(:,1)], L_b, [], temp.tL_fm, T_ref, T_A, L_im, r_Bm);
  L(1)= []; ELw_m = L/del_M; % cm, carapace length
  
  % pack to output
  prdData.tL_fm = [ELw_f ELw_m];
end

function dL = get_L(t,L, tT, T_ref, T_A, L_i, r_B)
  TC = tempcorr(C2K(spline1(t,tT)), T_ref, T_A); 
  dL = TC * r_B * (L_i - L);
end

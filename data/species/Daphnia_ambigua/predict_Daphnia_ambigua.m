function [prdData, info] = predict_Daphnia_ambigua(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_10 = tempcorr(temp.tL10_f, T_ref, T_A);
  TC_5 = tempcorr(temp.tL5_f, T_ref, T_A);
  TC_ab = tempcorr(C2K(data.Tab(:,1)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Wd_b = 1e6*L_b^3*d_V*(1+f*ome);   % mug, dry weight at birth
  a_b = tau_b/ k_M;                 % d, age at birth at f and T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = 1e6*L_p^3*d_V*(1+f*ome);   % mug, dry weight at puberty at f
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty
  
  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = 1e6 * L_i^3 * d_V * (1 + f * ome); % mug, ultimate dry weight
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T
 
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Ww_im = L_im^3 * (1 + f * ome_m);      % g, ultimate wet weight
  pars_tpm = [g_m; k; l_T; v_Hb; v_Hp];% compose parameter vector

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  
  % uni-variate data
  
  % time-length
  tf = [30 f_30; 99 f_99]; tf(:,1) = tf(:,1) * k_M * TC_10;
  tvel = get_tp(pars_tp, tf,[],tL10_f(:,1)*k_M*TC_10);
  ELw_10f = L_m * tvel(:,4)/ del_M;
  %
  tvel = get_tp(pars_tpm, tf,[0 f_tL l_b*z/z_m],tL10_m(:,1)*k_M*TC_10);
  ELw_10m = L_mm * tvel(:,4)/ del_M;
  %
  tf = [30 f_30; 99 f_99]; tf(:,1) = tf(:,1) * k_M * TC_5;
  tvel = get_tp(pars_tp, tf,[],tL5_f(:,1)*k_M*TC_5);
  ELw_5f = L_m * tvel(:,4)/ del_M;
    
  % time-reproduction
  TC = TC_10;
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hp/TC]; % compose parameter vector at T
  EN_10 = cum_reprod(tN10(:,1), f_tL, pars_R);
  %
  TC = TC_5;
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hp/TC]; % compose parameter vector at T
  EN_5 = cum_reprod(tN5(:,1), f_tL, pars_R);
  
  % temperature-interbrood interval
  Ea_b = (t_0 + a_b) ./ TC_ab;
  
  % pack to output
  prdData.tL10_f = ELw_10f; 
  prdData.tL10_m = ELw_10m; 
  prdData.tL5_f = ELw_5f; 
  prdData.tN10 = EN_10; 
  prdData.tN5 = EN_5; 
  prdData.Tab = Ea_b; 
  
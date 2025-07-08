function [prdData, info] = predict_Lepidion_schmidti(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3*(1+f*ome);           % g, weight at birth at f
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3*(1+f*ome);           % g, weight at puberty

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R); % #/d, reproduction rate at TL 15.6 cm
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
%   % males
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, max struct length
%   L_im = f * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
%   pars_tpm = [g_m k l_T v_Hb v_Hp];
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  tf = [0 f_tLb; 50*365 f_tLi]; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tpm(pars_tp, tf, [], tL_m(:,1)*kT_M);
  ELw_m = L_m * tvel(:,4)/ del_M;   % cm, total length
  %
  tvel = get_tpm(pars_tp, tf, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, total length
  
  % length-weight
  tau = spline1(LW_f(:,1)*del_M/ L_m, tvel(:,[4 1])); 
  EWw_f = (LW_f(:,1)*del_M).^3 .* (1 + spline(tau, tvel(:,[1 3])) * ome);
  tau = spline1(LW_m(:,1)*del_M/ L_m, tvel(:,[4 1])); 
  EWw_m = (LW_m(:,1)*del_M).^3 .* (1 + spline(tau, tvel(:,[1 3])) * ome);

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  
  

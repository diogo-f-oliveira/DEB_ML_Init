function [prdData, info] = predict_Thamnophis_sirtalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_LdL = tempcorr(temp.LdL_fm, T_ref, T_A);
    
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  tT_p = (t_p-t_b)/ k_M/ TC_tp;     % d, time since brith at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;        % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;            % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  %
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, length at puberty at f
  L_bm = L_mm * l_bm; Lw_bm = L_bm/ del_M; % cm, length at birth
  tT_pm = (t_pm-t_bm)/ k_M/ TC_tp; % d, time since birth at pubert

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % length-change in length
  L_i = L_m * f_LdL; Lw_i = L_i/ del_M;
  rT_B = TC_LdL * k_M/ 3/ (1 + f_LdL/ g); % 1/d, von Bert growth rate
  EdL_f = rT_B * (Lw_i - LdL_fm(:,1)); % cm/d, change in length
  %
  L_im = L_mm * f_LdL; Lw_im = L_im/ del_M;
  rT_Bm = TC_LdL * k_M/ 3/ (1 + f_LdL/ g_m); % 1/d, von Bert growth rate
  EdL_m = rT_Bm * (Lw_im - LdL_fm(:,1)); % cm/d, change in length


  % pack to output
  prdData.LdL_fm = [EdL_f EdL_m];


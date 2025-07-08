function [prdData, info] = predict_Dentiraja_australis(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Lw_b = L_b/ del_M;                % cm, physical length at birth
  aT_b = t_b/ kT_M;                 % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty 
  Lw_p = L_p/ del_M;                % cm, physical length at puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty 

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
%   % males
%   p_Amm = z_m * p_M/ kap;            % J/d.cm^2, {p_Am} max spec assimilation flux for male
%   E_mm = p_Amm/ v;                   % J/cm^3, [E_m] reserve capacity for male
%   m_Emm = y_E_V * E_mm/ E_G;         % mol/mol, reserve capacity for males
%   g_m = E_G/ kap/ E_mm;              % -, energy investment ratio for male
%   w_m = m_Emm * w_E/ w_V;            % -, contribution of reserve to weight for males
%   L_mm = v/ k_M/ g_m;                % cm, maximum structural length
%   L_im = f * L_mm; Lw_im = L_im/ del_M; % cm, ultimate total length
%   pars_tpm = [g_m; k; l_T; v_Hb; v_Hpm];  % compose parameter vector
%   Lw_pm = L_mm *  get_lp(pars_tpm, f)/ del_M; % cm, total length at puberty

  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  % time-length
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tL, [], tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M;   % cm, length 
  
  % pack to output
  prdData.tL = ELw;
  
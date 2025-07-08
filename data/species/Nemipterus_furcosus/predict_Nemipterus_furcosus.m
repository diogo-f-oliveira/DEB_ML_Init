function [prdData, info] = predict_Nemipterus_furcosus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p * (1 + f * ome);       % g, weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];   % compose parameter vector

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

%   % males
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, max struc length
%   pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
%   [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
%   L_bm = L_mm * l_bm; L_im = l_im * L_mm; % cm, structural lengths
%   Lw_im = L_im/del_M;                  % cm, total length
%   tT_pm = (t_pm - t_bm)/ kT_M;         % d, time since birth at puberty
%   L_pm = l_pm * L_mm; Lw_pm = L_pm/ del_M; % length at puberty

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;

  % univariate data

  % time-length
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1) * kT_M);
  ELw = (L_m * tvel(:,4))/ del_M;  
  
  % weight-fecundity
  EN = TC * 365 * reprod_rate_j((WN(:,1)/(1+ome*f)).^(1/3), f, pars_R); % #, fecundity

  % pack to output  
  prdData.tL = ELw;
  prdData.WN = EN;

    
end
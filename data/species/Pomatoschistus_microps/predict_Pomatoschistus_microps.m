function [prdData, info] = predict_Pomatoschistus_microps(par, data, auxData)
  
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
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ kT_M;                 % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p-t_b)/ kT_M;        % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length
  Ww_i = L_i^3*(1+f*ome);           % g, ultimate weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);         % #/d, max reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
%   % males
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
%   w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;                  % cm, max struct length
%   L_bm = l_b * L_mm;                   % cm, struct length, birth & ultimate
%   L_im = f * L_mm; Lw_im = L_im/ del_M; 
%   Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
%   L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M;  % cm, total length
%   Ww_pm = L_pm^3 * (1 + f * w_m);      % g, ultimate wet weight
%   pars_tpm = [g_m k l_T v_Hb v_Hp];

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  [t, L] = ode45(@get_L, [0;tL(:,1)], L_m*get_lb([g k v_Hb], f_tL), [], T_ref, T_A, t_T, L_m*f_tL, k_M/3/(1+f_tL/g)); 
  L(1)=[]; ELw = L/ del_M;   % cm, length 
  
  % pack to output
  prdData.tL = ELw;
end

function dL = get_L(t,L, T_ref, T_A, t_T, L_i, r_B)
  TC = tempcorr(C2K(15+10*sin(pi*2*(t-t_T)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
  
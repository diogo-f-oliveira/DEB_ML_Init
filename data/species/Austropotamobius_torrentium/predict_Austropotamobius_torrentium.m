function [prdData, info] = predict_Austropotamobius_torrentium(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  filterChecks = k * v_Hp >= f^3 || ...            % constraint required for reaching puberty with f_Lab
                 ~reach_birth(g, k, v_Hb, f) ||... % constraint required for reaching birth with f_Lab
                E_Hh >= E_Hb ||...                     % maturity at hatching, birth
                v < 0.01;  
                 
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  

  
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_LN1 = tempcorr(temp.LN1, T_ref, T_A);
  TC_LN2 = tempcorr(temp.LN2, T_ref, T_A);
  TC_LN3 = tempcorr(temp.LN3, T_ref, T_A);
  
 %% zero-variate data

 % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E0 = J_E_Am * U_E0 * mu_E; % J
  
    % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1) +t_0; aT_h = a_h/ TC_ah; % d, age at hatch at f and T
  L_h = aUL(2,3); Lw_h = L_h/del_MC;    % cm, structural and physical length at f
  Ww_h = L_h^3 * (1 + f * ome);       % g, wet weight at hatch
  
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/del_M;                 % cm, length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth
  aT_b = (t_0 + tau_b/k_M) / TC_ab;      % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;  Lw_pc = L_p/ del_MC; % total and carapace length at puberty at f
  Ww_p = L_p^3 * (1 + f * ome);       % g, wet weight at puberty
  tT_p = (tau_p-tau_b)/k_M / TC_tp ;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ k_M/ TC_am;               % d, mean life span at T
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T * reprod_rate_j(2 * del_M, f, pars_R);          % #/d, ultimate reproduction rate at T

  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length

  pars_tpm = [g k l_T v_Hb v_Hpm];
  [~, tau_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f);
%   tT_pm = (tau_pm - tau_bm)/ k_M/ TC_tpm;       % d, time since birth at puberty
  L_bm = L_mm * l_bm;   % cm, structural length at birth at f for males
  Lw_pm = L_mm * l_pm /del_M;   % cm, total length at puberty at f for males
  L_im = (f-l_T) * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * ome_m);           % g, ultimate wet weight


  % pack to output
  prdData.ab = aT_b;
  prdData.ah = aT_h;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lhc = Lw_h;
  prdData.Lp = Lw_p;
  prdData.Lpc = Lw_pc;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  prdData.E0 = E0;


  %% univariate data

% length-weight females, MaguKlob2011
  EWw1 = (LWw1(:,1) * del_M).^3 * (1 + f * ome);  % g, wet weight
  EWw2 = (LWw2(:,1) * del_M).^3 * (1 + f * ome);  % g, wet weight
  EWw3 = (LWw3(:,1) * del_M).^3 * (1 + f * ome);  % g, wet weight
  EWw4 = (LWw4(:,1) * del_M).^3 * (1 + f * ome);  % g, wet weight
  
% length-weight males, MaguKlob2011
  EWw_m1 = (LWw_m1(:,1) * del_M).^3 * (1 + f * ome_m);  % g, wet weight
  EWw_m2 = (LWw_m2(:,1) * del_M).^3 * (1 + f * ome_m);  % g, wet weight
  EWw_m3 = (LWw_m3(:,1) * del_M).^3 * (1 + f * ome_m);  % g, wet weight
  EWw_m4 = (LWw_m4(:,1) * del_M).^3 * (1 + f * ome_m);  % g, wet weight

%   length - weight Males, BergStam2018
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * ome_m);  % g, wet weight
  
%   % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN1 = TC_LN1 * 2* 365 * reprod_rate(LN1(:,1)* del_M, f, pars_R); % #/d, ultimate reproduction rate at T
  EN2 = TC_LN2 * 2* 365 * reprod_rate(LN2(:,1)* del_M, f, pars_R); % #/d, ultimate reproduction rate at T
  EN3 = TC_LN3 * 2* 365 * reprod_rate(LN3(:,1)* del_M, f, pars_R); % #/d, ultimate reproduction rate at T
% pack to output   
  prdData.LWw1 = EWw1;
  prdData.LWw2 = EWw2;
  prdData.LWw3 = EWw3;
  prdData.LWw4 = EWw4;
  prdData.LWw_m1 = EWw_m1;
  prdData.LWw_m2 = EWw_m2;
  prdData.LWw_m3 = EWw_m3;
  prdData.LWw_m4 = EWw_m4;
  prdData.LW_m = EWw_m;
  prdData.LN1 = EN1;
  prdData.LN2 = EN2;
  prdData.LN3 = EN3;

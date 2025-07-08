function [prdData, info] = predict_Astacus_astacus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
 filterChecks = k * v_Hp >= f_Hudi^3 || ...            % constraint required for reaching puberty with f_Lab
                 ~reach_birth(g, k, v_Hb, f_Hudi) ||... % constraint required for reaching birth with f_Lab
                E_Hh >= E_Hb ;%||...                     % maturity at hatching, birth
%                 f_Gonz1 > 1.5 || f_Gonz2 > f_Gonz1 ||... % unrealistic
%                 v < 0.01;  
                 
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_tpm = tempcorr(temp.tpm, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_L2 = tempcorr(temp.L2, T_ref, T_A);
  TC_L2m = tempcorr(temp.L2m, T_ref, T_A);
  TC_Otoc = tempcorr(temp.tL_VLDf, T_ref, T_A);
  TC_West = tempcorr(temp.tL_Westf, T_ref, T_A);
  TC_Poli = tempcorr(temp.tWw_Poli1, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  
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
  a_h = t_0 + aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h / del_Mh;           % cm, physical length at f
%   Ww_h = L_h^3 * (1 + f * ome);       % g, wet weight at hatch
  
 % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/del_Mh;                 % cm, length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth
  aT_b = (t_0 + tau_b/k_M) / TC_ab;      % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * ome);       % g, wet weight at puberty
  tT_p = ((tau_p-tau_b)/k_M - t_0)/ TC_tp ;   % d, time since birth at puberty at f and T

   % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % growth
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_L2/ ir_B;  % 1/d, von Bert growth rate
  %   rT_B = rho_B * k_M * TC_L2;       % 1/d, von Bert growth rate 
  Lw_2 = (L_i - (L_i - L_b) * exp(- rT_B * 2* 365))/ del_M; % cm, total length at 2 yr

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ k_M/ TC_am;               % d, mean life span at T

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
   RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T * reprod_rate_j(2 * del_M, f, pars_R);          % #/d, ultimate reproduction rate at T

  
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length

  pars_tpm = [g k l_T v_Hb v_Hpm];
  [tau_pm, tau_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f);
  tT_pm = (tau_pm - tau_bm)/ k_M/ TC_tpm;       % d, time since birth at puberty
  L_bm = L_m * l_bm;   % cm, structural length at birth at f for males
  Lw_pm = L_m * l_pm /del_M;   % cm, total length at puberty at f for males
  L_im = (f-l_T) * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * ome_m);           % g, ultimate wet weight

  ir_B = 3/ k_M + 3 * f * L_mm/ v; rT_Bm = TC_L2m/ ir_B;  % 1/d, von Bert growth rate
   Lw_2m = (L_im - (L_im - L_bm) * exp(- rT_Bm * 2* 365))/ del_M; % cm, total length at 2 yr

  % pack to output  
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.L2 = Lw_2;
  prdData.L2m = Lw_2m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;

%% univariate data

  %  Otocac, time-length and time-weight at varying food, 
  % females eating veggies
  tf = [0 486 715 850; f_BastV1 f_BastV1 f_BastV2 f_BastV2]';
  [t, EL] = ode45(@get_EL, [0; tL_VLDf(:,1)], [E_m, L_b], [], tf, v * TC_Otoc, g, E_m, L_m, p_Am * TC_Otoc); % EL: {J/cm^3, cm}, with {[E], L}
  EL(1,:) = [];  % remove initial value
  ELw_VLDf = EL(:,2) / del_M; % cm, total length , for vegetable (low and high density)
  EWw_VLDf = EL(:,2).^3 .* (1 + EL(:,1) * w_E/ mu_E/ d_E); % g, wet weight
  
  % males males eating veggies
  [t, EL] = ode45(@get_EL, [0; tL_VLDm(:,1)], [E_m_m, L_b], [], tf, v * TC_Otoc, g_m, E_m_m, L_mm, p_Am_m * TC_Otoc); % EL: {J/cm^3, cm}, with {[E], L}
  EL(1,:) = [];  % remove initial value
  ELw_VLDm = EL(:,2) / del_M; % cm, total length , for vegetable (low and high density)
  EWw_VLDm = EL(:,2).^3 .* (1 + EL(:,1) * w_E/ mu_E/ d_E); % g, wet weight
  
  % females eating meat
  tf = [0 486 715 850; f_BastM1 f_BastM1 f_BastM2 f_BastM2]';
  [t, EL] = ode45(@get_EL, [0; tL_MLDf(:,1)], [E_m, L_b], [], tf, v * TC_Otoc, g, E_m, L_m, p_Am * TC_Otoc); % EL: {J/cm^3, cm}, with {[E], L}
  EL(1,:) = [];  % remove initial value
  ELw_MLDf = EL(:,2) / del_M; % cm, total length , for vegetable (low and high density)
  EWw_MLDf = EL(:,2).^3 .* (1 + EL(:,1) * w_E/ mu_E/ d_E); % g, wet weight
 
% males eating meat
  [t, EL] = ode45(@get_EL, [0; tL_MLDm(:,1)], [E_m_m, L_b], [], tf, v * TC_Otoc, g_m, E_m_m, L_mm, p_Am_m * TC_Otoc); % EL: {J/cm^3, cm}, with {[E], L}
  EL(1,:) = [];  % remove initial value
  ELw_MLDm = EL(:,2) / del_M; % cm, total length , for vegetable (low and high density)
  EWw_MLDm = EL(:,2).^3 .* (1 + EL(:,1) * w_E/ mu_E/ d_E); % g, wet weight

  % time - length
  % WestPurs1982 females, males 
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_West/ ir_B;  % 1/d, von Bert growth rate
  ELw_Westf = (L_i - (L_i - L_b) * exp(- rT_B * tL_Westf(:,1)))/ del_M; % cm, total length at 2 yr

  L_bm = L_mm * l_bm; L_im = (f-l_T) * L_mm;
  ir_Bm = 3/ k_M + 3 * f * L_mm/ v; rT_Bm = TC_West/ ir_Bm;  % 1/d, von Bert growth rate
  ELw_Westm = (L_im - (L_im - L_bm) * exp(- rT_Bm * tL_Westm(:,1)))/ del_M; % cm, total length at 2 yr

 
  % time - wet weight
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f_Poli);
  L_b = L_m * l_b; L_i = (f_Poli-l_T) * L_m;
  ir_B = 3/ k_M + 3 * f * L_mm/ v; rT_B = TC_Poli/ ir_B;  % 1/d, von Bert growth rate
  EL = (L_i - (L_i - L_b) * exp(- rT_B * tWw_Poli1(:,1)));
  EWw1 = EL.^3 * (1 + f_Poli * ome);  % g, wet weight

  EL = (L_i - (L_i - L_b) * exp(- rT_B * tWw_Poli2(:,1)));
  EWw2 = EL.^3 * (1 + f_Poli * ome);  % g, wet weight
 
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN = TC_LN * 365 * reprod_rate(LN(:,1)* del_M, f, pars_R);             % #/d, ultimate reproduction rate at T * reprod_rate_j(2 * del_M, f, pars_R);          % #/d, ultimate reproduction rate at T

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w);  % g, wet weight
  EWw_Hud_fem = (cLW_Hud_fem(:,1) * del_MC).^3 * (1 + f_Hudi * ome);  % g, wet weight
  EWw_Hud_m = (cLW_Hud_m(:,1) * del_MC).^3 * (1 + f_Hudi * ome_m);  % g, wet weight

  EWw_Mag_fem = (LWw_Mag_fem(:,1) * del_M).^3 * (1 + f_Magu * ome);  % g, wet weight
  EWw_Mag_m = (LWw_Mag_m(:,1) * del_M).^3 * (1 + f_Magu * ome_m);  % g, wet weight

  
  %% pack predictions uni-variate
  prdData.tL_VLDf = ELw_VLDf; prdData.tL_VHDf = ELw_VLDf; 
  prdData.tL_MLDf = ELw_MLDf; prdData.tL_MHDf = ELw_MLDf;
  prdData.tWw_VLDf = EWw_VLDf; prdData.tWw_VHDf = EWw_VLDf; 
  prdData.tWw_MLDf = EWw_MLDf; prdData.tWw_MHDf = EWw_MLDf;
  prdData.tL_VLDm = ELw_VLDm; prdData.tL_VHDm = ELw_VLDm; 
  prdData.tL_MLDm = ELw_MLDm; prdData.tL_MHDm = ELw_MLDm;
  prdData.tWw_VLDm = EWw_VLDm; prdData.tWw_VHDm = EWw_VLDm; 
  prdData.tWw_MLDm = EWw_MLDm; prdData.tWw_MHDm = EWw_MLDm;
  prdData.tL_Westf = ELw_Westf;
  prdData.tL_Westm = ELw_Westm;
  prdData.tWw_Poli1 = EWw1;
  prdData.tWw_Poli2 = EWw2;
  prdData.LN = EN;
  prdData.LW = EWw;
  prdData.cLW_Hud_fem = EWw_Hud_fem;
  prdData.cLW_Hud_m = EWw_Hud_m;
  prdData.LWw_Mag_fem = EWw_Mag_fem;
  prdData.LWw_Mag_m = EWw_Mag_m;
  
end


function dEL = get_EL(t, EL, tf, v, g, E_m, L_m, p_Am)
% by Starrlight (bobwhite quail)
  E = EL(1); % J/cm^3, reserve density [E]
  L = EL(2); % cm, structural length
  f  = spline1(t, tf);                    % -, scaled functional response at t
  dE = (f * p_Am - E * v)/ L;            % J/d.cm^3, change in reserve density d/dt [E]
  e  = E/ E_m;                            % -, scaled reserve density
  r  = v * (e/ L - 1/ L_m)/ (e + g);      % 1/d, specific growth rate
  dL = L * r/ 3;                         % cm/d, change in structural length d/dt L

  dEL = [dE; dL]; % catenate for output
end



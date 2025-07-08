function [prdData, info] = predict_Pacifastacus_leniusculus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  filterChecks = k * v_Hp >= f_Fin^3 || ...            % constraint required for reaching puberty with f_Lab
                 ~reach_birth(g, k, v_Hb, f_Fin) ||... % constraint required for reaching birth with f_Lab
                E_Hh >= E_Hb ||...                     % maturity at hatching, birth
                f_Gonz1 > 1.5 || f_Gonz2 > f_Gonz1 ||... % unrealistic
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
  TC_tpm = tempcorr(temp.tpm, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_L2 = tempcorr(temp.L2, T_ref, T_A);
  TC_L2m = tempcorr(temp.L2m, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL_T1 = tempcorr(temp.tL_T1, T_ref, T_A);
  TC_tL_T2 = tempcorr(temp.tL_T2, T_ref, T_A);
  TC_Belc1998 = tempcorr(temp.tL_Belc1998, T_ref, T_A);
  TC_Gonz2010 = tempcorr(temp.tL_Gonz2010_f1, T_ref, T_A); % all fs have same T
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  TC_LN_Hudi = tempcorr(temp.LN_Hudi, T_ref, T_A);
  TC_LN_Mart = tempcorr(temp.LN_Mart, T_ref, T_A);

  
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
  L_h = aUL(2,3);                  % cm, structural length at f
  Ww_h = L_h^3 * (1 + f * ome);       % g, wet weight at hatch
  
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/del_M;                 % cm, length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth
  aT_b = (t_0 + tau_b/k_M) / TC_ab;      % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * ome);       % g, wet weight at puberty
  tT_p = (tau_p-tau_b)/k_M / TC_tp ;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % growth
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_L2/ ir_B;  % 1/d, von Bert growth rate
  Lw_2 = (L_i - (L_i - L_b) * exp(- rT_B * 2* 365))/ del_M; % cm, total length at 2 yr

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
  [tau_pm, tau_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f);
  tT_pm = (tau_pm - tau_bm)/ k_M/ TC_tpm;       % d, time since birth at puberty
  L_bm = L_mm * l_bm;   % cm, structural length at birth at f for males
  Lw_pm = L_mm * l_pm /del_M;   % cm, total length at puberty at f for males
  L_im = (f-l_T) * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * ome_m);           % g, ultimate wet weight
% growth
  ir_B = 3/ k_M + 3 * f * L_mm/ v; rT_Bm = TC_L2m/ ir_B;  % 1/d, von Bert growth rate
   Lw_2m = (L_im - (L_im - L_bm) * exp(- rT_Bm * 2* 365))/ del_M; % cm, total length at 2 yr


  % pack to output
  prdData.ab = aT_b;
  prdData.ah = aT_h;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.L2 = Lw_2;
  prdData.L2m = Lw_2m;
  prdData.Wwh = Ww_h;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  prdData.E0 = E0;


  %% univariate data
  % age  - length KozaBuri2009
   F = f_Koz; 
  [tau_p, tau_b, l_p, l_b] = get_tp(pars_tp, F);
  L_b = L_m * l_b;  L_i = L_m * (F - l_T);
  ir_B = 3/ k_M + 3 * F * L_m/ v; 
  rT_B = TC_tL_T1/ ir_B;  % d, 1/von Bert growth rate
  ELw_T1 = ((L_i - (L_i - L_b) * exp( - rT_B * tL_T1(:,1))))/del_M; % cm, total length 
  EL_T1 = (L_i - (L_i - L_b) * exp( - rT_B * tWw_T1(:,1))); % structural length
  EWw_T1 = EL_T1.^3 * (1 + F * ome);  % g, wet weight

  rT_B = TC_tL_T2/ ir_B;  % d, 1/von Bert growth rate
  ELw_T2 = (L_i - (L_i - L_b) * exp( - rT_B * tL_T2(:,1)))/del_M;  % cm, total length
  EL_T2 = L_i - (L_i - L_b) * exp( - rT_B * tWw_T2(:,1));% structural length
  EWw_T2 = EL_T2.^3 * (1 + F * ome);  % g, wet weight

  
  % Belc1998,  age - carapace length, and age- wet weight
     F = f;
  rT_B = TC_Belc1998/ ir_B;  % d, 1/von Bert growth rate
  L_b = L_m * l_b;  L_i = L_m * (F - l_T);
  EL_Belc1998 = L_i - (L_i - L_b) * exp( - rT_B * tL_Belc1998(:,1)); 
  ELw_Belc1998 = EL_Belc1998/del_MC; % cm, total length
  EL_Belc1998 = L_i - (L_i - L_b) * exp( - rT_B * tWw_Belc1998(:,1)); % cm, total length
  EWw_Belc1998 = EL_Belc1998.^3 * (1 + F * ome);  % g, wet weight
  
  
  % Gonza2010,  age - carapace length, and age- wet weight, at two fs
   F = f_Gonz1; 
  ir_B = 3/ k_M + 3 * F * L_m/ v;   rT_B = TC_Gonz2010/ ir_B;  % d, 1/von Bert growth rate
  [tau_p, tau_b, l_p, l_b] = get_tp(pars_tp, F);
   L_b = L_m * l_b;  L_i = L_m * (F - l_T);
  EL_Gonz2010 = L_i - (L_i - L_b) * exp( - rT_B * tL_Gonz2010_f1(:,1)); 
  ELw_Gonz2010_f1 =   EL_Gonz2010/del_MC; % cm, total length
    EL_Gonz2010 = L_i - (L_i - L_b) * exp( - rT_B * tWw_Gonz2010_f1(:,1)); % cm, total length
    EWw_Gonz2010_f1 = EL_Gonz2010.^3 * (1 + F * ome);  % g, wet weight
  
    F = f_Gonz2; 
   ir_B = 3/ k_M + 3 * F * L_m/ v;   rT_B = TC_Gonz2010/ ir_B;  % d, 1/von Bert growth rate
  [tau_p, tau_b, l_p, l_b] = get_tp(pars_tp, F);
   L_b = L_m * l_b;  L_i = L_m * (F - l_T);
  EL_Gonz2010 = L_i - (L_i - L_b) * exp( - rT_B * tL_Gonz2010_f2(:,1)); 
  ELw_Gonz2010_f2 =   EL_Gonz2010/del_MC; % cm, total length
    EL_Gonz2010 = L_i - (L_i - L_b) * exp( - rT_B * tWw_Gonz2010_f2(:,1)); % cm, total length
    EWw_Gonz2010_f2 = EL_Gonz2010.^3 * (1 + F * ome);  % g, wet weight
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN = TC_LN * 365 * reprod_rate(LN(:,1)* del_M, f, pars_R); % #/d, ultimate reproduction rate at T

  EN_Hudi = TC_LN_Hudi * 365 * reprod_rate(LN_Hudi(:,1)* del_M, f, pars_R); % #/d, ultimate reproduction rate at T
  EN_Mart = TC_LN_Mart * 365 * reprod_rate(LN_Mart(:,1)* del_M, f, pars_R); % #/d, ultimate reproduction rate at T
  
  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * ome);  % g, wet weight
  
 % length - weight Females and Males, WestSavo2002
  EWw_fem = (LWw_fem(:,1) * del_M).^3 * (1 + f_Fin * ome);  % g, wet weight
  EWw_m = (LWw_m(:,1) * del_M).^3 * (1 + f_Fin * ome_m);  % g, wet weight
 
  
  prdData.tL_T1 = ELw_T1;
  prdData.tL_T2 = ELw_T2;
  prdData.tWw_T1 = EWw_T1;
  prdData.tWw_T2 = EWw_T2;
  prdData.tL_Belc1998 = ELw_Belc1998;
  prdData.tWw_Belc1998 = EWw_Belc1998;
  prdData.tL_Gonz2010_f1 = ELw_Gonz2010_f1;
  prdData.tWw_Gonz2010_f1 = EWw_Gonz2010_f1;
  prdData.tL_Gonz2010_f2 = ELw_Gonz2010_f2;
  prdData.tWw_Gonz2010_f2 = EWw_Gonz2010_f2;
  prdData.LN = EN;
  prdData.LN_Hudi = EN_Hudi;
  prdData.LN_Mart = EN_Mart;
  prdData.LW = EWw;
  prdData.LWw_fem = EWw_fem;
  prdData.LWw_m = EWw_m;
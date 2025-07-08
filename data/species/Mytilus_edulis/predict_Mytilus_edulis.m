function [prdData, info] = predict_Mytilus_edulis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if F_m < 0
    prdData = []; info = 0; return
  end

  % compute temperature correction factors
  pars_T = [T_A; T_L; T_H; T_AL; T_AH];
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_tp = tempcorr(temp.tp, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  TC_GSI = tempcorr(temp.GSI, T_ref, pars_T);
  TC_KiorMohl1980 = tempcorr(temp.SJX_KiorMohl1980, T_ref, pars_T);
  TC_WiddFiet1979 = tempcorr(temp.SJXp_WiddFiet1979, T_ref, pars_T);
  TC_PrinSmaa1991 = tempcorr(temp.SJXp_PrinSmaa1991, T_ref, pars_T);
  TC_JXJO = tempcorr(temp.JXJO_25, T_ref, pars_T);
  TC_LJO = tempcorr(temp.LJO, T_ref, pars_T);
  TC_tL = tempcorr(temp.tL_0, T_ref, pars_T);
  TC_tdL = tempcorr(temp.tdL, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T
  %
  % GSI: (4.89) of Kooy2010
  GSI = 365 * TC_GSI * k_M * g/ f^3/ (f + kap * g * y_V_E);  % -, GSI based on 10 d accumulation (wild guess)
  GSI = GSI * ((1 - kap) * f^2 - k_J * U_Hp/ (s_M * L_m)^2); % mol E_R/ mol W
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.GSI = GSI;
  
  % uni-variate data

  % particle conc-ingestion
  K = 1e3 * w_X * y_X_E * J_E_Am/ F_m; % mg/l, half saturation const
  %
  L = 3.7 * del_M;           % cm, structual length
  X = 0.08 * w_X/ 12;        % mg/l, food conc
  Y = SJX_KiorMohl1980(:,1); % mg/l, inorg matter conc
  EJT_X_KiorMohl1980 = TC_KiorMohl1980 * 1e5 * w_X * J_X_Am * L^2 * (X + Y) ./ (K * (1 + Y/ K_Y) + X + Y)/ 24; % mg/h, ingestion rate
  %
  L = 6 * del_M;             % cm, structual length
  X = 0.2 * w_X/ 12;         % mg/l, mean food conc
  Y = SJX_PrinSmaa1991(:,1); % mg/l, inorg matter conc
  EJT_X_PrinSmaa1991 = TC_PrinSmaa1991 * 1e6 * y_Ch_X * w_X * J_X_Am * L^2 * X ./ (K * (1 + Y/ K_Y) + X + Y)/ 24; % mug/h, ingestion rate
  
  % particle conc-pseudofaeces prod
  L = 7 * del_M;              % cm, structual length
  X = 0.24 * w_X/ 12;         % mg/l, food conc
  Y = SJXp_WiddFiet1979(:,1); % mg/l, inorg matter conc
  J_X = J_X_Am * L^2 * (X + Y)./ (K * (1 + Y/ K_Y) + X + Y)/ 24; % mol/h, ingestion rate
  EJT_Xp_WiddFiet1979 = TC_WiddFiet1979 * 1e6 * w_X * J_X .* Y ./ (X + Y); % mg/h, pseudo faeces prod
  %
  L = 6 * del_M;              % cm, structual length
  X = 0.2 * w_X/ 12;          % mg/l, mean food conc
  Y = SJXp_PrinSmaa1991(:,1); % mg/l, inorg matter conc
  J_X = J_X_Am * L^2 * (X + Y)./ (K * (1 + Y/ K_Y) + X + Y)/ 24; % mmol/h, ingestion rate
  EJT_Xp_PrinSmaa1991 = TC_PrinSmaa1991 * 1e6 * y_Ch_X * w_X * J_X .* Y ./ (X + Y); % mug/h, pseudo faeces prod  
  % particle conc-faeces prod
  EJT_P_PrinSmaa1991 = TC_PrinSmaa1991 * 1e6 * w_X * (1 - y_E_X) * J_X * X ./ (X + Y); % mug/h, faeces prod
  
  % ingestion-respiration
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  pT_ref = TC_JXJO * p_Am * L_m^2; % J/d, max assimilation power at max size
  n = size(JXJO_25,1); EJO_25 = zeros(n,1); L = 2.5 * del_M; JT_XAm = TC_JXJO * J_X_Am * L^2;
  for i = 1:n
    fi = JXJO_25(i,1)/ JT_XAm; [l_ji, l_pi, l_bi] = get_lj(pars_tj, fi);
    pACSJGRD = pT_ref * scaled_power_j(L, fi, pars_p, l_bi, l_ji, l_pi); % J/d, powers
    J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
    EJO_25(i) = - J_M(3,:)';                            % mol/d, O2 consumption 
  end
  %    
  n = size(JXJO_45,1); EJO_45 = zeros(n,1); L = 4.5 * del_M; JT_XAm = TC_JXJO * J_X_Am * L^2;
  for i = 1:n
    fi = JXJO_45(i,1)/ JT_XAm; [l_ji, l_pi, l_bi] = get_lj(pars_tj, f);
    pACSJGRD = pT_ref * scaled_power_j(L, fi, pars_p, l_bi, l_ji, l_pi); % J/d, powers
    J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
    EJO_45(i) = - J_M(3,:)';                            % mol/d, O2 consumption 
  end
  
  % length-respiration
  pACSJGRD = pT_ref * scaled_power_j(LJO(:,1) * del_M, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
  EJT_O = - J_M(3,:)';                                % mol/d, O2 consumption 
  
  % time-length
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  kT_M = k_M * TC_tL; rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  ELw_0 = (L_i - (L_i - L_j) * exp( - rT_B * (tL_0(:,1) - tT_j)))/ del_M; % cm, shell height
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL * (1 - 0.13));
  rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  ELw_13 = (L_i - (L_i - L_j) * exp( - rT_B * (tL_13(:,1) - tT_j)))/ del_M; % cm, shell height
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL * (1 - 0.33));
  rT_B = rho_B * kT_M; L_j = L_m * l_j; L_i = L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  ELw_33 = (L_i - (L_i - L_j) * exp( - rT_B * (tL_33(:,1) - tT_j)))/ del_M; % cm, shell height
  
  % time-growth
  vT = v * TC_tdL; kT_J = k_J * TC_tdL; L_0 = 1.7 * del_M; UT_E = L_0^3 * f_0/ vT;
  [A ULH] = ode23s(@dget_ULH, tdL(:,1), [UT_E; L_0; M_Hp], [], vT, g, L_m, kT_J, kap);
  eL3 = ULH(:,1) .* v; gL3 = g .* ULH(:,2).^3;
  EdLw = v .* (eL3 - ULH(:,2).^4/ L_m) ./ (3 * (eL3 + gL3)) * L_m/ del_M; % from scaled dL = dl * Lm

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  
  % pack to output
  prdData.SJXp_WiddFiet1979 = EJT_Xp_WiddFiet1979;
  prdData.SJX_KiorMohl1980 = EJT_X_KiorMohl1980;
  prdData.SJXp_PrinSmaa1991 = EJT_Xp_PrinSmaa1991;
  prdData.SJX_PrinSmaa1991 = EJT_X_PrinSmaa1991;
  prdData.SJP_PrinSmaa1991 = EJT_P_PrinSmaa1991;
  prdData.JXJO_25 = EJO_25;
  prdData.JXJO_45 = EJO_45;
  prdData.LJO = EJT_O;
  prdData.tL_0 = ELw_0;
  prdData.tL_13 = ELw_13;
  prdData.tL_33 = ELw_33;
  prdData.tdL = EdLw;
  prdData.LW = EWw;
end

% %%% subfunctions

function dULH = dget_ULH(t, ULH, v, g, Lm, kJ, kap)
  % change in state variables during embryo stage
  % called by fnget_lnpars_r, get_pars
  
  % unpack state variables
  U = ULH(1); % U = M_E/{J_{EAm}}
  L = ULH(2); % structural length
  H = ULH(3); % H = M_H/{J_{EAm}}

  eL3 = U * v; % eL3 = L^3 * m_E/ m_Em
  gL3 = g * L^3;
  SC = L^2 * (1 + L/(g * Lm)) * g * eL3/ (gL3 + eL3); % J_EC/{J_EAm}
  dU = - SC;
  dL = v * (eL3 - L^4/ Lm)/ (3 * (eL3 + gL3));
  dH = (1 - kap) * SC - kJ * H;

  % pack derivatives
  dULH = [dU; dL; dH];
end

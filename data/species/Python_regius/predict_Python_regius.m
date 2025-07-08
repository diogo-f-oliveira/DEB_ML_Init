function [prdData, info] = predict_Python_regius(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_apm = tempcorr(temp.apm, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tW = tempcorr(temp.tW_01, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b] = get_tp(pars_tpm, f);
  aT_pm = t_p/ k_M/ TC_apm;            % d, age at puberty
  L_pm = L_mm * l_p;                   % cm, total length at puberty
  Ww_pm = L_pm.^3 * (1 + f * w_m);     % g, wet weight at puberty
  L_im = (f - l_T) * L_mm;             % cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.apm = aT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  pT_Am = p_Am * TC_tW; vT = v * TC_tW; pars_lb = [g k v_Hb];
  
  n = size(food.tW_01,1);  XeL_0 = [0; e_01; L_01]; tXeL = zeros(0, 4);
  for i = 2:n
    [t, XeL] = ode45(@dXeL, food.tW_01([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:) + kap_X_01 * [food.tW_01(i,2) 0 0]; 
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_01(:,1); X = spline1(t,tXeL(:,[1 2])); e= spline1(t,tXeL(:,[1 3])); L = spline1(t,tXeL(:,[1 4]));
  EWw_01 = L.^3 .* (1 + e * w) + X;
  
  n = size(food.tW_02,1); XeL_0 = [0; e_02; L_02]; tXeL = zeros(n, 4); 
  for i = 2:n
    [t, XeL] = ode45(@dXeL, food.tW_02([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:) + kap_X * [food.tW_02(i,2) 0 0];
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_02(:,1); X = spline1(t,tXeL(:,[1 2])); e = spline1(t,tXeL(:,[1 3])); L = spline1(t,tXeL(:,[1 4]));
  EWw_02 = L.^3 .* (1 + e * w) + X;
  
  n = size(food.tW_03,1); XeL_0 = [0; e_03; L_03]; tXeL = zeros(n, 4);  
  for i = 2:n
    [t, XeL] = ode45(@dXeL, food.tW_03([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:) + kap_X_03 * [food.tW_03(i,2) 0 0];
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_03(:,1); X = spline1(t,tXeL(:,[1 2])); e = spline1(t,tXeL(:,[1 3])) ; L = spline1(t,tXeL(:,[1 4]));
  EWw_03 = L.^3 .* (1 + e * w) + X;
  
  n = size(food.tW_04,1);  XeL_0 = [0; e_04; L_04]; tXeL = zeros(n, 4);
  for i = 2:n
    [t, XeL] = ode45(@dXeL, food.tW_04([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:) + kap_X_04 * [food.tW_04(i,2) 0 0];
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_04(:,1); X = spline1(t,tXeL(:,[1 2])); e = spline1(t,tXeL(:,[1 3])); L = spline1(t,tXeL(:,[1 4]));
  EWw_04 = L.^3 .* (1 + e * w) + X;
  
  n = size(food.tW_05,1); XeL_0 = [0; e_05; L_05]; tXeL = zeros(n, 4); 
  for i = 2:n
    [t, XeL] = ode45(@dXeL, food.tW_05([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:) + kap_X_05 * [food.tW_05(i,2) 0 0]; % smaller digestion efficiency
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_05(:,1); X = spline1(t,tXeL(:,[1 2])); e = spline1(t,tXeL(:,[1 3])); L = spline1(t,tXeL(:,[1 4]));
  EWw_05 = L.^3 .* (1 + e * w) + X;
  
  n = size(food.tW_06,1); XeL_0 = [0; e_06; L_06]; tXeL = zeros(n, 4); 
  for i = 2:n
    [t, XeL] = ode45(@dXeL, food.tW_06([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:) + kap_X_05 * [food.tW_06(i,2) 0 0]; % kap_06 = kap_05
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_06(:,1); X = spline1(t,tXeL(:,[1 2])); e = spline1(t,tXeL(:,[1 3])); L = spline1(t,tXeL(:,[1 4]));
  EWw_06 = L.^3 .* (1 + e * w) + X + 472 * (t < 1422); % spawning of 4 eggs of 472 g in total at day 1422
  e_b06 = e(t < 1422); e_b06 = e_b06(1); % scaled reserve density at spawning (see snake 10,11,12) 
  
  n = size(food.tW_07,1); XeL_0 = [0; e_07; L_07]; tXeL = zeros(n, 4); 
  for i = 2:n
    [t, XeL] = ode45(@dXeL, food.tW_07([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:) + kap_X_07 * [food.tW_07(i,2) 0 0];
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_07(:,1); X = spline1(t,tXeL(:,[1 2])); e = spline1(t,tXeL(:,[1 3])); L = spline1(t,tXeL(:,[1 4]));
  EWw_07 = L.^3 .* (1 + e * w) + X;
  
  n = size(food.tW_08,1); XeL_0 = [0; e_08; L_08]; tXeL = zeros(n, 4); 
  for i = 2:n
    [t, XeL] = ode45(@dXeL, food.tW_08([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:)  + kap_X * [food.tW_08(i,2) 0 0];
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_08(:,1); X = spline1(t,tXeL(:,[1 2])); e = spline1(t,tXeL(:,[1 3])); L = spline1(t,tXeL(:,[1 4]));
  EWw_08 = L.^3 .* (1 + e * w) + X;

  L_b = L_m * get_lb(pars_lb, e_b06); % cm, length at birth for 10, 11 and 12
  n = size(food.tW_10,1); XeL_0 = [0; e_b06; L_b]; tXeL = zeros(n, 4); 
  for i = 2:n
    [t, XeL] = ode45(@dXeL, food.tW_10([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:)  + kap_X * [food.tW_10(i,2) 0 0];
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_10(:,1); X = spline1(t,tXeL(:,[1 2])); e = spline1(t,tXeL(:,[1 3])); L = spline1(t,tXeL(:,[1 4]));
  EWw_10 = L.^3 .* (1 + e * w) + X;

  n = size(food.tW_11,1); XeL_0 = [0; e_b06; L_b]; tXeL = zeros(n, 4); 
  for i = 2:n
    [t, XeL] = ode45(@dXeL, food.tW_11([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:)  + kap_X * [food.tW_11(i,2) 0 0];
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_11(:,1); X = spline1(t,tXeL(:,[1 2])); e = spline1(t,tXeL(:,[1 3])); L = spline1(t,tXeL(:,[1 4]));
  EWw_11 = L.^3 .* (1 + e * w) + X;

  n = size(food.tW_12,1); XeL_0 = [0; e_b06; L_b]; tXeL = zeros(n, 4); 
  for i = 2:n
    [t XeL] = ode45(@dXeL, food.tW_12([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:)  + kap_X * [food.tW_12(i,2) 0 0];
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_12(:,1); X = spline1(t,tXeL(:,[1 2])); e = spline1(t,tXeL(:,[1 3])); L = spline1(t,tXeL(:,[1 4]));
  EWw_12 = L.^3 .* (1 + e * w) + X;

  n = size(food.tW_13,1); XeL_0 = [0; e_13; L_13]; tXeL = zeros(n, 4); 
  for i = 2:n
    [t, XeL] = ode45(@dXeL, food.tW_13([i - 1;i],1), XeL_0, [], vT, pT_Am, g, L_m, L_T);
    XeL_0 = XeL(end,:)  + kap_X * [food.tW_13(i,2) 0 0];
    tXeL = [tXeL; [t,XeL]];
  end
  t = tW_13(:,1); X = spline1(t,tXeL(:,[1 2])); e = spline1(t,tXeL(:,[1 3])); L = spline1(t,tXeL(:,[1 4]));
  EWw_13 = L.^3 .* (1 + e * w) + X;

  % pack to output
  prdData.tW_01 = EWw_01;
  prdData.tW_02 = EWw_02;
  prdData.tW_03 = EWw_03;
  prdData.tW_04 = EWw_04;
  prdData.tW_05 = EWw_05;
  prdData.tW_06 = EWw_06;
  prdData.tW_07 = EWw_07;
  prdData.tW_08 = EWw_08;
  prdData.tW_10 = EWw_10;
  prdData.tW_11 = EWw_11;
  prdData.tW_12 = EWw_12;
  prdData.tW_13 = EWw_13;
  
end

% %%% SUBFUNCTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

function dXeL = dXeL(t,XeL, vT, pT_Am, g, L_m, L_T)
  % routine for predict_Python_regius
  % digestion at max rate
  
  %unpack state variables
  X = max(0, XeL(1)); e = XeL(2); L = XeL(3);
  
  dX = - (X > 0) * pT_Am * L^2;
  de = - dX/ L^3 - e * vT/ L;
  r = vT * (e/ L - (1 + L_T/ L)/ L_m)/ (e + g);
  dL = L * r/ 3;
  
  dXeL = [dX; de; dL];
end
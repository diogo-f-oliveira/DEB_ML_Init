function [prdData, info] = predict_Simalia_amethistina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%   if f_tL0 < 0.2
%     info = 0; prdData = []; return;
%   end
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
    
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if ~info; prdData = []; return; end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];
  U_E0 = initial_scaled_reserve(f, pars_UE0);
  E_0 = p_Am * U_E0;            % J, initial energy content
  Ww_0 = w_E * E_0/ mu_E/ d_E;  % g, initial wet weight  

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

%   % males
%   p_Am_m = z_m * p_M/ kap;          % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);          % -, energy investment ratio
%   m_Em_m = y_E_V * E_m_m/ E_G;      % mol/mol, reserve capacity 
%   w_m = m_Em_m * w_E/ w_V;          % -, contribution of reserve to weight
%   L_mm = v/ k_M/ g_m;               % cm, max struct length
%   L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
%   Ww_im = L_im^3 * (1 + f * w);     % g, wet weight
%   %
%   pars_tpm = [g_m k l_T v_Hb v_Hp];
%   [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
%   L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, length at puberty at f
%   L_bm = L_mm * l_bm; Lw_bm = L_bm/ del_M; % cm, length at birth
%   tT_pm = (t_pm-t_bm)/ k_M/ TC_tp; % d, time since birth at pubert

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
  prdData.Ww0 = Ww_0;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-length
  L_b1 = L_m * get_lb([g k v_Hb], f_tL1); L_i1 = L_m * f_tL1; tf1 = [0 f_tL1; 200 f_tL1];
  [t, ELL2] = ode45(@get_L2, tX(:,1), [f_tL1*E_m; L_b1; 0], [], tf1, v, g, E_m, L_m, p_Am); 
  L1 = ELL2(:,2); ELw_1 = L1/ del_M; % cm, total length
  %
  L_b2 = L_m * get_lb([g k v_Hb], f_tL2); L_i2 = L_m * f_tL2; tf2 = [0 f_tL2; 200 f_tL2];
  [t, ELL2] = ode45(@get_L2, tX(:,1), [f_tL2*E_m; L_b2; 0], [], tf2, v, g, E_m, L_m, p_Am); 
  L2 = ELL2(:,2); ELw_2 = L2/ del_M; % cm, total length
  %
  L_b3 = L_m * get_lb([g k v_Hb], f_tL3); L_i3 = L_m * f_tL3; tf3 = [0 f_tL3; 200 f_tL3];
  [t, ELL2] = ode45(@get_L2, tX(:,1), [f_tL3*E_m; L_b3; 0], [], tf3, v, g, E_m, L_m, p_Am); 
  L3 = ELL2(:,2); ELw_3 = L3/ del_M; % cm, total length
  %
  L_b4 = L_m * get_lb([g k v_Hb], f_tL4); L_i4 = L_m * f_tL4; tf4 = [0 f_tL4; 200 f_tL4];
  [t, ELL2] = ode45(@get_L2, tX(:,1), [f_tL4*E_m; L_b4; 0], [], tf4, v, g, E_m, L_m, p_Am); 
  L4 = ELL2(:,2); ELw_4 = L4/ del_M; % cm, total length
  %
  L_b5 = L_m * get_lb([g k v_Hb], f_tL5); L_i5 = L_m * f_tL5; tf5 = [0 f_tL5; 200 f_tL5];
  [t, ELL2] = ode45(@get_L2, tX(:,1), [f_tL5*E_m; L_b5; 0], [], tf5, v, g, E_m, L_m, p_Am); 
  L5 = ELL2(:,2); ELw_5 = L5/ del_M; % cm, total length

  % time-weight
  EWw_1 = L1.^3 .* (1 + spline1(tW(:,1),tf1) * w); % g, wet weight
  EWw_2 = L2.^3 .* (1 + spline1(tW(:,1),tf2) * w); % g, wet weight
  EWw_3 = L3.^3 .* (1 + spline1(tW(:,1),tf3) * w); % g, wet weight
  EWw_4 = L4.^3 .* (1 + spline1(tW(:,1),tf4) * w); % g, wet weight
  EWw_5 = L5.^3 .* (1 + spline1(tW(:,1),tf5) * w); % g, wet weight
  
  % time-cum food
  [t, ELL2] = ode45(@get_L2, tX(:,1), [f_tL1*E_m; L_b1; 0], [], tf1, v, g, E_m, L_m, p_Am); EX_1 = f_tL1 * p_Am * ELL2(:,3)/ kap_X/ mu_X * w_X/ d_X; % g, wet food
  [t, ELL2] = ode45(@get_L2, tX(:,1), [f_tL2*E_m; L_b2; 0], [], tf2, v, g, E_m, L_m, p_Am); EX_2 = f_tL2 * p_Am * ELL2(:,3)/ kap_X/ mu_X * w_X/ d_X; % g, wet food
  [t, ELL2] = ode45(@get_L2, tX(:,1), [f_tL3*E_m; L_b3; 0], [], tf3, v, g, E_m, L_m, p_Am); EX_3 = f_tL3 * p_Am * ELL2(:,3)/ kap_X/ mu_X * w_X/ d_X; % g, wet food
  [t, ELL2] = ode45(@get_L2, tX(:,1), [f_tL4*E_m; L_b4; 0], [], tf4, v, g, E_m, L_m, p_Am); EX_4 = f_tL4 * p_Am * ELL2(:,3)/ kap_X/ mu_X * w_X/ d_X; % g, wet food
  [t, ELL2] = ode45(@get_L2, tX(:,1), [f_tL5*E_m; L_b5; 0], [], tf5, v, g, E_m, L_m, p_Am); EX_5 = f_tL5 * p_Am * ELL2(:,3)/ kap_X/ mu_X * w_X/ d_X; % g, wet food

  % pack to output
  prdData.tL = [ELw_1 ELw_2 ELw_3 ELw_4 ELw_5];
  prdData.tW = [EWw_1 EWw_2 EWw_3 EWw_4 EWw_5];
  prdData.tX = [EX_1  EX_2  EX_3  EX_4  EX_5];
end

function dELL2 = get_L2(t, ELL2, tf, v, g, E_m, L_m, p_Am)
  E = ELL2(1); % J/cm^3, reserve density [E}
  L = ELL2(2); % cm, structural length
  
  f = spline1(t, tf);                    % -, scaled functional response at t
  dE = (f * p_Am - E * v)/ L;            % J/d.cm^3, change in reserve density d/dt [E]
  e = E/ E_m;                            % -, scaled reserve density
  r = v * (e/ L - 1/ L_m)/ (e + g);      % 1/d, specific growth rate
  dL = L * r/ 3;                         % cm/d, change in structural length d/dt L
  
  dELL2 = [dE; dL; L^2]; % catenate for output
end
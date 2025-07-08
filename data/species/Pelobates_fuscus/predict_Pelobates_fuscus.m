function [prdData, info] = predict_Pelobates_fuscus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if f_bj < 0 || f_bj > 3.5 || f_tLf>1||f_tLm>1||f_tLf<0.4||f_tLm<0.4
    info = 0; prdData = []; return
  end

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [t_j, ~, l_j, ~] = get_tp(pars_tj, f_bj);       % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % start
  pars_UEO = [V_Hb, g, k_J, k_M, v];
  [UE0, ~, info] = initial_scaled_reserve(f, pars_UEO);
  E0 = UE0 * p_Am; % J, initian energy in egg
  Wd_0 = E0 * w_E/ mu_E; % g, dry weight of an egg
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mb;               % cm, total length of tadpole
%   Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at birth at f

%   Lw_jb = L_j/ del_Mb;              % cm, total length of tadpole at metam at f
  Lw_j = L_j/ del_M;                % cm, SVL at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC;      % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, SVL at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  tT_p = (t_p - t_j)/ k_M/ TC;      % d, time since metam at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm; 
  Lw_im = L_im/ del_M;% cm, ultimate structural, body length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m k l_T v_Hj v_Hp];   % pars for toad
  [t_pm, t_jm, l_pm, l_jm] = get_tp(pars_tpm, f);
%   tT_pm = (t_pm - t_jm)/ k_M/ TC;      % d, time since metam at puberty
%   L_pm = l_pm * L_mm; 
%   Lw_pm = L_pm/ del_M; % cm, physical, SVL
%   Ww_pm = L_pm^3 * (1 + f * w_m);      % g, wet weight at puberty
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
%   prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
%   prdData.Ljb = Lw_jb;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
%   prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wd0 = Wd_0;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
%   prdData.Wwpm = Ww_pm;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-length
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tLf, [0, f, l_j], tL_f(:,1)*k_M*TC_tL);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male
  tvel = get_tpm(pars_tpm, f_tLm, [0, f, l_jm], tL_m(:,1)*k_M*TC_tL);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length 
   % length-weight
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w_m); % g, wet weight
  % tadpole
  tf = [0;f_bj ]';
  [t, EL] = ode45(@get_EL, tL(:,1), [E_m, L_b], [], tf, v * TC_tL, g, E_m, L_m, p_Am * TC_tL); % EL: {J/cm^3, cm}, with {[E], L}
  tdelM = [0 13 80 100;del_Mb del_M13  del_M80 del_M]';
  delM = spline1(tL(:,1), tdelM);                    % -, scaled functional response at t
  ELw = EL(:,2)./ delM; % cm, TL tadpole
 
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tL   = ELw;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
end

function dEL = get_EL(t, EL, tf, v, g, E_m, L_m, p_Am)
  E = EL(1); % J/cm^3, reserve density [E}
  L = EL(2); % cm, structural length
  
  f = spline1(t, tf);                    % -, scaled functional response at t
  dE = (f * p_Am - E * v)/ L;            % J/d.cm^3, change in reserve density d/dt [E]
  e = E/ E_m;                            % -, scaled reserve density
  r = v * (e/ L - 1/ L_m)/ (e + g);      % 1/d, specific growth rate
  dL = L * r/ 3;                         % cm/d, change in structural length d/dt L
  
  dEL = [dE; dL]; % catenate for output
end
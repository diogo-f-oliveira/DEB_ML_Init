function [prdData, info] = predict_Eryx_miliaris(par, data, auxData)
  
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
  TC_tW = tempcorr(temp.tW_f, T_ref, T_A);
    
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
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  tT_p = (t_p-t_b)/ k_M/ TC_tp;     % d, time since brith at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % males
  p_Am_m = z_m * p_M/ kap;          % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v_m;                % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);          % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;      % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;          % -, contribution of reserve to weight
  L_mm = v_m/ k_M/ g_m;               % cm, max struct length
  L_im = f * L_mm;                  % cm, ultimate struc length
  Ww_im = L_im^3 * (1 + f * w_m);   % g, wet weight
  pars_tpm = [g_m k l_T v_Hb v_Hp];

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
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-weight
  % female
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tW, [], tW_f(:,1)*k_M*TC_tW);
  EWw_f = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * w);   % g, weight
  % male
  tvel = get_tpm(pars_tpm, f_tW, [t_b, f_tW*z/z_m, l_b*z/z_m], tW_m(:,1)*k_M*TC_tW);
  EWw_m = (L_mm * tvel(:,4)).^3 .* (1 + tvel(:,3) * w_m); % g, weight
  
  % pack to output
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
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
function [prdData, info] = predict_Hiodon_alosoides(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  vars_pull(par); vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if t_0 < 0 || t_0 > 35 || f_000 < 0 || f_175 < 0 || f_150 > 1 || f_090 > 1
    prdData = []; info = 0; return
  end
  
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_lp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_lp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  tT_p = (tau_p - tau_b)/ k_M/ TC;  % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);      % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
    
  %% pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % time-weight: varying food
  tf = [0 f_000; 60 f_090; 140 f_150; 175 f_175];
  [t, eL] = ode45(@get_EL, tL_0(:,1) - t_0, [1, L_b], [],  tf, TC * v, g, L_m); % eL: {-, cm}, with {e, L}
  ELw_0 = eL(:,2)/ del_M; % std length
  [t, eL] = ode45(@get_EL, tWw_0(:,1) - t_0, [1, L_b], [], tf, TC * v, g, L_m); % eL: {-, cm}, with {e, L}
  EWw_0 = eL(:,2).^3 .* (1 + E_m * eL(:,1) * w_E/ mu_E/ d_E); % g, wet weight
  %
  [t, eL] = ode45(@get_EL, tL_2(:,1), [1, L_0], [], tf, TC * v, g, L_m); % eL: {-, cm}, with {e, L}
  ELw_2 = eL(:,2)/ del_M; % std length
  [t, eL] = ode45(@get_EL, tWw_2(:,1), [1, L_0], [], tf, TC * v, g, L_m); % eL: {-, cm}, with {e, L}
  EWw_2 = eL(:,2).^3 .* (1 + E_m * eL(:,1) * w_E/ mu_E/ d_E); % g, wet weight

  % pack to output
  prdData.tL_0 = ELw_0;
  prdData.tL_2 = ELw_2;
  prdData.tWw_0 = EWw_0;
  prdData.tWw_2 = EWw_2;
end

function deL = get_EL(t, eL, tf, v, g, L_m)
  e = eL(1); % J/cm^3, reserve density [E}
  L = eL(2); % cm, structural length
  
  f = spline1(t, tf); 
  de = (f- e) * v/ L; % J/d.cm^3, change in reserve density d/dt [E]
  r = v * (e/ L - 1/ L_m)/ (e + g);      % 1/d, specific growth rate
  dL = L * r/ 3;                         % cm/d, change in structural length d/dt L
  
  deL = [de; dL]; % catenate for output
end



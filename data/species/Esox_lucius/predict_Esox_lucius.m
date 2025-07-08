function [prdData, info] = predict_Esox_lucius(par, data, auxData)
 
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tW = tempcorr(temp.tW_m, T_ref, T_A);

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p t_b l_p l_b info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % ultimate reproduction rate

  % life span
  z_m = z; L_mm = L_m; w_m = w;
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % males
  pars_tpm = [g k l_T v_Hb v_Hp];

  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
    
  % time-length
  tf = [1000 4000; f_0 f_4]';
  vT = v * TC_tW; pT_Am = p_Am * TC_tW;
  [t, EL] = ode45(@get_EL, [0;tL_f(:,1)], [E_m, L_b], [], tf, vT, g, E_m, L_m, pT_Am); % EL: {J/cm^3, cm}, with {[E], L}
  EL(1,:)=[]; ELw_f = EL(:,2)/ del_M; % cm, length
  %
  [t, EL] = ode45(@get_EL, [0;tL_m(:,1)], [E_m, L_b], [], tf, vT, g, E_m, L_m, pT_Am); % EL: {J/cm^3, cm}, with {[E], L}
  EL(1,:)=[]; ELw_m = EL(:,2)/ del_M; % cm, length
  
  % time-weight
  [t, EL] = ode45(@get_EL, [0;tW_f(:,1)], [E_m, L_b], [], tf, vT, g, E_m, L_m, pT_Am); % EL: {J/cm^3, cm}, with {[E], L}
  EL(1,:)=[]; EWw_f = EL(:,2).^3 .* (1 + EL(:,1) * w_E/ mu_E/ d_E); % g, wet weight
  %
  [t, EL] = ode45(@get_EL, [0;tW_m(:,1)], [E_m, L_b], [], tf, vT, g, E_m, L_m, pT_Am); % EL: {J/cm^3, cm}, with {[E], L}
  EL(1,:)=[]; EWw_m = EL(:,2).^3 .* (1 + EL(:,1) * w_E/ mu_E/ d_E); % g, wet weight

  % pack to output
  prdData.tL_m = ELw_m;
  prdData.tL_f = ELw_f;
  prdData.tW_m = EWw_m;
  prdData.tW_f = EWw_f;
     
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
  
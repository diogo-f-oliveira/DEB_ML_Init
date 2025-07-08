function [prdData, info] = predict_Megaderma_lyra(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if E_Hp < E_Hx || E_Hpm < E_Hx
    info = 0; prdData = []; return;
  end
 
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tR = [g; k; l_T; v_Hb; v_Hx; v_Hp; t_N * k_M * TC];  % compose parameter vector
  [t_R, t_p, t_x, t_b, l_R, l_p, l_x, l_b, info] = get_tR(pars_tR, f); % -, scaled times & lengths at f
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + t_b/ k_M/ TC;        % d, gestation time at f and T

  % weaning
  tT_x = (t_x - t_b)/ k_M/ TC;      % d, time since birth at weaning at f and T
  
  % pubert
  tT_R = (t_R - t_b)/ k_M/ TC;      % d, time since birth at first litter

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  pars_tRm = [g; k; l_T; v_Hb; v_Hx; v_Hpm; t_N * k_M * TC];  % compose parameter vector
  [t_Rm, t_pm, t_xm, t_bm, l_Rm, l_pm, l_xm, l_bm] = get_tR(pars_tRm, f);
  tT_Rm = (t_Rm - t_bm)/ k_M/ TC;      % d, time since birth at first brood

  % pack to output
  prdData.tg = aT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_R;
  prdData.tpm = tT_Rm;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  % time-weight: varying food
  tf = [0 10 20 30 40 50; f_00 f_10 f_20 f_30 f_40 f_50 ]';
  [t, EL] = ode45(@get_EL, [0;tW(:,1)], [E_m, L_b], [], tf, v * TC, g, E_m, L_m, p_Am * TC); % EL: {J/cm^3, cm}, with {[E], L}
  EL(1,:)=[]; EWw = EL(:,2).^3 .* (1 + EL(:,1) * w_E/ mu_E/ d_E); % g, wet weight
  
  % pack to output
  prdData.tW = EWw;

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
  
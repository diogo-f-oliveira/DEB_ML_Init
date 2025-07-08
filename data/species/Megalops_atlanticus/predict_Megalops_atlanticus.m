function [prdData, info] = predict_Megalops_atlanticus(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  vars_pull(par); vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  %% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_as = tempcorr(temp.as, T_ref, T_A);
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_L52 = tempcorr(temp.L52, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_m, T_ref, T_A);
  
%% zero-variate data

  % birth
  pars_lb = [g; k; v_Hb];        % compose parameter vector
  [t_b, l_b, info] = get_tb(pars_lb, f); % -, scaled age and length at birth at f
  L_b = L_m * l_b;     % cm, structural length at birth at f
  Lw_b = L_b/ del_M;   % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w); % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab; % d, age at birth at f and T
  
  % S1/S2 transition
  pars_ts = [g; k; l_T; v_Hb; v_Hs];    % compose parameter vector
  [t_s t_b l_s l_b info] = get_tp(pars_ts, f, l_b); % -, scaled length at birth at f
  L_s = L_m * l_s;              % cm, structural length at S1/S2 transition
  Lw_s = L_s/ del_M;            % cm, physical length at S1/S2 transition
  aT_s = t_s/ k_M/ TC_as;        % d, age at S1/S2 transition
  
  % S2/S3 transition to no-feeding
  [t eLH] = ode45 (@dget_eLH, [0; t_sj], [1; L_s; E_Hs], [], kap, TC_aj * v, g, L_m, TC_aj * k_J, E_m);
  L_j = eLH(end,2); Lw_j = L_j/ del_M; l_j = L_j/ L_m; 
  E_Hj = eLH(end,3);
  U_Hj = E_Hj/ p_Am;               % cm^2 d, scaled maturity at S3/juv transition
  u_Hj = U_Hj * g^2 * k_M^3/ v^2;  % -, scaled maturity at S3/juv transition
  V_Hj = U_Hj/ (1 - kap);          % cm^2 d, scaled maturity at S3/juv transition
  v_Hj = V_Hj * g^2 * k_M^3/ v^2;  % -, scaled maturity at S3/juv transition
  aT_j = aT_s + t_sj;               % d, age at end of stage 3
 
  % puberty 
  pars_tp = [g; k; l_T; v_Hj; v_Hp]; % compose parameter vector
  [t_p t_j l_p l_j info] = get_tp(pars_tp, f, l_j); % -, scaled length at birth at f
  L_p = L_m * l_p;              % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;            % cm, physical length at puberty at f
  %Ww_p = L_p^3 * (1 + f * w);   % g, wet weight at puberty 
  aT_p = aT_j + (t_p - t_j)/ k_M/ TC_ap; % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                % -, scaled ultimate length at f
  L_i = L_m * l_i;              % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;            % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);   % g, ultimate wet weight 
 
  % 7-8 weeks after aT_j
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  Lw_52 = Lw_i - (Lw_i - Lw_j) * exp( - TC_aj * r_B * 52.5); % cm, expected standard length at time

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(200 * del_M, f, pars_R); % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];     % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);         % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;                     % d, mean life span at T
  
  %males
  p_Am_m = z_m * p_M/ kap;         % J/d.cm^2, {p_Am} max spec assimilation flux for male
  J_E_Am_m = p_Am_m/ mu_E;         % mol/d.cm^2, {J_EAm}, max surface-spec assimilation flux for male
  E_m_m = p_Am_m/ v;               % J/cm^3, [E_m] reserve capacity for male
  g_m = E_G/ kap/ E_m_m;           % -, energy investment ratio for male
  L_m_m = v/ k_M/ g_m;             % cm, maximum structural length for male

  %% pack to output
  prdData.ab = aT_b;
  prdData.as = aT_s;
  prdData.aj = aT_j;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Ls = Lw_s;
  prdData.Lj = Lw_j;
  prdData.L52 = Lw_52;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  f = f_tL;
  % female
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  Lw_i = (f * L_m - L_T)/ del_M; % ultimate standard length at f
  ELw_f = Lw_i - (Lw_i - Lw_j) * exp( - TC_tL * r_B * tL_f(:,1)); % cm, expected standard length at time
  %EL_f = 1.08404 + 1.40423 * EL_f; % convert SL to fork length
  % male
  ir_B = 3/ k_M + 3 * f * L_m_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  Lw_i = (f * L_m_m - L_T)/ del_M; % ultimate standard length at f
  ELw_m = Lw_i - (Lw_i - Lw_j) * exp( - TC_tL * r_B * tL_m(:,1)); % cm, expected standard length at time
  %EL_m = 1.08404 + 1.40423 * EL_m; % convert SL to fork length

  %% pack to output
  prdData.tL_m = ELw_m;
  prdData.tL_f = ELw_f;
end

%% subfunction
function deLH = dget_eLH(t, eLH, kap, v, g, Lm, kJ, Em)
  % growth while f = 0
  % unpack state vars
  e = eLH(1);   % -, scaled reserve density
  L = eLH(2);   % cm, structural length
  EH = eLH(3); % J, maturity
  
  de = - e * v/ L;

  r = v * (e/ L - 1/ Lm)/ (e + g);
  dL = L * r/ 3;

  pC = - (de + e * r) * Em * L^3;
  dH = (1 - kap) * pC - kJ * EH;

  % pack derivatives
  deLH = [de; dL; dH];

end
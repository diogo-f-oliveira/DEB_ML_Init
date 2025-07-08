function [prdData, info] = predict_Penaeus_esculentus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC_20 = tempcorr(temp.WJO20, T_ref, T_A);
  TC_25 = tempcorr(temp.WJO25, T_ref, T_A); kT_M = TC_25 * k_M;
  TC_30 = tempcorr(temp.WJO30, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if ~info; prdData = []; return; end
    
  % birth
  a_b = tau_b/ kT_M;                % d, age at birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight  at birth 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight  at puberty 
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty  

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight   
 
  % reproduction 
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj; U_Hp]; % compose parameter vector at T
  R_i = TC_25 * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
%   % males  
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   L_mm = v/ k_M/ g_m;                  % cm, max struct length
%   L_im = l_i * L_mm; Lw_im = L_im/ del_M; % cm, ultimate total length  
%   pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
%  L_mm = L_m; z_m = z; pars_tjm = pars_tj; tel_b = [t_b, f_tL2*z/z_m, l_b*z/z_m]; tel_b = [];
  
  % pack to output
  prdData.ab = a_b;            
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = R_i;           
  
  % uni-variate data
  % time-weight
  l_0 = (Ww0/(1+f_tW*ome))^(1/3)/ L_m; % -, initial scaled length
  tvel = get_tj(pars_tj, f_tW, [0 f_tW l_0], tW(:,1)*kT_M);
  EWw = (L_m * tvel(:,4)).^3 .* (1 + ome * tvel(:,3)); % g, wet weight
  
  % weight-respiration
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars for scaled_power_j
  L = (WJO20(:,1)/(1+f_WJO*ome)).^(1/3); % cm, struc length
  pACSJGRD = TC_20 * p_Am * L_m^2 * scaled_power_j(L, f_WJO, pars_p, l_b, l_j, l_p); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pACSJGRD(:,1) = 0; % exclude contribution of assimilation
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJO_20 = - J_M(3, :)' * 32e3/ 24; % mg O2/h, O2 consumption 
  %
  L = (WJO25(:,1)/(1+f_WJO*ome)).^(1/3); % cm, struc length
  pACSJGRD = TC_25 * p_Am * L_m^2 * scaled_power_j(L, f_WJO, pars_p, l_b, l_j, l_p); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pACSJGRD(:,1) = 0; % exclude contribution of assimilation
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJO_25 = - J_M(3, :)' * 32e3/ 24; % mg O2/h, O2 consumption 
  %
  L = (WJO30(:,1)/(1+f_WJO*ome)).^(1/3); % cm, struc length
  pACSJGRD = TC_30 * p_Am * L_m^2 * scaled_power_j(L, f_WJO, pars_p, l_b, l_j, l_p); % J/d, powers
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pACSJGRD(:,1) = 0; % exclude contribution of assimilation
  J_M   = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])'; % mol/d: J_C, J_H, J_O, J_N in rows
  EJO_30 = - J_M(3, :)' * 32e3/ 24; % mg O2/h, O2 consumption 

  % pack to output
  prdData.tW = EWw;
  prdData.WJO20 = EJO_20;
  prdData.WJO25 = EJO_25;
  prdData.WJO30 = EJO_30;
  
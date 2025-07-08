function [prdData, info] = predict_Neurergus_microspilotus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % customized filters for allowable parameters of the standard DEB model (std)
  % for other models consult the appropriate filter function.
  filterChecks = (k * v_Hp >= f_tL^3 || ...         % constraint required for reaching puberty with f_tL
                 ~reach_birth(g, k, v_Hb, f_tL) || ...
             k * v_Hp >= f2^3 || ...         % constraint required for reaching puberty with f_tL
                 ~reach_birth(g, k, v_Hb, f2) || f2 > f1 || f1 > 1 ||...
                             k * v_Hp >= f2^3 || ...         % constraint required for reaching puberty with f_tL
                 E_Hj > E_Hp || E_Hj < E_Hb );   % constraint required for reaching birth with f_tL
  
  if filterChecks  
    info = 0;
    prdData = {};
    return; 
  end  

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL_f1 = tempcorr(temp.tL_f1, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj];               % compose parameter vector
  [tau_j, tau_b, l_j, l_b, info] = get_tp(pars_tj, f); % -, scaled times & lengths at f
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC_ab;              % d, age at birth
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, physical length at metam at f
  Ww_j = L_j^3 * (1 + f * ome);       % g, wet weight at metam
  tT_j = (tau_j - tau_b)/ k_M/ TC_tj;   % d, time since birth at metam
  
  % puberty 
%   L_p = L_m * l_p;                  % cm, structural length at puberty at f
%   Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
%   Ww_p = L_p^3 * (1 + f * ome);       % g, wet weight at puberty
  tT_p = (t_p - tau_b)/ k_M/ TC_tp;      % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
%   Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri *  reprod_rate(L_i, f, pars_R);% #/d, reprod rate 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Li = Lw_i;
  prdData.Wwj = Ww_j;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length & time-weight
  
  TC = TC_tL; F = f_tL; 
  
  [tau_j, tau_b, l_j, l_b, info] = get_tp(pars_tj, F); % -, scaled times & lengths at f
  L_b  = L_m * l_b;    L_i = L_m * (F - l_T);
    
  ir_B = 3/ k_M + 3 * F * L_m/ v; rT_B = TC/ ir_B;  % d, 1/von Bert growth rate
  
  L    = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)); % cm, structural length
  ELw  = L/ del_M; % cm, SVL 

  L    = L_i - (L_i - L_b) * exp( - rT_B * tWw(:,1)); % cm, structural length
  EWw  = L.^3 * (1 + ome * F); % g, wet weight
  
  % time-length at two food levels
  TC = TC_tL_f1; 
 
  F = f1;
  rT_B = TC * k_M/ 3/ (1 + F/ g); L_i = F * L_m; 
  ELw_f1 = (L_i - (L_i - L_b) * exp( - rT_B * tL_f1(:,1)))/ del_M; % cm, SVL females west

  F = f2;
  rT_B = TC * k_M/ 3/ (1 + F/ g); L_i = F * L_m; 
  ELw_f2 = (L_i - (L_i - L_b) * exp( - rT_B * tL_f2(:,1)))/ del_M; % cm, SVL females west

 
  % pack to output
  prdData.tL = ELw;
  prdData.tL_f1 = ELw_f1;
  prdData.tL_f2 = ELw_f2;
  prdData.tWw = EWw;

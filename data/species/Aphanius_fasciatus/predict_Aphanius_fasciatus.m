function [prdData, info] = predict_Aphanius_fasciatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_XJX = tempcorr(temp.XJX, T_ref, T_A);

  
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
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
  
  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  f = f_tL; pars_lb = [g; k; v_Hb];                    % compose parameters
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_tL/ ir_B;  % d, 1/von Bert growth rate
  L_i = (f * L_m - L_T); Lw_i = L_i/ del_M;            % cm, ultimate length at f
  L_b = get_lb(pars_lb, f) * L_m; Lw_b = L_b/ del_M;   % cm, length at birth at f
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL(:,1)); % cm, total length at time
  L = L_i - (L_i - L_b) * exp( - rT_B * tW(:,1));      % cm, structural length at time
  EWw = L .^ 3 * (1 + f * w);                          % g, wet weight
  %
  % length-weight
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f * w);          % g, expected wet weight 

  f = XJX(:,1) ./ (K + XJX(:,1));                      % -, scaled func response
%   L =  mean(length.XJX * del_M);                      % cm, structural length
  L   =  length.XJX * del_M;                      % cm, structural length
  EJX =  1e3 * TC_XJX * J_X_Am * w_X * f .* L.^2;        % mg/d, ingestion rate
  
  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;
  prdData.LW = EWw_L;
  prdData.XJX = EJX;
  
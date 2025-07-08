function [prdData, info] = predict_Pusa_hispida(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % customized filters 
  filterChecks = f02>1 || ...         % f contrained to not be larger than 1
                 f81 > 1;   % 
  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  

  % compute temperature correction factors
  TC_tg = tempcorr(temp.tg, T_ref, T_A);
  TC_tx = tempcorr(temp.tx, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tLW = tempcorr(temp.tL81, T_ref, T_A); 
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
%   Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ k_M/ TC_tg;     % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
%   Lw_x = L_x/ del_M;                % cm, total length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ k_M/ TC_tx;   % d, time since birth at fledging at f and T
  
  % puberty 
%   L_p = L_m * l_p;                  % cm, structural length at puberty at f
%   Lw_p = L_p/ del_M;                % cm, total length at puberty at f
%   Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_foetus(L_i, f, pars_R);      % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
 
  
  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
%   prdData.Lb = Lw_b;
%   prdData.Lx = Lw_x;
%   prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
%   prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri  = RT_i;
    
  % uni-variate data
  l_b = get_lb_foetus([g k v_Hb]);
  L_b = L_m * l_b;  
  % 1981-1982, svalbard
  f = f81;   L_i = L_m * (f - l_T);
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_tLW/ ir_B;  % d, 1/von Bert growth rate  
  % time-length (female)
  L = L_i - (L_i - L_b) * exp( - rT_B * tL81(:,1)); % cm, total length  % time-length (female)  
  ELw81 = L/ del_M; % cm, standard length  
  % time-length (male)
  L = L_i - (L_i - L_b) * exp( - rT_B * tLm81(:,1)); % cm, total length  % time-length (male)  
  ELwm81 = L/ del_M; % cm, standard length  
  % time-weight (female)
  L = L_i - (L_i - L_b) * exp( - rT_B * tW81(:,1)); % cm, total length  % time-length (female)  
  EWw81 = L.^3 * (1 * w * f); % g, wet weight 
  % time-weight(male)
  L = L_i - (L_i - L_b) * exp( - rT_B * tWm81(:,1)); % cm, total length  % time-length (male)  
  EWwm81 = L.^3 * (1 * w * f); % g, wet weight 

  % 2002-2004, Svalbard
  f = f02;  L_i = L_m * (f - l_T);
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_tLW/ ir_B;  % d, 1/von Bert growth rate  
  % time-length (female)
  L = L_i - (L_i - L_b) * exp( - rT_B * tL02(:,1)); % cm, total length  % time-length (female)  
  ELw02 = L/ del_M; % cm, standard length  
  % time-length (male)
  L = L_i - (L_i - L_b) * exp( - rT_B * tLm02(:,1)); % cm, total length  % time-length (male)  
  ELwm02 = L/ del_M; % cm, standard length  
  % time-weight (female)
  L = L_i - (L_i - L_b) * exp( - rT_B * tW02(:,1)); % cm, total length  % time-length (female)  
  EWw02 = L.^3 * (1 * w * f); % g, wet weight 
  % time-weight(male)
  L = L_i - (L_i - L_b) * exp( - rT_B * tWm02(:,1)); % cm, total length  % time-length (male)  
  EWwm02 = L.^3 * (1 * w * f); % g, wet weight 

  % pack to output
  prdData.tL81  = ELw81;
  prdData.tL02  = ELw02;
  prdData.tLm81 = ELwm81;
  prdData.tLm02 = ELwm02;
  prdData.tW81  = EWw81;
  prdData.tW02  = EWw02;
  prdData.tWm81 = EWwm81;
  prdData.tWm02 = EWwm02;
